FROM ubuntu:24.04
RUN apt-get update && apt-get install -y wget curl postgresql-client gettext-base
RUN wget https://dl.vikunja.io/vikunja/unstable/vikunja-unstable-x86_64.deb && \
    dpkg -i vikunja-unstable-x86_64.deb || apt-get install -f -y && \
    rm vikunja-unstable-x86_64.deb

COPY config.yml.template /etc/vikunja/config.yml.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["vikunja"]