# Rust Docker Demo

A simple project to learn how to containerize a Rust application using Docker.

This project explores Docker fundamentals, including writing a Dockerfile, building Docker images, running containers, and using multi-stage builds to create smaller production images.

## Tech Stack

- **Rust** – Application development
- **Docker** – Application containerization
- **Debian Slim** – Lightweight runtime image

## Project Structure

```text
rust-docker-demo/
├── src/
│   └── main.rs
├── Cargo.toml
├── Cargo.lock
├── Dockerfile
└── README.md
```

## Getting Started

### Prerequisites

Make sure you have installed:

- [Rust](https://www.rust-lang.org/tools/install)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### 1. Clone the repository

```bash
git clone https://github.com/Harijayaraj-S/rust-docker-demo
cd rust-docker-demo
```

### 2. Build the Docker image

Run the following command from the project root:

```bash
docker build -t rust-docker-demo:v1 .
```

This builds the application using a multi-stage Dockerfile.

**What's happening behind the scenes?**

- Docker pulls the Rust image for the build stage.
- Copies the Cargo files and Rust source code.
- Compiles the application in release mode.
- Creates a separate Debian Slim runtime image.
- Copies only the compiled executable into the runtime image.

### 3. Run the container

```bash
docker run --name rust-app rust-docker-demo:v1
```

### 4. Check the output

To see the application output:

```bash
docker logs rust-app
```

### 5. Check running containers

```bash
docker ps -a
```

### 6. Clean up

Remove the container:

```bash
docker rm rust-app
```

Remove the Docker image:

```bash
docker rmi rust-docker-demo:v1
```

## Docker Concepts Covered

- Docker images and containers
- Dockerfile instructions (`FROM`, `WORKDIR`, `COPY`, `RUN`, `CMD`, `EXPOSE`)
- Docker build context
- Multi-stage Docker builds
- Builder and runtime stages
- Container image optimization
- Running compiled Rust applications without including the Rust compiler in the runtime image

## Key Learning

One of the main things I learned from this project is how Docker multi-stage builds work.

Instead of shipping the entire Rust development environment with the application, I can compile the application in a builder stage and copy only the executable into a lightweight runtime image.

This helps reduce unnecessary dependencies and keeps the final Docker image leaner.