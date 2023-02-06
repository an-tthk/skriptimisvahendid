<#
	@ Task:

		Написать скрипт, который построчно считывает C:\Windows\Logs\StorGroupPolicy.log файл
		и копирует все строки содержащие слово "status" в текстовый файл на рабочем столе.

	@ Notes:

		"gc" is alias of "Get-Content"
		"sc" is alias of "Set-Content"
		"?" after "|" is alias of "Where-Object"

	@ Can be interpreted as:

		Get-Content "C:\Windows\Logs\StorGroupPolicy.log" | Where-Object { $_ -like "*status*" } | Set-Content ~\Desktop\status.txt

	@ Other way:

		if (Test-Path -Path ~\Desktop\status.txt -PathType Leaf) {
			Remove-Item -fo ~\Desktop\status.txt
		}

		foreach ($line in Get-Content C:\Windows\Logs\StorGroupPolicy.log) {
			if ($line -like "*status*") {
				$line >> ~\Desktop\status.txt
			}
		}
#>

gc C:\Windows\Logs\StorGroupPolicy.log |? {$_ -like "*status*"} | sc ~\Desktop\status.txt
