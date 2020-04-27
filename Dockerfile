FROM openjdk:8-alpine

RUN apk add --no-cache wget ttf-dejavu && \
  adduser -D -u 1000 irpf

RUN wget http://downloadirpf.receita.fazenda.gov.br/irpf/2020/irpf/arquivos/IRPF2020-1.6.zip -O irpf.zip && \
  unzip irpf.zip -d /opt/ && \
  rm irpf.zip
WORKDIR /opt/IRPF2020

USER irpf
CMD java -jar irpf.jar
