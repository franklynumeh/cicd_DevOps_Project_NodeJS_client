FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]

LABEL maintainer="chiemelaumeh1@gmail.com"
LABEL application="CICD server application"