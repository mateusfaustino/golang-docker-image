FROM golang:1.9.6 as BUILDER

WORKDIR /app

COPY *.go .
COPY go.mod .

RUN go build -o main . 

FROM scratch

COPY --from=BUILDER /app/main ./main

EXPOSE 8080

CMD ["./main"]