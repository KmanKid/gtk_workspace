
# Ensure the script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You need to have Administrator rights to run this script. Please re-run this script as an Administrator."
    exit
}

function replaceStringInFile {
    param (
        $filePath,
        $oldString,
        $newString
    )
    (Get-Content -Path $filePath) -replace $oldString, $newString | Set-Content -Path $filePath   
}

$installer_uri = "https://github.com/msys2/msys2-installer/releases/download/2024-05-07/msys2-x86_64-20240507.exe"
$filename = "msys2-installer.exe"
$install_path = "C:/msys64"

#Install msys2
$ProgressPreference = 'SilentlyContinue'
Write-Output "Starting"
Invoke-WebRequest -Uri $installer_uri -OutFile $filename
$ProgressPreference = 'Continue'
& ./$filename in --confirm-command --accept-messages --root $install_path
Remove-Item -Path ./$filename
# & $install_path\uninstall.exe pr --confirm-command

#Install dependencies
$bashpath = "$install_path/usr/bin/bash.exe"
& $bashpath --login -i -c 'pacman -S mingw-w64-x86_64-gtk4 --noconfirm'
#pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
& $bashpath --login -i -c 'pacman -S mingw-w64-x86_64-toolchain base-devel --noconfirm'

$currentdir = Get-Location
$currentdir = $currentdir -replace '\\','/'
replaceStringInFile -filePath "./.vscode/c_cpp_properties.json" -oldString "!installpath!" -newString "$install_path/"
replaceStringInFile -filePath "./.vscode/tasks.json" -oldString "!installpath!" -newString "$install_path/"
replaceStringInFile -filePath "./.vscode/tasks.json" -oldString "!currentdir!" -newString "$currentdir"
