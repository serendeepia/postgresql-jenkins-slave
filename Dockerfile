FROM jenkins/jnlp-slave:3.35-5

USER root
RUN apt-get install -y postgresql
RUN apt-get install -y postgresql-client
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.6/main/postgresql.conf

ENTRYPOINT ["/bin/bash", "-c", "service postgresql start && su jenkins -c jenkins-agent"]