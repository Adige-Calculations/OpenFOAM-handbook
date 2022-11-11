# fvSchemes

This dictionary contains the instructions to discretize the problem’s
equations. This settings can be changed on fly, however it is required 
to set the field ```controlDict.runTimeModifiable``` to yes in the controlDict
dictionary. In fact, different discretization procedures suit different mesh
refinement/quality and state of simulation.

| Main document keywords     | Category of mathematical terms                                                 |
| -------------------------- | ------------------------------------------------------------------------------ |
| interpolationSchemes       | Point-to-point interpolations of values                                        |
| snGradSchemes              | Component of gradient normal to a cell face                                    |
| gradSchemes                | Gradient     ∇                                                                 |
| divSchemes                 | Divergence   ∇ ∙                                                               |
| laplacianSchemes           | Laplacian    ∇<sup>2                                                           |
| timeScheme                 | First and second time derivatives ![∂∕ ∂t,∂<sup>2</sup>∕∂t<sup>2</sup>]        |


Main four steps must be taken to define a simulation:

- ```ddtSchemes```
- ```gradSchemes```
- ```divSchemes```
- ```laplacianSchemes```

This schemas defines how you case must be compueted.

## gradScheme

This dictionary field tackles gradient limitators and how to define the way we compute the
gradients. The gradients can be computed using the Gauss method or the least squares method. The keywords are:

- ```Gauss linear```
- ```leastSquares```

The leastSquares method is more accurate, however, it tends to be more oscillatory on tetrahedral meshes.
On the other side, gradient limiters will avoid over and under shoots on the gradient computations. They
increase the stability of the method but add diffusion due to clipping. There are four available:

- ```cellMDLimited```
- ```cellLimited```
- ```faceMDLimited```
- ```faceLimited```

They are in descendent order of accuracy ```faceLimited``` is the more diffusive one, however it provides stability.
The gradient limiter implementation uses a blending factor

```c++
gradSchemes
{
    default
    cellMDLimited Gauss linear 1  // the blending factor is 1
}
```

where 0 means no blending hence the solution will be accurate but less stable. Of course 1 will introduce the maximum blending possible.


## divSchemes

Relates to the evaluation of the flux φ (phi) across cell faces which
transport a property Θ under the influence of velocity field φ (phi).
The schemes are all based on Gauss integration, using the flux φ and
the advected field being interpolated to the cell faces by one of the
selected schemes

These are the convective discretization schemes that you will use most
of the times:

  - ```Gauss upwind``` → first order accurate.

  - ```Gauss linearUpwind grad(<Θ>)``` → second order accurate, bounded.

  - ```Gauss limitedLinear``` → TVD scheme, second order accurate, bounded. Recommended for LES simulations.

  - ```Gauss linear``` → linear interpolation, unbounded.

Gauss indicates that derivatives are evaluated via the Gauss’ theorem. While ```upwind```
indicates a standard 1st order upwind interpolation (bounded). First order methods are bounded and stable but diffusive.
Second order methods are accurate, but they might become oscillatory, the most common method to use is ```linearUpwind```, which
stands for standard 2nd order interpolation (unbounded). TVD methods such
as superBee, minmod and vanLeer are second order accurate (bounded).
TVD methods switch locally to upwind when they detect strong gradients. For the discretization of the diffusive terms instead, you
can use a fully orthogonal scheme

  - linear corrected

  - linear limited <from0To1>

0 for bad mesh and 1 for good quality mesh. An accurate and stable numerical scheme (second order accurate) would look like:
```c++
divSchemes
{
    div(phi,U)                      Gauss linearUpwind grad(U);
    div(phi,omega)                  Gauss linearUpwind grad(omega);
    div(phi,k)                      Gauss linearUpwind grad(omega);
    div((nuEff*dev2(T(grad(U)))))   Gauss linear;
}

```
## laplacianSchemes
For the discretization of the diffusive terms, you can use a fully orthogonal scheme

```c++
laplacianSchemes
{
    default  Gauss linear  corrected;
}
```

You can also use a scheme that uses a blending between a fully orthogonal scheme
and a non-orthogonal scheme:

```c++
laplacianSchemes
{
    default  Gauss linear limited 1
}
```
In summary, by setting the blending factor equal to 0 is equivalent to using the uncorrected
method. You give up accuracy but gain stability. If you set the blending factor to 0.5, you get the best of both worlds. In this case,
the non-orthogonal contribution does not exceed the orthogonal part. You give up
accuracy but gain stability. For meshes with non-orthogonality less than 70, set the blending factor to 1. For meshes with non-orthogonality between 70 and 85, set the blending factor to 0.5. For meshes with non-orthogonality more than 85, it is better to get a better mesh.
But if you definitely want to use that mesh, set the blending factor to
0.333, and increase the number of non-orthogonal corrections.

# Discretization schemes example

Few examples are proposed here for different quality thresholds.

### Non-orthogonality between 70 and 85

```c++
gradSchemes
{
    default     cellLimited Gauss linear 0.5;
    grad(U)     cellLimited Gauss linear 1.0;
}
divSchemes
{
    div(phi,U)                      Gauss linearUpwind grad(U);
    div(phi,omega)                  Gauss linearUpwind default;
    div(phi,k)                      Gauss linearUpwind default;
    div((nuEff*dev(T(grad(U)))))    Gauss linear;
}

laplacianSchemes
{
    default Gauss linear limited 0.5;
}
snGradSchemes
{
    default limited 0.5;
}

```

### Non-orthogonality between 60 and 70

```c++
gradSchemes
{
    default cellMDLimited Gauss linear 0.5;
    grad(U) cellMDLimited Gauss linear 0.5;
}
divSchemes
{
    div(phi,U) Gauss linearUpwind grad(U);
    div(phi,omega) Gauss linearUpwind default;
    div(phi,k) Gauss linearUpwind default;
    div((nuEff*dev(T(grad(U))))) Gauss linear;
}

laplacianSchemes
{
    default Gauss linear limited 0.777;
}
snGradSchemes
{
    default limited 0.777;
}
```

### Non-orthogonality between 40 and 60

```c++
gradSchemes
{
    default cellMDLimited Gauss linear 0;
    grad(U) cellMDLimited Gauss linear 0.333;
}
divSchemes
{
    div(phi,U) Gauss linearUpwind grad(U);
    div(phi,omega) Gauss linearUpwind default;
    div(phi,k) Gauss linearUpwind default;
    div((nuEff*dev(T(grad(U))))) Gauss linear;
}
laplacianSchemes
{
    default Gauss linear limited 1.0;
}
snGradSchemes
{
    default limited 1.0;
}
```

