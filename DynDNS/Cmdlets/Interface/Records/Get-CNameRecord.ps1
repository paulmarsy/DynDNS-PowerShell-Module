function Get-CNameRecord {
    # https://help.dyn.com/get-cname-records-api/
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$Zone,
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true, ParameterSetName="AllRecords")][switch]$AllRecords,
        [Parameter(Mandatory=$true, ParameterSetName="OneRecord")][string]$RecordId,
        [Parameter(Mandatory=$true)][string]$Token
    )
    
        Invoke-DynDNSApi -Resource CNAMERecord -Arguments @($Zone,  $Name, $RecordId) -Action Get -Token $Token
}