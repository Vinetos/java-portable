#Requires -Version 2.0

<#
    .SYNOPSIS
        Definitions for a portable java development environment
    .NOTES
        To update a package, update its name and its URL, then delete all folders and run Setup.
 #>

#
# Oracle JDK archive
# See https://www.whitebyte.info/programming/java/how-to-install-a-portable-jdk-in-windows-without-admin-rights
# 
$OracleJDK = 'jdk-8u151-windows-x64'
$OracleJDKInstaller = "$OracleJDK.exe"
$OracleJDKURL ="http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/$OracleJDKInstaller"
$OracleJDKInternalCABPath = '.rsrc\1033\JAVA_CAB10'
$OracleJDKInternalCAB = '111'
$OracleJDKInternalArchive ='tools.zip'
$OracleJDKDirectory =".\$OracleJDK"
$OracleJDKBinariesDirectory ="$OracleJDKDirectory\bin"

#
# LessMSI to unpack 7zip portable
# 
$LessMSI = 'lessmsi-v1.4'
$LessMSIArchive = "$LessMSI.zip"
$LessMSIURL = 'https://github.com/activescott/lessmsi/releases/download/v1.4/' + $LessMSIArchive
$LessMSIDirectory = ".\$LessMSI"
$LessMSIExecutable ='lessmsi.exe'

#
# 7zip portable to extract and setup jdk archive
#
$7z = '7z2201-x64'
$7zInstaller = "$7z.msi"
$7zURL = "https://cfhcable.dl.sourceforge.net/project/sevenzip/7-Zip/22.01/$7zInstaller"
$7zDirectory = ".\$7z\SourceDir\Files\7-Zip"
$7zExecutable = '7z.exe'
