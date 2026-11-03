# Build the application

FROM rust:latest AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

COPY src ./src

RUN cargo build --release

# Run the application
FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder app/target/release/rust-docker-demo ./rust-docker-demo

EXPOSE 3000

CMD [ "./rust-docker-demo" ]