function Remove-Secret {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$Name,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable]$AdditionalParameters
    )

    # TODO: Write this
        if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    Check-Unlocked -VaultName $VaultName -AdditionalParameters $AdditionalParameters
}
