# PSPasswordSafe

A powershell secrets mananagement extension to get secrets from passwordsafe, this was created as a POC for reading from the db and has no update functionality at the moment, just write and even then the metadata is limited.

## Pre-requisites

```Powershell
Install-Module -Name Microsoft.PowerShell.SecretManagement -Repository PSGallery
```

## Registering

```Powershell
Register-SecretVault `
    -Name PWSafeTest `
    -ModuleName ./PSPasswordSafe `
    -VaultParameters @{Path="./TestSafe.psafe3"} `
    -DefaultVault
```

Check for the presence of the vault using

```Powershell
Get-SecretVault
```

## Usage


Updating formatting data to show the metadata properties relevant to the pwsafe db structure

```Powershell
Update-FormatData -PrependPath .\PSPasswordSafe\PSPasswordSafe.Extension\PSPasswordSafe.format.ps1xml
```

Listing secrets

```Powershell
Get-SecretVault -Name PWSafeTest -Verbose
```
Filtering

```Powershell
Get-SecretInfo -Verbose -Vault PWSafeTest | Select-Object -First 1 -Wait
```

Getting passwords using different approaches

```Powershell
$secString = Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1" -Vault PWSafeTest <# Retuns as a securestring #>

$unSecPwd = Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1" -Vault PWSafeTest -AsPlainText  <# Retuns as a securestring #>

$pwd = Get-SecretInfo -Verbose -Vault PWSafeTest | Select-Object -First 1 -Wait | Get-Secret

```

### Metadata
The properties for the individual objects are available under the metadata hashtable - some of these are shown using the format file, the name property could probably be synthentically made up to represent group\title\username but uuid is currently used to reference items as this was created as a POC

```Powershell
Get-SecretInfo -Verbose -Vault PWSafeTest | Select-Object -First 1 -ExpandProperty Metadata -Wait
```

Get account, filtering by metadata and return the password
```Powershell
Get-SecretInfo -Verbose -Vault PWSafeTest | Where {
    $_.Metadata.Group -eq "Group1"  -and `
    $_.Metadata.Title -eq "Ti1tle" -and `
    $_.Metadata.UserName -eq "Username" `
} | Get-Secret -AsPlainText
```

Unlocking for unattended use

```Powershell
$SecureString = ConvertTo-SecureString "MyPassword1!" -AsPlainText -Force
Unlock-SecretVault -Name PWSafeTest -password $SecureString -verbose
```

### Unregistering

```Powershell
Unregister-SecretVault -Name PWSafeTest
```

## References:

https://github.com/PowerShell/SecretManagement

https://devblogs.microsoft.com/powershell/secrets-management-module-vault-extensions/

https://github.com/PowerShell/SecretManagement/blob/master/Docs/ARCHITECTURE.md

https://github.com/JustinGrote/SecretManagement.KeePass

https://github.com/medo64/PasswordSafe

https://github.com/Azure/azure-powershell/blob/main/src/KeyVault/KeyVault/Az.KeyVault.Extension/Az.KeyVault.Extension.psm1

https://github.com/powershell/secretstore
