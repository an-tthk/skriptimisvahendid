#!/bin/bash

#kodutöö - Bash. Изучить разделы:
#3. Переменные
#4. Передача аргументов в bash-скрипт
#6. Чтение введенных пользователем данных
# 
#Задание написать скрипт:
#передавать аргументами скрипта имя и фамилию
#сохранить переданные имя и фамилию в две отдельные переменные
#вывести имя и фамилию на экран
#запросить новые значения для переменных имени и фамилии у пользователя
#вывести новые значения имени и фамилии одной строкой на экран

NIMI=$1
PERENIMI=$2

if [ -z "$NIMI" ] || [ -z "$PERENIMI" ]
then
	echo "Pazhalusta vvedite imja familiju"
	echo "Primer: ./kodu1.sh Aleksandr Nurk"
	exit 1
fi

echo -e 'Privet, '$NIMI $PERENIMI'.\n '
read -p 'Pazhalusta vvedite novoe imja: ' NIMI
read -p 'Pazhalusta vvedite novuju familiju: ' PERENIMI

echo -e ' \nPrivet, '$NIMI $PERENIMI'.'