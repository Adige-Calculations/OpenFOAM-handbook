-[Preface](./preface.md)

- [Intro](1_intro/README.md)

- [Installation](2_installation/README.md)

  - [Package manager](2_installation/via_package_manager.md)

  - [Precompiled binaries](2_installation/download_binaries.md)

  - [Compiling the source code](2_installation/compiling_source_code.md)

    - [ARM architecture](2_installation/compiling_ARM.md)

- [Problem set up](3_problem_set_up/README.md)

- [Automation ](4_automation/README.md)

  - [Run commands in sequence](4_automation/run-commands-in-sequence.md)

  - [Create a custom command](4_automation/create-a-custom-command.md)

  - [Shell scripting](4_automation/bash-script.md)

- [Useful commands](5_useful_command/README.md)

- [Mesh](6_mesh/README.md)

  - [blockMesh](6_mesh/blockmesh.md)

  - [SnappyHexMesh](6_mesh/snappyhexmesh/README.md)

    - [Internal flow](6_mesh/snappyhexmesh/advice-for-internal-flow.md)

    - [Setting zones](6_mesh/snappyhexmesh/setting-zones-inside-the-mesh-for-source-terms.md)

    - [Refinement technique](6_mesh/snappyhexmesh/advanced-refinement-technique.md)

    - [Multiple closed body](6_mesh/snappyhexmesh/meshing-more-than-one-closed-body.md)

    - [Parallelization issues](6_mesh/snappyhexmesh/parallelization-issues.md)

  - [cfMesh ](6_mesh/cfmesh.md)

  - [checkMesh](6_mesh/checkMesh/README.md)

      - [Most important mesh parameters](6_mesh/checkMesh/most_important_parameters.md)

      - [Bad quality mesh](6_mesh/checkMesh/delete-bad-quality-cells.md)

  - [ANSYS Meshing to OpenFoam® ](6_mesh/ansys-meshing-to-openfoam.md)

- [Directories’ structure](7_Directories’_structure/README.md)

  - [0 (i.e. Boundary Conditions)](7_Directories’_structure/0/README.md)

    - [ε, ω, k](7_Directories’_structure/0/ε-ω-k/README.md)

    - [nut](7_Directories’_structure/0/nut/README.md)

  - [Constant](7_Directories’_structure/constant/README.md)

    - [transportProperties](7_Directories’_structure/constant/transportProperties.md)

    - [turbulentProperties](7_Directories’_structure/constant/turbulentProperties.md)

    - [polyMesh](7_Directories’_structure/constant/polymesh/README.md)

      - [boundary](7_Directories’_structure/constant/polymesh/boundary.md)

      - [sets](7_Directories’_structure/constant/polymesh/sets.md)

    - [thermophysicalProperties](7_Directories’_structure/constant/thermophysicalProperties.md)

  - [System](7_Directories’_structure/system/README.md)

    - [controlDict ](7_Directories’_structure/system/controldict.md)

    - [fvSchemes ](7_Directories’_structure/system/fvSchemes/README.md)

      - [Discretization schemes selection](7_Directories’_structure/system/fvSchemes/discretization-schemes-selection.md)

    - [fvSolution](7_Directories’_structure/system/fvSolution/README.md)

      - [Linear solver](7_Directories’_structure/system/fvSolution/linear-solver.md)

      - [Solver](7_Directories’_structure/system/fvSolution/solver.md)

      - [Under-relaxation factors](7_Directories’_structure/system/fvSolution/under-relaxation-factors.md)

    - [decomposeParDict](7_Directories’_structure/decomposepardict.md)

    - [fvOptions](7_Directories’_structure/fvOptions.md)

    - [topoSetDict](7_Directories’_structure/system/topoSetDict.md)

- [Problem initialization](8_problem-initialization-and-interpolation-from-previous-results/README.md)

- [Browse Source Code](9_browse-source-code/README.md)

   - [Doxigen](9_browse-source-code/doxigen.md)

   - [Source code](9_browse-source-code/source-code.md)

- [Multiphase model](10_multiphase-model/README.md)

- [Parallel practices](11_run-in-parallel/README.md)

- [Conjugate Heat Transfer Model](12_conjugate-heat-transfer-model/README.md)

  - [Run in parallel a CHT model](12_conjugate-heat-transfer-model/run-in-parallel-a-cht-model.md)

- [Residuals](13_residuals/README.md)

- [ParaView](14_paraview/README.md)

  - [pvserver](14_paraview/pvserver.md)

  - [Compilation](14_paraview/compilation.md)

  - [Trouble shooting](14_paraview/trouble-shooting-common-problems.md)

- [CLI Post-processing](15_post-processing-via-command-line/README.md)

- [Cluster practices](16_cluster-practice/README.md)

- [Compile functionObjects](17_compile-functionobjects-from-web/README.md)

- [Windows programmes](18_windows-practices/README.md)

  - [Windows Subsystem for GNU-Linux](18_windows-practices/WSL.md)

  - [NotePad ++](18_windows-practices/notepad++.md)

- [Virtualization](19_virtualization/README.md)

  - [Multipass](19_virtualization/multipass.md)

  - [Docker](19_virtualization/docker.md)

- [GNU-Linux distro settings](20_distribution_setting/README.md)