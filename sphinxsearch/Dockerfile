FROM fedora:31

RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && dnf -y install \
        sphinx \
    && dnf clean all \
    && usermod --uid 1001 sphinx \
    && groupmod --gid 1001 sphinx \
    && chown sphinx /run/sphinx \
    && chown sphinx /var/log/sphinx
COPY sphinx.conf /etc/sphinx/sphinx.conf
USER sphinx
#CMD ["tail", "-f", "/dev/null"]
CMD ["/usr/bin/searchd", "--nodetach", "--config", "/etc/sphinx/sphinx.conf"]
