FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/nginx/tools/* /etc/nginx/ssl/
COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
