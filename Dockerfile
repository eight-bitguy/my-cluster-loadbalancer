FROM nginx:1.19.1-alpine

RUN apk add --no-cache bash

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "-c", "nginx -g \"daemon off;\""]
