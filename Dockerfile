FROM fedora:23

RUN dnf -y install python-websockify && dnf clean all
ADD noVNC /noVNC
RUN ln -s /noVNC/vnc_auto.html /noVNC/index.html
ADD start.sh /start.sh

EXPOSE 6080

CMD [ "/start.sh" ]
