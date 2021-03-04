## -- main image ---
FROM zenika/alpine-chrome:latest

USER root

# supervisord config
COPY ./supervisord.conf /etc/supervisord.conf
# COPY --chown=docker:docker ./supervisord.conf /etc/supervisord.conf

# Install supervisord (in golang)
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /bin/supervisord

RUN apk add --update nodejs npm

COPY express /usr/src/app

WORKDIR /usr/src/app
RUN mkdir -p /data && npm install

# Remove hasura default entrypoint
ENTRYPOINT []

EXPOSE 9223

CMD ["sh", "-c", "supervisord -c /etc/supervisord.conf"]
