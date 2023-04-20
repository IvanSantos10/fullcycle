FROM golang:alpine3.14 AS build

WORKDIR /app

COPY . /app

RUN go build -o api main.go

FROM scratch

WORKDIR /app

COPY --from=build /app/api ./

EXPOSE 8000

CMD [ "./api" ]
