@{
    ModuleVersion = '1.0'
    RootModule = '.\PSPasswordSafe.Extension.psm1'
    FunctionsToExport = @('Set-Secret','Get-Secret','Remove-Secret','Get-SecretInfo','Test-SecretVault')
    RequiredAssemblies = @('C:\Users\dwallis\source\repos\PSPasswordSafe\src\PSPasswordSafe\PSPasswordSafe.Extension\PasswordSafe.dll')
}
