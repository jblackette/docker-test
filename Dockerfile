FROM registry.access.redhat.com/ubi8/nodejs:12-ubi8
# This image provides a Node.JS environment you can use to build your Modern Web Applications
COPY *.cer /etc/pki/ca-trust/source/anchors/
USER root
RUN /usr/bin/update-ca-trust
RUN chmod -R go+rwx /tmp
RUN npm install lerna
RUN chown -R 1001:0 $HOME && \
    chmod -R 777 $HOME
EXPOSE 8080
USER 1001 
