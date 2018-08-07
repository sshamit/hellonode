# use a node base image
FROM node:9-onbuild

# set maintainer
LABEL maintainer "kushwaha_a@hcl.com"

# tell docker what port to expose
ENV PORT 8000
EXPOSE 8000


COPY package.json /usr/src/app

# Create app directory
WORKDIR /usr/src/app

# Set registry
RUN npm config set registry http://18.222.25.181:8081/nexus/content/repositories/npm-group/
RUN npm config set _auth YWRtaW46YWRtaW4xMjM= 
RUN npm config set email kushwaha_a@hcl.com

RUN  cat /root/.npmrc
RUN npm config get registry
# Install app dependencies
RUN npm install  --verbose
#--registry=http://ec2-18-222-25-181.us-east-2.compute.amazonaws.com:8081/nexus/content/groups/npm-group/ --_auth=YWRtaW46YWRtaW4xMjM= --email=kushwaha_a@hcl.com

# Bundle app source
COPY . /usr/src/app

CMD ["npm", "start"]

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
