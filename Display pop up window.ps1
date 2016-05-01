# https://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx

$wshell = New-Object -ComObject Wscript.Shell

$wshell.Popup("Operation Completed",0,"Done",0x0 + 0x40)

