<#

C:\Users\dwallis\source\repos\PSPasswordSafe\test1.ps1

powershell -NoExit C:\Users\dwallis\source\repos\PSPasswordSafe\test1.ps1
#>

Unregister-SecretVault -Name PWSafeTest -Verbose -erroraction SilentlyContinue
Register-SecretVault `
    -Name PWSafeTest `
    -ModuleName "C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe" `
    -VaultParameters @{Path="C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3"; } `
    -DefaultVault `
    -Verbose

write-verbose "Updating format data"
Update-FormatData -PrependPath C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe\PSPasswordSafe.Extension\PSPasswordSafe.format.ps1xml

$SecureString = ConvertTo-SecureString "MyPassword1!" -AsPlainText -Force
Unlock-SecretVault -name PWSafeTest -password $SecureString -verbose

#set-secret -Name "test" -metadata @{blah="foo"}
# $secretText = 'This is my securestring secret'
# Set-Secret -Name "test secret" -Secret ($secretText | ConvertTo-SecureString -AsPlainText -Force) -verbose

#break

# Get-SecretVault -Name PWSafeTest -Verbose

Get-SecretInfo -Verbose | ft




# Unregister-SecretVault -Name PWSafeTest -Verbose

"Need 1 record here:"
Get-SecretInfo -Verbose -Vault PWSafeTest | Select-Object -First 1 -Wait | ft

"get password"
Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1" -Vault PWSafeTest -AsPlainText -Verbose  <# Without vault not working #>
Get-secret -name "ce6a8ce0-9a62-db48-a3c2-0533c948b8fa" -Vault PWSafeTest -AsPlainText -Verbose  <# Without vault not working #>
Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1"

# Unregister-SecretVault -Name PWSafeTest -Verbose
# Get-SecretInfo -Verbose | Select-Object -First 1 -Wait | ft
# Get-Secret -Name "26d5465f-ddf9-a444-b82b-10925e6758a1"
# Get-secret -name "ce6a8ce0-9a62-db48-a3c2-0533c948b8fa" -Vault PWSafeTest -AsPlainText -Verbose
