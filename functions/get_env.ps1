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
#write_json -CONTENTS $OUT -FILE_NAME "t1" -FILE_PATH ".\"
function print_env {
	# show the env variables by name
	([System.Environment]::GetEnvironmentVariables()).Name
}


# 
#$ENV_VAR = "example_env_variable"
#get_env -ENV_VAR
function get_env 
{
	# 
	param($ENV_VAR)  
	#
	$VAR = ([System.Environment]::GetEnvironmentVariables()).($ENV_VAR)
	# 
	Write-Output $VAR
}

# 
#get_email_env 
function get_email_env 
{
	#
	$EMAIL_USER = ([System.Environment]::GetEnvironmentVariables()).EMAIL_USER
	$EMAIL_HOST_PASSWORD = ([System.Environment]::GetEnvironmentVariables()).EMAIL_HOST_PASSWORD
	# 
	$USER = $EMAIL_USER
	$PW = $EMAIL_HOST_PASSWORD
	# 
	Write-Output $USER 
	Write-Output $PW
}

# set environment var
#([System.Environment]::SetEnvironmentVariables("EMAIL_USER", "NEW_USER_EMAIL"))
#([System.Environment]::SetEnvironmentVariables("EMAIL_HOST_PASSWORD", "NEW_APP_PW"))