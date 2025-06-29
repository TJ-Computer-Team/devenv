FROM node:20

WORKDIR /home/tjctgrader/coderunner

COPY ./coderunner/package*.json ./
RUN npm install

RUN mkdir -p /home/tjctgrader/config/

COPY coderunner/ .
COPY config/coderunner/code /home/tjctgrader/config/
COPY config/coderunner/generate_problems.sh /home/tjctgrader/config/

RUN chmod +x /home/tjctgrader/config/generate_problems.sh
RUN bash /home/tjctgrader/config/generate_problems.sh

RUN apt-get update && \
    apt-get install -y \
        flex \
        bison \
        build-essential \
        protobuf-compiler \
        libprotobuf-dev \
        libnl-3-dev \
        libnl-route-3-dev

RUN cd nsjail && make && cd ..

COPY config/coderunner/archive.zip /tmp/archive.zip
RUN apt-get update && apt-get install -y unzip
COPY config/coderunner/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

RUN apt-get update && apt-get install -y default-jdk && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["npm", "run", "dev"]
