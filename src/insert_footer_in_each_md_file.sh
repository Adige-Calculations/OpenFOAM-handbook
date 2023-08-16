#!/bin/sh
# delete the last 16 lines of a file

# for markdown_file in */*.md
#   do
#   sed -e :a -e '$d;N;2,16ba' -e 'P;D' 
# done
# # delete the last 16 lines of a file

# for markdown_file in */*/*.md
#   do
#   sed -e :a -e '$d;N;2,16ba' -e 'P;D' 
# done


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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
EOF
done

# Fix picking up in a way that picks up only file in second level
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
  $("#footer").load("../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
EOF
done

# Fix picking up in a way that picks up only file in second level
for file in */*/*/*.md
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
  $("#footer").load("../../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
EOF
done
