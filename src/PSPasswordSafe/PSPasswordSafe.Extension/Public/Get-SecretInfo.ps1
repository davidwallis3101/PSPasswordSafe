function Get-SecretInfo {
    param (
        [string] $Filter,
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.Verbose) {
        $VerbosePreference = "Continue"
    }

    <#
        Returns information about each secret stored in all registered vaults, but not the secret itself.
        The information is returned in a Microsoft.PowerShell.SecretManagement.SecretInformation type.
    #>

    # Add filtering


    $doc = [Medo.Security.Cryptography.PasswordSafe.Document]::Load("C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3","MyPassword1!")
    [Object[]]$secretInfoResult = $doc.Entries | ForEach-Object {

        # Extract to function
        $metadata = @{
            Uuid                        = $_.Uuid
            Group                       = $_.Group
            Title                       = $_.Title
            UserName                    = $_.UserName
            Notes                       = $_.Notes
            CreationTime                = $_.CreationTime
            PasswordModificationTime    = $_.PasswordModificationTime
            LastAccessTime              = $_.LastAccessTime
            PasswordExpiryTime          = $_.PasswordExpiryTime
            LastModificationTime        = $_.LastModificationTime
            Url                         = $_.Url
            Email                       = $_.Email
            TwoFactorKey                = $_.TwoFactorKey
            CreditCardNumber            = $_.CreditCardNumber
            CreditCardExpiration        = $_.CreditCardExpiration
            CreditCardVerificationValue = $_.CreditCardVerificationValue
            CreditCardPin               = $_.CreditCardPin
            QRCode                      = $_.QRCode
            Autotype                    = $_.Autotype
        }

        [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
            "$($_.Group)\$($_.Title)",
            "String",
            $VaultName,
            $metadata
        )
    }

    [Object[]]$sortedInfoResult = $secretInfoResult | Sort-Object -Unique -Property Name

    if ($sortedInfoResult.count -lt $secretInfoResult.count) {
        $nonUniqueFilteredRecords = Compare-Object $sortedInfoResult $secretInfoResult -Property Name | Where-Object SideIndicator -eq '=>'
        Write-Warning "Vault ${VaultName}= $_.Entries with non-unique titles were detected, the duplicates were filtered out."
        Write-Verbose "Vault ${VaultName}= $_.Filtered Non-Unique Titles= $_.$($nonUniqueFilteredRecords.Name -join ', ')"
    }

    write-output $sortedInfoResult
}
