Dim objShell
Set objShell = WScript.CreateObject ("WScript.shell")
objShell.run ".\script\main.ps1" , 1
Set objShell = Nothing