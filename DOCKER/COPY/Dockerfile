FROM almalinux:8
RUN yum install nginx -y
RUN rm -f /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/
CMD [ "nginx", "-g" , "daemon off;"]
