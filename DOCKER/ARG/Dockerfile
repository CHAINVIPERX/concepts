ARG version
FROM almalinux:${version}
ARG username
RUN adduser $username
USER ${username}
ARG COURSE
ARG NAME
ENV COURSE=${COURSE}
ENV NAME=${NAME}
RUN echo "Course: ${COURSE}, NAME: ${NAME}"
CMD [ "sleep","100" ]