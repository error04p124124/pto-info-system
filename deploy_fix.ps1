Write-Host "Pushing changes to GitHub..." -ForegroundColor Cyan

$gitPush = git push origin main 2>&1 | Out-String

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Go to Railway dashboard: https://railway.app" -ForegroundColor White
    Write-Host "2. Open your project: pto-info-system" -ForegroundColor White
    Write-Host "3. Railway should auto-deploy the changes" -ForegroundColor White
    Write-Host "4. Wait for deployment to complete" -ForegroundColor White
    Write-Host "5. Visit: https://pto-info-system-production.up.railway.app" -ForegroundColor White
    Write-Host ""
    Write-Host "The site design should now work correctly!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Push failed. Output:" -ForegroundColor Red
    Write-Host $gitPush
    Write-Host ""
    Write-Host "Try running manually:" -ForegroundColor Yellow
    Write-Host "git push origin main" -ForegroundColor White
}

Write-Host ""
git log --oneline -3
