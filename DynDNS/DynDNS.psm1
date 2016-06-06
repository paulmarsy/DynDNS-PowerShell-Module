Set-StrictMode -Version Latest

<# Interface #>
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Changes\Get-DynDNSZoneChanges.ps1')"
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Changes\Publish-DynDNSChanges.ps1')" 
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Records\Add-CNameRecord.ps1')"
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Records\Get-CNameRecord.ps1')"
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Records\Update-CNameRecord.ps1')"
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Session\Connect-DynDNSSession.ps1')"
. "$(Join-Path $PSScriptRoot '\Cmdlets\Interface\Session\Disconnect-DynDNSSession.ps1')"

<# Internal #>
. "$(Join-Path $PSScriptRoot '\Cmdlets\Internal\Invoke-DynDNSApi.ps1')"