#!/bin/sh

for file in */*.md
	do
	cat <<\EOF >> $file


<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
EOF
done


for file in */*/*.md
	do
	cat <<\EOF >> $file


<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
EOF
done