function Unlock-SecretVault {
    [CmdletBinding()]
    param (
        [SecureString]$Password,
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    $vault = Get-SecretVault -Name $VaultName -ErrorAction Stop

    if ($vault.ModuleName -ne 'PSPasswordSafe') {
        throw "$($vaultName) was found but is not a PSPasswordSafe Vault."
    }

    Set-Variable -Name "Vault_$($VaultName)_MasterPassword" -Scope Script -Value $Password -Force

    if (-not (Test-SecretVault -VaultName $VaultName -AdditionalParameters $AdditionalParameters)) {
        Write-verbose "$($vault.Name): Failed to unlock the vault"
        Remove-Variable -Name "Vault_$($VaultName)_MasterPassword" -Scope Script -Force -ErrorAction SilentlyContinue
        throw "error"
    }

    return $true
}
