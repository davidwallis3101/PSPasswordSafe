function Unlock-SecureString {
    <#
    .SYNOPSIS
        Compatibility function to convert a secure string to plain text

    .OUTPUTS
        String

    .NOTES
        https://www.powershellgallery.com/packages/SecretManagement.KeePass/0.0.9.4/Content/SecretManagement.KeePass.Extension%5CPrivate%5CUnlock-SecureString.ps1
    #>
    [CmdLetBinding()]
    Param (
        [Parameter(Position=0)]
        [SecureString]$SecureString
    )

    if ($PSVersionTable.PSVersion -ge '6.0.0') {
        ConvertFrom-SecureString -AsPlainText -SecureString $SecureString
    } else {
        #Legacy Windows Powershell Workaround Method
        ([PSCredential]::new('SecureString',$SecureString)).GetNetworkCredential().Password
    }
}
