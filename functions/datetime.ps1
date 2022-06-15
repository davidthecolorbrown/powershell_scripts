

<#
##################
Set of functions for working with datetime objects
date_utc_format: YYYY-MM-DDThh:mm:ss.0000000Z
##################
#>

# get date windows format
Get-Date -Format "dddd dd-MM-yyyy HH:mm K

#
Get-Date | Format-Table

# get date with unix format
Get-Date -UFormat "%d-%m-%Y %r %Z"

# return todays date in table format with attributes
Get-Date | Format-List

# get a datetime objects specific attribute
(Get-Date).Year

# get datetime methods
Get-Date | Get-Member

# set a generic datetime object using specific values
$DATE = Get-Date -Month 11 -Day 23 -Year 2020 -Hour 00 -Minute 00 -Second 00

# add/sub 
$ADD_OR_REMOVE_DAYS = -1 # +1 or -1
$SHIFT_DAYS_BY = args[0] # number of days to shift current day by
$CURR_DAY = Get-Date
$NEW_DAY = ($CURR_DAY).AddDays($ADD_OR_REMOVE_DAYS * $SHIFT_DAYS_BY)
Write-Output $NEW_DAY
#echo $NEW_DAY

# find the difference between a start and end date
$StartDate = Get-Date -Month 11 -Day 23 -Year 2020 -Hour 00 -Minute 00 -Second 00
$EndDate = Get-Date -Month 12 -Day 31 -Year 2020 -Hour 00 -Minute 00 -Second 00
New-TimeSpan -Start $StartDate -End $EndDate

# compare two dates (is, eq, ne, lt, gt, le, ge, band, bor, and, or)
$Date1 = (Get-Date -Month 11 -Day 14 -Year 2020)
$Date2 = Get-Date
$Date1 -lt $Date2

# cast a string as a datetime object
$DATE_STRING = "2020-09-07T13:35:08.4780000Z"
$DATE_OBJ = [DateTime]$DATE_STRING
