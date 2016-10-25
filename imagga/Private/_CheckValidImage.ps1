function _CheckValidImage{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String] $url
    )

    begin{
        Write-Debug "Starting _CheckValidImage with $url"
    }

    process{
        try{
            $image = invoke-webrequest $url -DisableKeepAlive -UseBasicParsing
        }
        catch{
            Throw "Problem retrieving the image"
        }

        if ($image.StatusCode -ne 200){
            Throw "Problem retrieving the image: Invalid HTTP code"
        }

        if(-not ($image.Headers.'Content-Type'.StartsWith("image"))){
            Throw "Invalid url: please make sure it has an image Content type"
        }

        Write-debug "image is valid"
    }
}