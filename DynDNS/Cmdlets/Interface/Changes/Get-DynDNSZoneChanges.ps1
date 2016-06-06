function Get-DynDNSZoneChanges {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)][string]$Zone,
        [Parameter(Mandatory=$true)][string]$Token
    )
    
    Invoke-DynDNSApi -Resource ZoneChanges -Arguments $Zone -Action Get -Token $Token
}