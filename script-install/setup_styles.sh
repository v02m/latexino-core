#!/bin/bash

# setup_styles.sh — установка стилей в ~/texmf
# Работает из любой директории, ссылается на src/

set -e  # Прервать при ошибке

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$PROJECT_DIR/src"
TARGET_DIR="$HOME/texmf/tex/latex/latexino-core"  # ← новое имя!

echo "Project root: $PROJECT_DIR"
echo "Source dir:  $SOURCE_DIR"
echo "Target dir:  $TARGET_DIR"

# Создаём целевую папку
mkdir -p "$TARGET_DIR"

# Удаляем ТОЛЬКО символические ссылки на наши файлы (безопасно!)
echo "Removing old links..."
for file in "$TARGET_DIR"/*.sty; do
    if [ -L "$file" ]; then
        rm "$file"
    fi
done

# Создаём новые ссылки
echo "Creating symbolic links..."
for file in "$SOURCE_DIR"/*.sty; do
    if [ -f "$file" ]; then
        ln -sf "$file" "$TARGET_DIR/"
        echo "  → $(basename "$file")"
    fi
done

# Обновляем TeX-базу
echo "Updating TeX file database..."
if command -v texhash >/dev/null; then
    texhash "$HOME/texmf"
elif command -v mktexlsr >/dev/null; then
    mktexlsr "$HOME/texmf"
else
    echo "Warning: neither texhash nor mktexlsr found. TeX may not see new styles."
fi

echo "✅ Setup complete! Styles available as: \usepackage{<filename>}"
