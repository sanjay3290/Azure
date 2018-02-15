﻿Login-AzureRmAccount
$storageAccount="devops3290"
$rgName="NobleSync"
$container="test1"
$storageKey= Get-AzureRmStorageAccountKey -ResourceGroupName $rgName -Name $storageAccount
$context=New-AzureStorageContext -StorageAccountName $storageAccount -StorageAccountKey $storageKey[0].Value
Set-AzureStorageServiceMetricsProperty -ServiceType Blob -MetricsType Hour -RetentionDays 30 -MetricsLevel ServiceAndApi -Context $context
Set-AzureStorageServiceLoggingProperty -ServiceType Blob -RetentionDays 30 -LoggingOperations Delete -Context $context
