<#

C:\Users\dwallis\source\repos\PSPasswordSafe\test1.ps1

#>

Unregister-SecretVault -Name PWSafeTest -Verbose -erroraction SilentlyContinue
Register-SecretVault -Name PWSafeTest -ModuleName "C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe" -VaultParameters @{ None="ReallyNeeded"; } -DefaultVault -Verbose

# Get-SecretVault -Name PWSafeTest -Verbose

Get-SecretInfo -Verbose

#Get-secret -name Name_1 -AsPlainText

# Unregister-SecretVault -Name PWSafeTest -Verbose
