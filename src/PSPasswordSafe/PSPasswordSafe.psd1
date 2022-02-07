@{
    ModuleVersion = '1.0'
    #RootModule = '.\PSPasswordSafe.psm1'
    NestedModules = @('.\PSPasswordSafe.Extension')
    FunctionsToExport = @('Set-TestStoreConfiguration','Get-TestStoreConfiguration') # Cmdlets if C#
    PrivateData = @{
        PSData = @{
            Tags = @('SecretManagement')
        }
    }
}
