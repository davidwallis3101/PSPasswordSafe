using namespace Microsoft.PowerShell.SecretManagement
function Set-Secret {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $Name,
        [Parameter(ValueFromPipelineByPropertyName)]
        [object] $Secret,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $VaultName,
        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.Verbose) {
        $VerbosePreference = "Continue"
    }
}

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

function Remove-Secret {
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
}

function Test-SecretVault
{
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string] $VaultName,

        [Parameter(ValueFromPipelineByPropertyName)]
        [hashtable] $AdditionalParameters
    )

    if ($AdditionalParameters.Verbose) {
        $VerbosePreference = "Continue"
    }

    write-verbose "not implemented"
    return $true
}

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

# using namespace Microsoft.PowerShell.SecretManagement

# Get-ChildItem "$PSScriptRoot/Private" -Exclude "*.Tests.ps1"  | Foreach-Object {
#     . $PSItem.FullName
# }
# $publicFunctions = Get-ChildItem "$PSScriptRoot/Public" -Exclude "*.Tests.ps1"  | Foreach-Object {
#     . $PSItem.FullName
#     #Output the name of the function assuming it is the same as the .ps1 file so it can be exported
#     $PSItem.BaseName
# }

# Export-ModuleMember $publicFunctions
