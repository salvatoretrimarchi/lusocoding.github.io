Param(
    [Parameter(Mandatory=$true, Position=0, HelpMessage="GitHub username")]
    [ValidateNotNullOrEmpty()]
    [string]
    $Username
)

$apiBasePath = "https://api.github.com"
$headers = @{ "Accept" = "application/vnd.github.mister-fantastic-preview+json" }
$repoName = "$Username.github.io"

try 
{
    Invoke-WebRequest -Uri "$apiBasePath/repos/$Username/$repoName/pages/builds" -Method Post -Headers $headers
    Write-Host "Build pages for  requested successfully"
}
catch
{
    Write-Host "Build pages request failed => " $_.Exception.Message
}
