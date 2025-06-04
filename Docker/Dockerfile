FROM alpine:latest

ENV path /var/www/localhost/htdocs/index.html

RUN apk update && \
    apk add --no-cache apache2 

RUN echo "<h1> Hello Everyone, Welcome to devops batch</h1>" > /index.html

EXPOSE 80

CMD [ "httpd", "-D", "FOREGROUND" ]