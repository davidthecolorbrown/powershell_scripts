<#
.SYNOPSIS
	Removes duplicate commits from a CSV file.
.DESCRIPTION
	Given ... ... removes duplicates from CSV file.
.EXAMPLE
	PS> ./remove_duplicates_by_id.ps1 -FILE_NAME commits -FILE_PATH .\data\
.LINK
.NOTES
#>

# path to file
$CSV_FILE = "{0}{1}.csv" -f $FILE_PATH, $FILE_NAME
$NEW_FILE = "unique_commits"
$NEW_CSV_FILE = "{0}{1}.csv" -f $FILE_PATH, $NEW_FILE

# import csv object, sort for unique commit id, save to new file in cwd
try {
    # import commit data
    $commits = Import-Csv $CSV_FILE
    # get only unique commits 
    $unique_commits = $commits | Sort-Object commit_id –Unique 
    # export only unique commits to new csv 
    $unique_commits | Export-CSV $NEW_CSV_FILE
    # success
    "Successfully removed duplicates from CSV file."
    exit 0 
} 
# if error occurs, print error to terminal
catch {
    # failure
    "An error occurred while trying to remove duplicates from CSV file."
    Write-Output $Error.ExceptionMessage
	exit 1
}