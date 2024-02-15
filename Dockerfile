FROM node:16-alpine as builder

WORKDIR "/app"

COPY package.json .
RUN npm install

COPY  . . 

RUN npm run build


# /app/build  ----> will have our build folder
#everythng above this will be get dumped once  below code run so we olny have build rest code is droped
FROM nginx

COPY  --from=builder /app/build /usr/share/nginx/html

# ngixn default command is already to run the nginx so no need to add CMD for us