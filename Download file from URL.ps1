Invoke-WebRequest -Uri "https://github.com/SuperFlea2828/PowershellScripts/archive/master.zip" -OutFile "C:\Scripts.zip"
$shell = new-object -com shell.application
$zip = $shell.NameSpace(“C:\Scripts.zip”)
foreach($item in $zip.items())
{
    $shell.Namespace(“C:\temp”).copyhere($item) 
}

