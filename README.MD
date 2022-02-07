# PSPasswordSafe

A powershell secrets mananagement extension to get secrets from passwordsafe

## Pre-requisites

```Powershell
Install-Module -Name Microsoft.PowerShell.SecretManagement -Repository PSGallery
```

## Registering

```Powershell
Register-SecretVault -Name PWSafeTest -ModuleName ./PSPasswordSafe -VaultParameters @{ None="ReallyNeeded" } -DefaultVault

Get-SecretVault
```
Un-Registering

```Powershell
Unregister-SecretVault -Name PWSafeTest
```

##Attempt to load passwordsafe secrets from powershell

## References:

https://github.com/PowerShell/SecretManagement
https://devblogs.microsoft.com/powershell/secrets-management-module-vault-extensions/
https://github.com/PowerShell/SecretManagement/blob/master/Docs/ARCHITECTURE.md
https://github.com/JustinGrote/SecretManagement.KeePass
