<#

C:\Users\dwallis\source\repos\PSPasswordSafe\test1.ps1

powershell -NoExit C:\Users\dwallis\source\repos\PSPasswordSafe\test1.ps1
#>

Unregister-SecretVault -Name PWSafeTest -Verbose -erroraction SilentlyContinue
Register-SecretVault -Name PWSafeTest -ModuleName "C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe" -VaultParameters @{ None="ReallyNeeded"; } -DefaultVault -Verbose

Update-FormatData -PrependPath C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe\PSPasswordSafe.Extension\PSPasswordSafe.format.ps1xml
# Get-SecretVault -Name PWSafeTest -Verbose

"get secret Info:"
Get-SecretInfo |ft -Verbose

#Get-secret -name Name_1 -AsPlainText

# Unregister-SecretVault -Name PWSafeTest -Verbose

"Need 1 record here:"
Get-SecretInfo -Verbose | Select-Object -First 1 -Wait |ft

"get password"
Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1" -Vault PWSafeTest -AsPlainText -Verbose  <# Without vault not working #>
Get-secret -name "ce6a8ce0-9a62-db48-a3c2-0533c948b8fa" -Vault PWSafeTest -AsPlainText -Verbose  <# Without vault not working #>
