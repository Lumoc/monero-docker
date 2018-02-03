FROM servethehome/monero_xmrig:latest
RUN chmod 777 /home
ADD xmrig.sh /usr/local/bin/xmrig.sh
RUN chmod +x /usr/local/bin/xmrig.sh
USER 1001
CMD /bin/sh -c /usr/local/bin/xmrig.sh