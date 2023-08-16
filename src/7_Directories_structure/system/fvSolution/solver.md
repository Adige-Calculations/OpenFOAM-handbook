# Solver

The solver use a specific algorithm to prepare the resolution pattern of your linear system such as SIMPLE, PISO or PIMPLE.
All the algorithms solve the same governing equations, consequently they
differ in how they loop over the equations. The looping is controlled by
input parameters that are listed below. They are set in a dictionary
named after the algorithm

  - nNonOrthogonalCorrectors: used by all algorithms, specifies repeated
    solutions of the pressure equation, used to update the explicit
    non-orthogonal correction of the Laplacian term; typically set to 0
    (particularly for steady-state) or 1.

  - nCorrectors: used by PISO, and PIMPLE, sets the number of times the
    algorithm solves the pressure equation and momentum corrector in
    each step; typically set to 2 or 3.

  - nOuterCorrectors: used by PIMPLE, it enables looping over the entire
    system of equations within on time step, representing the total
    number of times the system is solved; must be and is typically set
    to 1, replicating the PISO algorithm.

  - momentumPredictor: switch those controls solving of the momentum
    predictor; typically set to off for some flows, including low
    Reynolds number and multiphase.

### Addtional notes
Set to yes for high Reynolds flows, where
convection dominates (default value is yes)
```c++
 momentumPredictor yes;
 ```
Recommended value is 1 (equivalent to PISO).
Increase to improve the stability of second
order time discretization schemes (LES
simulations). Increase for strongly coupled
problems.

```c++
nOuterCorrectors 1; 
```
Recommended to use at least 3 correctors.
It improves accuracy and stability. Use 4 or
more for highly transient flows or strongly
coupled problems.
```c++
 nCorrector 3; 
 ```
Recommend to use at least 1 corrector.
Increase the value for bad quality meshes.
```c++
 nNonOrthogonalCorrectors 1; 
 ```
The orthogonality correctors must be raised once the mesh starts to be highly orthogonal.

|Non-orthogonality       |<n>between 70 and 85: </n>| between 60 and 70 | less than 60 |
|------------------------|--------------------------|-------------------|--------------|
|nNonOrthogonalCorrectors| 3                | 2| 1|

Flag to indicate whether to solve the turbulence
on the final pimple iteration only. For SRS
simulations the recommended value is false
(the default value is true)
```c++
 turbOnFinalIterOnly false; 
 ```

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../../footers/footer_third_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
