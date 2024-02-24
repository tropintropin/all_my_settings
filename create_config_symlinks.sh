#!/bin/bash

# Скрипт написан с подсказками от GPT 3.5

# Сделайте файл исполняемым! В терминале введите:
# chmod +x create_config_symlinks.sh

# Затем запустите скрипт:
# ./create_config_symlinks.sh

# Функция для цветного вывода текста. 1 аргумент — цвет, 2 — текст
    # BLACK       0
	# RED         1
	# GREEN       2
	# YELLOW      3
	# BLUE        4
	# PURPLE      5
	# CYAN        6
	# WHITE       7
colorecho() {
    local color="$1"
    local message="$2"
    tput setaf "$color"
    echo "$message"
    tput sgr0
}

# Определение абсолютного пути до директории, в которой находится скрипт
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Функция для проверки файла и создания симлинка
function check_and_create_symlink() {
    local file_name="$1"
    local symlink_path="$HOME/$file_name"
    local source_path="$SCRIPT_DIR/$file_name"

    if [ -f "$symlink_path" ]; then
        if [ -L "$symlink_path" ] && [ "$(readlink "$symlink_path")" = "$source_path" ]; then
            colorecho 6 "Симлинк $symlink_path уже указывает на файл $source_path"
        else
            colorecho 1 "Симлинк $symlink_path уже существует и будет перезаписан"
            ln -sf "$source_path" "$symlink_path"
        fi
    else
        colorecho 3 "Создаю симлинк $symlink_path"
        ln -s "$source_path" "$symlink_path"
    fi
}

# Массив файлов для проверки и создания симлинка
files=("bashrc" "gitconfig" "zshrc" "vimrc" "tmux.conf")

# Цикл для проверки и создания симлинков
for file in "${files[@]}"; do
    colorecho 7 "Проверка файла $file..."
    check_and_create_symlink ".$file"
done

colorecho 2 "Скрипт завершен!"
