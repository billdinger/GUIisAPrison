FROM centos:8

# Install Ansible + GCP stuffs.
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
yum -y update && \
yum install -y python3-pip.noarch && \
pip3 install --no-cache-dir --no-compile ansible && \
pip3 install --no-cache-dir --no-compile requests google-auth && \
pip3 install --no-cache-dir --no-compile ansible-lint && \
yum install -y nano && \
yum install -y openssh-clients && \
rm -rf /root/.cache && \
find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf && \
find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

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