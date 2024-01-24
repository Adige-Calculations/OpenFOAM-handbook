# Automating boundary conditions writing

This prectice it is not necessary, but usually multiple regions in CHT studies are present and manually 
managing the ```0``` directory dictionaries can be overwhelming. The utility ```changeDictionary``` 
can be used to generate a set of dictionary from a sample:

```sh
for region in $(foamListRegions)
do
  changeDictionary -region $region
done
```

To make this utility working your "system" directory must instanciate a similar layout:

```sh
system
│
├── regionName1
│   ├── changeDictionaryDict
│   ├── decomposeParDict -> ../decomposeParDict
│   ├── fvOptions -> ../fvOptions
│   ├── fvSchemes
│   └── fvSolution
├── regionName2
│   ├── changeDictionaryDict
│   ├── createBafflesDict
│   ├── decomposeParDict -> ../decomposeParDict
│   ├── fvOptions -> ../fvOptions
│   ├── fvSchemes
│   └── fvSolution
├── topoSetDict
├── controlDict
└── ...
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
