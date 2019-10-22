FROM jenkins/jnlp-slave:3.35-5
ARG user=jenkins

USER root
RUN apt-get install -y postgresql
RUN apt-get install -y postgresql-client
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.6/main/postgresql.conf
RUN service postgresql start
USER postgres
RUN createuser serendeepia
RUN psql -c "ALTER USER serendeepia PASSWORD 'serendeepia';"
USER ${user}

ENTRYPOINT ["jenkins-agent"]