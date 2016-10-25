function _VerifyResolutionMatrix{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String[]] $resolution
    )

    begin{
        Write-Debug "Starting _VerifyResolutionMatrix with $resolution"
    }

    process{
        $resolution | ForEach-Object{
            if(-not ($_ -match '^[1-9][0-9]*x[1-9][0-9]*$')){
                Write-Debug "$_ is invalid"
                Throw "Invalid resolution matrix"
            }

            Write-Debug "$_ is valid"
        }
    }
}