function Check-Unlocked {
    Param (
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    $vault = Get-SecretVault -Name $VaultName -ErrorAction Stop
    if ($vault.ModuleName -ne 'PSPasswordSafe') { throw "$($vaultName) was found but is not a PSPasswordSafe Vault." }

    if (-Not (Test-Path "variable:script:Vault_$($VaultName)_MasterPassword")) {
        Set-Variable `
            -Name "Vault_$($VaultName)_MasterPassword" `
            -Scope Script `
            -Value (Read-Host "Enter Password" -AsSecureString) `
            -Force
    }
}
