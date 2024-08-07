FROM golang:1.16.3-alpine3.13 AS BUILDER

WORKDIR /app

COPY ./main.go .

RUN go build main.go 


FROM scratch

COPY --from=BUILDER /app /bin/app

ENTRYPOINT ["/bin/app/main"]

