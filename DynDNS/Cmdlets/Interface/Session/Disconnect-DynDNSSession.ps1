# Ends an API session.
function Disconnect-DynDNSSession {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$Token
    )
    Invoke-DynDNSApi -Resource Session -Action Delete -Token $Token
}