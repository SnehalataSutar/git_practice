FROM alpine:latest

RUN apk update && apk add --no-cache apache2 

ENV project=devops

WORKDIR /var/www/localhost/htdocs

COPY index.html .

EXPOSE 80

CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]