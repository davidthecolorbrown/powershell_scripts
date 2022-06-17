

<#
##################
Set of functions for working with datetime objects
date_utc_format: YYYY-MM-DDThh:mm:ss.0000000Z
##################
#>

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
function get_date_table
{
    # 
    Get-Date | Format-Table
}

#
function get_date_attr
{
    # return todays date in table format with attributes
    Get-Date | Format-List
}


#
function get_year {
    # get a datetime objects specific attribute
    (Get-Date).Year
}


#
function get_month {
    # get a datetime objects specific attribute
    (Get-Date).Month
}

#
function get_day {
    # get a datetime objects specific attribute
    (Get-Date).Day
}



# 
function datetime_methods 
{
    # get datetime methods
    Get-Date | Get-Member
}


#
function get_windows_date
{
    # get date windows format
    Get-Date -Format "yyyy-MM-dd HH:mm K"
}

#
function get_unix_date
{
    # get date with unix format
    Get-Date -UFormat "%d-%m-%Y %r %Z"
}


#
function get_date
{
    # 
    Get-Date -UFormat "%Y%m%d"
}


#
function set_generic_dt 
{
    # set a generic datetime object using specific values
    $DATE = Get-Date -Month 11 -Day 23 -Year 2020 -Hour 00 -Minute 00 -Second 00
}



<#
$DAYS = [int]31 # -31
shift_day_by -NUM_DAYS $DAYS
#>
function shift_day_by 
{
    #
    param($NUM_DAYS) 
    # add/sub 
    #$ADD_OR_REMOVE_DAYS = -1 # +1 or -1
    #$SHIFT_DAYS_BY = args[0] # number of days to shift current day by
    #$CURR_DAY = Get-Date
    #$NEW_DAY = ($CURR_DAY).AddDays($ADD_OR_REMOVE_DAYS * $SHIFT_DAYS_BY)
    # 
    $CURR_DAY = Get-Date
    $NEW_DAY = ($CURR_DAY).AddDays($NUM_DAYS)
    Write-Output $NEW_DAY
}


<##>
function difference_between_dates
{
    #
    param($START_DATE, $END_DATE)
    # find the difference between a start and end date
    #$StartDate = Get-Date -Month 11 -Day 23 -Year 2020 -Hour 00 -Minute 00 -Second 00
    #$EndDate = Get-Date -Month 12 -Day 31 -Year 2020 -Hour 00 -Minute 00 -Second 00
    #New-TimeSpan -Start $StartDate -End $EndDate

    #
    if (New-TimeSpan -Start $StartDate -End $EndDate)
}


<##>
function compare_dates
{
    #
    param($DATE_1, $DATE_2)
    # compare two dates (is, eq, ne, lt, gt, le, ge, band, bor, and, or)
    #$DATE_1 = (Get-Date -Month 11 -Day 14 -Year 2020)
    #$DATE_2 = Get-Date
    #$Date1 -lt $Date2

    # check whether date 2 is in future compared to date 1
    if ($DATE_2 -gt $DATE_1) 
    {
        Write-Output "$DATE_2 is in future compared to $DATE_1."

    }
    # check if date 2 is 
    elseif ($DATE_2 -lt $DATE_1) 
    {
        Write-Output "$DATE_2 is in past compared to $DATE_1."

    }
    # must be equal dates
    else 
    {
        Write-Output "$DATE_2 is same as $DATE_1."
        
    }

}


<##>
function string_to_dt
{
    #
    param($START_DATE, $END_DATE)
    # cast a string as a datetime object
    $DATE_STRING = "2020-09-07T13:35:08.4780000Z"
    $DATE_OBJ = [DateTime]$DATE_STRING
}