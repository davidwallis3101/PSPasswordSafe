@{
    ModuleVersion = '1.0'
    RootModule = '.\PSPasswordSafe.Extension.psm1'
    FunctionsToExport = @('Set-Secret','Get-Secret','Remove-Secret','Get-SecretInfo','Test-SecretVault',"Unregister-SecretVault","Unlock-SecretVault")
    RequiredAssemblies = @('.\PasswordSafe.dll')
}
