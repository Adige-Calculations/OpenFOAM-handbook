# Directories’ structure

The following represaentation is the usual set up for an OpenFoam® case:

```console
.
├── 0.orig                          →  Initial value settings
│   ├── k                                   →  Turbulent kinetic energy
│   ├── nut                                 →  Turbutent kinematic viscosity
│   ├── omega                               →  Specific rate of turbulent dissipation
│   ├── p                                   →  Pressure
│   └── U                                   →  Velocity
├── Allclean
├── Allrun
├── constant                        →  Initial value settings
│   ├── transportProperties                 →  Fluid properties
│   └── turbulenceProperties                →  Turbulence model selection
└── system                          →  Settings
    ├── blockMeshDict                       → Dictionary for cartesian mesh generation
    ├── controlDict                         → Running time and I/O control
    ├── decomposeParDict `                  → Dictionary to control the parallelization scheme
    ├── fvSchemes                           → Terms, scheme, numerical settings
    ├── fvSolution                          → Tolerance, algorithm and solver settings
    ├── snappyHexMeshDict                   → Dictionary for mesh generation (with snappyHexMesh)
    └── surfaceFeatureExtractDict           → Dictionary de facto needed for mesh generation (with snappyHexMesh)
```

You can change the parameters in the dictionaries controlDict, fvSchemes and fvSolution on-the-fly. But you will need to set the keyword runTimeModifiable to yes in the controlDict dictionary.
<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
