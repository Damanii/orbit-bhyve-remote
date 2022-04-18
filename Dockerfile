FROM node:8

RUN mkdir -pv /bhyve/config
VOLUME /bhyve

WORKDIR /usr/src/app
COPY package*.json ./
COPY config.json /bhyve/config 
# Only include production files
# RUN npm ci --only=production
RUN npm i --only=production

# Bundled app source
COPY . .
EXPOSE 8080

# Run the app
CMD [ "npm", "start" ]