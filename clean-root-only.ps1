Remove-Item -Path ".\node_modules" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\package-lock.json" -Force -ErrorAction SilentlyContinue

Write-Host "Root cleaned!" -ForegroundColor Green
