Function Get-PSSafeDoc {
    [CmdletBinding()]
    Param(
        $Path,

        [SecureString]$Passcode,

        [hashtable]$AdditionalParameters
    )

    if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
        $VerbosePreference = 'Continue'
    }

    Write-verbose "Loading passwordsafe database $($Path)"
    [Medo.Security.Cryptography.PasswordSafe.Document]::Load($Path, (Unlock-SecureString $Passcode))
}
