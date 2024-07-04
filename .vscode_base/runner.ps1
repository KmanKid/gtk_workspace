param (
    [string]$inputParam,
    [string]$outputParam
)

$inputParam = $inputParam -replace '\\','/'
$outputParam = $outputParam -replace '\\','/'
Write-Output "Starting build of $inputParam"
# Define the command as a string
$command = "!installpath!/usr/bin/bash.exe -c 'g++ -fdiagnostics-color=always -g $(pkg-config --cflags gtk4) $inputParam -o $outputParam $(pkg-config --libs gtk4)'"
# Invoke the command
Invoke-Expression $command
Write-Output "Finished building $outputParam"