function Test-SecretVault
{
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.Verbose) {
        $VerbosePreference = "Continue"
    }

    write-verbose "not implemented"
    return $true
}
