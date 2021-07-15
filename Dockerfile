FROM openjdk:11-jdk-buster
RUN apt-get update && \
    apt-get install -y wget curl git tmux python3-pip python3-dev build-essential tree sudo nano \
    apt-transport-https ca-certificates gnupg2 software-properties-common openssh-server && \
    rm -rf /var/lib/apt/lists/* # remove the cached files.

# Install Ansible + GCP stuffs.
RUN pip3 install -U pip && \
    pip3 install boto3 && \
    pip3 install boto && \
    pip3 install --no-cache-dir --no-compile ansible && \
    pip3 install --no-cache-dir --no-compile ansible-lint && \
    pip3 install --no-cache-dir --no-compile requests google-auth && \
    pip3 install -U docker-compose

# Copy over SSH keys
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh 
ADD ./gcp.private /root/.ssh/id_rsa
ADD ./gcp.pub /root/.ssh/id_rsa.pub
RUN  chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub
RUN eval "$(ssh-agent -s)" && ssh-add

# Mount current workdir and start.
VOLUME ["/tmp/playbook"]
WORKDIR  /tmp/playbook
CMD ["bash"]