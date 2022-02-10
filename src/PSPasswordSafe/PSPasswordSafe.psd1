@{
    ModuleVersion = '1.0'
    NestedModules = @('.\PSPasswordSafe.Extension')
    FunctionsToExport = @('Set-TestStoreConfiguration','Get-TestStoreConfiguration')
    PrivateData = @{
        PSData = @{
            Tags = @('SecretManagement')
        }
    }
}
