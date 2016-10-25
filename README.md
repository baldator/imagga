# imagga PowerShell module
[![Build status](https://ci.appveyor.com/api/projects/status/c1y63ip35wryfidk?svg=true)](https://ci.appveyor.com/project/baldator/imagga)
[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)


Powershell module to simplify the use of imagga API (https://docs.imagga.com/). An imagga account is needed to use this module.

# Implemented methods

* New-ImaggaConnection: It gets the imagga apikey and secret and create a connection object (PSCredential) to be used to connect to imagga.
* Get-ImageTag: It retrieves the suggested tags to associate to the image passed as parameter.
* Get-CroppedImage: It retrieves cropped version of the image passed as parameter. Images will match dimension passed in the resolution parameter.
* Get-ImageColor: It analyses and extract the predominant colors from one or several images.

# Installation

You can easilly install the module from PowerShell Gallery: 
```
Install-module imagga
Import-module imagga
```
# Examples
## New-ImaggaConnection
```
new-imaggaconnection -apikey '1111111111' -apisecret '1dsa23dasd234dfg354'
```
## Get-ImageTag
```
Get-ImageTag -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -apikey '1111111111' -apisecret '1dsa23dasd234dfg354'
Get-ImageTag -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -imaggaObj $credential
```
## Get-CroppedImage
```
Get-CroppedImage -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -apikey '1111111111' -apisecret '1dsa23dasd234dfg354' -resolution @('800x600','200x100')
Get-CroppedImage -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -imaggaObj $credential -resolution @('800x600') -noScaling
```
## Get-ImageColor
```
Get-ImageColor -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -apikey '1111111111' -apisecret '1dsa23dasd234dfg354'
Get-ImageColor -url 'http://docs.imagga.com/static/images/docs/sample/japan-605234_1280.jpg' -imaggaObj $credential
```

