#!/bin/bash

# Verificar que se hayan proporcionado los parámetros obligatorios
if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_URL" ]; then
  echo "Error: Se requieren las variables de entorno GITHUB_TOKEN y GITHUB_URL."
  exit 1
fi


# Asignar un valor predeterminado al runner group si no se proporciona
RUNNER_GROUP="${RUNNER_GROUP:-Default}"
echo "Runner group set to value: $RUNNER_GROUP"

# Asignar un valor predeterminado al nombre del runner si no se proporciona
RUNNER_NAME="${RUNNER_NAME:-$(hostname)}"
echo "Runner name set to value: $RUNNER_NAME"

# Cambiar al directorio del runner
cd /home/github-runner/actions-runner

# Configurar el GitHub Runner
./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN" --runnergroup "$RUNNER_GROUP" --name "$RUNNER_NAME" --work _work --unattended

# Iniciar el GitHub Runner
./run.sh