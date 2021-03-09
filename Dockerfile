# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Robin Cernin <cerninr@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the container
RUN curl -SL https://raw.githubusercontent.com/zerodayz/scheduler-extender/master/main.go -o main.go
RUN curl -SL https://raw.githubusercontent.com/zerodayz/scheduler-extender/master/go.mod -o go.mod
RUN curl -SL https://raw.githubusercontent.com/zerodayz/scheduler-extender/master/go.sum -o go.sum

# Download dependency
RUN go mod download

# Build the Go app
RUN go build -o scheduler-extender main.go

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./scheduler-extender"]
