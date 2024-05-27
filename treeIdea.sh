#!/bin/bash

# Максимальная глубина дерева
max_depth=6
# Максимальное количество элементов для отображения
max_items=110

# Функция для отображения дерева с ограничением количества элементов
function limited_tree() {
  local depth=$1
  local path=$2
  tree -a -L $depth $path | awk -v max_items=$max_items 'NR<=max_items+1'
}

# Запуск функции
limited_tree $max_depth .