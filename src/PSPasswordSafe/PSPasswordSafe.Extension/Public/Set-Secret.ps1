function Set-Secret {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$Name,

        [Parameter(ValueFromPipelineByPropertyName)]
        [object]$Secret,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable]$AdditionalParameters
    )

    # TODO: Write this
    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    # #if ($secret -is [hashtable]) {
    #     throw ("secret is not correct type {0}" -f $secret.Gettype())
    # #}


    Check-Unlocked -VaultName $VaultName -AdditionalParameters $AdditionalParameters

    $doc = Get-PSSafeDoc `
        -Path $AdditionalParameters.Path `
        -Passcode (Get-Variable -Name "Vault_$($VaultName)_MasterPassword").Value `
        -AdditionalParameters $AdditionalParameters


    $entry = New-Entry -Title $Name -Password $Secret

    $doc.Entries.Add($entry);
    $doc.Save($AdditionalParameters.Path)
    return $?
}
