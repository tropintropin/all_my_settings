#!/bin/bash
#
# Скрипт написан с подсказками от GPT 3.5

echo "Начинаю проверку..."

script_dir="$(dirname "$(readlink -f "$0")")"
cd "$script_dir"

outdated_packages=$(pip list -o)

outdated_module_names=$(echo "$outdated_packages" | awk 'NR>2 {print $1}')

if [ -n "$outdated_module_names" ]; then
  echo "Найдены устаревшие модули:"
  echo "$outdated_module_names"
  echo "Обновляю..."
  echo "$outdated_module_names" | xargs pip install -U
  echo "Обновление завершено."
else
  echo "Нет устаревших модулей."
fi

echo "Проверка завершена!"

