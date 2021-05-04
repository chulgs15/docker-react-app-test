from node:alpine as builder

workdir /usr/src/app

copy package.json ./

run npm install

copy ./ ./

run npm run build

from nginx
expose 80
copy --from=builder /usr/src/app/build /usr/share/nginx/html