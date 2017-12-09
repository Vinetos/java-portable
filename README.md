# JDK Portable
Install and run a portable version of the JDK without admin rights on Windows.

# Prerequisite
 - Windows 7 and higher
 - Powershell 2.0 or highter (see [get powershell](https://github.com/PowerShell/PowerShell#get-powershell)\).

# First time installation
Run ``Setup.ps1`` to download, create and setup the jdk.

# Run everywhere
Once you have setup the JDK. Just run ``start.bat`` where you want to use the JRE/JDK to set environment variables to local directories.

# Test
Type ``java -version`` and ``javac -version`` to see if all works fine !

# Shortcomings

The scripts don't touch your project files in any way or form.

In an environment with a ``Restricted`` PowerShell execution policy you have to start scripts in the following way

 ```PowerShell.exe -ExecutionPolicy Bypass -File <a script file name to start>```
