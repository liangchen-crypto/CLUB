$baseHtml = [System.IO.File]::ReadAllText("index-template.html", [System.Text.Encoding]::UTF8)
$jsonText = [System.IO.File]::ReadAllText("translations.json", [System.Text.Encoding]::UTF8)

# we convert to Hashtable for string keys processing
# ConvertFrom-Json output PSObject, but we need to iterate map
$mappings = ConvertFrom-Json $jsonText

foreach ($lang in $mappings.psobject.properties.name) {
    if ($lang -eq 'zh-SG') { continue }
    
    $obj = $mappings.$lang
    $mapObj = $obj.map
    $content = $baseHtml.Replace('lang="zh-SG"', ('lang="' + $lang + '"'))
    
    $langName = $obj.lang_name
    $content = $content.Replace('<button class="lang-btn"><i class="fa-solid fa-globe"></i> 中文 <i', '<button class="lang-btn"><i class="fa-solid fa-globe"></i> ' + $langName + ' <i')
    
    $keys = @($mapObj.psobject.properties.name) | Sort-Object Length -Descending
    foreach ($k in $keys) {
        $v = $mapObj.$k
        $content = $content.Replace($k, $v)
    }
    
    $outFile = $obj.file
    [System.IO.File]::WriteAllText($outFile, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Generated $outFile"
}

# we also need the Chinese file!
[System.IO.File]::WriteAllText("index-zh.html", $baseHtml, [System.Text.Encoding]::UTF8)
Write-Host "Generated index-zh.html"

