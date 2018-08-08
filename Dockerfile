# use a node base image
FROM node:9-onbuild

# set maintainer
LABEL maintainer "kushwaha_a@hcl.com"

# tell docker what port to expose
ENV PORT 8000
EXPOSE 8000

# Create app directory
WORKDIR /usr/src/app

COPY package.json /usr/src/app

# Set registry
RUN npm config set registry http://18.222.25.181:8081/nexus/content/repositories/npm-group/
RUN npm config set _auth YWRtaW46YWRtaW4xMjM= 
RUN npm config set email kushwaha_a@hcl.com

RUN  cat /root/.npmrc
RUN npm config get registry
# Install app dependencies
CMD ["npm", "install"]

#Run Test
CMD ["npm", "test"]

# Bundle app source
COPY . /usr/src/app

CMD ["npm", "start"]

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
