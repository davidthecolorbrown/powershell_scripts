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

# 
([System.Environment]::GetEnvironmentVariables()).Name
$EMAIL_USER = ([System.Environment]::GetEnvironmentVariables()).EMAIL_USER
$EMAIL_HOST_PASSWORD = ([System.Environment]::GetEnvironmentVariables()).EMAIL_HOST_PASSWORD
#$USER = 'testuser'
$USER = $EMAIL_USER
#$PW = "testpwd"
$PW = $EMAIL_HOST_PASSWORD


# 
#$TO = "test@test.com"
#$FROM = "test@test.com"
#$SUBJECT = "Disk space alert"
#$BODY = "low space in the system"
$FROM = read-host "Enter sender email address"
$TO = read-host "Enter recipient email address"
$SUBJECT = read-host "Enter subject"
$BODY = read-host "Enter message"

#
try {
    #
    $SMTPServer = "smtp.gmail.com"
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($FROM,$TO,$SUBJECT,$BODY)
    $SMTPMessage.ReplyTo = $FROM
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
    #
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($USER, $PW)
    $SMTPClient.Send($SMTPMessage)
    "✔️  Message sent."
    # success
    exit 0 
} 
#
catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    #Write-Output $Error.ExceptionMessage
    # failure
	exit 1
}