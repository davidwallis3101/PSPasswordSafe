function Get-Secret {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    Check-Unlocked -VaultName $VaultName -AdditionalParameters $AdditionalParameters

    $doc = Get-PSSafeDoc `
        -Path $AdditionalParameters.Path `
        -Passcode (Get-Variable -Name "Vault_$($VaultName)_MasterPassword" ).Value `
        -AdditionalParameters $AdditionalParameters

    ($doc.Entries | Where-Object {$_.Uuid.Guid -eq $Name}).Password # Secure string?

}
