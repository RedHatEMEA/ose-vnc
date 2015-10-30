FROM fedora:22

RUN dnf install -y git hostname net-tools procps-ng python-websockify which && dnf clean all
RUN git clone https://github.com/kanaka/noVNC.git /novnc
RUN ln -s /novnc/vnc_auto.html /novnc/index.html
ADD start.sh /start.sh
RUN chmod u+x /start.sh

EXPOSE 6080

CMD [ "/start.sh" ]


