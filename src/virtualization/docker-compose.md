# Docker compose 

Docker Compose is a tool for running multi-container applications on Docker defined using
the Compose file format. A Compose file is used to define how one or more containers that 
make up your application are configured, such as:

```yml
version: '3.4'

services:
  restsvr:
    image: imageName
    ports:
      - 443:8000
    build:
      context: .
      dockerfile: ./Dockerfile

    logging:
      driver: "json-file"
      options:
        max-size: "100m"
        max-file: "5"
```
Once you have a Compose file, you can create and start your application with a single command:

```sh
docker-compose up --build -d
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
