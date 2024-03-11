# Function Objects

Function objects are essentially pre-built modules that empower users to monitor control 
points, compute forces and coefficients, perform time-averaging of fields, extract surfaces and slices, 
and much more — all in real-time and without requiring additional coding. These built-in utilities are defined 
and loaded in ```controlDict```. When leveraged effectively, function objects eliminate the necessity of storing 
all run-time simulation data, leading to significant resource  savings. Here are some additional details on what 
we use function objects for:

- Monitor probes : Probes are basically control points in your domain where values of certain fields are monitored
  over simualtion time. This feature is particularly useful for tracking critical locations or assessing the behavior 
  of specific variables over time. For example, one can track statistical convergence using probes.
- Calculate forces and force coefficients : Users can compute forces and force coefficients acting on surfaces or boundaries within the simulation domain. This capability is essential for analyzing fluid-structure interactions, aerodynamic performance, and other engineering phenomena. For example, wind load on buildings, drag and lift forces acting on an airfoil, and so on.
- Calculate time-averaged fields : Function objects enable the calculation of time-averaged fields, providing insights into the steady-state behavior of the simulation. This is beneficial for understanding long-term trends and minimizing the influence of transient effects.
- Extract slice information : Users can extract surfaces or slices from the computational domain using function objects. This functionality is valuable for visualizing specific regions of interest or exporting data for further analysis such as Proper Orthogonal Decomposition (POD), Dynamic Mode Decomposition (DMD), and so on.
- Custom data processing : Beyond the built-in functionalities, function objects can be customized to perform user-defined data processing tasks. This flexibility allows users to tailor post-processing routines to their specific requirements, enhancing the utility of OpenFOAM for diverse applications.

## How to use Function Objects

Function objects serve dual purposes: 

- being employed during runtime within the simulation
- accessed via command-line post-processing utilities 

Typically, function objects excel in runtime investigations, offering invaluable insights. To utilize 
function objects, each selected function must be listed within the functions sub-dictionary of the ```system/controlDict``` file, 
structured as a nested sub-dictionary, as illustrated in the following example:

```c#
...

runTimeModifiable true;

functions
{
  <userDefinedSubDictName2>
    {
      ...
    }

  <userDefinedSubDictNameN>
  {
    ...
  }
}
```

Another approach to implementing function objects in controlDict is by including the file that contains them. For instance, if I define a probe function object file named probes or surfaces function objec file, I can include it in controlDict as shown below:

```c#
functions
{
  #includeFunc probes
  #includeFunc surfaces
}
```

### Example

List of useful OpenFOAM function objects

#### probes 

Function object to monitor pressure and velocity at critical points across the domain.

```c#
probes
{
    type            probes;
    libs            ("libsampling.so");

    // Name of the directory for probe data
    name            probes;

    // Write at same frequency as fields
    writeControl    timeStep;
    writeInterval   1;

fields (
        p 
        U 
       );

probeLocations
(

	(0.03 0.006 0.006)
	(0.03 0.006 0)
	(0.03 0.006 -0.006)
	
);
    // Optional: filter out points that haven't been found. Default
    //           is to include them (with value -VGREAT)
    includeOutOfBounds  true;
}
```

#### fieldAverage 

Function object to calculate the time-averaged pressure and velocity fields, as well as their root-mean-squared covarience.

```c#
fieldAverage
    {
        type            fieldAverage;
        libs            ("libfieldFunctionObjects.so");
        writeControl    writeTime;
        timeStart       0;

        fields
        (
            U
            {
                mean        on;
                prime2Mean  on;
                base        time;
            }

            p
            {
                mean        on;
                prime2Mean  on;
                base        time;
            }
        );
    }
```

#### forces / forceCoeffs 

Function object to calculate the force and force coefficient on any projected surface.

```c#
forces1
    {
        type            forces;
        libs            (forces);
        writeControl   timeStep;
        writeInterval  1;

        patches         ( "PRISM" );
        CofR            (0 0 0);

        rho             rhoInf;
        log             true;
        rhoInf          1.225;
    }

forceCoefficients
    {
        type            forceCoeffs;
        libs ( "libforces.so" );
    
        writeControl   timeStep;
        writeInterval  1;
        
        patches         ( "PRISM" );
        
        rho             rhoInf;
        log             true;
        rhoInf          1.225;
        liftDir         (0 1 0);
        dragDir         (1 0 0);
        //sideDir         (0 0 1);
        CofR            (0 0 0);
        pitchAxis       (0 0 1);
        magUInf         0.015;
        lRef            0.1;
        Aref            0.0628;
    }
```

#### vorticity 

Function object to calculate the curl of velocity:

```c#
vorticity
    {
        // Mandatory entries
        type            vorticity;
        libs            (fieldFunctionObjects);

        // Optional (inherited) entries
        field           U;
        result          vorticityField;
        region          region0;
        enabled         true;
        log             true;
        executeControl  timeStep;
        executeInterval 1;
        writeControl    timeStep;
        writeInterval   42;
    }
```
#### Lambda2

Function object used to identify vortex cores.

```c#
Lambda2
{
    // Mandatory entries
    type            Lambda2;
    libs            (fieldFunctionObjects);

    // Optional (inherited) entries
    field           U;
    result          Lambda2Field;
    region          region0;
    enabled         true;
    log             true;
    executeControl  timeStep;
    executeInterval 42;
    writeControl    timeStep;
    writeInterval   42;
}
```

#### Subtract 

Function object to calculate the turbulence intensity, i.e. the fluctuating component of velocity.

```c#
subtract
{
    // Mandatory entries
    type            subtract;
    libs            (fieldFunctionObjects);
    fields          (U UMean);

    // Optional (inherited) entries
    result          uPrime;
    region          region0;
    enabled         true;
    log             true;
    executeControl  timeStep;
    executeInterval 1;
    writeControl    timeStep;
    writeInterval   42;
}
```

#### surfaces 

Function object to extract field data at specified planes.

```c#
surfaces
{
    type            surfaces;
    libs            ("libsampling.so");
    writeControl    writeTime;

    surfaceFormat   vtk;
	
	formatOptions
	{
		vtk
		{
			legacy true;
			format ascii;
		} 
	}
	
    fields          (p U);

    interpolationScheme cellPoint;

    surfaces
    {
        zNormal
        {
            type        cuttingPlane;
            point       (0 0 0);
            normal      (0 0 1);
            interpolate true;
        }

              yNormal
        {
            type        cuttingPlane;
            point       (0 0.005 0);
            normal      (0 1 0);
            interpolate true;
        }
    };
}
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
