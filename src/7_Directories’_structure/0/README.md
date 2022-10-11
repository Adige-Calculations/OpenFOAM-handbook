# 0 (i.e. Boundary Conditions)

The BC works on the Patches which have been defined in the mesh and the
guessing of the first value of the field pass through the voice

```c++
internal field
```
which can be filled with a uniform, but it could be changed in
non-uniform if set values in system/setFieldsDict and then apply this
change through setFields

Type of patches are:

- fixedValue

- zeroGradient

- symmetryplane

- noSlip

- empty  (to set a 2D simulation)

- AMIcyclic (impose a periodic BC when the patches in study have not the
same mesh, it must be declared the nature of periodicity (rotational,
translation). The separationVector must contain the distances between
the 2 patches in study. It is advised to use a createPatchDict to modify
the BC after snappy procedure of snappyHexMesh because can cause
problems to the patches)

- calculated – calculate the value from its component in the field, this
doesn’t work for transport quantities but only for variable define by a
formulae (for instance nut)

- totalPressure – which is a fixedValue condition calculated from p and U
field

- pressureInletOutletVelocity – which applies a zeroGradient on all
components, except where there is inflow, in this case a fixedValue
condition is applied to the tangential component

- inletOutlet: which is a zeroGradient condition when outwards, fixedValue
when flow is inwards

```c
  {
    type inletOutlet;
    inletValue uniform (0 0 0); // value of the velocity
    value uniform x;            // value of the properties
  }
```

Basically, inletOutlet is zero gradient unless the flow is inward in
which case it is fixed value (inletValue). outletInlet is zero gradient
if the flow is inward and fixed value (outletValue) if the flow is
outward.