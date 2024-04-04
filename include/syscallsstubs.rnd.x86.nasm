[SECTION .data align=4]
stubReturn:     dd  0
returnAddress:  dd  0
espBookmark:    dd  0
syscallNumber:  dd  0
syscallAddress: dd  0

[SECTION .text]

BITS 32
DEFAULT REL

global _NtAccessCheck
global _NtWorkerFactoryWorkerReady
global _NtAcceptConnectPort
global _NtMapUserPhysicalPagesScatter
global _NtWaitForSingleObject
global _NtCallbackReturn
global _NtReadFile
global _NtDeviceIoControlFile
global _NtWriteFile
global _NtRemoveIoCompletion
global _NtReleaseSemaphore
global _NtReplyWaitReceivePort
global _NtReplyPort
global _NtSetInformationThread
global _NtSetEvent
global _NtClose
global _NtQueryObject
global _NtQueryInformationFile
global _NtOpenKey
global _NtEnumerateValueKey
global _NtFindAtom
global _NtQueryDefaultLocale
global _NtQueryKey
global _NtQueryValueKey
global _NtAllocateVirtualMemory
global _NtQueryInformationProcess
global _NtWaitForMultipleObjects32
global _NtWriteFileGather
global _NtCreateKey
global _NtFreeVirtualMemory
global _NtImpersonateClientOfPort
global _NtReleaseMutant
global _NtQueryInformationToken
global _NtRequestWaitReplyPort
global _NtQueryVirtualMemory
global _NtOpenThreadToken
global _NtQueryInformationThread
global _NtOpenProcess
global _NtSetInformationFile
global _NtMapViewOfSection
global _NtAccessCheckAndAuditAlarm
global _NtUnmapViewOfSection
global _NtReplyWaitReceivePortEx
global _NtTerminateProcess
global _NtSetEventBoostPriority
global _NtReadFileScatter
global _NtOpenThreadTokenEx
global _NtOpenProcessTokenEx
global _NtQueryPerformanceCounter
global _NtEnumerateKey
global _NtOpenFile
global _NtDelayExecution
global _NtQueryDirectoryFile
global _NtQuerySystemInformation
global _NtOpenSection
global _NtQueryTimer
global _NtFsControlFile
global _NtWriteVirtualMemory
global _NtCloseObjectAuditAlarm
global _NtDuplicateObject
global _NtQueryAttributesFile
global _NtClearEvent
global _NtReadVirtualMemory
global _NtOpenEvent
global _NtAdjustPrivilegesToken
global _NtDuplicateToken
global _NtContinue
global _NtQueryDefaultUILanguage
global _NtQueueApcThread
global _NtYieldExecution
global _NtAddAtom
global _NtCreateEvent
global _NtQueryVolumeInformationFile
global _NtCreateSection
global _NtFlushBuffersFile
global _NtApphelpCacheControl
global _NtCreateProcessEx
global _NtCreateThread
global _NtIsProcessInJob
global _NtProtectVirtualMemory
global _NtQuerySection
global _NtResumeThread
global _NtTerminateThread
global _NtReadRequestData
global _NtCreateFile
global _NtQueryEvent
global _NtWriteRequestData
global _NtOpenDirectoryObject
global _NtAccessCheckByTypeAndAuditAlarm
global _NtWaitForMultipleObjects
global _NtSetInformationObject
global _NtCancelIoFile
global _NtTraceEvent
global _NtPowerInformation
global _NtSetValueKey
global _NtCancelTimer
global _NtSetTimer
global _NtAccessCheckByType
global _NtAccessCheckByTypeResultList
global _NtAccessCheckByTypeResultListAndAuditAlarm
global _NtAccessCheckByTypeResultListAndAuditAlarmByHandle
global _NtAcquireProcessActivityReference
global _NtAddAtomEx
global _NtAddBootEntry
global _NtAddDriverEntry
global _NtAdjustGroupsToken
global _NtAdjustTokenClaimsAndDeviceGroups
global _NtAlertResumeThread
global _NtAlertThread
global _NtAlertThreadByThreadId
global _NtAllocateLocallyUniqueId
global _NtAllocateReserveObject
global _NtAllocateUserPhysicalPages
global _NtAllocateUuids
global _NtAllocateVirtualMemoryEx
global _NtAlpcAcceptConnectPort
global _NtAlpcCancelMessage
global _NtAlpcConnectPort
global _NtAlpcConnectPortEx
global _NtAlpcCreatePort
global _NtAlpcCreatePortSection
global _NtAlpcCreateResourceReserve
global _NtAlpcCreateSectionView
global _NtAlpcCreateSecurityContext
global _NtAlpcDeletePortSection
global _NtAlpcDeleteResourceReserve
global _NtAlpcDeleteSectionView
global _NtAlpcDeleteSecurityContext
global _NtAlpcDisconnectPort
global _NtAlpcImpersonateClientContainerOfPort
global _NtAlpcImpersonateClientOfPort
global _NtAlpcOpenSenderProcess
global _NtAlpcOpenSenderThread
global _NtAlpcQueryInformation
global _NtAlpcQueryInformationMessage
global _NtAlpcRevokeSecurityContext
global _NtAlpcSendWaitReceivePort
global _NtAlpcSetInformation
global _NtAreMappedFilesTheSame
global _NtAssignProcessToJobObject
global _NtAssociateWaitCompletionPacket
global _NtCallEnclave
global _NtCancelIoFileEx
global _NtCancelSynchronousIoFile
global _NtCancelTimer2
global _NtCancelWaitCompletionPacket
global _NtCommitComplete
global _NtCommitEnlistment
global _NtCommitRegistryTransaction
global _NtCommitTransaction
global _NtCompactKeys
global _NtCompareObjects
global _NtCompareSigningLevels
global _NtCompareTokens
global _NtCompleteConnectPort
global _NtCompressKey
global _NtConnectPort
global _NtConvertBetweenAuxiliaryCounterAndPerformanceCounter
global _NtCreateDebugObject
global _NtCreateDirectoryObject
global _NtCreateDirectoryObjectEx
global _NtCreateEnclave
global _NtCreateEnlistment
global _NtCreateEventPair
global _NtCreateIRTimer
global _NtCreateIoCompletion
global _NtCreateJobObject
global _NtCreateJobSet
global _NtCreateKeyTransacted
global _NtCreateKeyedEvent
global _NtCreateLowBoxToken
global _NtCreateMailslotFile
global _NtCreateMutant
global _NtCreateNamedPipeFile
global _NtCreatePagingFile
global _NtCreatePartition
global _NtCreatePort
global _NtCreatePrivateNamespace
global _NtCreateProcess
global _NtCreateProfile
global _NtCreateProfileEx
global _NtCreateRegistryTransaction
global _NtCreateResourceManager
global _NtCreateSemaphore
global _NtCreateSymbolicLinkObject
global _NtCreateThreadEx
global _NtCreateTimer
global _NtCreateTimer2
global _NtCreateToken
global _NtCreateTokenEx
global _NtCreateTransaction
global _NtCreateTransactionManager
global _NtCreateUserProcess
global _NtCreateWaitCompletionPacket
global _NtCreateWaitablePort
global _NtCreateWnfStateName
global _NtCreateWorkerFactory
global _NtDebugActiveProcess
global _NtDebugContinue
global _NtDeleteAtom
global _NtDeleteBootEntry
global _NtDeleteDriverEntry
global _NtDeleteFile
global _NtDeleteKey
global _NtDeleteObjectAuditAlarm
global _NtDeletePrivateNamespace
global _NtDeleteValueKey
global _NtDeleteWnfStateData
global _NtDeleteWnfStateName
global _NtDisableLastKnownGood
global _NtDisplayString
global _NtDrawText
global _NtEnableLastKnownGood
global _NtEnumerateBootEntries
global _NtEnumerateDriverEntries
global _NtEnumerateSystemEnvironmentValuesEx
global _NtEnumerateTransactionObject
global _NtExtendSection
global _NtFilterBootOption
global _NtFilterToken
global _NtFilterTokenEx
global _NtFlushBuffersFileEx
global _NtFlushInstallUILanguage
global _NtFlushInstructionCache
global _NtFlushKey
global _NtFlushProcessWriteBuffers
global _NtFlushVirtualMemory
global _NtFlushWriteBuffer
global _NtFreeUserPhysicalPages
global _NtFreezeRegistry
global _NtFreezeTransactions
global _NtGetCachedSigningLevel
global _NtGetCompleteWnfStateSubscription
global _NtGetContextThread
global _NtGetCurrentProcessorNumber
global _NtGetCurrentProcessorNumberEx
global _NtGetDevicePowerState
global _NtGetMUIRegistryInfo
global _NtGetNextProcess
global _NtGetNextThread
global _NtGetNlsSectionPtr
global _NtGetNotificationResourceManager
global _NtGetWriteWatch
global _NtImpersonateAnonymousToken
global _NtImpersonateThread
global _NtInitializeEnclave
global _NtInitializeNlsFiles
global _NtInitializeRegistry
global _NtInitiatePowerAction
global _NtIsSystemResumeAutomatic
global _NtIsUILanguageComitted
global _NtListenPort
global _NtLoadDriver
global _NtLoadEnclaveData
global _NtLoadHotPatch
global _NtLoadKey
global _NtLoadKey2
global _NtLoadKeyEx
global _NtLockFile
global _NtLockProductActivationKeys
global _NtLockRegistryKey
global _NtLockVirtualMemory
global _NtMakePermanentObject
global _NtMakeTemporaryObject
global _NtManagePartition
global _NtMapCMFModule
global _NtMapUserPhysicalPages
global _NtMapViewOfSectionEx
global _NtModifyBootEntry
global _NtModifyDriverEntry
global _NtNotifyChangeDirectoryFile
global _NtNotifyChangeDirectoryFileEx
global _NtNotifyChangeKey
global _NtNotifyChangeMultipleKeys
global _NtNotifyChangeSession
global _NtOpenEnlistment
global _NtOpenEventPair
global _NtOpenIoCompletion
global _NtOpenJobObject
global _NtOpenKeyEx
global _NtOpenKeyTransacted
global _NtOpenKeyTransactedEx
global _NtOpenKeyedEvent
global _NtOpenMutant
global _NtOpenObjectAuditAlarm
global _NtOpenPartition
global _NtOpenPrivateNamespace
global _NtOpenProcessToken
global _NtOpenRegistryTransaction
global _NtOpenResourceManager
global _NtOpenSemaphore
global _NtOpenSession
global _NtOpenSymbolicLinkObject
global _NtOpenThread
global _NtOpenTimer
global _NtOpenTransaction
global _NtOpenTransactionManager
global _NtPlugPlayControl
global _NtPrePrepareComplete
global _NtPrePrepareEnlistment
global _NtPrepareComplete
global _NtPrepareEnlistment
global _NtPrivilegeCheck
global _NtPrivilegeObjectAuditAlarm
global _NtPrivilegedServiceAuditAlarm
global _NtPropagationComplete
global _NtPropagationFailed
global _NtPulseEvent
global _NtQueryAuxiliaryCounterFrequency
global _NtQueryBootEntryOrder
global _NtQueryBootOptions
global _NtQueryDebugFilterState
global _NtQueryDirectoryFileEx
global _NtQueryDirectoryObject
global _NtQueryDriverEntryOrder
global _NtQueryEaFile
global _NtQueryFullAttributesFile
global _NtQueryInformationAtom
global _NtQueryInformationByName
global _NtQueryInformationEnlistment
global _NtQueryInformationJobObject
global _NtQueryInformationPort
global _NtQueryInformationResourceManager
global _NtQueryInformationTransaction
global _NtQueryInformationTransactionManager
global _NtQueryInformationWorkerFactory
global _NtQueryInstallUILanguage
global _NtQueryIntervalProfile
global _NtQueryIoCompletion
global _NtQueryLicenseValue
global _NtQueryMultipleValueKey
global _NtQueryMutant
global _NtQueryOpenSubKeys
global _NtQueryOpenSubKeysEx
global _NtQueryPortInformationProcess
global _NtQueryQuotaInformationFile
global _NtQuerySecurityAttributesToken
global _NtQuerySecurityObject
global _NtQuerySecurityPolicy
global _NtQuerySemaphore
global _NtQuerySymbolicLinkObject
global _NtQuerySystemEnvironmentValue
global _NtQuerySystemEnvironmentValueEx
global _NtQuerySystemInformationEx
global _NtQueryTimerResolution
global _NtQueryWnfStateData
global _NtQueryWnfStateNameInformation
global _NtQueueApcThreadEx
global _NtRaiseException
global _NtRaiseHardError
global _NtReadOnlyEnlistment
global _NtRecoverEnlistment
global _NtRecoverResourceManager
global _NtRecoverTransactionManager
global _NtRegisterProtocolAddressInformation
global _NtRegisterThreadTerminatePort
global _NtReleaseKeyedEvent
global _NtReleaseWorkerFactoryWorker
global _NtRemoveIoCompletionEx
global _NtRemoveProcessDebug
global _NtRenameKey
global _NtRenameTransactionManager
global _NtReplaceKey
global _NtReplacePartitionUnit
global _NtReplyWaitReplyPort
global _NtRequestPort
global _NtResetEvent
global _NtResetWriteWatch
global _NtRestoreKey
global _NtResumeProcess
global _NtRevertContainerImpersonation
global _NtRollbackComplete
global _NtRollbackEnlistment
global _NtRollbackRegistryTransaction
global _NtRollbackTransaction
global _NtRollforwardTransactionManager
global _NtSaveKey
global _NtSaveKeyEx
global _NtSaveMergedKeys
global _NtSecureConnectPort
global _NtSerializeBoot
global _NtSetBootEntryOrder
global _NtSetBootOptions
global _NtSetCachedSigningLevel
global _NtSetCachedSigningLevel2
global _NtSetContextThread
global _NtSetDebugFilterState
global _NtSetDefaultHardErrorPort
global _NtSetDefaultLocale
global _NtSetDefaultUILanguage
global _NtSetDriverEntryOrder
global _NtSetEaFile
global _NtSetHighEventPair
global _NtSetHighWaitLowEventPair
global _NtSetIRTimer
global _NtSetInformationDebugObject
global _NtSetInformationEnlistment
global _NtSetInformationJobObject
global _NtSetInformationKey
global _NtSetInformationResourceManager
global _NtSetInformationSymbolicLink
global _NtSetInformationToken
global _NtSetInformationTransaction
global _NtSetInformationTransactionManager
global _NtSetInformationVirtualMemory
global _NtSetInformationWorkerFactory
global _NtSetIntervalProfile
global _NtSetIoCompletion
global _NtSetIoCompletionEx
global _NtSetLdtEntries
global _NtSetLowEventPair
global _NtSetLowWaitHighEventPair
global _NtSetQuotaInformationFile
global _NtSetSecurityObject
global _NtSetSystemEnvironmentValue
global _NtSetSystemEnvironmentValueEx
global _NtSetSystemInformation
global _NtSetSystemPowerState
global _NtSetSystemTime
global _NtSetThreadExecutionState
global _NtSetTimer2
global _NtSetTimerEx
global _NtSetTimerResolution
global _NtSetUuidSeed
global _NtSetVolumeInformationFile
global _NtSetWnfProcessNotificationEvent
global _NtShutdownSystem
global _NtShutdownWorkerFactory
global _NtSignalAndWaitForSingleObject
global _NtSinglePhaseReject
global _NtStartProfile
global _NtStopProfile
global _NtSubscribeWnfStateChange
global _NtSuspendProcess
global _NtSuspendThread
global _NtSystemDebugControl
global _NtTerminateEnclave
global _NtTerminateJobObject
global _NtTestAlert
global _NtThawRegistry
global _NtThawTransactions
global _NtTraceControl
global _NtTranslateFilePath
global _NtUmsThreadYield
global _NtUnloadDriver
global _NtUnloadKey
global _NtUnloadKey2
global _NtUnloadKeyEx
global _NtUnlockFile
global _NtUnlockVirtualMemory
global _NtUnmapViewOfSectionEx
global _NtUnsubscribeWnfStateChange
global _NtUpdateWnfStateData
global _NtVdmControl
global _NtWaitForAlertByThreadId
global _NtWaitForDebugEvent
global _NtWaitForKeyedEvent
global _NtWaitForWorkViaWorkerFactory
global _NtWaitHighEventPair
global _NtWaitLowEventPair
global _NtAcquireCMFViewOwnership
global _NtCancelDeviceWakeupRequest
global _NtClearAllSavepointsTransaction
global _NtClearSavepointTransaction
global _NtRollbackSavepointTransaction
global _NtSavepointTransaction
global _NtSavepointComplete
global _NtCreateSectionEx
global _NtCreateCrossVmEvent
global _NtGetPlugPlayEvent
global _NtListTransactions
global _NtMarshallTransaction
global _NtPullTransaction
global _NtReleaseCMFViewOwnership
global _NtWaitForWnfNotifications
global _NtStartTm
global _NtSetInformationProcess
global _NtRequestDeviceWakeup
global _NtRequestWakeupLatency
global _NtQuerySystemTime
global _NtManageHotPatch
global _NtContinueEx

global _WhisperMain
extern _SW2_GetSyscallNumber
extern _SW2_GetRandomSyscallAddress

_WhisperMain:
    pop eax                                  
    mov dword [stubReturn], eax             ; Save the return address to the stub
    push esp
    pop eax
    add eax, 4h
    push dword [eax]
    pop dword [returnAddress]               ; Save original return address
    add eax, 4h
    push eax
    pop dword [espBookmark]                 ; Save original ESP
    call _SW2_GetSyscallNumber              ; Resolve function hash into syscall number
    add esp, 4h                             ; Restore ESP
    mov dword [syscallNumber], eax          ; Save the syscall number
    xor eax, eax
    mov ecx, dword [fs:0c0h]
    test ecx, ecx
    je _x86
    inc eax                                 ; Inc EAX to 1 for Wow64
_x86:
    push eax                                ; Push 0 for x86, 1 for Wow64
    lea edx, dword [esp+4h]
    call _SW2_GetRandomSyscallAddress       ; Get a random 0x02E address
    mov dword [syscallAddress], eax         ; Save the address
    mov esp, dword [espBookmark]            ; Restore ESP
    mov eax, dword [syscallNumber]          ; Restore the syscall number
    call dword [syscallAddress]             ; Call the random syscall location
    mov esp, dword [espBookmark]            ; Restore ESP
    push dword [returnAddress]              ; Restore the return address
    ret
    
_NtAccessCheck:
    push 000D84B05h
    call _WhisperMain

_NtWorkerFactoryWorkerReady:
    push 09FA1B93Ch
    call _WhisperMain

_NtAcceptConnectPort:
    push 024B2213Ch
    call _WhisperMain

_NtMapUserPhysicalPagesScatter:
    push 027822D1Fh
    call _WhisperMain

_NtWaitForSingleObject:
    push 0A698B634h
    call _WhisperMain

_NtCallbackReturn:
    push 046DA6906h
    call _WhisperMain

_NtReadFile:
    push 02D78E329h
    call _WhisperMain

_NtDeviceIoControlFile:
    push 05CBC501Eh
    call _WhisperMain

_NtWriteFile:
    push 0C159CE3Bh
    call _WhisperMain

_NtRemoveIoCompletion:
    push 00689869Fh
    call _WhisperMain

_NtReleaseSemaphore:
    push 04C1E34C0h
    call _WhisperMain

_NtReplyWaitReceivePort:
    push 061729E19h
    call _WhisperMain

_NtReplyPort:
    push 0A133CB2Dh
    call _WhisperMain

_NtSetInformationThread:
    push 0882FC281h
    call _WhisperMain

_NtSetEvent:
    push 0DD40C0C9h
    call _WhisperMain

_NtClose:
    push 0489CDDA5h
    call _WhisperMain

_NtQueryObject:
    push 0FA54F6FBh
    call _WhisperMain

_NtQueryInformationFile:
    push 0F9781779h
    call _WhisperMain

_NtOpenKey:
    push 00466E83Ch
    call _WhisperMain

_NtEnumerateValueKey:
    push 02A5F37CAh
    call _WhisperMain

_NtFindAtom:
    push 0B5238AA1h
    call _WhisperMain

_NtQueryDefaultLocale:
    push 0A3237C62h
    call _WhisperMain

_NtQueryKey:
    push 092A6AF1Ch
    call _WhisperMain

_NtQueryValueKey:
    push 0B9099CAAh
    call _WhisperMain

_NtAllocateVirtualMemory:
    push 09790911Fh
    call _WhisperMain

_NtQueryInformationProcess:
    push 0612F4AB0h
    call _WhisperMain

_NtWaitForMultipleObjects32:
    push 016CA3625h
    call _WhisperMain

_NtWriteFileGather:
    push 03A24D23Eh
    call _WhisperMain

_NtCreateKey:
    push 07E814F3Bh
    call _WhisperMain

_NtFreeVirtualMemory:
    push 0C596A942h
    call _WhisperMain

_NtImpersonateClientOfPort:
    push 0783265BCh
    call _WhisperMain

_NtReleaseMutant:
    push 03BBC3426h
    call _WhisperMain

_NtQueryInformationToken:
    push 0A17ECBFAh
    call _WhisperMain

_NtRequestWaitReplyPort:
    push 02DB14823h
    call _WhisperMain

_NtQueryVirtualMemory:
    push 039D0395Fh
    call _WhisperMain

_NtOpenThreadToken:
    push 01D840F08h
    call _WhisperMain

_NtQueryInformationThread:
    push 02E8A3C3Bh
    call _WhisperMain

_NtOpenProcess:
    push 0BE20A5ACh
    call _WhisperMain

_NtSetInformationFile:
    push 0B63F582Ch
    call _WhisperMain

_NtMapViewOfSection:
    push 046EA2639h
    call _WhisperMain

_NtAccessCheckAndAuditAlarm:
    push 018BE1A52h
    call _WhisperMain

_NtUnmapViewOfSection:
    push 00A9E080Fh
    call _WhisperMain

_NtReplyWaitReceivePortEx:
    push 0696B3BB1h
    call _WhisperMain

_NtTerminateProcess:
    push 021A32630h
    call _WhisperMain

_NtSetEventBoostPriority:
    push 00C961A1Eh
    call _WhisperMain

_NtReadFileScatter:
    push 039921B2Fh
    call _WhisperMain

_NtOpenThreadTokenEx:
    push 0148CA0B0h
    call _WhisperMain

_NtOpenProcessTokenEx:
    push 0C6C3807Dh
    call _WhisperMain

_NtQueryPerformanceCounter:
    push 073D595C1h
    call _WhisperMain

_NtEnumerateKey:
    push 01B1F4ECDh
    call _WhisperMain

_NtOpenFile:
    push 0F4A573B9h
    call _WhisperMain

_NtDelayExecution:
    push 00A800811h
    call _WhisperMain

_NtQueryDirectoryFile:
    push 028BEF888h
    call _WhisperMain

_NtQuerySystemInformation:
    push 0DA4BDCDFh
    call _WhisperMain

_NtOpenSection:
    push 01CC63E57h
    call _WhisperMain

_NtQueryTimer:
    push 0C3971FBAh
    call _WhisperMain

_NtFsControlFile:
    push 0A8A9920Eh
    call _WhisperMain

_NtWriteVirtualMemory:
    push 00F912503h
    call _WhisperMain

_NtCloseObjectAuditAlarm:
    push 06EB06A26h
    call _WhisperMain

_NtDuplicateObject:
    push 008B13A3Fh
    call _WhisperMain

_NtQueryAttributesFile:
    push 03AB80E66h
    call _WhisperMain

_NtClearEvent:
    push 06EF46B64h
    call _WhisperMain

_NtReadVirtualMemory:
    push 0D39D2AFEh
    call _WhisperMain

_NtOpenEvent:
    push 092B1D167h
    call _WhisperMain

_NtAdjustPrivilegesToken:
    push 01DA2F11Eh
    call _WhisperMain

_NtDuplicateToken:
    push 0DE6AC4E9h
    call _WhisperMain

_NtContinue:
    push 04ED93916h
    call _WhisperMain

_NtQueryDefaultUILanguage:
    push 09C3B8F87h
    call _WhisperMain

_NtQueueApcThread:
    push 08EA41A9Bh
    call _WhisperMain

_NtYieldExecution:
    push 02EB8042Dh
    call _WhisperMain

_NtAddAtom:
    push 04D47AE51h
    call _WhisperMain

_NtCreateEvent:
    push 0E64DF5AAh
    call _WhisperMain

_NtQueryVolumeInformationFile:
    push 0DE4FF0CCh
    call _WhisperMain

_NtCreateSection:
    push 0248D2A15h
    call _WhisperMain

_NtFlushBuffersFile:
    push 0E85B3662h
    call _WhisperMain

_NtApphelpCacheControl:
    push 0BDAD26ABh
    call _WhisperMain

_NtCreateProcessEx:
    push 00C924647h
    call _WhisperMain

_NtCreateThread:
    push 010B44209h
    call _WhisperMain

_NtIsProcessInJob:
    push 064C2A691h
    call _WhisperMain

_NtProtectVirtualMemory:
    push 04F954517h
    call _WhisperMain

_NtQuerySection:
    push 0C844E4DFh
    call _WhisperMain

_NtResumeThread:
    push 0B898BA26h
    call _WhisperMain

_NtTerminateThread:
    push 04C8E022Fh
    call _WhisperMain

_NtReadRequestData:
    push 0C3BDF0EFh
    call _WhisperMain

_NtCreateFile:
    push 056E78957h
    call _WhisperMain

_NtQueryEvent:
    push 07A4129E6h
    call _WhisperMain

_NtWriteRequestData:
    push 0E4059212h
    call _WhisperMain

_NtOpenDirectoryObject:
    push 0855FB1C0h
    call _WhisperMain

_NtAccessCheckByTypeAndAuditAlarm:
    push 0CF40EFCFh
    call _WhisperMain

_NtWaitForMultipleObjects:
    push 0D52DEDE7h
    call _WhisperMain

_NtSetInformationObject:
    push 002213A8Ch
    call _WhisperMain

_NtCancelIoFile:
    push 09AFB5DC7h
    call _WhisperMain

_NtTraceEvent:
    push 0CEF22697h
    call _WhisperMain

_NtPowerInformation:
    push 030AE11FDh
    call _WhisperMain

_NtSetValueKey:
    push 009DD2E40h
    call _WhisperMain

_NtCancelTimer:
    push 0ACA6F468h
    call _WhisperMain

_NtSetTimer:
    push 0379E1D26h
    call _WhisperMain

_NtAccessCheckByType:
    push 09CC67084h
    call _WhisperMain

_NtAccessCheckByTypeResultList:
    push 07ED37A5Bh
    call _WhisperMain

_NtAccessCheckByTypeResultListAndAuditAlarm:
    push 0D2D4D540h
    call _WhisperMain

_NtAccessCheckByTypeResultListAndAuditAlarmByHandle:
    push 0A99663A0h
    call _WhisperMain

_NtAcquireProcessActivityReference:
    push 03AE3533Eh
    call _WhisperMain

_NtAddAtomEx:
    push 0FD15DDAEh
    call _WhisperMain

_NtAddBootEntry:
    push 001903128h
    call _WhisperMain

_NtAddDriverEntry:
    push 019F76978h
    call _WhisperMain

_NtAdjustGroupsToken:
    push 025917530h
    call _WhisperMain

_NtAdjustTokenClaimsAndDeviceGroups:
    push 0FA66FCF4h
    call _WhisperMain

_NtAlertResumeThread:
    push 0309A3E33h
    call _WhisperMain

_NtAlertThread:
    push 0284312D5h
    call _WhisperMain

_NtAlertThreadByThreadId:
    push 0A4B8E61Eh
    call _WhisperMain

_NtAllocateLocallyUniqueId:
    push 0CC0FCFA8h
    call _WhisperMain

_NtAllocateReserveObject:
    push 08E23BEAFh
    call _WhisperMain

_NtAllocateUserPhysicalPages:
    push 02F9D6816h
    call _WhisperMain

_NtAllocateUuids:
    push 017A4E4DAh
    call _WhisperMain

_NtAllocateVirtualMemoryEx:
    push 0B880EA6Bh
    call _WhisperMain

_NtAlpcAcceptConnectPort:
    push 040B75B38h
    call _WhisperMain

_NtAlpcCancelMessage:
    push 017B6322Ch
    call _WhisperMain

_NtAlpcConnectPort:
    push 03269C007h
    call _WhisperMain

_NtAlpcConnectPortEx:
    push 0E06E3731h
    call _WhisperMain

_NtAlpcCreatePort:
    push 058CA7552h
    call _WhisperMain

_NtAlpcCreatePortSection:
    push 00ADA0241h
    call _WhisperMain

_NtAlpcCreateResourceReserve:
    push 010A10C1Bh
    call _WhisperMain

_NtAlpcCreateSectionView:
    push 0148C7113h
    call _WhisperMain

_NtAlpcCreateSecurityContext:
    push 008B21F3Ah
    call _WhisperMain

_NtAlpcDeletePortSection:
    push 0E157C602h
    call _WhisperMain

_NtAlpcDeleteResourceReserve:
    push 028A8D4F3h
    call _WhisperMain

_NtAlpcDeleteSectionView:
    push 086B7571Dh
    call _WhisperMain

_NtAlpcDeleteSecurityContext:
    push 0EE960206h
    call _WhisperMain

_NtAlpcDisconnectPort:
    push 0A6F2A060h
    call _WhisperMain

_NtAlpcImpersonateClientContainerOfPort:
    push 020B3C728h
    call _WhisperMain

_NtAlpcImpersonateClientOfPort:
    push 0D44DC7E2h
    call _WhisperMain

_NtAlpcOpenSenderProcess:
    push 0EFBB2DEBh
    call _WhisperMain

_NtAlpcOpenSenderThread:
    push 0A805BAABh
    call _WhisperMain

_NtAlpcQueryInformation:
    push 09D44BDCAh
    call _WhisperMain

_NtAlpcQueryInformationMessage:
    push 0C751C6EAh
    call _WhisperMain

_NtAlpcRevokeSecurityContext:
    push 0D742F2D3h
    call _WhisperMain

_NtAlpcSendWaitReceivePort:
    push 022B23B36h
    call _WhisperMain

_NtAlpcSetInformation:
    push 000E80279h
    call _WhisperMain

_NtAreMappedFilesTheSame:
    push 0F7D4DA63h
    call _WhisperMain

_NtAssignProcessToJobObject:
    push 0301C1B43h
    call _WhisperMain

_NtAssociateWaitCompletionPacket:
    push 0073C3780h
    call _WhisperMain

_NtCallEnclave:
    push 022D31278h
    call _WhisperMain

_NtCancelIoFileEx:
    push 0C73D0B79h
    call _WhisperMain

_NtCancelSynchronousIoFile:
    push 026A60A20h
    call _WhisperMain

_NtCancelTimer2:
    push 0C40A1C84h
    call _WhisperMain

_NtCancelWaitCompletionPacket:
    push 007833D0Ch
    call _WhisperMain

_NtCommitComplete:
    push 0DA2BF4A0h
    call _WhisperMain

_NtCommitEnlistment:
    push 059009E53h
    call _WhisperMain

_NtCommitRegistryTransaction:
    push 04E810C51h
    call _WhisperMain

_NtCommitTransaction:
    push 03852F60Fh
    call _WhisperMain

_NtCompactKeys:
    push 043B77820h
    call _WhisperMain

_NtCompareObjects:
    push 09226A562h
    call _WhisperMain

_NtCompareSigningLevels:
    push 070EA917Eh
    call _WhisperMain

_NtCompareTokens:
    push 079D57755h
    call _WhisperMain

_NtCompleteConnectPort:
    push 020B63D38h
    call _WhisperMain

_NtCompressKey:
    push 0ABD1AA4Eh
    call _WhisperMain

_NtConnectPort:
    push 07EA87B3Ah
    call _WhisperMain

_NtConvertBetweenAuxiliaryCounterAndPerformanceCounter:
    push 07FCC111Dh
    call _WhisperMain

_NtCreateDebugObject:
    push 070584915h
    call _WhisperMain

_NtCreateDirectoryObject:
    push 0BB91A91Fh
    call _WhisperMain

_NtCreateDirectoryObjectEx:
    push 0AC89F658h
    call _WhisperMain

_NtCreateEnclave:
    push 0EC551C48h
    call _WhisperMain

_NtCreateEnlistment:
    push 025982E1Fh
    call _WhisperMain

_NtCreateEventPair:
    push 01696320Bh
    call _WhisperMain

_NtCreateIRTimer:
    push 0CD9BFD38h
    call _WhisperMain

_NtCreateIoCompletion:
    push 0C6B02420h
    call _WhisperMain

_NtCreateJobObject:
    push 03C9D04D1h
    call _WhisperMain

_NtCreateJobSet:
    push 020AE760Dh
    call _WhisperMain

_NtCreateKeyTransacted:
    push 0121EF303h
    call _WhisperMain

_NtCreateKeyedEvent:
    push 0C1AB2FB6h
    call _WhisperMain

_NtCreateLowBoxToken:
    push 04F946DC4h
    call _WhisperMain

_NtCreateMailslotFile:
    push 0243DCA3Eh
    call _WhisperMain

_NtCreateMutant:
    push 0DDB3BE64h
    call _WhisperMain

_NtCreateNamedPipeFile:
    push 02ABD122Ah
    call _WhisperMain

_NtCreatePagingFile:
    push 05CCB5E52h
    call _WhisperMain

_NtCreatePartition:
    push 015A0694Ah
    call _WhisperMain

_NtCreatePort:
    push 002881B06h
    call _WhisperMain

_NtCreatePrivateNamespace:
    push 09DBE43FFh
    call _WhisperMain

_NtCreateProcess:
    push 029B92F28h
    call _WhisperMain

_NtCreateProfile:
    push 026BE292Ch
    call _WhisperMain

_NtCreateProfileEx:
    push 00D934B4Eh
    call _WhisperMain

_NtCreateRegistryTransaction:
    push 0CF54CBC6h
    call _WhisperMain

_NtCreateResourceManager:
    push 0183CC170h
    call _WhisperMain

_NtCreateSemaphore:
    push 0085A7AB2h
    call _WhisperMain

_NtCreateSymbolicLinkObject:
    push 0F2D8DC65h
    call _WhisperMain

_NtCreateThreadEx:
    push 044BC86C6h
    call _WhisperMain

_NtCreateTimer:
    push 00350DD10h
    call _WhisperMain

_NtCreateTimer2:
    push 01353BA0Dh
    call _WhisperMain

_NtCreateToken:
    push 0C75AF5FAh
    call _WhisperMain

_NtCreateTokenEx:
    push 03AA0F7E5h
    call _WhisperMain

_NtCreateTransaction:
    push 046CD4267h
    call _WhisperMain

_NtCreateTransactionManager:
    push 0172507A4h
    call _WhisperMain

_NtCreateUserProcess:
    push 0398A3A14h
    call _WhisperMain

_NtCreateWaitCompletionPacket:
    push 0A99DD171h
    call _WhisperMain

_NtCreateWaitablePort:
    push 0E673E1E0h
    call _WhisperMain

_NtCreateWnfStateName:
    push 0148A2D1Fh
    call _WhisperMain

_NtCreateWorkerFactory:
    push 0BEAED64Fh
    call _WhisperMain

_NtDebugActiveProcess:
    push 07E3097ACh
    call _WhisperMain

_NtDebugContinue:
    push 030244728h
    call _WhisperMain

_NtDeleteAtom:
    push 054C15756h
    call _WhisperMain

_NtDeleteBootEntry:
    push 009950306h
    call _WhisperMain

_NtDeleteDriverEntry:
    push 0CB97FF2Ah
    call _WhisperMain

_NtDeleteFile:
    push 014B25392h
    call _WhisperMain

_NtDeleteKey:
    push 069D34C78h
    call _WhisperMain

_NtDeleteObjectAuditAlarm:
    push 07AA47C30h
    call _WhisperMain

_NtDeletePrivateNamespace:
    push 06ACC6F55h
    call _WhisperMain

_NtDeleteValueKey:
    push 02A9F0905h
    call _WhisperMain

_NtDeleteWnfStateData:
    push 002C292F0h
    call _WhisperMain

_NtDeleteWnfStateName:
    push 076B8FD9Bh
    call _WhisperMain

_NtDisableLastKnownGood:
    push 07BAA4570h
    call _WhisperMain

_NtDisplayString:
    push 0FEA3D422h
    call _WhisperMain

_NtDrawText:
    push 012AB093Ch
    call _WhisperMain

_NtEnableLastKnownGood:
    push 0E47B9E7Dh
    call _WhisperMain

_NtEnumerateBootEntries:
    push 018CD1B51h
    call _WhisperMain

_NtEnumerateDriverEntries:
    push 0E8DC14B4h
    call _WhisperMain

_NtEnumerateSystemEnvironmentValuesEx:
    push 01D90CDC8h
    call _WhisperMain

_NtEnumerateTransactionObject:
    push 01935E84Bh
    call _WhisperMain

_NtExtendSection:
    push 03368ECC1h
    call _WhisperMain

_NtFilterBootOption:
    push 00CA6CEF6h
    call _WhisperMain

_NtFilterToken:
    push 06420B86Eh
    call _WhisperMain

_NtFilterTokenEx:
    push 0A64FA2F0h
    call _WhisperMain

_NtFlushBuffersFileEx:
    push 0AA399A81h
    call _WhisperMain

_NtFlushInstallUILanguage:
    push 0BB895C88h
    call _WhisperMain

_NtFlushInstructionCache:
    push 08B588FF9h
    call _WhisperMain

_NtFlushKey:
    push 01C1F79E3h
    call _WhisperMain

_NtFlushProcessWriteBuffers:
    push 000BF0C2Eh
    call _WhisperMain

_NtFlushVirtualMemory:
    push 0C9D12CBEh
    call _WhisperMain

_NtFlushWriteBuffer:
    push 0831AAD8Bh
    call _WhisperMain

_NtFreeUserPhysicalPages:
    push 081BCB61Ch
    call _WhisperMain

_NtFreezeRegistry:
    push 0008B0607h
    call _WhisperMain

_NtFreezeTransactions:
    push 04F9D3777h
    call _WhisperMain

_NtGetCachedSigningLevel:
    push 0B67AF0C0h
    call _WhisperMain

_NtGetCompleteWnfStateSubscription:
    push 03CB13C23h
    call _WhisperMain

_NtGetContextThread:
    push 0F4C8FE5Fh
    call _WhisperMain

_NtGetCurrentProcessorNumber:
    push 0D7B2C512h
    call _WhisperMain

_NtGetCurrentProcessorNumberEx:
    push 010AFC3F5h
    call _WhisperMain

_NtGetDevicePowerState:
    push 036B61836h
    call _WhisperMain

_NtGetMUIRegistryInfo:
    push 06A10444Fh
    call _WhisperMain

_NtGetNextProcess:
    push 0015FE333h
    call _WhisperMain

_NtGetNextThread:
    push 0306C32D5h
    call _WhisperMain

_NtGetNlsSectionPtr:
    push 03E16219Fh
    call _WhisperMain

_NtGetNotificationResourceManager:
    push 00F9F6B42h
    call _WhisperMain

_NtGetWriteWatch:
    push 0AD6FD7FDh
    call _WhisperMain

_NtImpersonateAnonymousToken:
    push 03016E42Ch
    call _WhisperMain

_NtImpersonateThread:
    push 0328E1037h
    call _WhisperMain

_NtInitializeEnclave:
    push 0F0AEDA22h
    call _WhisperMain

_NtInitializeNlsFiles:
    push 01317DD54h
    call _WhisperMain

_NtInitializeRegistry:
    push 02C8C342Bh
    call _WhisperMain

_NtInitiatePowerAction:
    push 00EA16475h
    call _WhisperMain

_NtIsSystemResumeAutomatic:
    push 086887393h
    call _WhisperMain

_NtIsUILanguageComitted:
    push 063861293h
    call _WhisperMain

_NtListenPort:
    push 0A4AEA130h
    call _WhisperMain

_NtLoadDriver:
    push 05CD7764Ch
    call _WhisperMain

_NtLoadEnclaveData:
    push 0F303C9D9h
    call _WhisperMain

_NtLoadHotPatch:
    push 09EAF9630h
    call _WhisperMain

_NtLoadKey:
    push 05BE25E61h
    call _WhisperMain

_NtLoadKey2:
    push 03AB9CE3Fh
    call _WhisperMain

_NtLoadKeyEx:
    push 00584FD84h
    call _WhisperMain

_NtLockFile:
    push 0E038E8AAh
    call _WhisperMain

_NtLockProductActivationKeys:
    push 0E742ECD4h
    call _WhisperMain

_NtLockRegistryKey:
    push 06DCB5C4Ch
    call _WhisperMain

_NtLockVirtualMemory:
    push 031B4D4DBh
    call _WhisperMain

_NtMakePermanentObject:
    push 012017ADCh
    call _WhisperMain

_NtMakeTemporaryObject:
    push 006DD7E31h
    call _WhisperMain

_NtManagePartition:
    push 0868D8118h
    call _WhisperMain

_NtMapCMFModule:
    push 068265372h
    call _WhisperMain

_NtMapUserPhysicalPages:
    push 08DB5F64Eh
    call _WhisperMain

_NtMapViewOfSectionEx:
    push 060D329E2h
    call _WhisperMain

_NtModifyBootEntry:
    push 009803938h
    call _WhisperMain

_NtModifyDriverEntry:
    push 009983950h
    call _WhisperMain

_NtNotifyChangeDirectoryFile:
    push 0BC3BAC80h
    call _WhisperMain

_NtNotifyChangeDirectoryFileEx:
    push 080BBC407h
    call _WhisperMain

_NtNotifyChangeKey:
    push 0859A6385h
    call _WhisperMain

_NtNotifyChangeMultipleKeys:
    push 08794009Fh
    call _WhisperMain

_NtNotifyChangeSession:
    push 001D750F4h
    call _WhisperMain

_NtOpenEnlistment:
    push 049CB7C4Dh
    call _WhisperMain

_NtOpenEventPair:
    push 0C292C607h
    call _WhisperMain

_NtOpenIoCompletion:
    push 0148235D1h
    call _WhisperMain

_NtOpenJobObject:
    push 082A050FDh
    call _WhisperMain

_NtOpenKeyEx:
    push 0765A9025h
    call _WhisperMain

_NtOpenKeyTransacted:
    push 0DCBCEE62h
    call _WhisperMain

_NtOpenKeyTransactedEx:
    push 026DFE061h
    call _WhisperMain

_NtOpenKeyedEvent:
    push 0C88A2AFDh
    call _WhisperMain

_NtOpenMutant:
    push 072E27B7Eh
    call _WhisperMain

_NtOpenObjectAuditAlarm:
    push 00A85261Ah
    call _WhisperMain

_NtOpenPartition:
    push 0B4AA53BAh
    call _WhisperMain

_NtOpenPrivateNamespace:
    push 01EAE213Ch
    call _WhisperMain

_NtOpenProcessToken:
    push 0E5219BE2h
    call _WhisperMain

_NtOpenRegistryTransaction:
    push 01E40D914h
    call _WhisperMain

_NtOpenResourceManager:
    push 0259D313Ch
    call _WhisperMain

_NtOpenSemaphore:
    push 04E9A9322h
    call _WhisperMain

_NtOpenSession:
    push 0EBCD17AEh
    call _WhisperMain

_NtOpenSymbolicLinkObject:
    push 00FA1372Ch
    call _WhisperMain

_NtOpenThread:
    push 002315609h
    call _WhisperMain

_NtOpenTimer:
    push 06A52E243h
    call _WhisperMain

_NtOpenTransaction:
    push 0E8C19E25h
    call _WhisperMain

_NtOpenTransactionManager:
    push 03DA6D7BAh
    call _WhisperMain

_NtPlugPlayControl:
    push 04F184BF3h
    call _WhisperMain

_NtPrePrepareComplete:
    push 02ED3C45Ch
    call _WhisperMain

_NtPrePrepareEnlistment:
    push 0D9BEC63Dh
    call _WhisperMain

_NtPrepareComplete:
    push 0089003FEh
    call _WhisperMain

_NtPrepareEnlistment:
    push 0B629CDDEh
    call _WhisperMain

_NtPrivilegeCheck:
    push 00AA6F9F8h
    call _WhisperMain

_NtPrivilegeObjectAuditAlarm:
    push 010AEEAC2h
    call _WhisperMain

_NtPrivilegedServiceAuditAlarm:
    push 0905F1D46h
    call _WhisperMain

_NtPropagationComplete:
    push 01CB9FEF6h
    call _WhisperMain

_NtPropagationFailed:
    push 09E997DC7h
    call _WhisperMain

_NtPulseEvent:
    push 0F64AC7ECh
    call _WhisperMain

_NtQueryAuxiliaryCounterFrequency:
    push 03BB11617h
    call _WhisperMain

_NtQueryBootEntryOrder:
    push 087AE138Dh
    call _WhisperMain

_NtQueryBootOptions:
    push 0C5A93FC1h
    call _WhisperMain

_NtQueryDebugFilterState:
    push 0F6B518F4h
    call _WhisperMain

_NtQueryDirectoryFileEx:
    push 02C37108Ch
    call _WhisperMain

_NtQueryDirectoryObject:
    push 0163D38A6h
    call _WhisperMain

_NtQueryDriverEntryOrder:
    push 0B3869513h
    call _WhisperMain

_NtQueryEaFile:
    push 06432B598h
    call _WhisperMain

_NtQueryFullAttributesFile:
    push 01C7DC8CEh
    call _WhisperMain

_NtQueryInformationAtom:
    push 0A938CD31h
    call _WhisperMain

_NtQueryInformationByName:
    push 0F42B87FDh
    call _WhisperMain

_NtQueryInformationEnlistment:
    push 0D448F7DEh
    call _WhisperMain

_NtQueryInformationJobObject:
    push 072508F50h
    call _WhisperMain

_NtQueryInformationPort:
    push 0E579FCD7h
    call _WhisperMain

_NtQueryInformationResourceManager:
    push 0E7577177h
    call _WhisperMain

_NtQueryInformationTransaction:
    push 002172C8Fh
    call _WhisperMain

_NtQueryInformationTransactionManager:
    push 0C5992AE5h
    call _WhisperMain

_NtQueryInformationWorkerFactory:
    push 0FC95CA39h
    call _WhisperMain

_NtQueryInstallUILanguage:
    push 01342D01Ah
    call _WhisperMain

_NtQueryIntervalProfile:
    push 028A07664h
    call _WhisperMain

_NtQueryIoCompletion:
    push 09F36A3B4h
    call _WhisperMain

_NtQueryLicenseValue:
    push 0B421DA2Ah
    call _WhisperMain

_NtQueryMultipleValueKey:
    push 04195622Ch
    call _WhisperMain

_NtQueryMutant:
    push 0F453CDE6h
    call _WhisperMain

_NtQueryOpenSubKeys:
    push 08AD0A572h
    call _WhisperMain

_NtQueryOpenSubKeysEx:
    push 0AFA3F576h
    call _WhisperMain

_NtQueryPortInformationProcess:
    push 041D4444Ch
    call _WhisperMain

_NtQueryQuotaInformationFile:
    push 0BAB944BAh
    call _WhisperMain

_NtQuerySecurityAttributesToken:
    push 032153A8Fh
    call _WhisperMain

_NtQuerySecurityObject:
    push 036AB5EB7h
    call _WhisperMain

_NtQuerySecurityPolicy:
    push 03C8B013Fh
    call _WhisperMain

_NtQuerySemaphore:
    push 043560DF0h
    call _WhisperMain

_NtQuerySymbolicLinkObject:
    push 01435FC29h
    call _WhisperMain

_NtQuerySystemEnvironmentValue:
    push 0FC20F3C0h
    call _WhisperMain

_NtQuerySystemEnvironmentValueEx:
    push 0FFE0FB5Ch
    call _WhisperMain

_NtQuerySystemInformationEx:
    push 0969554AEh
    call _WhisperMain

_NtQueryTimerResolution:
    push 048D26801h
    call _WhisperMain

_NtQueryWnfStateData:
    push 062FB700Ah
    call _WhisperMain

_NtQueryWnfStateNameInformation:
    push 0DE44DED7h
    call _WhisperMain

_NtQueueApcThreadEx:
    push 02A3E6884h
    call _WhisperMain

_NtRaiseException:
    push 0C149205Ah
    call _WhisperMain

_NtRaiseHardError:
    push 007982B3Bh
    call _WhisperMain

_NtReadOnlyEnlistment:
    push 00FA90E3Bh
    call _WhisperMain

_NtRecoverEnlistment:
    push 09B359EA3h
    call _WhisperMain

_NtRecoverResourceManager:
    push 06833B099h
    call _WhisperMain

_NtRecoverTransactionManager:
    push 03FA81530h
    call _WhisperMain

_NtRegisterProtocolAddressInformation:
    push 0180F7E1Fh
    call _WhisperMain

_NtRegisterThreadTerminatePort:
    push 020B2C6E0h
    call _WhisperMain

_NtReleaseKeyedEvent:
    push 0CE4EDBCCh
    call _WhisperMain

_NtReleaseWorkerFactoryWorker:
    push 0F86DD6B5h
    call _WhisperMain

_NtRemoveIoCompletionEx:
    push 08416B2A8h
    call _WhisperMain

_NtRemoveProcessDebug:
    push 0AA3A6912h
    call _WhisperMain

_NtRenameKey:
    push 03AF26529h
    call _WhisperMain

_NtRenameTransactionManager:
    push 0C79EDC37h
    call _WhisperMain

_NtReplaceKey:
    push 08AD7A178h
    call _WhisperMain

_NtReplacePartitionUnit:
    push 026332AA8h
    call _WhisperMain

_NtReplyWaitReplyPort:
    push 0A0358FAEh
    call _WhisperMain

_NtRequestPort:
    push 0E97EF6F5h
    call _WhisperMain

_NtResetEvent:
    push 0CF127F37h
    call _WhisperMain

_NtResetWriteWatch:
    push 0C2B1C912h
    call _WhisperMain

_NtRestoreKey:
    push 096A2F748h
    call _WhisperMain

_NtResumeProcess:
    push 0722C69A1h
    call _WhisperMain

_NtRevertContainerImpersonation:
    push 0452E49BDh
    call _WhisperMain

_NtRollbackComplete:
    push 0273ABE04h
    call _WhisperMain

_NtRollbackEnlistment:
    push 07E421BDAh
    call _WhisperMain

_NtRollbackRegistryTransaction:
    push 00CFE1673h
    call _WhisperMain

_NtRollbackTransaction:
    push 0920A969Bh
    call _WhisperMain

_NtRollforwardTransactionManager:
    push 0160644C7h
    call _WhisperMain

_NtSaveKey:
    push 01682C8D5h
    call _WhisperMain

_NtSaveKeyEx:
    push 0C457E3E8h
    call _WhisperMain

_NtSaveMergedKeys:
    push 067FC6274h
    call _WhisperMain

_NtSecureConnectPort:
    push 0608E592Ch
    call _WhisperMain

_NtSerializeBoot:
    push 072E24C61h
    call _WhisperMain

_NtSetBootEntryOrder:
    push 033B61D2Bh
    call _WhisperMain

_NtSetBootOptions:
    push 05387591Bh
    call _WhisperMain

_NtSetCachedSigningLevel:
    push 02ABAA598h
    call _WhisperMain

_NtSetCachedSigningLevel2:
    push 0B29040B5h
    call _WhisperMain

_NtSetContextThread:
    push 03CBCE60Ah
    call _WhisperMain

_NtSetDebugFilterState:
    push 03290DBDEh
    call _WhisperMain

_NtSetDefaultHardErrorPort:
    push 0257724E9h
    call _WhisperMain

_NtSetDefaultLocale:
    push 08D2C8599h
    call _WhisperMain

_NtSetDefaultUILanguage:
    push 08B35AB6Eh
    call _WhisperMain

_NtSetDriverEntryOrder:
    push 095AEE742h
    call _WhisperMain

_NtSetEaFile:
    push 0E138E9DDh
    call _WhisperMain

_NtSetHighEventPair:
    push 060D47A71h
    call _WhisperMain

_NtSetHighWaitLowEventPair:
    push 090B19827h
    call _WhisperMain

_NtSetIRTimer:
    push 08FA8F140h
    call _WhisperMain

_NtSetInformationDebugObject:
    push 0071D79EFh
    call _WhisperMain

_NtSetInformationEnlistment:
    push 00E56E804h
    call _WhisperMain

_NtSetInformationJobObject:
    push 073569D24h
    call _WhisperMain

_NtSetInformationKey:
    push 0020837B5h
    call _WhisperMain

_NtSetInformationResourceManager:
    push 0FD9309EAh
    call _WhisperMain

_NtSetInformationSymbolicLink:
    push 0AE3BA6AEh
    call _WhisperMain

_NtSetInformationToken:
    push 0AF9FF534h
    call _WhisperMain

_NtSetInformationTransaction:
    push 0108A361Bh
    call _WhisperMain

_NtSetInformationTransactionManager:
    push 0725FEC74h
    call _WhisperMain

_NtSetInformationVirtualMemory:
    push 019901313h
    call _WhisperMain

_NtSetInformationWorkerFactory:
    push 00A8E1816h
    call _WhisperMain

_NtSetIntervalProfile:
    push 03499AE98h
    call _WhisperMain

_NtSetIoCompletion:
    push 09681921Bh
    call _WhisperMain

_NtSetIoCompletionEx:
    push 0989A24BEh
    call _WhisperMain

_NtSetLdtEntries:
    push 0B91DBA86h
    call _WhisperMain

_NtSetLowEventPair:
    push 010B7C4F1h
    call _WhisperMain

_NtSetLowWaitHighEventPair:
    push 0E4D1D40Ch
    call _WhisperMain

_NtSetQuotaInformationFile:
    push 068FEA148h
    call _WhisperMain

_NtSetSecurityObject:
    push 01A2464D9h
    call _WhisperMain

_NtSetSystemEnvironmentValue:
    push 0C256ED92h
    call _WhisperMain

_NtSetSystemEnvironmentValueEx:
    push 02FC4F2A1h
    call _WhisperMain

_NtSetSystemInformation:
    push 09C069A9Fh
    call _WhisperMain

_NtSetSystemPowerState:
    push 01F3D8800h
    call _WhisperMain

_NtSetSystemTime:
    push 094B3C98Bh
    call _WhisperMain

_NtSetThreadExecutionState:
    push 000BA2834h
    call _WhisperMain

_NtSetTimer2:
    push 011A97007h
    call _WhisperMain

_NtSetTimerEx:
    push 030B7726Ch
    call _WhisperMain

_NtSetTimerResolution:
    push 0D649F6D7h
    call _WhisperMain

_NtSetUuidSeed:
    push 0158DD430h
    call _WhisperMain

_NtSetVolumeInformationFile:
    push 0D8CB47F8h
    call _WhisperMain

_NtSetWnfProcessNotificationEvent:
    push 03E941334h
    call _WhisperMain

_NtShutdownSystem:
    push 0068CFEC7h
    call _WhisperMain

_NtShutdownWorkerFactory:
    push 00898362Ch
    call _WhisperMain

_NtSignalAndWaitForSingleObject:
    push 000BE0E03h
    call _WhisperMain

_NtSinglePhaseReject:
    push 01AA13E39h
    call _WhisperMain

_NtStartProfile:
    push 0289C722Ch
    call _WhisperMain

_NtStopProfile:
    push 0C88938DFh
    call _WhisperMain

_NtSubscribeWnfStateChange:
    push 022A16304h
    call _WhisperMain

_NtSuspendProcess:
    push 0519C7000h
    call _WhisperMain

_NtSuspendThread:
    push 03A1F24BDh
    call _WhisperMain

_NtSystemDebugControl:
    push 0C09EC476h
    call _WhisperMain

_NtTerminateEnclave:
    push 0EE33C6FEh
    call _WhisperMain

_NtTerminateJobObject:
    push 0BAB8B224h
    call _WhisperMain

_NtTestAlert:
    push 04ED13358h
    call _WhisperMain

_NtThawRegistry:
    push 006EF4E21h
    call _WhisperMain

_NtThawTransactions:
    push 00796193Dh
    call _WhisperMain

_NtTraceControl:
    push 0DF8A2BDDh
    call _WhisperMain

_NtTranslateFilePath:
    push 0FA3081FCh
    call _WhisperMain

_NtUmsThreadYield:
    push 0F85A28EEh
    call _WhisperMain

_NtUnloadDriver:
    push 0D69F05C1h
    call _WhisperMain

_NtUnloadKey:
    push 0EA3E8DCDh
    call _WhisperMain

_NtUnloadKey2:
    push 027D4615Ch
    call _WhisperMain

_NtUnloadKeyEx:
    push 067F32B36h
    call _WhisperMain

_NtUnlockFile:
    push 0903DC0F6h
    call _WhisperMain

_NtUnlockVirtualMemory:
    push 098118E80h
    call _WhisperMain

_NtUnmapViewOfSectionEx:
    push 0F29131EBh
    call _WhisperMain

_NtUnsubscribeWnfStateChange:
    push 050CE5756h
    call _WhisperMain

_NtUpdateWnfStateData:
    push 0DEDCEA46h
    call _WhisperMain

_NtVdmControl:
    push 0BD9039A7h
    call _WhisperMain

_NtWaitForAlertByThreadId:
    push 0143F7CCAh
    call _WhisperMain

_NtWaitForDebugEvent:
    push 090B06FDAh
    call _WhisperMain

_NtWaitForKeyedEvent:
    push 0D08A3618h
    call _WhisperMain

_NtWaitForWorkViaWorkerFactory:
    push 0C89DE634h
    call _WhisperMain

_NtWaitHighEventPair:
    push 0A31DBFB0h
    call _WhisperMain

_NtWaitLowEventPair:
    push 050B3B4E5h
    call _WhisperMain

_NtAcquireCMFViewOwnership:
    push 0FA6D1A7Ah
    call _WhisperMain

_NtCancelDeviceWakeupRequest:
    push 033EDFBB0h
    call _WhisperMain

_NtClearAllSavepointsTransaction:
    push 00294280Dh
    call _WhisperMain

_NtClearSavepointTransaction:
    push 01288301Dh
    call _WhisperMain

_NtRollbackSavepointTransaction:
    push 0CB28EFBAh
    call _WhisperMain

_NtSavepointTransaction:
    push 0009A27CBh
    call _WhisperMain

_NtSavepointComplete:
    push 02AB2163Ch
    call _WhisperMain

_NtCreateSectionEx:
    push 0F8993BC3h
    call _WhisperMain

_NtCreateCrossVmEvent:
    push 092CDBB10h
    call _WhisperMain

_NtGetPlugPlayEvent:
    push 008858F96h
    call _WhisperMain

_NtListTransactions:
    push 00D982B33h
    call _WhisperMain

_NtMarshallTransaction:
    push 02A6FF427h
    call _WhisperMain

_NtPullTransaction:
    push 0898FA91Dh
    call _WhisperMain

_NtReleaseCMFViewOwnership:
    push 00D95254Dh
    call _WhisperMain

_NtWaitForWnfNotifications:
    push 00D97290Dh
    call _WhisperMain

_NtStartTm:
    push 021F27B5Ch
    call _WhisperMain

_NtSetInformationProcess:
    push 0922881A5h
    call _WhisperMain

_NtRequestDeviceWakeup:
    push 003AF3904h
    call _WhisperMain

_NtRequestWakeupLatency:
    push 03285536Ch
    call _WhisperMain

_NtQuerySystemTime:
    push 07EB95963h
    call _WhisperMain

_NtManageHotPatch:
    push 01321D914h
    call _WhisperMain

_NtContinueEx:
    push 0F7CEB332h
    call _WhisperMain

