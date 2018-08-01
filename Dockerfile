# use a node base image
FROM node:8-onbuild

# set maintainer
LABEL maintainer "kushwaha_a@hcl.com"

# tell docker what port to expose
ENV PORT 8000
EXPOSE 8000

# Create app directory
WORKDIR /usr/src/app

COPY package.json /usr/src/app

# Install app dependencies
RUN npm install

# Bundle app source
COPY . /usr/src/app

CMD ["npm", "start"]

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
