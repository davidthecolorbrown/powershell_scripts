<#
.SYNOPSIS
	Get local environment variables.
.DESCRIPTION
	Gets common environment variables.
.EXAMPLE
	PS> ./get-env
.LINK
	https://github.com/davidthecolorbrown/powershell_scripts/
.NOTES
	
#>

# 
([System.Environment]::GetEnvironmentVariables()).Name
$EMAIL_USER = ([System.Environment]::GetEnvironmentVariables()).EMAIL_USER
$EMAIL_HOST_PASSWORD = ([System.Environment]::GetEnvironmentVariables()).EMAIL_HOST_PASSWORD
#$USER = 'testuser'
$USER = $EMAIL_USER
#$PW = "testpwd"
$PW = $EMAIL_HOST_PASSWORD

