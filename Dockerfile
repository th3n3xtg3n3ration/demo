FROM nginx:alpine

COPY resources/nginx.conf /etc/nginx/conf.d/default.conf
COPY resources/index.html /usr/share/nginx/html/
EXPOSE 8083

COPY resources/crontab.txt /crontab.txt
COPY resources/script.sh /script.sh
COPY resources/entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]
