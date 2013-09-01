# Start consoles and launch Vagrant commands
Start-Process "vagrant" "up" -Wait -NoNewWindow
Start-Process "vagrant" "ssh", "-new_console:b" -Wait
Start-Process "vagrant" "ssh", "-new_console:b" -Wait
Start-Process "powershell" "-new_console:b"
& "vagrant" "ssh"
# enter SSH commands
<#
& "ConEmuC64" "/GUIMACRO Tab(7, 0)"
& "ConEmuC64" "/GUIMACRO Paste(2,`"cd /vagrant\n`")"
& "ConEmuC64" "/GUIMACRO Tab(7, 1)"
& "ConEmuC64" "/GUIMACRO Paste(2,`"cd /vagrant\n`")"
& "ConEmuC64" "/GUIMACRO Tab(7, 2)"
& "ConEmuC64" "/GUIMACRO Paste(2,`"cd /vagrant\n`")"
#>