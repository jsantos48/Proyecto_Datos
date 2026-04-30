#!/bin/bash

url="https://github.com/jsantos48/Proyecto_Datos.git"
repositorio=$(basename "$url" .git)

# ============================
# DETECCIÓN AUTOMÁTICA DE RUTA
# ============================
ruta=$(dirname "$(readlink -f "$0")")/..
cd "$ruta"

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# ============================
# VALIDAR QUE ES REPOSITORIO GIT
# ============================
if [ ! -d .git ]; then
    echo ""
    echo "❌ ERROR: No se detecta repositorio Git en $ruta"
    exit 1
fi

echo ""
echo "🔍 Analizando estado del repositorio..."

# ============================
# ACTUALIZAR INFORMACIÓN REMOTA
# ============================
git fetch origin $branch >/dev/null 2>&1

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse origin/$branch)
BASE=$(git merge-base @ origin/$branch)

# ============================
# COMPROBAR SI HAY CAMBIOS LOCALES
# ============================
if [[ -z $(git status --porcelain) ]]; then
    echo "ℹ️ No hay cambios locales para subir."
    read -p "Pulse ENTER para continuar..." cont
    exit 0
fi

# ============================
# REMOTO MÁS AVANZADO
# ============================
if [ "$LOCAL" = "$BASE" ]; then
    echo ""
    echo "❌ GitHub contiene cambios nuevos que no tienes en local."
    echo ""
    echo "📥 Archivos modificados en remoto:"
    git diff --name-status $LOCAL origin/$branch
    echo ""
    echo "➡ Debes ejecutar primero un git pull --rebase o sincronizar manualmente."
    read -p "Pulse ENTER para continuar..." cont
    exit 1
fi

# ============================
# DIVERGENCIA ENTRE LOCAL Y REMOTO
# ============================
if [ "$LOCAL" != "$REMOTE" ] && [ "$REMOTE" != "$BASE" ]; then
    echo ""
    echo "⚠️ Se detectó divergencia entre tu copia local y GitHub."
    echo ""
    echo "📂 Posibles archivos en conflicto:"
    git diff --name-only $LOCAL origin/$branch
    echo ""
    echo "⛔ Operación cancelada para evitar conflictos o duplicaciones."
    read -p "Pulse ENTER para continuar..." cont
    exit 1
fi

# ============================
# MOSTRAR ARCHIVOS LOCALES A SUBIR
# ============================
echo ""
echo "📤 Archivos locales preparados para publicar:"
git status --short

echo ""
read -p "¿Deseas continuar con la subida segura? (s/n): " confirm

if [ "$confirm" != "s" ]; then
    echo "Operación cancelada por el usuario."
    exit 0
fi

# ============================
# SUBIDA SEGURA
# ============================
git add .
git commit -m "⬆️ ASIR: Subida de nuevos materiales y prácticas"
git push origin $branch

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Cambios publicados correctamente y repositorio sincronizado."
else
    echo ""
    echo "❌ ERROR al publicar los cambios."
fi

read -p "Pulse ENTER para continuar..." cont
