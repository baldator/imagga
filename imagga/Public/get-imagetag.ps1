#requires -version 4
<#
.SYNOPSIS
  Get recommended tags from imagga
.DESCRIPTION
  The Get-ImageTag function is part of Imagga module. It retrieves the suggested tags to associate to the image passed as parameter.
.PARAMETER url
  The url of the image to be tagged. It has to be accessible from imagga server, so make sure it's a public url.
.PARAMETER apikey
  Your imagga API key. If you don't have one follow the doc: https://docs.imagga.com/#introduction
.PARAMETER secret
  Your imagga API secret.
.PARAMETER imaggaObj
  The connection object created using new-imaggaconnection.
.INPUTS
  None
.OUTPUTS
  A PowerShell array containing suggested tags.
.NOTES
  Version:        1.0
  Author:         Marco Torello
  Creation Date:  10/10/2016
  Purpose/Change: Initial script development
  
.EXAMPLE
  Get-ImageTag -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -apikey '1111111111' -apisecret '1dsa23dasd234dfg354'
  
.EXAMPLE
  Get-ImageTag -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -imaggaObj $credential
#>


Function Get-ImageTag{
  [CmdletBinding()]
  Param(
      [parameter(Mandatory=$true)] [String] $url,
      [parameter(ParameterSetName="ApiKey",Mandatory=$true)] [String] $apikey,
      [parameter(ParameterSetName="ApiKey",Mandatory=$true)] [String] $secret,
      [parameter(ParameterSetName="ConnectionObject",Mandatory=$true)] [String] $imaggaObj
  )
  
  Begin{
    Write-debug "Starting execution of Get-ImageTag. Url is: $url"
  }
  
  Process{
    if ($PsCmdlet.ParameterSetName -eq "ApiKey"){
      $mycreds = new-imaggaConnection -apiley $apikey -secret $secret
    }

    if ($PsCmdlet.ParameterSetName -eq "ConnectionObject"){
      $mycreds = $imaggaObj
    }

    Try{
        Invoke-WebRequest "https://api.imagga.com/v1/tagging?url=$url" -Credential $cred
    }
    Catch{
      Write-output $_.Exception 
      Throw "Problem contacting imagga API"
      Break
    }
    
    $json = $null
    Try{
        $json = ConvertFrom-Json $result
    }
    Catch{
      if ($verbose){
        Write-output $_.Exception 
        Write-output "JSON: $result"
      }
      Throw "Problem converting imagga JSON."
      Break
    }
    return $json 
  }
  
  End{
    If($?){
      Write-debug "Completed Successfully."
    }
  }
}
