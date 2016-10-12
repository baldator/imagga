#requires -version 4
Function New-ImaggaConnection{
<#
.SYNOPSIS
  Create an imagga connection object
.DESCRIPTION
  The new-imaggaconnection function is part of Imagga module. It gets the imagga apikey and secret and create a connection object (PSCredential) to be used to connect to imagga.
.PARAMETER apikey
  Your imagga API key. If you don't have one follow the doc: https://docs.imagga.com/#introduction
.PARAMETER secret
  Your imagga API secret.
.INPUTS
  None
.OUTPUTS
  A PSCredential object to be used to connect to imagga.
.NOTES
  Version:        1.0
  Author:         Marco Torello
  Creation Date:  11/10/2016
  Purpose/Change: Initial script development
  
.EXAMPLE
  new-imaggaconnection -apikey '1111111111' -apisecret '1dsa23dasd234dfg354'
#>


  [CmdletBinding()]
  Param(
      [parameter(Mandatory=$true)] [String] $apikey,
      [parameter(Mandatory=$true)] [String] $secret
  )
  
  Begin{
    Write-debug "Starting execution of new-imaggaconnection. Api Key: $apikey, Secret: $secret"
  }
  
  Process{
    Try{
        $secpasswd = ConvertTo-SecureString $secret -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ($apiKey, $secpasswd)
    }
    Catch{
      Write-output $_.Exception 
      Throw "Problem creating Imagga connection object"
      Break
    }
    
    return $mycreds 
  }
  
  End{
    If($?){
        Write-debug "new-imaggaconnection. Completed Successfully."
    }
  }
}
