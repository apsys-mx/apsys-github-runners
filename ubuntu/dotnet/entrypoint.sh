#!/bin/bash

# Configurar e iniciar el runner (sin migraciones)
cd /home/github-runner/actions-runner
./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN" --runnergroup "$RUNNER_GROUP" --name "$RUNNER_NAME" --work _work --unattended
./run.sh