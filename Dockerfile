# FROM ubuntu:22.04

# RUN apt update
# RUN apt install curl -y
# RUN curl -L https://install.meilisearch.com | sh

# RUN mv ./meilisearch /usr/local/bin/
# RUN chmod 777 /usr/local/bin/

# ARG MASTER_KEY

# ENV MASTER_KEY=${MASTER_KEY}

# CMD [ "meilisearch" ]
ADD file:80b46be2fe86b402518b00758ff5d8556d92113dc267a002b6c72a5f9c6742a3 in /

CMD ["/bin/sh"]

ENV MEILI_HTTP_ADDR=0.0.0.0:7700
ENV MEILI_SERVER_PROVIDER=docker

RUN /bin/sh -c apk update

COPY /meilisearch/target/release/meilisearch /bin/meilisearch # buildkit

RUN /bin/sh -c ln -s
WORKDIR /meili_data

EXPOSE map[7700/tcp:{}]

ENTRYPOINT ["tini" "--"]
CMD ["/bin/sh" "-c" "/bin/meilisearch"]
