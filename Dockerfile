# 
# Installs WordPress with wp-cli (wp.cli.org) installed
# Docker Hub: https://registry.hub.docker.com/u/conetix/wordpress-with-wp-cli/
# Github Repo: https://github.com/conetix/docker-wordpress-wp-cli

FROM appcontainers/wordpress:debian

# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y curl less


# Download WordPress CLI
RUN curl -L "https://github.com/wp-cli/wp-cli/releases/download/v0.23.0/wp-cli-0.23.0.phar" > /usr/bin/wp && \
    chmod +x /usr/bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
