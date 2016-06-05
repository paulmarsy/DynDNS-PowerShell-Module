function Publish-DynDNSChanges {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)][string]$Zone,
        [Parameter(Mandatory=$false)][string]$Notes,
        [Parameter(Mandatory=$true)][string]$Token
    )
    
    Invoke-DynDNSApi -Resource Zone -Arguments $Zone -Action Put -Data @{ publish = "true" } -Token $Token
}