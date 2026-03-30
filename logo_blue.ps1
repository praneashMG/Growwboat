$files = Get-ChildItem -Path "d:\boat" -Filter "*.html"
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    $newContent = $content -replace 'class="text-accent-light">Wave</span>', 'class="text-[#48CAE4]">Wave</span>' `
                           -replace 'class="text-\[#FF6B35\]">Wave</span>', 'class="text-[#48CAE4]">Wave</span>'

    if ($newContent -ne $content) {
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated logo in $($file.Name)"
    }
}
