# GitHub Actions Runner Docker Images

This repository contains Dockerfiles and scripts to create Docker images for GitHub Actions Runners on different operating systems. These images can be used to deploy self-hosted runners in your CI/CD infrastructure.

## Supported Operating Systems

- Ubuntu: Lightweight and widely used Linux distribution.
- Alpine: Minimal Linux distribution optimized for size and security. (Pending)
- Windows: For running Windows-based workloads. (Pending)

## How to Use

### Prerequisites

- Docker installed on your machine.
- A GitHub repository or organization where the runner will be registered.
- A valid GitHub token with permissions to register runners.

### Building the Docker Image

1. Navigate to the directory of the desired operating system:

```bash
cd ubuntu/ # or alpine/, windows/, etc.
```

2. Build the Docker image:

```bash
docker build -t apsys-github-runner-ubuntu .
```

## Running the Docker Container

Run the container with the required environment variables:

```bash
docker run -d \
  --name github-runner-container \
  -e GITHUB_TOKEN=<YOUR_GITHUB_TOKEN> \
  -e GITHUB_URL=https://github.com/<OWNER_OR_ORGANIZATION> \
  -e RUNNER_GROUP=<RUNNER_GROUP> \
  -e RUNNER_NAME=<RUNNER_NAME> \
  apsys-github-runner-ubuntu
```

### Environment

- GITHUB_TOKEN: (Required) The GitHub token to register the runner.
- GITHUB_URL: (Required) The URL of the GitHub repository or organization.
- RUNNER_GROUP: (Optional) The runner group to which the runner will belong. Default: "Default".
- RUNNER_NAME: (Optional) The name of the runner. Default: Hostname of the container.
