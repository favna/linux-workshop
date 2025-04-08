FROM debian:bookworm

RUN apt update && \
	apt install -y \
		cron \
		curl \
		less \
		locate \
		man \
		nano \
		sudo \
		vim \
		wget \
	# Remove apt cache
	&& apt-get clean -y \
	&& apt autoremove -y \
	&& rm -rf /var/lib/apt/lists/* \
	# Add aliases
	&& echo "alias ll='ls -lhs'" >> /etc/bash.bashrc \
	&& echo "alias la='ls -lAhs'" >> /etc/bash.bashrc \
	&& echo "alias grep='grep --color=always'" >> /etc/bash.bashrc \
	&& echo 'export PS1="\[\033[1;32m\]\u\[\033[0;36m\]@\h \[\033[1;35m\]\w\[\033[0m\]\$ "' >> /etc/bash.bashrc \
	&& useradd -m "my_user" \
	&& useradd "old-deprecated_user" \
	&& usermod --shell /bin/bash my_user \
	&& mkdir -p /var/old_logging && touch /var/old_logging/log1.log && touch /var/old_logging/log2.log

COPY lipsum.txt /home/my_user/.hidden-directory/very-well-hidden.1.txt
COPY lipsum.txt /home/my_user/.hidden-directory/very-well-hidden.2.txt
COPY fun.sh /root/fun.sh

RUN updatedb
