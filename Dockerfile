# Install the app dependencies in a full Node docker image
FROM node:14
  
WORKDIR "/app"

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install --production

WORKDIR "/app"

COPY . /app

RUN npm run build

USER node

CMD ["npm", "run". "fetch"]
