FROM szabgab/galaxy:main

WORKDIR /srv

RUN echo "===> Installing system dependencies" && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y unzip && \
    apt-get install -y less && \
    apt-get install -y vim && \
    wget https://github.com/Bailador/bailador.net/archive/main.zip
    #unzip main.zip

COPY . .

CMD ["/bin/bash"]
