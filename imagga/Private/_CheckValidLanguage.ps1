function _CheckValidLanguage{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true)][String] $language
    )

    begin{
        Write-Debug "Starting _CheckValidLanguage with $language"
    }

    process{
        $languageMatrix = @(
            "ar",
            "bg",
            "bs",
            "en",
            "ca",
            "cs",
            "cy",
            "da",
            "de",
            "el",
            "es",
            "et",
            "fa",
            "fi",
            "fr",
            "he",
            "hi",
            "hr",
            "ht",
            "hu",
            "id",
            "it",
            "ja",
            "ko",
            "lt",
            "lv",
            "ms",
            "mt",
            "mww",
            "nl",
            "no",
            "otq",
            "pl",
            "pt",
            "ro",
            "ru",
            "sk",
            "sv",
            "sl",
            "sr_cyrl",
            "sr_latn",
            "th",
            "tlh",
            "tlh_qaak",
            "tr",
            "uk",
            "ur",
            "vi",
            "yua",
            "zh_chs",
            "zh_cht"
        )

        if (-not($languageMatrix -contains $language)){
            Throw "Invalid language code: valid languages can be found at http://docs.imagga.com/#multi-language-support"
        }

        Write-debug "Language is valid"
        return
    }
}