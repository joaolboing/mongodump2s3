FROM mongo:4.2

RUN apt-get update && apt-get install awscli -y

COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD [ "/run.sh" ]