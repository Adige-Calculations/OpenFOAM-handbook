# Run in parallel a CHT model


To decompose a case with more than one region it is opportune to run
this shell script in a way that you correctly distribute the regions
between the processors:

And the decompose the case through:
```bash
decomposePar -allRegions
```

Remember to create symbolic link to all your
```bash
/system/\<region>/decomposeParDict -\> system/decomposeParDict
mpirun -n \<nProcessors> \<solver> -parallel
```