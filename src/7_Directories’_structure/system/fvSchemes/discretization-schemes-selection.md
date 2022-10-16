# Discretization schemes selection

The discratazion scheme of the equations must take in account the quality of the mesh.

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