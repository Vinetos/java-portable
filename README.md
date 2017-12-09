# Java Portable (JDK and JRE)
Install a **portable version** of the JDK (and bundled JRE) and **run it everywhere** without **admin rights** on **Windows**.  

**The scripts don't touch your project files in any way or form.**

### You can: 
* **Install the JDK (+ JRE)** on a removable device (like USB key).
* **Run and compile** application on every computer which can run Java.  

**Works without internet** (only setup need an internet connection).

# Prerequisite
 - **Windows 7 and higher**.
 - **Powershell 2.0** or highter (see [get powershell](https://github.com/PowerShell/PowerShell#get-powershell)\) \(installed by default on Windows\).

# Installation
Before run, make sure that you have **an active internet connection**.

Run ``Setup.ps1`` with **powershell** to download, create and setup the jdk files.

# Run everywhere
Once you have done the installation,  
**Run** ``start.bat`` on **the computer you want** to use the JRE/JDK. It will set environment variables for applications which needs Java.

# That's It
Type ``java -version`` and ``javac -version`` into CMD to see if all works fine !

# Shortcomings
In an environment with a ``Restricted`` PowerShell execution policy, you have to start scripts in the following way

 ```PowerShell.exe -ExecutionPolicy Bypass -File <a script file name to start>```
