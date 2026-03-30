$files = Get-ChildItem -Path "d:\boat" -Filter "*.html"
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    $newContent = $content -replace '#48CAE4', '#FF6B35' `
                           -replace '#90E0EF', '#FF9E7D' `
                           -replace 'Light Blue for dark', 'Orange for dark' `
                           -replace '(?i)Light Blue', 'Coral Orange' `
                           -replace '(?i)bg-blue-400', 'bg-orange-500' `
                           -replace '(?i)text-blue-400', 'text-orange-500' `
                           -replace '(?i)hover:text-\[#48CAE4\]', 'hover:text-orange' `
                           -replace '(?i)cyan-gradient', 'coral-gradient'

    if ($newContent -ne $content) {
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Reverted $($file.Name)"
    }
}
