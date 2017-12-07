#Requires -Version 2.0

<#
    .SYNOPSIS
        Helper functions and shims for older versions of PowerShell
 #>

<#
    .SYNOPSIS
        Expands a relative path into an absolute path.
 #>

 function Expand-Path
 {
     [OutputType([String])]
     Param (
         [Parameter(Mandatory=$true)]
         [String]
         $Path
     )
 
     $ResolvePathParameter = @{
         Path = $Path;
         ErrorAction = 'SilentlyContinue';
         ErrorVariable = 'ResolveError';
     }
     $ResolvedPath =
         Resolve-Path @ResolvePathParameter
 
     if (!($ResolvedPath))
     {
         $ResolvedPath =
             $ResolveError[0].TargetObject
     }
 
     return "$ResolvedPath"
 }
 
 <#
     .SYNOPSIS
         Returns the first directory name in a relative path.
  #>
 
 function Get-RelativeRootDirectory
 {
     [OutputType([String])]
     Param(
         [Parameter(Mandatory=$true)]
         [String]
         $RelativePath
     )
 
     $Path =
         Expand-Path -Path $RelativePath
     $RelativePath =
         $Path.Replace($PWD, '')
 
     $Elements =
         $RelativePath.Split('\')
     $Directory =
         $Elements[0]
 
     if (!($Directory))
     {
         $Directory =
             $Elements[1]
     }
 
     return $Directory
 }
 
 <#
     .NOTES
         An `Expand-Archive` shim for older PowerShells
  #>
 
 if (!(Get-Command -Name 'Expand-Archive' `
                   -ErrorAction SilentlyContinue))
 {
     $ExpandArchiveIsShimmed =
         $true
 
     <#
         .SYNOPSIS
             Unpacks an archive.
     #>
     function Expand-Archive
     {
         Param(
             [Parameter(Mandatory=$true)]
             [String]
             $Path
         )
 
         if (Test-Path -Path $Path)
         {
             $Path =
                 Expand-Path -Path $Path
 
             $NewObjectParameters = @{
                 TypeName = 'System.IO.FileInfo';
                 ArgumentList = $Path;
             }
             $DestinationDirectoryInfo =
                 New-Object @NewObjectParameters
             $DestinationDirectory =
                 ".\$($DestinationDirectoryInfo.BaseName)"
             $DestinationDirectory =
                 Expand-Path -Path $DestinationDirectory
 
             $NewItemParameters = @{
                 Path = $DestinationDirectory;
                 ItemType = 'Directory';
             }
             New-Item @NewItemParameters -Force | Out-Null
 
             $ShellApplication =
                 New-Object -Com 'shell.application'
 
             $Archive =
                 $ShellApplication.NameSpace($Path)
             $Destination =
                 $ShellApplication.NameSpace($DestinationDirectory)
 
             $Destination.CopyHere($Archive.Items())
         }
     }
 }
 
 <#
     .NOTES
         An `Invoke-WebRequest` shim for older PowerShells
 #>
 
 if (!(Get-Command -Name 'Invoke-WebRequest' `
                   -ErrorAction SilentlyContinue))
 {
     $InvokeWebRequestIsShimmed =
         $true
 
     <#
         .SYNOPSIS
             Downloads a file.
      #>
     function Invoke-WebRequest
     {
         Param(
             [Parameter(Mandatory=$true)]
             [Uri]
             $Uri,
 
             [Parameter(Mandatory=$true)]
             [String]
             $OutFile
         )
 
         $WebClient =
             New-Object -TypeName 'System.Net.WebClient'
 
         Write-Output "Downloading '$Uri' to '$OutFile'..."
 
         $WebClient.DownloadFile($Uri, $OutFile)
     }
 }
 
 <#
     .SYNOPSIS
         Downloads a file while sending requests with provided cookies.
 
     .NOTES
         Uses the `Invoke-WebRequest` cmdlet if possible.
 #>
 
 function Invoke-WebRequestWithCookies
 {
     Param(
         [Parameter(Mandatory=$true)]
         [Uri]
         $Uri,
 
         [Parameter(Mandatory=$true)]
         [String]
         $OutFile,
 
         [Parameter(Mandatory=$true)]
         [System.Net.CookieContainer]
         $Cookies
     )
 
     if ($InvokeWebRequestIsShimmed)
     {
         $WebClient =
             New-Object -TypeName 'System.Net.WebClient'
 
         $Header =
             $Cookies.GetCookieHeader($Uri)
 
         $WebClient.Headers.Add('Cookie', $Header)
 
         Write-Output "Downloading '$Uri' to '$OutFile'..."
 
         $WebClient.DownloadFile($Uri, $OutFile)
     }
     else
     {
         $Session =
             New-Object -TypeName `
                 'Microsoft.PowerShell.Commands.WebRequestSession'
 
         $Session.Cookies =
             $Cookies
 
         $InvokeWebRequestParameters = @{
             Uri = $Uri;
             OutFile = $OutFile;
             WebSession = $Session;
         }
         Invoke-WebRequest @InvokeWebRequestParameters
     }
 }
 