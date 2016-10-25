Import-Module .\imagga\imagga.psd1 -force

$url = 'http://imagga.com/static/images/tagging/wind-farm-538576_640.jpg'
$invalid_url = 'http://www.google.com'
$invalid_url_404 = 'http://www.google.com/notexistingpage'
$resolution = '800x600'
$resolution_matrix = @('800x600', '54x7643', '322x76')
$invalid_resolution = '80_0x600'
$invalid_resolution_matrix = @('800x23', '892x932', '8o0x600')
$invalid_resolution_matrix2 = @('892x932', '800x023', '800x600')

Describe New-ImaggaConnection {
    It 'Valid parameter' {
        New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce' | Should BeOfType PScredential
    }
}

Describe Get-CroppedImage {
    Context 'Parameters'{
        It 'Passing apikey, secret and connection object' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -apikey '123123' -secret 'asd213dsdce' } | Should Throw
        }
        It 'Invalid url: not an image'{
            { Get-CroppedImage -apikey '123123' -secret 'asd213dsdce' -url $invalid_url -resolution $resolution} | Should Throw "Invalid url: please make sure it has an image Content type"
        }
        It 'Invalid url: 404'{
            { Get-CroppedImage -apikey '123123' -secret 'asd213dsdce' -url $invalid_url_404 -resolution $resolution} | Should Throw "Problem retrieving the image"
        }
        It 'Passing invalid resolution' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -url $url -resolution $invalid_resolution} | Should Throw "Invalid resolution matrix"
        }
        It 'Passing invalid resolution matrix' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -url $url -resolution $invalid_resolution_matrix} | Should Throw "Invalid resolution matrix"
        }
        It 'Passing invalid resolution matrix 2' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -url $url -resolution $invalid_resolution_matrix2} | Should Throw "Invalid resolution matrix"
        }
    }
    Context 'WebService'{
        It 'Passing invalid apikey, secret' {
            { Get-CroppedImage -apikey '123123' -secret 'asd213dsdce' -url $url -resolution $resolution} | Should Throw "Problem contacting imagga API"
        }
        It 'Parameters OK' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -url $url -resolution $resolution} | Should Throw "Problem contacting imagga API"
        }
        It 'Parameters OK 1' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-CroppedImage -imaggaObj $user -url $url -resolution $resolution_matrix} | Should Throw "Problem contacting imagga API"
        }

    }
}

Describe Get-ImageColor {
    Context 'Parameters'{
         It 'Passing apikey, secret and connection object' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-ImageTag -imaggaObj $user -apikey '123123' -secret 'asd213dsdce' } | Should Throw
        }
        It 'Invalid url: not an image'{
            { Get-ImageTag -apikey '123123' -secret 'asd213dsdce' -url $invalid_url} | Should Throw "Invalid url: please make sure it has an image Content type"
        }
        It 'Invalid url: 404'{
            { Get-ImageTag -apikey '123123' -secret 'asd213dsdce' -url $invalid_url_404} | Should Throw "Problem retrieving the image"
        }
    }

    Context 'WebService'{
        It 'Passing invalid apikey, secret' {
            { Get-ImageColor -apikey '123123' -secret 'asd213dsdce' -url $url} | Should Throw "Problem contacting imagga API"
        }
        It 'Passing invalid imagga object' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-ImageColor -imaggaObj $user -url $url} | Should Throw "Problem contacting imagga API"
        }
    }
}

Describe Get-ImageTag {
    Context 'Parameters'{
         It 'Passing apikey, secret and connection object' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-ImageTag -imaggaObj $user -apikey '123123' -secret 'asd213dsdce' } | Should Throw
        }
        It 'Invalid url: not an image'{
            { Get-ImageTag -apikey '123123' -secret 'asd213dsdce' -url $invalid_url} | Should Throw "Invalid url: please make sure it has an image Content type"
        }
        It 'Invalid url: 404'{
            { Get-ImageTag -apikey '123123' -secret 'asd213dsdce' -url $invalid_url_404} | Should Throw "Problem retrieving the image"
        }
    }
    
    Context 'WebService'{
        It 'Passing invalid apikey, secret' {
            { Get-ImageColor -apikey '123123' -secret 'asd213dsdce' -url $url} | Should Throw "Problem contacting imagga API"
        }
        It 'Passing invalid imagga object' {
            $user = New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce'
            { Get-ImageColor -imaggaObj $user -url $url} | Should Throw "Problem contacting imagga API"
        }
    }
}