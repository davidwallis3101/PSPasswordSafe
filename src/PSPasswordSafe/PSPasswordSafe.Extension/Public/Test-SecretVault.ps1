function Test-SecretVault
{
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable]$AdditionalParameters
    )

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    Check-Unlocked -VaultName $VaultName -AdditionalParameters $AdditionalParameters

    Get-PSSafeDoc `
        -Path $AdditionalParameters.Path `
        -Passcode (Get-Variable -Name "Vault_$($VaultName)_MasterPassword" ).Value `
        -AdditionalParameters $AdditionalParameters

    return $?
}
