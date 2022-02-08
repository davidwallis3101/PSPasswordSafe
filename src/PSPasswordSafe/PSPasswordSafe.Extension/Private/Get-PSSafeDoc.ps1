Function Get-PSSafeDoc {
    [CmdletBinding()]
    Param(
        $Path,

        $Passcode
    )


    # $doc = [Medo.Security.Cryptography.PasswordSafe.Document]::Load("C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3","MyPassword1!")
    $doc = [Medo.Security.Cryptography.PasswordSafe.Document]::Load($Path,$Passcode)

    return $doc
}
