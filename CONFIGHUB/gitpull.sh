#!/bin/bash

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
NC='\033[0m'

url="https://github.com/jsantos48/Proyecto_Datos.git"
repositorio=$(basename "$url" .git)

# ============================
# DETECCIÓN AUTOMÁTICA DE RUTA
# ============================
ruta=$(dirname "$(readlink -f "$0")")/..
cd "$ruta"

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# ============================
# VALIDAR REPOSITORIO
# ============================
if [ ! -d .git ]; then
    echo -e "${ROJO}❌ Error: No se encontró la carpeta .git en $ruta${NC}"
    exit 1
fi

echo ""
echo "🔍 Analizando estado antes de actualizar..."

# ============================
# SI HAY CAMBIOS SIN COMMIT
# ============================
if [[ -n $(git status --porcelain) ]]; then
    echo -e "${ROJO}❌ Tienes cambios locales sin guardar o sin commit.${NC}"
    echo "Haz commit/stash antes de actualizar para evitar sobrescrituras."
    read -p "Pulse ENTER para continuar..." cont
    exit 1
fi

# ============================
# ACTUALIZAR REFERENCIAS REMOTAS
# ============================
git fetch origin $branch >/dev/null 2>&1

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse origin/$branch)
BASE=$(git merge-base @ origin/$branch)

# ============================
# SI YA ESTÁ ACTUALIZADO
# ============================
if [ "$LOCAL" = "$REMOTE" ]; then
    echo -e "${VERDE}✅ El repositorio ya está completamente actualizado.${NC}"
    read -p "Pulse ENTER para continuar..." cont
    exit 0
fi

# ============================
# SI TIENES COMMITS LOCALES NO SUBIDOS
# ============================
if [ "$REMOTE" = "$BASE" ] && [ "$LOCAL" != "$REMOTE" ]; then
    echo -e "${AMARILLO}⚠️ Tienes commits locales que aún no han sido subidos a GitHub.${NC}"
    echo "Haz primero la subida segura para no mezclar historiales."
    read -p "Pulse ENTER para continuar..." cont
    exit 1
fi

# ============================
# SI HAY DIVERGENCIA
# ============================
if [ "$LOCAL" != "$REMOTE" ] && [ "$LOCAL" != "$BASE" ]; then
    echo -e "${AMARILLO}⚠️ Se detectó divergencia entre local y remoto.${NC}"
    echo ""
    echo "📂 Archivos potencialmente conflictivos:"
    git diff --name-only $LOCAL origin/$branch
    echo ""
    echo "⛔ Pull cancelado para evitar conflictos automáticos."
    read -p "Pulse ENTER para continuar..." cont
    exit 1
fi

# ============================
# MOSTRAR ARCHIVOS QUE SE VAN A DESCARGAR
# ============================
echo ""
echo "📥 Archivos nuevos/modificados que llegarán desde GitHub:"
git diff --name-status $LOCAL origin/$branch

echo ""
read -p "¿Deseas continuar con la actualización segura? (s/n): " confirm

if [ "$confirm" != "s" ]; then
    echo "Actualización cancelada."
    exit 0
fi

# ============================
# DESCARGA SEGURA
# ============================
git pull --rebase origin $branch

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${VERDE}✅ Repositorio actualizado correctamente y sincronizado.${NC}"
else
    echo ""
    echo -e "${ROJO}❌ Error durante la actualización del repositorio.${NC}"
fi

read -p "Pulse ENTER para continuar..." cont
