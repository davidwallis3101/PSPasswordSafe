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

    if ($AdditionalParameters.Verbose) {$VerbosePreference = 'continue'}

    $doc = Get-PSSafeDoc -Path "C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3" -Passcode "MyPassword1!"
    ($doc.Entries | Where-Object {$_.Uuid.Guid -eq $Name}).Password

}
