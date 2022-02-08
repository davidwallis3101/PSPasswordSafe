function Get-SecretInfo {
    param (
        [string] $Filter = "*",
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )



    <#
        Returns information about each secret stored in all registered vaults, but not the secret itself.
        The information is returned in a Microsoft.PowerShell.SecretManagement.SecretInformation type.
    #>

    # Add filtering
    # $filter | fl * | out-string | write-verbose

    # $doc = [Medo.Security.Cryptography.PasswordSafe.Document]::Load("C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3","MyPassword1!")
    # [Object[]]$secretInfoResult = $doc.Entries | Where-Object {$_.Title -like $Filter} | ForEach-Object {


    #     [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
    #         "$($_.Group)\$($_.Title)",
    #         "String",
    #         $VaultName,
    #         (New-Metadata $_)
    #     )
    # }

    # [Object[]]$sortedInfoResult = $secretInfoResult | Sort-Object -Unique -Property Name

    # if ($sortedInfoResult.count -lt $secretInfoResult.count) {
    #     $nonUniqueFilteredRecords = Compare-Object $sortedInfoResult $secretInfoResult -Property Name | Where-Object SideIndicator -eq '=>'
    #     Write-Warning "Vault ${VaultName}= $_.Entries with non-unique titles were detected, the duplicates were filtered out."
    #     Write-Verbose "Vault ${VaultName}= $_.Filtered Non-Unique Titles= $_.$($nonUniqueFilteredRecords.Name -join ', ')"
    # }

    # write-output $sortedInfoResult
    Write-Verbose "Filter: $($Filter)"

    $doc = Get-PSSafeDoc -Path "C:\users\dwallis\source\repos\PSPasswordSafe\TestSafe.psafe3" -Passcode "MyPassword1!"
    $doc.Entries | Where-Object {$_.Title -like $Filter} | ForEach-Object {
        [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
            "$($_.Group)\$($_.Title)",
            "String",
            $VaultName,
            (New-Metadata $_)
        )
    }
}
