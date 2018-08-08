# Hello Node
This is a very basic Hello World application written with Node.

It includes a `Dockerfile` for building a Docker image with the application, and a `Jenkinsfile` that defines a build pipeline for it.

https://getintodevops.com

# Docker build
sudo docker build . -f Dockerfile.test -t getintodevops-hellonode-test:1

# Docker run with port
sudo docker run -i -t -p 8000:8000 a505c2c095aa

# Docker scan with with bash
sudo docker run -i -t -p 8000:8000 a505c2c095aa bash

# Copy changes
sudo docker run -i -t --mount type=bind,source=/home/ubuntu/app/amit,target=/usr/src/app/coverage a505c2c095aa
