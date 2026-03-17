#!/usr/bin/env bash

set -e


ENV_FILE="${1:-.env.local}"

if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Fichier $ENV_FILE introuvable"
  exit 1
fi

echo "📄 Chargement des variables depuis $ENV_FILE..."
set -a
source "$ENV_FILE"
set +a


echo "🔎 Vérification de eas-cli..."

if ! command -v eas >/dev/null 2>&1; then
  echo "📦 Installation de eas-cli..."
  npm install -g eas-cli
fi

echo "🔐 Vérification login Expo..."

if ! eas whoami >/dev/null 2>&1; then
  echo "Connexion requise..."
  eas login
fi

echo "🧠 Limitation mémoire Node..."

TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
MAX_NODE=$((TOTAL_RAM - 10240))

export NODE_OPTIONS="--max-old-space-size=$MAX_NODE"

echo "🚀 Lancement du build Android (APK)..."

eas build --platform android --local --profile preview