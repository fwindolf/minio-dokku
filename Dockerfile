FROM minio/minio:latest

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data \
    && chown -R dokku:dokku /home/dokku/data

# Add custom nginx.conf template for Dokku to use
WORKDIR /app
ADD nginx.conf.sigil .

CMD ["minio", "server", "/home/dokku/data", "--user", "dokku", "--console-address", ":9001"]
