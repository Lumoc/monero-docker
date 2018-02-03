FROM servethehome/monero_xmrig:latest
RUN chmod 775 /
USER 1001
CMD /bin/sh -c /usr/local/bin/xmrig.sh