<#
CRUD Operation HTTP Function     API Help Topic Key Word
Create                   POST                   Create
Read                     GET                     Get
Update                  PUT                     Update, Activate, Deactivate, Reset, or Recover
Delete                   DELETE             Delete or Remove
#>
function Invoke-DynDNSApi {
    [CmdletBinding()]
    param(
        [ValidateSet("Session", "Zone", "ZoneChanges", "CNAMERecord")]$Resource,
        [ValidateSet("Post", "Get", "Put", "Delete")]$Action,
        [array]$Arguments,
        [hashtable]$Data,
        [string]$Token,
        [uri]$DynsDNSBaseApiUri = [uri]"https://api.dynect.net/"
    )
    
    $uri = [uri]::new($DynsDNSBaseApiUri, ("/REST/{0}/{1}/" -f $Resource, (@($Arguments) -join '/')))
        Write-Verbose "URI: $uri"

    $splat = @{
        UseBasicParsing = $true
        ContentType = "application/json"
        Method = $Action
        Uri = ($uri | % ToString)
     }
        Write-Verbose "Uri: $($splat.Uri)"

    if (-not ([string]::IsNullOrWhiteSpace($Token))) {
        $splat += @{ Headers = @{ "Auth-Token" = $Token } }
    }
    if ($null -ne $Data) {
        $splat += @{ Body = ($Data | ConvertTo-Json -Compress) }
        Write-Verbose "Body: $($splat.Body)"
    }
   
    Invoke-WebRequest @splat `
        | % Content `
        | ConvertFrom-Json `
        | % data
}