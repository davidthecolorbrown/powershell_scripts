



<#
Functions to deal with standard input/output
#>


#
function print ($STRING) 
{
    # pswh can use either 'Write-Output' OR echo alias
    #$STRING = "pswh can use either 'Write-Output' OR echo alias."
    Write-Output $STRING
    echo $STRING
}

function input ()
{
    # Simple way to get input data from console
    $INPUT = Read-Host "Enter some data (read as a string): " 
    Write-Output $INPUT
}


#
function print_file () 
{
    # return contents of a file
    $FILE_NAME = "test_csv"
    $FILE_PATH = ".\"
    $FILE_EXT = ".csv"
    Get-Content ("{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT)
    #cat ("{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT)
}


<#
write text file

$OUT = @{"col_1"= 12
        "col_2"= 21}
write_txt -CONTENTS $OUT -FILE_NAME "t1" -FILE_PATH ".\"
#>
function write_txt { 
    param($CONTENTS, $FILE_NAME, $FILE_PATH)
    #
    $FILE_EXT = ".txt"
    #
    $CONTENTS | Out-File ("{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT)
}

<#
write csv file

$OUT = @{"col_1"= 12
        "col_2"= 21}
write_csv -CONTENTS $OUT -FILE_NAME "t1" -FILE_PATH ".\" -FILE_EXT ".csv"
#>
function write_csv { 
    param($CONTENTS, $FILE_NAME, $FILE_PATH)
    #
    $FILE_EXT = ".csv"
    $CSV_FILE = "{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT
    #
    $CONTENTS | Export-CSV $CSV_FILE
    #$CONTENTS | Export-CSV ("{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT)
}

<#
write json file

$OUT = @{"col_1"= 12
        "col_2"= 21}
write_json -CONTENTS $OUT -FILE_NAME "t1" -FILE_PATH ".\"
#>
function write_json { 
    param($CONTENTS, $FILE_NAME, $FILE_PATH)    
    #
    $FILE_EXT = ".csv"
    $CSV_FILE = "{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT
    #
    #$CONTENTS | Export-CSV ("{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT)
    $CONTENTS | Export-CSV $CSV_FILE
    #
    $JSON_FILE = "{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, "_to_json.json"
    Get-Content $CSV_FILE | ConvertTo-Json > $JSON_FILE # "{0}{1}{2}" -f $FILE_PATH, $FILE_NAME, $FILE_EXT
}


# convert to html
#$out | convertTo-HTML | out-file output.html
#Get-Content "todo_ps.csv" | ConvertTo-HTML | Out-File output.html
#Get-Content "todo_ps.csv" | ConvertFrom-Csv | ConvertTo-Html | Out-File "output.html