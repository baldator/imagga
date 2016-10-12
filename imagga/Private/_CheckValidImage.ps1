function _CheckValidImage{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String] $url
    )

    begin{
        Write-Debug "Starting _CheckValidImage with $resolution"
    }

    process{
        $valid = $true
        try{
            $image = invoke-webrequest $url -DisableKeepAlive -UseBasicParsing
        }
        catch{
            Throw "Problem retrieving the image"
        }

        if ($image.StatusCode -ne 200){
            Write-debug "Invalid HTTP code"
            $valid = $false 
        }

        if(-not ($image.Headers.'Content-Type'.StartsWith("image"))){
            Write-debug "Invalid Content type"
            $valid = $false 
        }

        return $valid
    }
}