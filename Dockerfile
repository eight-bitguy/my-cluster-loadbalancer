FROM nginx:stable

RUN apt-get update \
    && apt-get install -y cron bash certbot \
    && apt-get update -y

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./scripts /scripts

RUN chmod +x /scripts/*.sh

RUN echo "22 03 * * 2,7 root ./scripts/renew.sh" >/etc/cron.d/certbot-renew

CMD [ "sh", "-c", "cron && nginx -g 'daemon off;'" ]
