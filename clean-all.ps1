Remove-Item -Path ".\node_modules" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\package-lock.json" -Force -ErrorAction SilentlyContinue

Remove-Item -Path ".\workspace_1\node_modules" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\workspace_1\package-lock.json" -Force -ErrorAction SilentlyContinue

Write-Host "Cleaned all node modules and package-lock.json file!" -ForegroundColor Green
