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

    if ($AdditionalParameters.Verbose) {
        $VerbosePreference = "Continue"
    }

    $secret = "foo"
    # $username = ""

    # $password = $secret | ConvertTo-SecureString -AsPlainText -Force

    # return [System.Management.Automation.PSCredential]::new($username, $password)

    write-output $secret
}
