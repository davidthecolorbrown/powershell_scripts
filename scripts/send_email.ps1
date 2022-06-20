<#
.SYNOPSIS
	Send an email message.
.DESCRIPTION
	Send an email message. Assumes email address for user and their email app password at already set as local env variables ('EMAIL_USER', 'EMAIL_HOST_PASSWORD')
.EXAMPLE
	PS> ./send_email
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	
#>

# get environment variables for email address using 2FA
#([System.Environment]::GetEnvironmentVariables()).Name
$EMAIL_USER = ([System.Environment]::GetEnvironmentVariables()).EMAIL_USER
$EMAIL_APP_PASSWORD = ([System.Environment]::GetEnvironmentVariables()).EMAIL_HOST_PASSWORD
$USER = $EMAIL_USER
$PW = $EMAIL_APP_PASSWORD


# get email variables
$FROM = read-host "Enter sender email address"
$TO = read-host "Enter recipient email address"
$SUBJECT = read-host "Enter subject"
$BODY = read-host "Enter message"

# try to send email
try {
    # create new email, verify credentials, and send
    $SMTPServer = "smtp.gmail.com"
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($FROM,$TO,$SUBJECT,$BODY)
    $SMTPMessage.ReplyTo = $FROM
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($USER, $PW)
    $SMTPClient.Send($SMTPMessage)
    # success 
    "Message sent."
    exit 0 
} 
# if fail to send email, print error
catch {
    # failure
	#"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    Write-Output $Error.ExceptionMessage
	exit 1
}