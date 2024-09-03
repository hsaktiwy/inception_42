FROM debian:bullseye
RUN apt-get update
RUN apt-get install -y curl
RUN curl -L https://github.com/google/cadvisor/releases/download/v0.50.0/cadvisor-v0.50.0-linux-amd64 -o cadvisor
RUN chmod +x cadvisor
ENTRYPOINT ["./cadvisor"] 
