# Set encoding to ANSI (GB2312)
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("gb2312")

function Set-Proxy {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Configuration - Set Proxy"
    Write-Host "============================================================"
    Write-Host "NetMount Proxy Configuration Script - Set Proxy"
    Write-Host "============================================================"
    Write-Host "Please enter your local proxy server address:"
    Write-Host "For example, the default address for v2RayN is 127.0.0.1:10809"
    $proxy = Read-Host ">"

    Write-Host "============================================================"
    Write-Host "Setting HTTP_PROXY environment variable to http://$proxy..."
    [Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://$proxy", "User")
    Write-Host "Setting HTTPS_PROXY environment variable to http://$proxy..."
    [Environment]::SetEnvironmentVariable("HTTPS_PROXY", "http://$proxy", "User")
    Write-Host "Setting ALL_PROXY environment variable to socks5://$proxy..."
    [Environment]::SetEnvironmentVariable("ALL_PROXY", "socks5://$proxy", "User")
    Write-Host "Proxy settings should be successful. Please check for any errors."
    Write-Host "============================================================"
}

function Remove-Proxy {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Configuration - Remove Proxy"
    Write-Host "============================================================"
    Write-Host "NetMount Proxy Configuration Script - Remove Proxy"
    Write-Host "============================================================"
    Write-Host "Clearing HTTP_PROXY environment variable..."
    [Environment]::SetEnvironmentVariable("HTTP_PROXY", $null, "User")
    Write-Host "Clearing HTTPS_PROXY environment variable..."
    [Environment]::SetEnvironmentVariable("HTTPS_PROXY", $null, "User")
    Write-Host "Clearing ALL_PROXY environment variable..."
    [Environment]::SetEnvironmentVariable("ALL_PROXY", $null, "User")
    Write-Host "Proxy has been successfully cleared."
    Write-Host "============================================================"
}

$host.UI.RawUI.WindowTitle = "NetMount Proxy Management Script"
Clear-Host
Write-Host "============================================================"
Write-Host "Welcome to the NetMount Proxy Management Script"
Write-Host "Please choose an option:"
Write-Host "============================================================"
Write-Host "1 - Set Proxy"
Write-Host "2 - Remove Proxy"
Write-Host "3 - Exit"
Write-Host "============================================================"
Write-Host "H - Homepage"
Write-Host "A - About"
Write-Host "============================================================"
$choice = Read-Host "Enter your choice [1,2,3] "
if ($choice -eq "1") {
    Set-Proxy
} elseif ($choice -eq "2") {
    Remove-Proxy
} elseif ($choice -eq "3") {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Management Script - Exit"
    Write-Host "Exiting the script..."
    Exit
} elseif ($choice -eq "H" -or $choice -eq "h") {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Management Script - Homepage"
    Write-Host "Opening the homepage..."
    Start-Process "https://github.com/NT-AUTHORITY/NetMount-Proxy-Management-Script"
    Exit
} elseif ($choice -eq "A" -or $choice -eq "a") {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Management Script - About"
    Write-Host "NetMount Proxy Management Script"
    Write-Host "Version 1.0"
    Write-Host "Author: NT_AUTHORITY"
    Write-Host "GitHub: https://github.com/NT-AUTHORITY"
    Write-Host "============================================================"
    Write-Host "A NetMount proxy settings management script."
    Write-Host "For more information, please visit the homepage."
    Write-Host "============================================================"
    Read-Host -Prompt "Press Enter to exit"
    Exit
} else {
    $host.UI.RawUI.WindowTitle = "NetMount Proxy Management Script - Invalid Choice"
    Write-Host "Invalid choice, please rerun the script and select a valid option."
}

Read-Host -Prompt "Press Enter to exit"
Exit