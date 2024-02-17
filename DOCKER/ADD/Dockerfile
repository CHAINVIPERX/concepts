FROM almalinux:8
RUN yum install nginx -y
RUN rm -f /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/
ADD https://github.com/Stability-AI/StableCascade/blob/master/readme.md /tmp/index.html
CMD [ "nginx", "-g" , "daemon off;"]
