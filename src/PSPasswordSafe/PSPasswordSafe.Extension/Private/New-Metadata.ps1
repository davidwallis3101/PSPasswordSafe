Function New-Metadata {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0 )]
        $InputObject
    )

    @{
        Uuid                        = $InputObject.Uuid
        Group                       = $InputObject.Group
        Title                       = $InputObject.Title
        UserName                    = $InputObject.UserName
        Notes                       = $InputObject.Notes
        CreationTime                = $InputObject.CreationTime
        PasswordModificationTime    = $InputObject.PasswordModificationTime
        LastAccessTime              = $InputObject.LastAccessTime
        PasswordExpiryTime          = $InputObject.PasswordExpiryTime
        LastModificationTime        = $InputObject.LastModificationTime
        Url                         = $InputObject.Url
        Email                       = $InputObject.Email
        TwoFactorKey                = $InputObject.TwoFactorKey
        CreditCardNumber            = $InputObject.CreditCardNumber
        CreditCardExpiration        = $InputObject.CreditCardExpiration
        CreditCardVerificationValue = $InputObject.CreditCardVerificationValue
        CreditCardPin               = $InputObject.CreditCardPin
        QRCode                      = $InputObject.QRCode
        Autotype                    = $InputObject.Autotype
    }
}
