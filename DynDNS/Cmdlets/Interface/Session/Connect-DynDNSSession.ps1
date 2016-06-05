# Starts an API Session
function Connect-DynDNSSession {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$CustomerName,
        [Parameter(Mandatory=$true)][string]$UserName,
        [Parameter(Mandatory=$true)][string]$Password
    )
    
    Invoke-DynDNSApi -Resource Session -Action Post -Data @{
        customer_name = $CustomerName
        user_name = $UserName
        password = $Password
    } | % token
}