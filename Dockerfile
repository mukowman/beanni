# Install the app dependencies in a full Node docker image
FROM node:14-alpine
  
WORKDIR "/app"

# Copy package.json and package-lock.json
COPY * ./

# Install app dependencies
RUN npm install
RUN npm run build
RUN npm run init

USER node

CMD ["npm", "run", "fetch"]
