FROM mcr.microsoft.com/azure-cli:latest

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
curl -LO "https://github.com/derailed/popeye/releases/download/v0.10.0/popeye_Linux_x86_64.tar.gz" && \
tar -xf popeye_Linux_x86_64.tar.gz popeye && \
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
rm kubectl && \
install -o root -g root -m 0755 popeye /usr/local/bin/popeye && \
rm popeye && \
rm popeye_Linux_x86_64.tar.gz && \
apk update && apk add k9s && \
apk add --update docker