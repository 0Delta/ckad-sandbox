FROM ubuntu:16.04

WORKDIR /root

ENV PROJECT=$project
ENV ZONE=us-central1-a

COPY ./setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

COPY ./teardown.sh /tmp/teardown.sh
RUN chmod +x /tmp/teardown.sh 
RUN echo "alias exit='/tmp/teardown.sh && exit'" >>~/.bashrc

RUN apt-get update && apt-get -y install --no-install-recommends \
    curl vim bash-completion apt-transport-https ca-certificates gnupg

# kubectl
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && apt-get update -y && apt-get install kubectl -y

# gcloud 
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

# Enable bash completion
RUN echo 'source /usr/share/bash-completion/bash_completion' >>~/.bashrc

#############
RUN echo 'source <(kubectl completion bash)' >>~/.bashrc
RUN echo 'alias k=kubectl' >>~/.bashrc
RUN echo 'complete -F __start_kubectl k' >>~/.bashrc
RUN echo "alias kn='k config set-context --current --namespace '" >>~/.bashrc

CMD [ "/tmp/setup.sh" ]

# For developer ###
# BUILD: docker build -t qushot/ckad-sandbox:dev .
# RUN:   docker run -it -e PROJECT={{YOUR_PROJECT}} --rm qushot/ckad-sandbox:dev
