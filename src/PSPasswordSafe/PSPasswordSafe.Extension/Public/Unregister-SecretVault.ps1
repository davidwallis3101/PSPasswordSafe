function Unregister-SecretVault {
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

    Write-Verbose "Removing Variables"
    Remove-Variable -Name "Vault_$($VaultName)" -Scope Script -Force -ErrorAction SilentlyContinue
    Remove-Variable -Name "Vault_$($VaultName)_MasterPassword" -Scope Script -Force -ErrorAction SilentlyContinue
}
