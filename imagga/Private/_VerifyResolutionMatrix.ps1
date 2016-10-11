function _VerifyResolutionMatrix{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String[]] $resolution
    )

    begin{
        Write-Debug "Starting _VerifyResolutionMatrix with $resolution"
    }

    process{
        $valid = $true
        $resolution | %{
            if(-not ($_ -match '[0-9]+x[0-9]+')){
                $valid = $false
                Write-Debug "$_ is invalid"
                break
            }
        }

        return $valid
    }
}