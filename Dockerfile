FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y man wget curl locate less nano sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "alias ll='ls -l'" >> /etc/bash.bashrc

RUN useradd -m "my_user"
RUN useradd "old-deprecated_user"

RUN mkdir -p /var/old_logging && touch /var/old_logging/log1.log && touch /var/old_logging/log2.log
ADD lipsum.txt /home/my_user/.hidden-directory/very-well-hidden.1.txt

RUN updatedb
