# use a node base image
FROM node:8-onbuild

# set maintainer
LABEL maintainer "kushwaha_a@hcl.com"

# tell docker what port to expose
ENV PORT 8080
EXPOSE 8080

# Create app directory
WORKDIR /app

COPY package.json .

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

CMD ["npm", "start"]

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8080 || exit 1
