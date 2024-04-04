.intel_syntax noprefix

.text
.global _NtAccessCheck
.global _NtWorkerFactoryWorkerReady
.global _NtAcceptConnectPort
.global _NtMapUserPhysicalPagesScatter
.global _NtWaitForSingleObject
.global _NtCallbackReturn
.global _NtReadFile
.global _NtDeviceIoControlFile
.global _NtWriteFile
.global _NtRemoveIoCompletion
.global _NtReleaseSemaphore
.global _NtReplyWaitReceivePort
.global _NtReplyPort
.global _NtSetInformationThread
.global _NtSetEvent
.global _NtClose
.global _NtQueryObject
.global _NtQueryInformationFile
.global _NtOpenKey
.global _NtEnumerateValueKey
.global _NtFindAtom
.global _NtQueryDefaultLocale
.global _NtQueryKey
.global _NtQueryValueKey
.global _NtAllocateVirtualMemory
.global _NtQueryInformationProcess
.global _NtWaitForMultipleObjects32
.global _NtWriteFileGather
.global _NtCreateKey
.global _NtFreeVirtualMemory
.global _NtImpersonateClientOfPort
.global _NtReleaseMutant
.global _NtQueryInformationToken
.global _NtRequestWaitReplyPort
.global _NtQueryVirtualMemory
.global _NtOpenThreadToken
.global _NtQueryInformationThread
.global _NtOpenProcess
.global _NtSetInformationFile
.global _NtMapViewOfSection
.global _NtAccessCheckAndAuditAlarm
.global _NtUnmapViewOfSection
.global _NtReplyWaitReceivePortEx
.global _NtTerminateProcess
.global _NtSetEventBoostPriority
.global _NtReadFileScatter
.global _NtOpenThreadTokenEx
.global _NtOpenProcessTokenEx
.global _NtQueryPerformanceCounter
.global _NtEnumerateKey
.global _NtOpenFile
.global _NtDelayExecution
.global _NtQueryDirectoryFile
.global _NtQuerySystemInformation
.global _NtOpenSection
.global _NtQueryTimer
.global _NtFsControlFile
.global _NtWriteVirtualMemory
.global _NtCloseObjectAuditAlarm
.global _NtDuplicateObject
.global _NtQueryAttributesFile
.global _NtClearEvent
.global _NtReadVirtualMemory
.global _NtOpenEvent
.global _NtAdjustPrivilegesToken
.global _NtDuplicateToken
.global _NtContinue
.global _NtQueryDefaultUILanguage
.global _NtQueueApcThread
.global _NtYieldExecution
.global _NtAddAtom
.global _NtCreateEvent
.global _NtQueryVolumeInformationFile
.global _NtCreateSection
.global _NtFlushBuffersFile
.global _NtApphelpCacheControl
.global _NtCreateProcessEx
.global _NtCreateThread
.global _NtIsProcessInJob
.global _NtProtectVirtualMemory
.global _NtQuerySection
.global _NtResumeThread
.global _NtTerminateThread
.global _NtReadRequestData
.global _NtCreateFile
.global _NtQueryEvent
.global _NtWriteRequestData
.global _NtOpenDirectoryObject
.global _NtAccessCheckByTypeAndAuditAlarm
.global _NtWaitForMultipleObjects
.global _NtSetInformationObject
.global _NtCancelIoFile
.global _NtTraceEvent
.global _NtPowerInformation
.global _NtSetValueKey
.global _NtCancelTimer
.global _NtSetTimer
.global _NtAccessCheckByType
.global _NtAccessCheckByTypeResultList
.global _NtAccessCheckByTypeResultListAndAuditAlarm
.global _NtAccessCheckByTypeResultListAndAuditAlarmByHandle
.global _NtAcquireProcessActivityReference
.global _NtAddAtomEx
.global _NtAddBootEntry
.global _NtAddDriverEntry
.global _NtAdjustGroupsToken
.global _NtAdjustTokenClaimsAndDeviceGroups
.global _NtAlertResumeThread
.global _NtAlertThread
.global _NtAlertThreadByThreadId
.global _NtAllocateLocallyUniqueId
.global _NtAllocateReserveObject
.global _NtAllocateUserPhysicalPages
.global _NtAllocateUuids
.global _NtAllocateVirtualMemoryEx
.global _NtAlpcAcceptConnectPort
.global _NtAlpcCancelMessage
.global _NtAlpcConnectPort
.global _NtAlpcConnectPortEx
.global _NtAlpcCreatePort
.global _NtAlpcCreatePortSection
.global _NtAlpcCreateResourceReserve
.global _NtAlpcCreateSectionView
.global _NtAlpcCreateSecurityContext
.global _NtAlpcDeletePortSection
.global _NtAlpcDeleteResourceReserve
.global _NtAlpcDeleteSectionView
.global _NtAlpcDeleteSecurityContext
.global _NtAlpcDisconnectPort
.global _NtAlpcImpersonateClientContainerOfPort
.global _NtAlpcImpersonateClientOfPort
.global _NtAlpcOpenSenderProcess
.global _NtAlpcOpenSenderThread
.global _NtAlpcQueryInformation
.global _NtAlpcQueryInformationMessage
.global _NtAlpcRevokeSecurityContext
.global _NtAlpcSendWaitReceivePort
.global _NtAlpcSetInformation
.global _NtAreMappedFilesTheSame
.global _NtAssignProcessToJobObject
.global _NtAssociateWaitCompletionPacket
.global _NtCallEnclave
.global _NtCancelIoFileEx
.global _NtCancelSynchronousIoFile
.global _NtCancelTimer2
.global _NtCancelWaitCompletionPacket
.global _NtCommitComplete
.global _NtCommitEnlistment
.global _NtCommitRegistryTransaction
.global _NtCommitTransaction
.global _NtCompactKeys
.global _NtCompareObjects
.global _NtCompareSigningLevels
.global _NtCompareTokens
.global _NtCompleteConnectPort
.global _NtCompressKey
.global _NtConnectPort
.global _NtConvertBetweenAuxiliaryCounterAndPerformanceCounter
.global _NtCreateDebugObject
.global _NtCreateDirectoryObject
.global _NtCreateDirectoryObjectEx
.global _NtCreateEnclave
.global _NtCreateEnlistment
.global _NtCreateEventPair
.global _NtCreateIRTimer
.global _NtCreateIoCompletion
.global _NtCreateJobObject
.global _NtCreateJobSet
.global _NtCreateKeyTransacted
.global _NtCreateKeyedEvent
.global _NtCreateLowBoxToken
.global _NtCreateMailslotFile
.global _NtCreateMutant
.global _NtCreateNamedPipeFile
.global _NtCreatePagingFile
.global _NtCreatePartition
.global _NtCreatePort
.global _NtCreatePrivateNamespace
.global _NtCreateProcess
.global _NtCreateProfile
.global _NtCreateProfileEx
.global _NtCreateRegistryTransaction
.global _NtCreateResourceManager
.global _NtCreateSemaphore
.global _NtCreateSymbolicLinkObject
.global _NtCreateThreadEx
.global _NtCreateTimer
.global _NtCreateTimer2
.global _NtCreateToken
.global _NtCreateTokenEx
.global _NtCreateTransaction
.global _NtCreateTransactionManager
.global _NtCreateUserProcess
.global _NtCreateWaitCompletionPacket
.global _NtCreateWaitablePort
.global _NtCreateWnfStateName
.global _NtCreateWorkerFactory
.global _NtDebugActiveProcess
.global _NtDebugContinue
.global _NtDeleteAtom
.global _NtDeleteBootEntry
.global _NtDeleteDriverEntry
.global _NtDeleteFile
.global _NtDeleteKey
.global _NtDeleteObjectAuditAlarm
.global _NtDeletePrivateNamespace
.global _NtDeleteValueKey
.global _NtDeleteWnfStateData
.global _NtDeleteWnfStateName
.global _NtDisableLastKnownGood
.global _NtDisplayString
.global _NtDrawText
.global _NtEnableLastKnownGood
.global _NtEnumerateBootEntries
.global _NtEnumerateDriverEntries
.global _NtEnumerateSystemEnvironmentValuesEx
.global _NtEnumerateTransactionObject
.global _NtExtendSection
.global _NtFilterBootOption
.global _NtFilterToken
.global _NtFilterTokenEx
.global _NtFlushBuffersFileEx
.global _NtFlushInstallUILanguage
.global _NtFlushInstructionCache
.global _NtFlushKey
.global _NtFlushProcessWriteBuffers
.global _NtFlushVirtualMemory
.global _NtFlushWriteBuffer
.global _NtFreeUserPhysicalPages
.global _NtFreezeRegistry
.global _NtFreezeTransactions
.global _NtGetCachedSigningLevel
.global _NtGetCompleteWnfStateSubscription
.global _NtGetContextThread
.global _NtGetCurrentProcessorNumber
.global _NtGetCurrentProcessorNumberEx
.global _NtGetDevicePowerState
.global _NtGetMUIRegistryInfo
.global _NtGetNextProcess
.global _NtGetNextThread
.global _NtGetNlsSectionPtr
.global _NtGetNotificationResourceManager
.global _NtGetWriteWatch
.global _NtImpersonateAnonymousToken
.global _NtImpersonateThread
.global _NtInitializeEnclave
.global _NtInitializeNlsFiles
.global _NtInitializeRegistry
.global _NtInitiatePowerAction
.global _NtIsSystemResumeAutomatic
.global _NtIsUILanguageComitted
.global _NtListenPort
.global _NtLoadDriver
.global _NtLoadEnclaveData
.global _NtLoadHotPatch
.global _NtLoadKey
.global _NtLoadKey2
.global _NtLoadKeyEx
.global _NtLockFile
.global _NtLockProductActivationKeys
.global _NtLockRegistryKey
.global _NtLockVirtualMemory
.global _NtMakePermanentObject
.global _NtMakeTemporaryObject
.global _NtManagePartition
.global _NtMapCMFModule
.global _NtMapUserPhysicalPages
.global _NtMapViewOfSectionEx
.global _NtModifyBootEntry
.global _NtModifyDriverEntry
.global _NtNotifyChangeDirectoryFile
.global _NtNotifyChangeDirectoryFileEx
.global _NtNotifyChangeKey
.global _NtNotifyChangeMultipleKeys
.global _NtNotifyChangeSession
.global _NtOpenEnlistment
.global _NtOpenEventPair
.global _NtOpenIoCompletion
.global _NtOpenJobObject
.global _NtOpenKeyEx
.global _NtOpenKeyTransacted
.global _NtOpenKeyTransactedEx
.global _NtOpenKeyedEvent
.global _NtOpenMutant
.global _NtOpenObjectAuditAlarm
.global _NtOpenPartition
.global _NtOpenPrivateNamespace
.global _NtOpenProcessToken
.global _NtOpenRegistryTransaction
.global _NtOpenResourceManager
.global _NtOpenSemaphore
.global _NtOpenSession
.global _NtOpenSymbolicLinkObject
.global _NtOpenThread
.global _NtOpenTimer
.global _NtOpenTransaction
.global _NtOpenTransactionManager
.global _NtPlugPlayControl
.global _NtPrePrepareComplete
.global _NtPrePrepareEnlistment
.global _NtPrepareComplete
.global _NtPrepareEnlistment
.global _NtPrivilegeCheck
.global _NtPrivilegeObjectAuditAlarm
.global _NtPrivilegedServiceAuditAlarm
.global _NtPropagationComplete
.global _NtPropagationFailed
.global _NtPulseEvent
.global _NtQueryAuxiliaryCounterFrequency
.global _NtQueryBootEntryOrder
.global _NtQueryBootOptions
.global _NtQueryDebugFilterState
.global _NtQueryDirectoryFileEx
.global _NtQueryDirectoryObject
.global _NtQueryDriverEntryOrder
.global _NtQueryEaFile
.global _NtQueryFullAttributesFile
.global _NtQueryInformationAtom
.global _NtQueryInformationByName
.global _NtQueryInformationEnlistment
.global _NtQueryInformationJobObject
.global _NtQueryInformationPort
.global _NtQueryInformationResourceManager
.global _NtQueryInformationTransaction
.global _NtQueryInformationTransactionManager
.global _NtQueryInformationWorkerFactory
.global _NtQueryInstallUILanguage
.global _NtQueryIntervalProfile
.global _NtQueryIoCompletion
.global _NtQueryLicenseValue
.global _NtQueryMultipleValueKey
.global _NtQueryMutant
.global _NtQueryOpenSubKeys
.global _NtQueryOpenSubKeysEx
.global _NtQueryPortInformationProcess
.global _NtQueryQuotaInformationFile
.global _NtQuerySecurityAttributesToken
.global _NtQuerySecurityObject
.global _NtQuerySecurityPolicy
.global _NtQuerySemaphore
.global _NtQuerySymbolicLinkObject
.global _NtQuerySystemEnvironmentValue
.global _NtQuerySystemEnvironmentValueEx
.global _NtQuerySystemInformationEx
.global _NtQueryTimerResolution
.global _NtQueryWnfStateData
.global _NtQueryWnfStateNameInformation
.global _NtQueueApcThreadEx
.global _NtRaiseException
.global _NtRaiseHardError
.global _NtReadOnlyEnlistment
.global _NtRecoverEnlistment
.global _NtRecoverResourceManager
.global _NtRecoverTransactionManager
.global _NtRegisterProtocolAddressInformation
.global _NtRegisterThreadTerminatePort
.global _NtReleaseKeyedEvent
.global _NtReleaseWorkerFactoryWorker
.global _NtRemoveIoCompletionEx
.global _NtRemoveProcessDebug
.global _NtRenameKey
.global _NtRenameTransactionManager
.global _NtReplaceKey
.global _NtReplacePartitionUnit
.global _NtReplyWaitReplyPort
.global _NtRequestPort
.global _NtResetEvent
.global _NtResetWriteWatch
.global _NtRestoreKey
.global _NtResumeProcess
.global _NtRevertContainerImpersonation
.global _NtRollbackComplete
.global _NtRollbackEnlistment
.global _NtRollbackRegistryTransaction
.global _NtRollbackTransaction
.global _NtRollforwardTransactionManager
.global _NtSaveKey
.global _NtSaveKeyEx
.global _NtSaveMergedKeys
.global _NtSecureConnectPort
.global _NtSerializeBoot
.global _NtSetBootEntryOrder
.global _NtSetBootOptions
.global _NtSetCachedSigningLevel
.global _NtSetCachedSigningLevel2
.global _NtSetContextThread
.global _NtSetDebugFilterState
.global _NtSetDefaultHardErrorPort
.global _NtSetDefaultLocale
.global _NtSetDefaultUILanguage
.global _NtSetDriverEntryOrder
.global _NtSetEaFile
.global _NtSetHighEventPair
.global _NtSetHighWaitLowEventPair
.global _NtSetIRTimer
.global _NtSetInformationDebugObject
.global _NtSetInformationEnlistment
.global _NtSetInformationJobObject
.global _NtSetInformationKey
.global _NtSetInformationResourceManager
.global _NtSetInformationSymbolicLink
.global _NtSetInformationToken
.global _NtSetInformationTransaction
.global _NtSetInformationTransactionManager
.global _NtSetInformationVirtualMemory
.global _NtSetInformationWorkerFactory
.global _NtSetIntervalProfile
.global _NtSetIoCompletion
.global _NtSetIoCompletionEx
.global _NtSetLdtEntries
.global _NtSetLowEventPair
.global _NtSetLowWaitHighEventPair
.global _NtSetQuotaInformationFile
.global _NtSetSecurityObject
.global _NtSetSystemEnvironmentValue
.global _NtSetSystemEnvironmentValueEx
.global _NtSetSystemInformation
.global _NtSetSystemPowerState
.global _NtSetSystemTime
.global _NtSetThreadExecutionState
.global _NtSetTimer2
.global _NtSetTimerEx
.global _NtSetTimerResolution
.global _NtSetUuidSeed
.global _NtSetVolumeInformationFile
.global _NtSetWnfProcessNotificationEvent
.global _NtShutdownSystem
.global _NtShutdownWorkerFactory
.global _NtSignalAndWaitForSingleObject
.global _NtSinglePhaseReject
.global _NtStartProfile
.global _NtStopProfile
.global _NtSubscribeWnfStateChange
.global _NtSuspendProcess
.global _NtSuspendThread
.global _NtSystemDebugControl
.global _NtTerminateEnclave
.global _NtTerminateJobObject
.global _NtTestAlert
.global _NtThawRegistry
.global _NtThawTransactions
.global _NtTraceControl
.global _NtTranslateFilePath
.global _NtUmsThreadYield
.global _NtUnloadDriver
.global _NtUnloadKey
.global _NtUnloadKey2
.global _NtUnloadKeyEx
.global _NtUnlockFile
.global _NtUnlockVirtualMemory
.global _NtUnmapViewOfSectionEx
.global _NtUnsubscribeWnfStateChange
.global _NtUpdateWnfStateData
.global _NtVdmControl
.global _NtWaitForAlertByThreadId
.global _NtWaitForDebugEvent
.global _NtWaitForKeyedEvent
.global _NtWaitForWorkViaWorkerFactory
.global _NtWaitHighEventPair
.global _NtWaitLowEventPair
.global _NtAcquireCMFViewOwnership
.global _NtCancelDeviceWakeupRequest
.global _NtClearAllSavepointsTransaction
.global _NtClearSavepointTransaction
.global _NtRollbackSavepointTransaction
.global _NtSavepointTransaction
.global _NtSavepointComplete
.global _NtCreateSectionEx
.global _NtCreateCrossVmEvent
.global _NtGetPlugPlayEvent
.global _NtListTransactions
.global _NtMarshallTransaction
.global _NtPullTransaction
.global _NtReleaseCMFViewOwnership
.global _NtWaitForWnfNotifications
.global _NtStartTm
.global _NtSetInformationProcess
.global _NtRequestDeviceWakeup
.global _NtRequestWakeupLatency
.global _NtQuerySystemTime
.global _NtManageHotPatch
.global _NtContinueEx

.global _WhisperMain

_WhisperMain:
    pop eax                        # Remove return address from CALL instruction
    call _SW2_GetSyscallNumber     # Resolve function hash into syscall number
    add esp, 4                     # Restore ESP
    mov ecx, dword ptr fs:0xc0
    test ecx, ecx
    jne _wow64
    lea edx, dword ptr [esp+0x04]
    INT 0x02e
    ret
_wow64:
    xor ecx, ecx
    lea edx, dword ptr [esp+0x04]
    call dword ptr fs:0xc0
    ret

_NtAccessCheck:
    push 0x00D84B05
    call _WhisperMain

_NtWorkerFactoryWorkerReady:
    push 0x9FA1B93C
    call _WhisperMain

_NtAcceptConnectPort:
    push 0x24B2213C
    call _WhisperMain

_NtMapUserPhysicalPagesScatter:
    push 0x27822D1F
    call _WhisperMain

_NtWaitForSingleObject:
    push 0xA698B634
    call _WhisperMain

_NtCallbackReturn:
    push 0x46DA6906
    call _WhisperMain

_NtReadFile:
    push 0x2D78E329
    call _WhisperMain

_NtDeviceIoControlFile:
    push 0x5CBC501E
    call _WhisperMain

_NtWriteFile:
    push 0xC159CE3B
    call _WhisperMain

_NtRemoveIoCompletion:
    push 0x0689869F
    call _WhisperMain

_NtReleaseSemaphore:
    push 0x4C1E34C0
    call _WhisperMain

_NtReplyWaitReceivePort:
    push 0x61729E19
    call _WhisperMain

_NtReplyPort:
    push 0xA133CB2D
    call _WhisperMain

_NtSetInformationThread:
    push 0x882FC281
    call _WhisperMain

_NtSetEvent:
    push 0xDD40C0C9
    call _WhisperMain

_NtClose:
    push 0x489CDDA5
    call _WhisperMain

_NtQueryObject:
    push 0xFA54F6FB
    call _WhisperMain

_NtQueryInformationFile:
    push 0xF9781779
    call _WhisperMain

_NtOpenKey:
    push 0x0466E83C
    call _WhisperMain

_NtEnumerateValueKey:
    push 0x2A5F37CA
    call _WhisperMain

_NtFindAtom:
    push 0xB5238AA1
    call _WhisperMain

_NtQueryDefaultLocale:
    push 0xA3237C62
    call _WhisperMain

_NtQueryKey:
    push 0x92A6AF1C
    call _WhisperMain

_NtQueryValueKey:
    push 0xB9099CAA
    call _WhisperMain

_NtAllocateVirtualMemory:
    push 0x9790911F
    call _WhisperMain

_NtQueryInformationProcess:
    push 0x612F4AB0
    call _WhisperMain

_NtWaitForMultipleObjects32:
    push 0x16CA3625
    call _WhisperMain

_NtWriteFileGather:
    push 0x3A24D23E
    call _WhisperMain

_NtCreateKey:
    push 0x7E814F3B
    call _WhisperMain

_NtFreeVirtualMemory:
    push 0xC596A942
    call _WhisperMain

_NtImpersonateClientOfPort:
    push 0x783265BC
    call _WhisperMain

_NtReleaseMutant:
    push 0x3BBC3426
    call _WhisperMain

_NtQueryInformationToken:
    push 0xA17ECBFA
    call _WhisperMain

_NtRequestWaitReplyPort:
    push 0x2DB14823
    call _WhisperMain

_NtQueryVirtualMemory:
    push 0x39D0395F
    call _WhisperMain

_NtOpenThreadToken:
    push 0x1D840F08
    call _WhisperMain

_NtQueryInformationThread:
    push 0x2E8A3C3B
    call _WhisperMain

_NtOpenProcess:
    push 0xBE20A5AC
    call _WhisperMain

_NtSetInformationFile:
    push 0xB63F582C
    call _WhisperMain

_NtMapViewOfSection:
    push 0x46EA2639
    call _WhisperMain

_NtAccessCheckAndAuditAlarm:
    push 0x18BE1A52
    call _WhisperMain

_NtUnmapViewOfSection:
    push 0x0A9E080F
    call _WhisperMain

_NtReplyWaitReceivePortEx:
    push 0x696B3BB1
    call _WhisperMain

_NtTerminateProcess:
    push 0x21A32630
    call _WhisperMain

_NtSetEventBoostPriority:
    push 0x0C961A1E
    call _WhisperMain

_NtReadFileScatter:
    push 0x39921B2F
    call _WhisperMain

_NtOpenThreadTokenEx:
    push 0x148CA0B0
    call _WhisperMain

_NtOpenProcessTokenEx:
    push 0xC6C3807D
    call _WhisperMain

_NtQueryPerformanceCounter:
    push 0x73D595C1
    call _WhisperMain

_NtEnumerateKey:
    push 0x1B1F4ECD
    call _WhisperMain

_NtOpenFile:
    push 0xF4A573B9
    call _WhisperMain

_NtDelayExecution:
    push 0x0A800811
    call _WhisperMain

_NtQueryDirectoryFile:
    push 0x28BEF888
    call _WhisperMain

_NtQuerySystemInformation:
    push 0xDA4BDCDF
    call _WhisperMain

_NtOpenSection:
    push 0x1CC63E57
    call _WhisperMain

_NtQueryTimer:
    push 0xC3971FBA
    call _WhisperMain

_NtFsControlFile:
    push 0xA8A9920E
    call _WhisperMain

_NtWriteVirtualMemory:
    push 0x0F912503
    call _WhisperMain

_NtCloseObjectAuditAlarm:
    push 0x6EB06A26
    call _WhisperMain

_NtDuplicateObject:
    push 0x08B13A3F
    call _WhisperMain

_NtQueryAttributesFile:
    push 0x3AB80E66
    call _WhisperMain

_NtClearEvent:
    push 0x6EF46B64
    call _WhisperMain

_NtReadVirtualMemory:
    push 0xD39D2AFE
    call _WhisperMain

_NtOpenEvent:
    push 0x92B1D167
    call _WhisperMain

_NtAdjustPrivilegesToken:
    push 0x1DA2F11E
    call _WhisperMain

_NtDuplicateToken:
    push 0xDE6AC4E9
    call _WhisperMain

_NtContinue:
    push 0x4ED93916
    call _WhisperMain

_NtQueryDefaultUILanguage:
    push 0x9C3B8F87
    call _WhisperMain

_NtQueueApcThread:
    push 0x8EA41A9B
    call _WhisperMain

_NtYieldExecution:
    push 0x2EB8042D
    call _WhisperMain

_NtAddAtom:
    push 0x4D47AE51
    call _WhisperMain

_NtCreateEvent:
    push 0xE64DF5AA
    call _WhisperMain

_NtQueryVolumeInformationFile:
    push 0xDE4FF0CC
    call _WhisperMain

_NtCreateSection:
    push 0x248D2A15
    call _WhisperMain

_NtFlushBuffersFile:
    push 0xE85B3662
    call _WhisperMain

_NtApphelpCacheControl:
    push 0xBDAD26AB
    call _WhisperMain

_NtCreateProcessEx:
    push 0x0C924647
    call _WhisperMain

_NtCreateThread:
    push 0x10B44209
    call _WhisperMain

_NtIsProcessInJob:
    push 0x64C2A691
    call _WhisperMain

_NtProtectVirtualMemory:
    push 0x4F954517
    call _WhisperMain

_NtQuerySection:
    push 0xC844E4DF
    call _WhisperMain

_NtResumeThread:
    push 0xB898BA26
    call _WhisperMain

_NtTerminateThread:
    push 0x4C8E022F
    call _WhisperMain

_NtReadRequestData:
    push 0xC3BDF0EF
    call _WhisperMain

_NtCreateFile:
    push 0x56E78957
    call _WhisperMain

_NtQueryEvent:
    push 0x7A4129E6
    call _WhisperMain

_NtWriteRequestData:
    push 0xE4059212
    call _WhisperMain

_NtOpenDirectoryObject:
    push 0x855FB1C0
    call _WhisperMain

_NtAccessCheckByTypeAndAuditAlarm:
    push 0xCF40EFCF
    call _WhisperMain

_NtWaitForMultipleObjects:
    push 0xD52DEDE7
    call _WhisperMain

_NtSetInformationObject:
    push 0x02213A8C
    call _WhisperMain

_NtCancelIoFile:
    push 0x9AFB5DC7
    call _WhisperMain

_NtTraceEvent:
    push 0xCEF22697
    call _WhisperMain

_NtPowerInformation:
    push 0x30AE11FD
    call _WhisperMain

_NtSetValueKey:
    push 0x09DD2E40
    call _WhisperMain

_NtCancelTimer:
    push 0xACA6F468
    call _WhisperMain

_NtSetTimer:
    push 0x379E1D26
    call _WhisperMain

_NtAccessCheckByType:
    push 0x9CC67084
    call _WhisperMain

_NtAccessCheckByTypeResultList:
    push 0x7ED37A5B
    call _WhisperMain

_NtAccessCheckByTypeResultListAndAuditAlarm:
    push 0xD2D4D540
    call _WhisperMain

_NtAccessCheckByTypeResultListAndAuditAlarmByHandle:
    push 0xA99663A0
    call _WhisperMain

_NtAcquireProcessActivityReference:
    push 0x3AE3533E
    call _WhisperMain

_NtAddAtomEx:
    push 0xFD15DDAE
    call _WhisperMain

_NtAddBootEntry:
    push 0x01903128
    call _WhisperMain

_NtAddDriverEntry:
    push 0x19F76978
    call _WhisperMain

_NtAdjustGroupsToken:
    push 0x25917530
    call _WhisperMain

_NtAdjustTokenClaimsAndDeviceGroups:
    push 0xFA66FCF4
    call _WhisperMain

_NtAlertResumeThread:
    push 0x309A3E33
    call _WhisperMain

_NtAlertThread:
    push 0x284312D5
    call _WhisperMain

_NtAlertThreadByThreadId:
    push 0xA4B8E61E
    call _WhisperMain

_NtAllocateLocallyUniqueId:
    push 0xCC0FCFA8
    call _WhisperMain

_NtAllocateReserveObject:
    push 0x8E23BEAF
    call _WhisperMain

_NtAllocateUserPhysicalPages:
    push 0x2F9D6816
    call _WhisperMain

_NtAllocateUuids:
    push 0x17A4E4DA
    call _WhisperMain

_NtAllocateVirtualMemoryEx:
    push 0xB880EA6B
    call _WhisperMain

_NtAlpcAcceptConnectPort:
    push 0x40B75B38
    call _WhisperMain

_NtAlpcCancelMessage:
    push 0x17B6322C
    call _WhisperMain

_NtAlpcConnectPort:
    push 0x3269C007
    call _WhisperMain

_NtAlpcConnectPortEx:
    push 0xE06E3731
    call _WhisperMain

_NtAlpcCreatePort:
    push 0x58CA7552
    call _WhisperMain

_NtAlpcCreatePortSection:
    push 0x0ADA0241
    call _WhisperMain

_NtAlpcCreateResourceReserve:
    push 0x10A10C1B
    call _WhisperMain

_NtAlpcCreateSectionView:
    push 0x148C7113
    call _WhisperMain

_NtAlpcCreateSecurityContext:
    push 0x08B21F3A
    call _WhisperMain

_NtAlpcDeletePortSection:
    push 0xE157C602
    call _WhisperMain

_NtAlpcDeleteResourceReserve:
    push 0x28A8D4F3
    call _WhisperMain

_NtAlpcDeleteSectionView:
    push 0x86B7571D
    call _WhisperMain

_NtAlpcDeleteSecurityContext:
    push 0xEE960206
    call _WhisperMain

_NtAlpcDisconnectPort:
    push 0xA6F2A060
    call _WhisperMain

_NtAlpcImpersonateClientContainerOfPort:
    push 0x20B3C728
    call _WhisperMain

_NtAlpcImpersonateClientOfPort:
    push 0xD44DC7E2
    call _WhisperMain

_NtAlpcOpenSenderProcess:
    push 0xEFBB2DEB
    call _WhisperMain

_NtAlpcOpenSenderThread:
    push 0xA805BAAB
    call _WhisperMain

_NtAlpcQueryInformation:
    push 0x9D44BDCA
    call _WhisperMain

_NtAlpcQueryInformationMessage:
    push 0xC751C6EA
    call _WhisperMain

_NtAlpcRevokeSecurityContext:
    push 0xD742F2D3
    call _WhisperMain

_NtAlpcSendWaitReceivePort:
    push 0x22B23B36
    call _WhisperMain

_NtAlpcSetInformation:
    push 0x00E80279
    call _WhisperMain

_NtAreMappedFilesTheSame:
    push 0xF7D4DA63
    call _WhisperMain

_NtAssignProcessToJobObject:
    push 0x301C1B43
    call _WhisperMain

_NtAssociateWaitCompletionPacket:
    push 0x073C3780
    call _WhisperMain

_NtCallEnclave:
    push 0x22D31278
    call _WhisperMain

_NtCancelIoFileEx:
    push 0xC73D0B79
    call _WhisperMain

_NtCancelSynchronousIoFile:
    push 0x26A60A20
    call _WhisperMain

_NtCancelTimer2:
    push 0xC40A1C84
    call _WhisperMain

_NtCancelWaitCompletionPacket:
    push 0x07833D0C
    call _WhisperMain

_NtCommitComplete:
    push 0xDA2BF4A0
    call _WhisperMain

_NtCommitEnlistment:
    push 0x59009E53
    call _WhisperMain

_NtCommitRegistryTransaction:
    push 0x4E810C51
    call _WhisperMain

_NtCommitTransaction:
    push 0x3852F60F
    call _WhisperMain

_NtCompactKeys:
    push 0x43B77820
    call _WhisperMain

_NtCompareObjects:
    push 0x9226A562
    call _WhisperMain

_NtCompareSigningLevels:
    push 0x70EA917E
    call _WhisperMain

_NtCompareTokens:
    push 0x79D57755
    call _WhisperMain

_NtCompleteConnectPort:
    push 0x20B63D38
    call _WhisperMain

_NtCompressKey:
    push 0xABD1AA4E
    call _WhisperMain

_NtConnectPort:
    push 0x7EA87B3A
    call _WhisperMain

_NtConvertBetweenAuxiliaryCounterAndPerformanceCounter:
    push 0x7FCC111D
    call _WhisperMain

_NtCreateDebugObject:
    push 0x70584915
    call _WhisperMain

_NtCreateDirectoryObject:
    push 0xBB91A91F
    call _WhisperMain

_NtCreateDirectoryObjectEx:
    push 0xAC89F658
    call _WhisperMain

_NtCreateEnclave:
    push 0xEC551C48
    call _WhisperMain

_NtCreateEnlistment:
    push 0x25982E1F
    call _WhisperMain

_NtCreateEventPair:
    push 0x1696320B
    call _WhisperMain

_NtCreateIRTimer:
    push 0xCD9BFD38
    call _WhisperMain

_NtCreateIoCompletion:
    push 0xC6B02420
    call _WhisperMain

_NtCreateJobObject:
    push 0x3C9D04D1
    call _WhisperMain

_NtCreateJobSet:
    push 0x20AE760D
    call _WhisperMain

_NtCreateKeyTransacted:
    push 0x121EF303
    call _WhisperMain

_NtCreateKeyedEvent:
    push 0xC1AB2FB6
    call _WhisperMain

_NtCreateLowBoxToken:
    push 0x4F946DC4
    call _WhisperMain

_NtCreateMailslotFile:
    push 0x243DCA3E
    call _WhisperMain

_NtCreateMutant:
    push 0xDDB3BE64
    call _WhisperMain

_NtCreateNamedPipeFile:
    push 0x2ABD122A
    call _WhisperMain

_NtCreatePagingFile:
    push 0x5CCB5E52
    call _WhisperMain

_NtCreatePartition:
    push 0x15A0694A
    call _WhisperMain

_NtCreatePort:
    push 0x02881B06
    call _WhisperMain

_NtCreatePrivateNamespace:
    push 0x9DBE43FF
    call _WhisperMain

_NtCreateProcess:
    push 0x29B92F28
    call _WhisperMain

_NtCreateProfile:
    push 0x26BE292C
    call _WhisperMain

_NtCreateProfileEx:
    push 0x0D934B4E
    call _WhisperMain

_NtCreateRegistryTransaction:
    push 0xCF54CBC6
    call _WhisperMain

_NtCreateResourceManager:
    push 0x183CC170
    call _WhisperMain

_NtCreateSemaphore:
    push 0x085A7AB2
    call _WhisperMain

_NtCreateSymbolicLinkObject:
    push 0xF2D8DC65
    call _WhisperMain

_NtCreateThreadEx:
    push 0x44BC86C6
    call _WhisperMain

_NtCreateTimer:
    push 0x0350DD10
    call _WhisperMain

_NtCreateTimer2:
    push 0x1353BA0D
    call _WhisperMain

_NtCreateToken:
    push 0xC75AF5FA
    call _WhisperMain

_NtCreateTokenEx:
    push 0x3AA0F7E5
    call _WhisperMain

_NtCreateTransaction:
    push 0x46CD4267
    call _WhisperMain

_NtCreateTransactionManager:
    push 0x172507A4
    call _WhisperMain

_NtCreateUserProcess:
    push 0x398A3A14
    call _WhisperMain

_NtCreateWaitCompletionPacket:
    push 0xA99DD171
    call _WhisperMain

_NtCreateWaitablePort:
    push 0xE673E1E0
    call _WhisperMain

_NtCreateWnfStateName:
    push 0x148A2D1F
    call _WhisperMain

_NtCreateWorkerFactory:
    push 0xBEAED64F
    call _WhisperMain

_NtDebugActiveProcess:
    push 0x7E3097AC
    call _WhisperMain

_NtDebugContinue:
    push 0x30244728
    call _WhisperMain

_NtDeleteAtom:
    push 0x54C15756
    call _WhisperMain

_NtDeleteBootEntry:
    push 0x09950306
    call _WhisperMain

_NtDeleteDriverEntry:
    push 0xCB97FF2A
    call _WhisperMain

_NtDeleteFile:
    push 0x14B25392
    call _WhisperMain

_NtDeleteKey:
    push 0x69D34C78
    call _WhisperMain

_NtDeleteObjectAuditAlarm:
    push 0x7AA47C30
    call _WhisperMain

_NtDeletePrivateNamespace:
    push 0x6ACC6F55
    call _WhisperMain

_NtDeleteValueKey:
    push 0x2A9F0905
    call _WhisperMain

_NtDeleteWnfStateData:
    push 0x02C292F0
    call _WhisperMain

_NtDeleteWnfStateName:
    push 0x76B8FD9B
    call _WhisperMain

_NtDisableLastKnownGood:
    push 0x7BAA4570
    call _WhisperMain

_NtDisplayString:
    push 0xFEA3D422
    call _WhisperMain

_NtDrawText:
    push 0x12AB093C
    call _WhisperMain

_NtEnableLastKnownGood:
    push 0xE47B9E7D
    call _WhisperMain

_NtEnumerateBootEntries:
    push 0x18CD1B51
    call _WhisperMain

_NtEnumerateDriverEntries:
    push 0xE8DC14B4
    call _WhisperMain

_NtEnumerateSystemEnvironmentValuesEx:
    push 0x1D90CDC8
    call _WhisperMain

_NtEnumerateTransactionObject:
    push 0x1935E84B
    call _WhisperMain

_NtExtendSection:
    push 0x3368ECC1
    call _WhisperMain

_NtFilterBootOption:
    push 0x0CA6CEF6
    call _WhisperMain

_NtFilterToken:
    push 0x6420B86E
    call _WhisperMain

_NtFilterTokenEx:
    push 0xA64FA2F0
    call _WhisperMain

_NtFlushBuffersFileEx:
    push 0xAA399A81
    call _WhisperMain

_NtFlushInstallUILanguage:
    push 0xBB895C88
    call _WhisperMain

_NtFlushInstructionCache:
    push 0x8B588FF9
    call _WhisperMain

_NtFlushKey:
    push 0x1C1F79E3
    call _WhisperMain

_NtFlushProcessWriteBuffers:
    push 0x00BF0C2E
    call _WhisperMain

_NtFlushVirtualMemory:
    push 0xC9D12CBE
    call _WhisperMain

_NtFlushWriteBuffer:
    push 0x831AAD8B
    call _WhisperMain

_NtFreeUserPhysicalPages:
    push 0x81BCB61C
    call _WhisperMain

_NtFreezeRegistry:
    push 0x008B0607
    call _WhisperMain

_NtFreezeTransactions:
    push 0x4F9D3777
    call _WhisperMain

_NtGetCachedSigningLevel:
    push 0xB67AF0C0
    call _WhisperMain

_NtGetCompleteWnfStateSubscription:
    push 0x3CB13C23
    call _WhisperMain

_NtGetContextThread:
    push 0xF4C8FE5F
    call _WhisperMain

_NtGetCurrentProcessorNumber:
    push 0xD7B2C512
    call _WhisperMain

_NtGetCurrentProcessorNumberEx:
    push 0x10AFC3F5
    call _WhisperMain

_NtGetDevicePowerState:
    push 0x36B61836
    call _WhisperMain

_NtGetMUIRegistryInfo:
    push 0x6A10444F
    call _WhisperMain

_NtGetNextProcess:
    push 0x015FE333
    call _WhisperMain

_NtGetNextThread:
    push 0x306C32D5
    call _WhisperMain

_NtGetNlsSectionPtr:
    push 0x3E16219F
    call _WhisperMain

_NtGetNotificationResourceManager:
    push 0x0F9F6B42
    call _WhisperMain

_NtGetWriteWatch:
    push 0xAD6FD7FD
    call _WhisperMain

_NtImpersonateAnonymousToken:
    push 0x3016E42C
    call _WhisperMain

_NtImpersonateThread:
    push 0x328E1037
    call _WhisperMain

_NtInitializeEnclave:
    push 0xF0AEDA22
    call _WhisperMain

_NtInitializeNlsFiles:
    push 0x1317DD54
    call _WhisperMain

_NtInitializeRegistry:
    push 0x2C8C342B
    call _WhisperMain

_NtInitiatePowerAction:
    push 0x0EA16475
    call _WhisperMain

_NtIsSystemResumeAutomatic:
    push 0x86887393
    call _WhisperMain

_NtIsUILanguageComitted:
    push 0x63861293
    call _WhisperMain

_NtListenPort:
    push 0xA4AEA130
    call _WhisperMain

_NtLoadDriver:
    push 0x5CD7764C
    call _WhisperMain

_NtLoadEnclaveData:
    push 0xF303C9D9
    call _WhisperMain

_NtLoadHotPatch:
    push 0x9EAF9630
    call _WhisperMain

_NtLoadKey:
    push 0x5BE25E61
    call _WhisperMain

_NtLoadKey2:
    push 0x3AB9CE3F
    call _WhisperMain

_NtLoadKeyEx:
    push 0x0584FD84
    call _WhisperMain

_NtLockFile:
    push 0xE038E8AA
    call _WhisperMain

_NtLockProductActivationKeys:
    push 0xE742ECD4
    call _WhisperMain

_NtLockRegistryKey:
    push 0x6DCB5C4C
    call _WhisperMain

_NtLockVirtualMemory:
    push 0x31B4D4DB
    call _WhisperMain

_NtMakePermanentObject:
    push 0x12017ADC
    call _WhisperMain

_NtMakeTemporaryObject:
    push 0x06DD7E31
    call _WhisperMain

_NtManagePartition:
    push 0x868D8118
    call _WhisperMain

_NtMapCMFModule:
    push 0x68265372
    call _WhisperMain

_NtMapUserPhysicalPages:
    push 0x8DB5F64E
    call _WhisperMain

_NtMapViewOfSectionEx:
    push 0x60D329E2
    call _WhisperMain

_NtModifyBootEntry:
    push 0x09803938
    call _WhisperMain

_NtModifyDriverEntry:
    push 0x09983950
    call _WhisperMain

_NtNotifyChangeDirectoryFile:
    push 0xBC3BAC80
    call _WhisperMain

_NtNotifyChangeDirectoryFileEx:
    push 0x80BBC407
    call _WhisperMain

_NtNotifyChangeKey:
    push 0x859A6385
    call _WhisperMain

_NtNotifyChangeMultipleKeys:
    push 0x8794009F
    call _WhisperMain

_NtNotifyChangeSession:
    push 0x01D750F4
    call _WhisperMain

_NtOpenEnlistment:
    push 0x49CB7C4D
    call _WhisperMain

_NtOpenEventPair:
    push 0xC292C607
    call _WhisperMain

_NtOpenIoCompletion:
    push 0x148235D1
    call _WhisperMain

_NtOpenJobObject:
    push 0x82A050FD
    call _WhisperMain

_NtOpenKeyEx:
    push 0x765A9025
    call _WhisperMain

_NtOpenKeyTransacted:
    push 0xDCBCEE62
    call _WhisperMain

_NtOpenKeyTransactedEx:
    push 0x26DFE061
    call _WhisperMain

_NtOpenKeyedEvent:
    push 0xC88A2AFD
    call _WhisperMain

_NtOpenMutant:
    push 0x72E27B7E
    call _WhisperMain

_NtOpenObjectAuditAlarm:
    push 0x0A85261A
    call _WhisperMain

_NtOpenPartition:
    push 0xB4AA53BA
    call _WhisperMain

_NtOpenPrivateNamespace:
    push 0x1EAE213C
    call _WhisperMain

_NtOpenProcessToken:
    push 0xE5219BE2
    call _WhisperMain

_NtOpenRegistryTransaction:
    push 0x1E40D914
    call _WhisperMain

_NtOpenResourceManager:
    push 0x259D313C
    call _WhisperMain

_NtOpenSemaphore:
    push 0x4E9A9322
    call _WhisperMain

_NtOpenSession:
    push 0xEBCD17AE
    call _WhisperMain

_NtOpenSymbolicLinkObject:
    push 0x0FA1372C
    call _WhisperMain

_NtOpenThread:
    push 0x02315609
    call _WhisperMain

_NtOpenTimer:
    push 0x6A52E243
    call _WhisperMain

_NtOpenTransaction:
    push 0xE8C19E25
    call _WhisperMain

_NtOpenTransactionManager:
    push 0x3DA6D7BA
    call _WhisperMain

_NtPlugPlayControl:
    push 0x4F184BF3
    call _WhisperMain

_NtPrePrepareComplete:
    push 0x2ED3C45C
    call _WhisperMain

_NtPrePrepareEnlistment:
    push 0xD9BEC63D
    call _WhisperMain

_NtPrepareComplete:
    push 0x089003FE
    call _WhisperMain

_NtPrepareEnlistment:
    push 0xB629CDDE
    call _WhisperMain

_NtPrivilegeCheck:
    push 0x0AA6F9F8
    call _WhisperMain

_NtPrivilegeObjectAuditAlarm:
    push 0x10AEEAC2
    call _WhisperMain

_NtPrivilegedServiceAuditAlarm:
    push 0x905F1D46
    call _WhisperMain

_NtPropagationComplete:
    push 0x1CB9FEF6
    call _WhisperMain

_NtPropagationFailed:
    push 0x9E997DC7
    call _WhisperMain

_NtPulseEvent:
    push 0xF64AC7EC
    call _WhisperMain

_NtQueryAuxiliaryCounterFrequency:
    push 0x3BB11617
    call _WhisperMain

_NtQueryBootEntryOrder:
    push 0x87AE138D
    call _WhisperMain

_NtQueryBootOptions:
    push 0xC5A93FC1
    call _WhisperMain

_NtQueryDebugFilterState:
    push 0xF6B518F4
    call _WhisperMain

_NtQueryDirectoryFileEx:
    push 0x2C37108C
    call _WhisperMain

_NtQueryDirectoryObject:
    push 0x163D38A6
    call _WhisperMain

_NtQueryDriverEntryOrder:
    push 0xB3869513
    call _WhisperMain

_NtQueryEaFile:
    push 0x6432B598
    call _WhisperMain

_NtQueryFullAttributesFile:
    push 0x1C7DC8CE
    call _WhisperMain

_NtQueryInformationAtom:
    push 0xA938CD31
    call _WhisperMain

_NtQueryInformationByName:
    push 0xF42B87FD
    call _WhisperMain

_NtQueryInformationEnlistment:
    push 0xD448F7DE
    call _WhisperMain

_NtQueryInformationJobObject:
    push 0x72508F50
    call _WhisperMain

_NtQueryInformationPort:
    push 0xE579FCD7
    call _WhisperMain

_NtQueryInformationResourceManager:
    push 0xE7577177
    call _WhisperMain

_NtQueryInformationTransaction:
    push 0x02172C8F
    call _WhisperMain

_NtQueryInformationTransactionManager:
    push 0xC5992AE5
    call _WhisperMain

_NtQueryInformationWorkerFactory:
    push 0xFC95CA39
    call _WhisperMain

_NtQueryInstallUILanguage:
    push 0x1342D01A
    call _WhisperMain

_NtQueryIntervalProfile:
    push 0x28A07664
    call _WhisperMain

_NtQueryIoCompletion:
    push 0x9F36A3B4
    call _WhisperMain

_NtQueryLicenseValue:
    push 0xB421DA2A
    call _WhisperMain

_NtQueryMultipleValueKey:
    push 0x4195622C
    call _WhisperMain

_NtQueryMutant:
    push 0xF453CDE6
    call _WhisperMain

_NtQueryOpenSubKeys:
    push 0x8AD0A572
    call _WhisperMain

_NtQueryOpenSubKeysEx:
    push 0xAFA3F576
    call _WhisperMain

_NtQueryPortInformationProcess:
    push 0x41D4444C
    call _WhisperMain

_NtQueryQuotaInformationFile:
    push 0xBAB944BA
    call _WhisperMain

_NtQuerySecurityAttributesToken:
    push 0x32153A8F
    call _WhisperMain

_NtQuerySecurityObject:
    push 0x36AB5EB7
    call _WhisperMain

_NtQuerySecurityPolicy:
    push 0x3C8B013F
    call _WhisperMain

_NtQuerySemaphore:
    push 0x43560DF0
    call _WhisperMain

_NtQuerySymbolicLinkObject:
    push 0x1435FC29
    call _WhisperMain

_NtQuerySystemEnvironmentValue:
    push 0xFC20F3C0
    call _WhisperMain

_NtQuerySystemEnvironmentValueEx:
    push 0xFFE0FB5C
    call _WhisperMain

_NtQuerySystemInformationEx:
    push 0x969554AE
    call _WhisperMain

_NtQueryTimerResolution:
    push 0x48D26801
    call _WhisperMain

_NtQueryWnfStateData:
    push 0x62FB700A
    call _WhisperMain

_NtQueryWnfStateNameInformation:
    push 0xDE44DED7
    call _WhisperMain

_NtQueueApcThreadEx:
    push 0x2A3E6884
    call _WhisperMain

_NtRaiseException:
    push 0xC149205A
    call _WhisperMain

_NtRaiseHardError:
    push 0x07982B3B
    call _WhisperMain

_NtReadOnlyEnlistment:
    push 0x0FA90E3B
    call _WhisperMain

_NtRecoverEnlistment:
    push 0x9B359EA3
    call _WhisperMain

_NtRecoverResourceManager:
    push 0x6833B099
    call _WhisperMain

_NtRecoverTransactionManager:
    push 0x3FA81530
    call _WhisperMain

_NtRegisterProtocolAddressInformation:
    push 0x180F7E1F
    call _WhisperMain

_NtRegisterThreadTerminatePort:
    push 0x20B2C6E0
    call _WhisperMain

_NtReleaseKeyedEvent:
    push 0xCE4EDBCC
    call _WhisperMain

_NtReleaseWorkerFactoryWorker:
    push 0xF86DD6B5
    call _WhisperMain

_NtRemoveIoCompletionEx:
    push 0x8416B2A8
    call _WhisperMain

_NtRemoveProcessDebug:
    push 0xAA3A6912
    call _WhisperMain

_NtRenameKey:
    push 0x3AF26529
    call _WhisperMain

_NtRenameTransactionManager:
    push 0xC79EDC37
    call _WhisperMain

_NtReplaceKey:
    push 0x8AD7A178
    call _WhisperMain

_NtReplacePartitionUnit:
    push 0x26332AA8
    call _WhisperMain

_NtReplyWaitReplyPort:
    push 0xA0358FAE
    call _WhisperMain

_NtRequestPort:
    push 0xE97EF6F5
    call _WhisperMain

_NtResetEvent:
    push 0xCF127F37
    call _WhisperMain

_NtResetWriteWatch:
    push 0xC2B1C912
    call _WhisperMain

_NtRestoreKey:
    push 0x96A2F748
    call _WhisperMain

_NtResumeProcess:
    push 0x722C69A1
    call _WhisperMain

_NtRevertContainerImpersonation:
    push 0x452E49BD
    call _WhisperMain

_NtRollbackComplete:
    push 0x273ABE04
    call _WhisperMain

_NtRollbackEnlistment:
    push 0x7E421BDA
    call _WhisperMain

_NtRollbackRegistryTransaction:
    push 0x0CFE1673
    call _WhisperMain

_NtRollbackTransaction:
    push 0x920A969B
    call _WhisperMain

_NtRollforwardTransactionManager:
    push 0x160644C7
    call _WhisperMain

_NtSaveKey:
    push 0x1682C8D5
    call _WhisperMain

_NtSaveKeyEx:
    push 0xC457E3E8
    call _WhisperMain

_NtSaveMergedKeys:
    push 0x67FC6274
    call _WhisperMain

_NtSecureConnectPort:
    push 0x608E592C
    call _WhisperMain

_NtSerializeBoot:
    push 0x72E24C61
    call _WhisperMain

_NtSetBootEntryOrder:
    push 0x33B61D2B
    call _WhisperMain

_NtSetBootOptions:
    push 0x5387591B
    call _WhisperMain

_NtSetCachedSigningLevel:
    push 0x2ABAA598
    call _WhisperMain

_NtSetCachedSigningLevel2:
    push 0xB29040B5
    call _WhisperMain

_NtSetContextThread:
    push 0x3CBCE60A
    call _WhisperMain

_NtSetDebugFilterState:
    push 0x3290DBDE
    call _WhisperMain

_NtSetDefaultHardErrorPort:
    push 0x257724E9
    call _WhisperMain

_NtSetDefaultLocale:
    push 0x8D2C8599
    call _WhisperMain

_NtSetDefaultUILanguage:
    push 0x8B35AB6E
    call _WhisperMain

_NtSetDriverEntryOrder:
    push 0x95AEE742
    call _WhisperMain

_NtSetEaFile:
    push 0xE138E9DD
    call _WhisperMain

_NtSetHighEventPair:
    push 0x60D47A71
    call _WhisperMain

_NtSetHighWaitLowEventPair:
    push 0x90B19827
    call _WhisperMain

_NtSetIRTimer:
    push 0x8FA8F140
    call _WhisperMain

_NtSetInformationDebugObject:
    push 0x071D79EF
    call _WhisperMain

_NtSetInformationEnlistment:
    push 0x0E56E804
    call _WhisperMain

_NtSetInformationJobObject:
    push 0x73569D24
    call _WhisperMain

_NtSetInformationKey:
    push 0x020837B5
    call _WhisperMain

_NtSetInformationResourceManager:
    push 0xFD9309EA
    call _WhisperMain

_NtSetInformationSymbolicLink:
    push 0xAE3BA6AE
    call _WhisperMain

_NtSetInformationToken:
    push 0xAF9FF534
    call _WhisperMain

_NtSetInformationTransaction:
    push 0x108A361B
    call _WhisperMain

_NtSetInformationTransactionManager:
    push 0x725FEC74
    call _WhisperMain

_NtSetInformationVirtualMemory:
    push 0x19901313
    call _WhisperMain

_NtSetInformationWorkerFactory:
    push 0x0A8E1816
    call _WhisperMain

_NtSetIntervalProfile:
    push 0x3499AE98
    call _WhisperMain

_NtSetIoCompletion:
    push 0x9681921B
    call _WhisperMain

_NtSetIoCompletionEx:
    push 0x989A24BE
    call _WhisperMain

_NtSetLdtEntries:
    push 0xB91DBA86
    call _WhisperMain

_NtSetLowEventPair:
    push 0x10B7C4F1
    call _WhisperMain

_NtSetLowWaitHighEventPair:
    push 0xE4D1D40C
    call _WhisperMain

_NtSetQuotaInformationFile:
    push 0x68FEA148
    call _WhisperMain

_NtSetSecurityObject:
    push 0x1A2464D9
    call _WhisperMain

_NtSetSystemEnvironmentValue:
    push 0xC256ED92
    call _WhisperMain

_NtSetSystemEnvironmentValueEx:
    push 0x2FC4F2A1
    call _WhisperMain

_NtSetSystemInformation:
    push 0x9C069A9F
    call _WhisperMain

_NtSetSystemPowerState:
    push 0x1F3D8800
    call _WhisperMain

_NtSetSystemTime:
    push 0x94B3C98B
    call _WhisperMain

_NtSetThreadExecutionState:
    push 0x00BA2834
    call _WhisperMain

_NtSetTimer2:
    push 0x11A97007
    call _WhisperMain

_NtSetTimerEx:
    push 0x30B7726C
    call _WhisperMain

_NtSetTimerResolution:
    push 0xD649F6D7
    call _WhisperMain

_NtSetUuidSeed:
    push 0x158DD430
    call _WhisperMain

_NtSetVolumeInformationFile:
    push 0xD8CB47F8
    call _WhisperMain

_NtSetWnfProcessNotificationEvent:
    push 0x3E941334
    call _WhisperMain

_NtShutdownSystem:
    push 0x068CFEC7
    call _WhisperMain

_NtShutdownWorkerFactory:
    push 0x0898362C
    call _WhisperMain

_NtSignalAndWaitForSingleObject:
    push 0x00BE0E03
    call _WhisperMain

_NtSinglePhaseReject:
    push 0x1AA13E39
    call _WhisperMain

_NtStartProfile:
    push 0x289C722C
    call _WhisperMain

_NtStopProfile:
    push 0xC88938DF
    call _WhisperMain

_NtSubscribeWnfStateChange:
    push 0x22A16304
    call _WhisperMain

_NtSuspendProcess:
    push 0x519C7000
    call _WhisperMain

_NtSuspendThread:
    push 0x3A1F24BD
    call _WhisperMain

_NtSystemDebugControl:
    push 0xC09EC476
    call _WhisperMain

_NtTerminateEnclave:
    push 0xEE33C6FE
    call _WhisperMain

_NtTerminateJobObject:
    push 0xBAB8B224
    call _WhisperMain

_NtTestAlert:
    push 0x4ED13358
    call _WhisperMain

_NtThawRegistry:
    push 0x06EF4E21
    call _WhisperMain

_NtThawTransactions:
    push 0x0796193D
    call _WhisperMain

_NtTraceControl:
    push 0xDF8A2BDD
    call _WhisperMain

_NtTranslateFilePath:
    push 0xFA3081FC
    call _WhisperMain

_NtUmsThreadYield:
    push 0xF85A28EE
    call _WhisperMain

_NtUnloadDriver:
    push 0xD69F05C1
    call _WhisperMain

_NtUnloadKey:
    push 0xEA3E8DCD
    call _WhisperMain

_NtUnloadKey2:
    push 0x27D4615C
    call _WhisperMain

_NtUnloadKeyEx:
    push 0x67F32B36
    call _WhisperMain

_NtUnlockFile:
    push 0x903DC0F6
    call _WhisperMain

_NtUnlockVirtualMemory:
    push 0x98118E80
    call _WhisperMain

_NtUnmapViewOfSectionEx:
    push 0xF29131EB
    call _WhisperMain

_NtUnsubscribeWnfStateChange:
    push 0x50CE5756
    call _WhisperMain

_NtUpdateWnfStateData:
    push 0xDEDCEA46
    call _WhisperMain

_NtVdmControl:
    push 0xBD9039A7
    call _WhisperMain

_NtWaitForAlertByThreadId:
    push 0x143F7CCA
    call _WhisperMain

_NtWaitForDebugEvent:
    push 0x90B06FDA
    call _WhisperMain

_NtWaitForKeyedEvent:
    push 0xD08A3618
    call _WhisperMain

_NtWaitForWorkViaWorkerFactory:
    push 0xC89DE634
    call _WhisperMain

_NtWaitHighEventPair:
    push 0xA31DBFB0
    call _WhisperMain

_NtWaitLowEventPair:
    push 0x50B3B4E5
    call _WhisperMain

_NtAcquireCMFViewOwnership:
    push 0xFA6D1A7A
    call _WhisperMain

_NtCancelDeviceWakeupRequest:
    push 0x33EDFBB0
    call _WhisperMain

_NtClearAllSavepointsTransaction:
    push 0x0294280D
    call _WhisperMain

_NtClearSavepointTransaction:
    push 0x1288301D
    call _WhisperMain

_NtRollbackSavepointTransaction:
    push 0xCB28EFBA
    call _WhisperMain

_NtSavepointTransaction:
    push 0x009A27CB
    call _WhisperMain

_NtSavepointComplete:
    push 0x2AB2163C
    call _WhisperMain

_NtCreateSectionEx:
    push 0xF8993BC3
    call _WhisperMain

_NtCreateCrossVmEvent:
    push 0x92CDBB10
    call _WhisperMain

_NtGetPlugPlayEvent:
    push 0x08858F96
    call _WhisperMain

_NtListTransactions:
    push 0x0D982B33
    call _WhisperMain

_NtMarshallTransaction:
    push 0x2A6FF427
    call _WhisperMain

_NtPullTransaction:
    push 0x898FA91D
    call _WhisperMain

_NtReleaseCMFViewOwnership:
    push 0x0D95254D
    call _WhisperMain

_NtWaitForWnfNotifications:
    push 0x0D97290D
    call _WhisperMain

_NtStartTm:
    push 0x21F27B5C
    call _WhisperMain

_NtSetInformationProcess:
    push 0x922881A5
    call _WhisperMain

_NtRequestDeviceWakeup:
    push 0x03AF3904
    call _WhisperMain

_NtRequestWakeupLatency:
    push 0x3285536C
    call _WhisperMain

_NtQuerySystemTime:
    push 0x7EB95963
    call _WhisperMain

_NtManageHotPatch:
    push 0x1321D914
    call _WhisperMain

_NtContinueEx:
    push 0xF7CEB332
    call _WhisperMain

