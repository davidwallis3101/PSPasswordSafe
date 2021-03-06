function Get-SecretInfo {
    param (
        [string]$Filter = "*",

        [string]$VaultName,

        [hashtable]$AdditionalParameters
    )

    <#
        Returns information about each secret stored in all registered vaults, but not the secret itself.
        The information is returned in a Microsoft.PowerShell.SecretManagement.SecretInformation type.
    #>

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    Check-Unlocked -VaultName $VaultName -AdditionalParameters $AdditionalParameters

    $doc = Get-PSSafeDoc `
        -Path $AdditionalParameters.Path `
        -Passcode (Get-Variable -Name "Vault_$($VaultName)_MasterPassword" ).Value `
        -AdditionalParameters $AdditionalParameters

    $doc.Entries | Where-Object {$_.Uuid.Guid -like $Filter} | ForEach-Object {
        [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
            <# "$($_.Group)\$($_.Title)"#> $_.Uuid.Guid,
            "String",
            $VaultName,
            (New-Metadata $_)
        )
    }
}
