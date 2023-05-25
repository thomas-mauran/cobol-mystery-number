FROM ubuntu

RUN apt-get update && apt-get install -y gnucobol4

COPY game.cob .

RUN cobc -free -x -o game game.cob

ENTRYPOINT [ "./game" ]


