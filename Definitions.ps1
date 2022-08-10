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
# For 32bit Windows
$OracleJDK = 'jdk-8u341-windows-i586'
$OracleJDKInstaller = "$OracleJDK.exe"
$OracleJDKURL ="https://downloads.sourceforge.net/portableapps/$OracleJDKInstaller"
$OracleJDKDirectory =".\$OracleJDK"
$OracleJDKBinariesDirectory ="$OracleJDKDirectory\bin"
# For 64bit Windows
$OracleJDK64 = 'jdk-8u341-windows-x64'
$OracleJDKInstaller64 = "$OracleJDK64.exe"
$OracleJDKURL64 ="https://downloads.sourceforge.net/portableapps/$OracleJDKInstaller64"
$OracleJDKDirectory64 =".\$OracleJDK64"
$OracleJDKBinariesDirectory64 ="$OracleJDKDirectory64\bin"

$OracleJDKInternalCABPath = '.rsrc\1033\JAVA_CAB10'
$OracleJDKInternalCAB = '111'
$OracleJDKInternalArchive ='tools.zip'

#
# LessMSI to unpack 7zip portable
# 
$LessMSI = 'lessmsi-v1.4'
$LessMSIArchive = "$LessMSI.zip"
$LessMSIURL = 'https://github.com/activescott/lessmsi/releases/download/v1.4/' + $LessMSIArchive
$LessMSIDirectory = ".\$LessMSI"
$LessMSIExecutable ='lessmsi.exe'

#
# 7zip portable to extract and setup JDK archive
#
$7z = '7z2201-x64'
$7zInstaller = "$7z.msi"
$7zURL = "https://cfhcable.dl.sourceforge.net/project/sevenzip/7-Zip/22.01/$7zInstaller"
$7zDirectory = ".\$7z\SourceDir\Files\7-Zip"
$7zExecutable = '7z.exe'
