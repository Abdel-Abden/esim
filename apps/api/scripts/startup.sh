#!/usr/bin/env bash
set -e

CONTAINER_NAME="postgres-local-dev"
ENV_FILE="${1:-.env.local}"
STRIPE_FORWARD_TO="${STRIPE_FORWARD_TO:-localhost:3000/api/webhooks/stripe}"

STRIPE_PID=""
STRIPE_WEBHOOK_SECRET=""

CLEANED_UP=0

if [ ! -f "$ENV_FILE" ]; then
  echo "Env file not found: $ENV_FILE"
  exit 1
fi

update_env_value() {
  local key="$1"
  local value="$2"

  if grep -q "^${key}=" "$ENV_FILE"; then
    sed -i.bak "s|^${key}=.*|${key}=${value}|" "$ENV_FILE"
  else
    echo "" >> "$ENV_FILE"
    echo "${key}=${value}" >> "$ENV_FILE"
  fi

  rm -f "${ENV_FILE}.bak"
}

cleanup() {
  if [ "$CLEANED_UP" -eq 1 ]; then
    return
  fi
  CLEANED_UP=1

  echo "========== STOPPING =========="
  echo "Stopping stripe"

  if [ -n "$STRIPE_PID" ] && kill -0 "$STRIPE_PID" >/dev/null 2>&1; then
    kill "$STRIPE_PID" >/dev/null 2>&1 || true
  fi

  if [ "$ENV_FILE" == ".env.local" ]; then
    echo "Stopping and removing $CONTAINER_NAME..."
    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
  fi
}

trap cleanup EXIT INT TERM

## Check if local env to start postgres container
if [ "$ENV_FILE" == ".env.local" ]; then
  echo "Local env : starting docker"
  
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

  docker run -d \
    --name "$CONTAINER_NAME" \
    -e POSTGRES_USER=dev \
    -e POSTGRES_PASSWORD=dev \
    -e POSTGRES_DB=appdb \
    -p 5433:5432 \
    -v "./init:/docker-entrypoint-initdb.d" \
    postgres:16
fi

## Starting Stripe to get secret then webhook
echo "Getting Stripe webhook secret..."
STRIPE_WEBHOOK_SECRET="$(
  stripe listen --forward-to "$STRIPE_FORWARD_TO" --print-secret 2>&1 \
  | grep -o 'whsec_[[:alnum:]_]*' \
  | head -n 1
)"

if [ -z "$STRIPE_WEBHOOK_SECRET" ]; then
  echo "Stripe secret not found, retrying..."
  STRIPE_WEBHOOK_SECRET="$(
    stripe listen --forward-to "$STRIPE_FORWARD_TO" --print-secret 2>&1 \
    | grep -o 'whsec_[[:alnum:]_]*' \
    | head -n 1
  )"

  if [ -z "$STRIPE_WEBHOOK_SECRET" ]; then
    echo "Unable to extract Stripe webhook secret"
    exit 1
  fi
fi

echo "Updating $ENV_FILE STRIPE_WEBHOOK_SECRET=$STRIPE_WEBHOOK_SECRET"

update_env_value "STRIPE_WEBHOOK_SECRET" "$STRIPE_WEBHOOK_SECRET"

echo "Starting Stripe CLI -> $STRIPE_FORWARD_TO"

stripe listen --forward-to "$STRIPE_FORWARD_TO" &
STRIPE_PID=$!

echo "Using env file: $ENV_FILE"

tsx watch --env-file="$ENV_FILE" src/server.ts