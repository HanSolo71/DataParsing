$UsernamePass = Select-String -Path 'C:\Temp\*.txt' -Pattern "@company.com" | Select-Object -ExpandProperty Line
$List = $UsernamePass
$UserObjs = $List | ForEach-Object {
   $split = $_ -split ":",3
   [PSCustomObject]@{Line = $split[0]; Username = $split[1]; Password = $split[2]; }
}
$UserObjs | Export-CSV -Path "C:\Temp\company.csv"
