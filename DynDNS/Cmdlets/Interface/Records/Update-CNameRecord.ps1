function Update-CNameRecord {
    # https://help.dyn.com/update-cname-records-api/
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$Zone,
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][string]$RecordId,
        [Parameter(Mandatory=$true)][string]$Value,
        [Parameter(Mandatory=$false)][string]$TTL = "0",
        [Parameter(Mandatory=$true)][string]$Token
    )
    
        Invoke-DynDNSApi -Resource CNAMERecord -Arguments @($Zone,  $Name, $RecordId) -Action Put -Data @{
            rdata = @{
                cname = $Value
            }
            ttl = $TTL
        } -Token $Token
}