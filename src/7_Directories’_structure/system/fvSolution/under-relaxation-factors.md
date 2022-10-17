# Under-relaxation factors
Relaxation factors for under-relaxation of fields are specified within
a *field* sub-dictionary; relaxation factors for equation
under-relaxation are within a *equations* sub-dictionary. 

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