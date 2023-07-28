#!/bin/bash

# Скрипт написан с помощью ChatGPT
# https://chat.openai.com/share/50889d98-df9c-4429-af07-ff88a1a6fa1b

# Сделайте файл исполняемым! В терминале введите:
# chmod +x create_config_symlinks.sh

# Затем запустите скрипт:
# ./create_config_symlinks.sh

# Определение абсолютного пути до директории, в которой находится скрипт
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Функция для проверки файла и создания симлинка
function check_and_create_symlink() {
    local file_name="$1"
    local symlink_path="$HOME/$file_name"
    local source_path="$SCRIPT_DIR/$file_name"

    if [ -f "$symlink_path" ]; then
        if [ -L "$symlink_path" ] && [ "$(readlink "$symlink_path")" = "$source_path" ]; then
            echo "Симлинк $symlink_path уже указывает на файл $source_path"
        else
            echo "Симлинк $symlink_path уже существует и будет перезаписан"
            ln -sf "$source_path" "$symlink_path"
        fi
    else
        echo "Создаю симлинк $symlink_path"
        ln -s "$source_path" "$symlink_path"
    fi
}

# Массив файлов для проверки и создания симлинка
files=("bashrc" "gitconfig" "zshrc" "vimrc" "tmux.conf")

# Цикл для проверки и создания симлинков
for file in "${files[@]}"; do
    echo "Проверка файла $file..."
    check_and_create_symlink ".$file"
done

echo "Скрипт завершен."
