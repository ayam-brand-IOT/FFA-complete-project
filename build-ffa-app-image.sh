#!/bin/bash

# Construye una imagen reproducible de ffa-app con el frontend compilado dentro.
# Uso: ./build-ffa-app-image.sh [plataforma]   (por defecto linux/arm64, Raspberry Pi)
#
# Resultado en images/:
#   ffa-app_<sha app>_ui-<sha ui>.tar.gz  imagen lista para `docker load`
#   *.sha256                              checksum del tar
#   *.manifest.txt                        commits, plataforma y checksums del dist

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PLATFORM="${1:-linux/arm64}"
APP="$ROOT/ffa-app"
UI="$ROOT/user-interface"
OUT="$ROOT/images"

# Solo se permite config/index.js modificado en la UI: en produccion usa URLs relativas.
dirty_app="$(git -C "$APP" status --porcelain)"
dirty_ui="$(git -C "$UI" status --porcelain | grep -v ' src/config/index.js$' || true)"
if [[ -n "$dirty_app" || -n "$dirty_ui" ]]; then
    echo "❌ Hay cambios sin commitear; la imagen no seria reproducible:"
    [[ -n "$dirty_app" ]] && echo "ffa-app:" && echo "$dirty_app"
    [[ -n "$dirty_ui" ]] && echo "user-interface:" && echo "$dirty_ui"
    exit 1
fi

APP_SHA="$(git -C "$APP" rev-parse --short HEAD)"
UI_SHA="$(git -C "$UI" rev-parse --short HEAD)"
TAG="ffa-app:${APP_SHA}-ui-${UI_SHA}"
NAME="ffa-app_${APP_SHA}_ui-${UI_SHA}"

echo "🔨 Compilando user-interface ($UI_SHA)..."
(cd "$UI" && NODE_ENV=production npx vue-cli-service build)

if grep -rqE '192\.168\.|127\.0\.0\.1' "$UI/dist" --include='*.js' --include='*.html'; then
    echo "❌ El build contiene URLs de desarrollo"
    exit 1
fi

echo "📦 Copiando dist a ffa-app/dist..."
find "$APP/dist" -mindepth 1 ! -name .gitkeep -delete
cp -R "$UI/dist/." "$APP/dist/"

echo "🐳 Construyendo $TAG para $PLATFORM..."
docker buildx build --platform "$PLATFORM" -t "$TAG" --load "$APP"

mkdir -p "$OUT"
docker save "$TAG" | gzip > "$OUT/$NAME.tar.gz"
(cd "$OUT" && shasum -a 256 "$NAME.tar.gz" > "$NAME.tar.gz.sha256")

{
    echo "image: $TAG"
    echo "platform: $PLATFORM"
    echo "built: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "ffa-app: $(git -C "$APP" rev-parse HEAD) ($(git -C "$APP" branch --show-current))"
    echo "user-interface: $(git -C "$UI" rev-parse HEAD) ($(git -C "$UI" branch --show-current))"
    echo "dist checksums:"
    (cd "$APP/dist" && find . -type f ! -name .gitkeep | sort | xargs shasum -a 256)
} > "$OUT/$NAME.manifest.txt"

echo "✅ $OUT/$NAME.tar.gz"
