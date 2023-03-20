# FT_SERVER
This is a System Administration subject.

## Objective
Discover Docker and set up our first web server.

## Usage
### Init Docker Image
`docker build -t <image_name> .`
- On MacOS : `sh utils/init_docker.sh`
### Run Docker container
`docker run -i <image_name> -p8080:8080`
