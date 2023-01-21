#!/bin/bash

until (( $choice > 0 && $choice < 5 ))
do
	echo "What is your preferred programming / scripting language"
	echo "1) bash"
	echo "2) perl"
	echo "3) python"
	echo "4) c++"
	echo "5) I do not know !"
	read choice;

	# структура простого bash условия
	# обратите внимание: в этом случае $case - это переменная, которая не обязана так называться
	# здесь она названа так для примера
	case $choice in
		1) echo "You selected bash";;
		2) echo "You selected perl";;
		3) echo "You selected python";;
		4) echo "You selected c++";;
		5) exit
	esac
done
