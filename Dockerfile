FROM golang:alpine3.15 AS build

WORKDIR /usr/src/app

COPY ./src/ /usr/src/app

RUN go mod download
RUN go build -o /desafio-go

#MULTISTAGE
FROM scratch

WORKDIR /

COPY --from=build /desafio-go /desafio-go

EXPOSE 8080
CMD [ "/desafio-go" ]