#Requires -Version 2.0

<#
    .SYNOPSIS
        Sets environment variables to local directories.
 #>

#
# Definitions
#

. '.\AndroidStudioPortable-Definitions.ps1'

#
# Helpers
#

. '.\AndroidStudioPortable-Helpers.ps1'

#
# Set environment variables.
#


$env:JAVA_HOME =
    Expand-Path -Path $OracleJDKDirectory

$env:PATH =
    "$(Expand-Path -Path $OracleJDKBinariesDirectory);$env:PATH"
