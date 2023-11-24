FROM public.ecr.aws/docker/library/alpine:3.17.5
RUN	apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
