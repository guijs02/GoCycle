FROM golang:1.4-alpine as build

WORKDIR /app
COPY ./src ./
RUN go build -o hello .

FROM scratch
WORKDIR /app
COPY --from=build /app .

CMD ["./hello"]
