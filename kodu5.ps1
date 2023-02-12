<#
	@@@@@- Aleksandr Nurk
	@@@@@- LOGITgv21

	@ Используя скрипт из AD User Guide pdf и файл AD users csv добавлять пользователей в домен.
	@ Вместо $transuname использовать $uname в New-ADUser -Name
	
	@ Задание: создать скриптом пользователей в AD из указанного .csv файла, предварительно 
	  изменить скрипт, чтобы $domain соответствовал имени домена сервера, $userSAM состоял из 
	  первой буквы имени и полностью фамилии (Vasaja Pupkin = vpupkin), -Path $_.OU указать в 
	  соответствии с organization unit домена

	@ FirstName, LastName, Department, JobTitle, Password, OU
#>

$domain = "@nurk.loc"
Import-Module activedirectory
Import-Csv "Y:\AD_users.csv" | ForEach-Object {
	$userSAM = $_.FirstName.Substring(0, 1).ToLower() + $_.LastName.ToLower()

	if (@(Get-ADUser -Filter "SamAccountName -eq '$($userSAM)'").Count -ne 0) {
		Write-Host "User $userSAM already exists, skipping.." -ForegroundColor Red
		Return
	}

	$upn = $userSAM + $domain
	$uname = $_.LastName + " " + $_.FirstName

	if ($_.OU -ne "") {
		$OU = $_.OU
	} else {
		$OU = "OU=IT,DC=nurk,DC=loc"
	}

	New-ADUser `
		-Name $uname `
		-DisplayName $uname `
		-GivenName $_.LastName `
		-Surname $_.FirstName `
		-Department $_.Department `
		-Title $_.JobTitle `
		-UserPrincipalName $upn `
		-SamAccountName $userSAM `
		-Path $OU `
		-AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -force) `
		-Enabled $true

    Write-Host "User $userSAM successfully created!"
}
