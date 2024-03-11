- [Preface](./preface.md)

- [Intro](intro/README.md)

- [Installation](installation/README.md)
  - [Package manager](installation/via_package_manager.md)
  - [Precompiled binaries](installation/download_binaries.md)
  - [Compiling source code](installation/compiling_src_code.md)
    - [Compiling function objects](installation/compile_function_objects.md) 

- [Problem set up](problem_set_up/README.md)

- [Automation ](automation/README.md)
  - [Run commands in sequence](automation/run-commands-in-sequence.md)
  - [Create a custom command](automation/create-a-custom-command.md)
  - [Shell scripting](automation/bash-script.md)

- [Useful commands](useful_command/README.md)

- [Mesh](mesh/README.md)
  - [blockMesh](mesh/blockmesh.md)
  - [snappyHexMesh](mesh/snappyhexmesh/README.md)
    - [Internal flow](mesh/snappyhexmesh/advice-for-internal-flow.md)
    - [Setting zones](mesh/snappyhexmesh/setting-zones-inside-the-mesh-for-source-terms.md)
    - [Multiple regions](mesh/snappyhexmesh/multiple_regions.md)
    - [Refinement technique](mesh/snappyhexmesh/advanced-refinement-technique.md)
  - [cfMesh ](mesh/cfmesh.md)
  - [checkMesh](mesh/checkMesh.md)
  - [ANSYS Meshing to OpenFoam® ](mesh/ansys-meshing-to-openfoam.md)

- [Directories’ structure](directories_structure/README.md)

  - [0](directories_structure/0/README.md)
    - [ε, ω, k](directories_structure/0/ε-ω-k/README.md)
    - [nut](directories_structure/0/nut/README.md)
  - [Constant](directories_structure/constant/README.md)
    - [transportProperties](directories_structure/constant/transportProperties.md)
    - [turbulentProperties](directories_structure/constant/turbulentProperties.md)
    - [polyMesh](directories_structure/constant/polyMesh.md)
    - [thermophysicalProperties](directories_structure/constant/thermophysicalProperties.md)
  - [System](directories_structure/system/README.md)
    - [controlDict](directories_structure/system/controldict.md)
    - [fvSchemes](directories_structure/system/fvSchemes.md)
    - [fvSolution](directories_structure/system/fvSolution/fvSolution.md)
    - [decomposeParDict](directories_structure/system/decomposepardict.md)
    - [fvOptions](directories_structure/system/fvOptions.md)
    - [topoSetDict](directories_structure/system/topoSetDict.md)

- [Problem initialization](problem-initialization-and-interpolation-from-previous-results/README.md)
    - [Modularity](problem-initialization-and-interpolation-from-previous-results/modularity.md)

- [Browse Source Code](browse-source-code/README.md)

- [Parallel execution](run-in-parallel/README.md)
    - [MPI (Message Passage Interface)](run-in-parallel/MPI.md)
    - [Cluster practices](run-in-parallel/cluster_practice.md)

- [Compressibility model](compressible-model/compressible-model.md)

- [Multiphase model](multiphase-model/README.md)

- [Conjugate Heat Transfer Model](conjugate-heat-transfer-model/README.md)
    - [Boundary condition automation](conjugate-heat-transfer-model/automation_for_initial_condition.md)
    - [Fluid decoupling](conjugate-heat-transfer-model/not_resolving_fluid_part.md)

- [Residuals](residuals/README.md)

- [ParaView](paraview/paraview.md)
  - [Remote rendering](paraview/pvserver.md)
  - [Compilation](paraview/compilation.md)
  - [Different meshes](paraview/visualization_different_meshes.md)

- [CLI Post-processing](post-processing-via-command-line/README.md)
  - [Function objects](post-processing-via-command-line/function_object.md)

- [External library for computation](PETSc/README.md)

- [Editing tools](tools/README.md)

- [Virtualization](virtualization/README.md)
  - [Windows Subsystem for Linux](virtualization/WSL.md)
  - [Multipass](virtualization/multipass.md)
  - [Docker](virtualization/docker.md)
  - [Docker compose](virtualization/docker-compose.md)

- [Navier Stokes equations ](math_formulation/README.md)

