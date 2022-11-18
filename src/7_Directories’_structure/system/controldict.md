# controlDict

The time from where simulation starts (startFrom), the time when the
simulation finishes (stopAt), the time step (deltaT), the data saving
interval (writeInterval), the saved data file format (writeFormat), the
saved file data precision (writePrecision), and if changing the files
during the run can affect the run or not (runTimeModifiable) are set in
this file.

*Note*: If the write format is ASCII, then the simulation data which is
written to the file can be opened and read using any text editor. If the
format is binary, the data will be written in binary style and is not
readable by text editors. The advantage of binary over ASCII is the
smaller file size, and consequently faster conversion and writing to
disk, for big simulations.

A simple example of a ```controlDict``` is display below:

```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    location    "system";
    object      controlDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

application     simpleFoam;

startFrom       latestTime;

startTime       0;

stopAt          endTime;

endTime         1000;

deltaT          1;

writeControl    timeStep;

writeInterval   100;

purgeWrite      0;

writeFormat     binary;

writePrecision  6;

writeCompression off;

timeFormat      general;

timePrecision   6;

graphFormat     raw;  // (raw is default)

runTimeModifiable true;

functions
{
    #include "yPlus"
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
  $("#footer").load("../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
