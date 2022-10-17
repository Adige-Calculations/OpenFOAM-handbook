# Discretization schemes selection

The discratazion scheme of the equations must take in account the quality of the mesh. The first calculation arrangemnt that must be set is the "gradient limitation".

## gradSchemes

This entry defines the way we compute the
gradients:

### Gradient computation

The gradients can be computed using the Gauss method or the least squares method. The keywords are:

- Gauss linear
- leastSquares

The leastSquares method is more accurate, however, I have found that it
tends to be more oscillatory on tetrahedral meshes

### Gradient limitation
Gradient limiters will avoid over and under shoots on the gradient computations. They
increase the stability of the method but add diffusion due to clipping. There are four available:

- cellMDLimited
- cellLimited
- faceMDLimited
- faceLimited

They are in order of accuracy, "faceLimited" is the more diffusive, however it provides stability.

### Blending factor

The gradient limiter implementation uses a blending factor

```c++
gradSchemes
{
default
    cellMDLimited Gauss linear 1 // the blending factor is 1
}
```

0 means no blending hence the solution will be accurate but less stable. Of course 1 will introduce the maximum bledning possible.

## divSchemes


These are the convective discretization schemes that you will use most of the times:
• upwind: first order accurate.
• linearUpwind: second order accurate, bounded.
• linear: second order accurate, unbounded.
• A good TVD scheme (vanLeer or Minmod): TVD, second order accurate,
bounded.
• limitedLinear: second order accurate, unbounded, but more stable than
pure linear. Recommended for LES simulations (kind of similar to the Fromm
method).
First order methods are bounded and stable but diffusive.
Second order methods are accurate, but they might become oscillatory.

### Example
An accurate and stable numerical scheme (second order accurate)
```c++
divSchemes
{
    div(phi,U)Gauss linearUpwind grad(U);
    div(phi,omega)Gauss linearUpwind grad(omega);
    div(phi,k)Gauss linearUpwind grad(omega);
    div((nuEff*dev2(T(grad(U)))))Gauss linear;
}

```
## laplacianSchemes
For the discretization of the diffusive terms, you can use a fully orthogonal scheme

```c++
laplacianSchemes
{
default
    Gauss linear corrected;
}
```

You can also use a scheme that uses a blending between a fully orthogonal scheme
and a non-orthogonal scheme:

```c++
laplacianSchemes
{
default
    Gauss linear limited 1
}
```
In summary, by setting the blending factor equal to 0 is equivalent to using the uncorrected
method. You give up accuracy but gain stability.

• If you set the blending factor to 0.5, you get the best of both worlds. In this case,
the non-orthogonal contribution does not exceed the orthogonal part. You give up
accuracy but gain stability.
• For meshes with non-orthogonality less than 70, you can set the blending factor
to 1.
• For meshes with non-orthogonality between 70 and 85, you can set the blending
factor to 0.5
• For meshes with non-orthogonality more than 85, it is better to get a better mesh.
But if you definitely want to use that mesh, you can set the blending factor to
0.333, and increase the number of non-orthogonal corrections.

### Non-orthogonality between 70 and 85

```c++
gradSchemes
{
    default cellLimited Gauss linear 0.5;
    grad(U) cellLimited Gauss linear 1.0;
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

## Non orthogonal correctors

The orthogonality correctors must be raised once the mesh starts to be highly orthogonal.

|Non-orthogonality       |<n>between 70 and 85: </n>| between 60 and 70 | less than 60 |
|------------------------|--------------------------|-------------------|--------------|
|nNonOrthogonalCorrectors| 3                | 2| 1|