# Problem initialization and interpolation from previous results

From a a brand new case where no available data are in place from previous solution, run the laplacian solver:

```sh
potentialFoam
```

this solver act only on velocity file chainging its potential to overwrite ```0/U``` with to get an
approximate solution of the field. Instead,if data are present from a previous solution it is possible
to map the fields to interpolate the results on the new mesh, running:

```sh
mapFields -consistent -sourceTime <iteration number> <path of the base case>
```
This will overwrite ```0/*``` with the value of
the case interpolating the result in the mesh in interest. If you do not
specify the flag "-consistent", it is necessary build a mapFieldsDict (not adivced).

To reorder the indexing of the matrix to get the more sparse matrix as possible, before launching the calculation use:

```sh
renumberMesh
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
