# MSYS2 Installation and Configuration Script

This PowerShell script installs MSYS2 and its dependencies, configures the environment for building GTK applications, and sets up Visual Studio Code for development.

## Prerequisites

Ensure the script is run as an Administrator.

## Script Overview

- Administrator Check: Confirms the script is running with Administrator rights.
- Function Definition: Defines a function to replace strings in files.
- Download and Install MSYS2:
- Downloads the MSYS2 installer.
- Installs MSYS2 to C:/msys64.
- Removes the installer after installation.
- - Installs GTK4 and development tools using pacman.
- Directory Configuration:
- - Converts the current directory path to a Unix-style path.
- - Copies the base VS Code configuration to the current directory.
- - Updates paths in the VS Code configuration files with the installation and current directory paths.
- Clean Up: Removes any existing installation log.
- Open VS Code: Launches Visual Studio Code.

## Usage

Run the script in PowerShell as an Administrator at the base of the repo.

**If you can not execute the script you should set the Execution Policy to RemoteSigned.**

Be careful and consult [Execution Policies](https://learn.microsoft.com/en-US/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4#powershell-execution-policies)!

This is also needed for the proxy script that builds the .exe!

> `Set-ExecutionPolicy RemoteSigned`

You can set it to Default or any other value by running:

> `Set-ExecutionPolicy Default`

You should now be able to run the main.cpp or the main.c file via the playbutton (select "Build and Run GTK Application")
