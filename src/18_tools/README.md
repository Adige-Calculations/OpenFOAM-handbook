# Text editors

To edit text during local and remote session, a GUI will not be always available.
As a consequence software able to manage text efficiently on terminal are necessary.
It is adivised to deprecate ```nano``` and make use of the most advanced tool to edit text.

| Software name | Destination of use  |  Why |
| -----------   | ------------------- |------------------- |
|  micro        | Dictionary editing  | Easy to use and common shortcuts|
|  vim          | Code editing        | Tons extentions and good sintax highlighting|


Debian based system will install the software via:
```sh
sudo apt install micro vim
```

## Windows text editors

Here there is a list of useful programmes that are available for Windows system

### NotePad ++

If you are in a Windows environment, we suggest using NotePad++ as a
default text editor.

A single modification must be apported since writing script in this
environment can cause crashes due to a different treatment of invisible
character for Windows or UNIX. Operate this mod to make the file
readable without trouble in GNU-Linux:

NotePad++ → Edit → EOL conversion →  UNIX
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
