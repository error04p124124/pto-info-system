$ErrorActionPreference = "Continue"

Write-Host "Attempting to push to GitHub..." -ForegroundColor Cyan

try {
    $output = git push origin main 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! Changes pushed to GitHub" -ForegroundColor Green
        Write-Host ""
        Write-Host "Railway will auto-deploy in a few minutes." -ForegroundColor Yellow
        Write-Host "Check: https://pto-info-system-production.up.railway.app/" -ForegroundColor White
    } else {
        Write-Host ""
        Write-Host "Push failed!" -ForegroundColor Red  
        Write-Host $output
    }
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "Recent commits:" -ForegroundColor Cyan
git log --oneline -3
