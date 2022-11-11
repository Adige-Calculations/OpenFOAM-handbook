# Under-relaxation factors
Relaxation factors for under-relaxaing fields are specified within
```fvSolution.relaxationFactors.fields``` sub-dictionary, instead
equation under-relaxations factor are within a ```fvSolution.relaxationFactors.equations``` sub-dictionary. 

## SIMPLE

```c++
p 0.3;
U 0.7;
k 0.7;
omega 0.7;
```

## SIMPLEC

```c++
p 1;
U 0.9;
k 0.9;
omega 0.9;
```