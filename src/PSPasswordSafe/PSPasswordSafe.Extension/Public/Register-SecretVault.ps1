Function Register-SecretVault {
    Param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable]$AdditionalParameters
    )

        if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    if (-not $VaultName) { throw 'PSPasswordSafe: Vault Name not provided' } # TODO: Required?
    if (-not $VaultParameters.Path) { throw 'PSPasswordSafe: Path to passwordsafe file not specified' }

    Set-Variable -Name "Vault_$($VaultName)_Path" -Scope Script -Value $VaultParameters.Path -Force

}
