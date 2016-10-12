Describe New-ImaggaConnection {
    It 'Valid parameter' {
        New-ImaggaConnection -apikey 's2d3dsdfswd' -secret 'asd213dsdce' | Should BeOfType PScredential
    }
}