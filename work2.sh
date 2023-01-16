#!/bin/bash

# Скрипт показывает количество переданных аргументов и выводит их в обратном порядке через цикл.
# Решение отправить текстом на daniil.solomykov@tthk.ee

# объявление массива из $@ элементов
ARRAY=("$@")

# получение числа элементов массива
ELEMENTS=${#ARRAY[@]}

echo 'Total elements: ' $ELEMENTS

for (( i = $ELEMENTS; i >= 0; i-- )); do
	STR=$STR' '${ARRAY[${i}]}
done

echo $STR
