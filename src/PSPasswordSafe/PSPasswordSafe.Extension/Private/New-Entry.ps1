Function New-Entry {
    [CmdletBinding()]
    Param(
        [Guid]$Uuid = [Guid]::NewGuid(),

        [string]$Group,

        [Parameter(Mandatory)]
        [string]$Title,

        [string]$UserName,

        [string]$Notes,

        [Parameter(Mandatory)]
        [Securestring]$Password,

        [string]$Url,

        [string]$Email
    )

    # abstracted to make furture testing easier.
    $entry = [Medo.Security.Cryptography.PasswordSafe.Entry]::New()

    $utcTime = (get-date).ToUniversalTime()

    $entry.Uuid = $Uuid;
    $entry.Group = $Group
    $entry.Title = $Title
    $entry.UserName = $UserName
    $entry.Notes = $Notes
    $entry.Password = (Unlock-SecureString $Password)
    $entry.CreationTime = $utcTime
    $entry.PasswordModificationTime = $utcTime
    $entry.LastAccessTime = $utcTime
    # $entry.PasswordExpiryTime = ($utcTime).AddDays(365)
    $entry.LastModificationTime = $utcTime
    $entry.Url = $Url
    $entry.Email = $Email
    #$entry.TwoFactorKey = new byte[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    #$entry.CreditCardNumber = "";
    #$entry.CreditCardExpiration = "";
    #$entry.CreditCardVerificationValue = "";
    #$entry.CreditCardPin = "";
    #$entry.QRCode = "";

    return $entry
}
