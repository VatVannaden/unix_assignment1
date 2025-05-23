param (
    [string]$GitHubProfileUrl
)

if (-not $GitHubProfileUrl) {
    Write-Host "Usage: .\githubpull.ps1 [GitHub Profile URL]"
    exit
}

if ($GitHubProfileUrl -match "https://github.com/([^/]+)") {
    $Username = $matches[1]
} else {
    Write-Host "Invalid URL format. Please enter a valid GitHub profile URL."
    exit
}

$OutputFile = "$Username.txt"

$Repositories = Invoke-RestMethod -Uri "https://api.github.com/users/$Username/repos?per_page=50" -Headers @{ "User-Agent" = "PowerShell" }

if ($Repositories.Count -eq 0) {
    Write-Host "No repositories found for user $Username."
    exit
}

$Repositories | ForEach-Object { $_.name } | Out-File -Encoding utf8 $OutputFile

Write-Host "Repositories saved to $OutputFile"
