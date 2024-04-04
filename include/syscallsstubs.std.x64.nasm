[SECTION .data]
currentHash:    dd  0

[SECTION .text]

BITS 64
DEFAULT REL

global NtAccessCheck
global NtWorkerFactoryWorkerReady
global NtAcceptConnectPort
global NtMapUserPhysicalPagesScatter
global NtWaitForSingleObject
global NtCallbackReturn
global NtReadFile
global NtDeviceIoControlFile
global NtWriteFile
global NtRemoveIoCompletion
global NtReleaseSemaphore
global NtReplyWaitReceivePort
global NtReplyPort
global NtSetInformationThread
global NtSetEvent
global NtClose
global NtQueryObject
global NtQueryInformationFile
global NtOpenKey
global NtEnumerateValueKey
global NtFindAtom
global NtQueryDefaultLocale
global NtQueryKey
global NtQueryValueKey
global NtAllocateVirtualMemory
global NtQueryInformationProcess
global NtWaitForMultipleObjects32
global NtWriteFileGather
global NtCreateKey
global NtFreeVirtualMemory
global NtImpersonateClientOfPort
global NtReleaseMutant
global NtQueryInformationToken
global NtRequestWaitReplyPort
global NtQueryVirtualMemory
global NtOpenThreadToken
global NtQueryInformationThread
global NtOpenProcess
global NtSetInformationFile
global NtMapViewOfSection
global NtAccessCheckAndAuditAlarm
global NtUnmapViewOfSection
global NtReplyWaitReceivePortEx
global NtTerminateProcess
global NtSetEventBoostPriority
global NtReadFileScatter
global NtOpenThreadTokenEx
global NtOpenProcessTokenEx
global NtQueryPerformanceCounter
global NtEnumerateKey
global NtOpenFile
global NtDelayExecution
global NtQueryDirectoryFile
global NtQuerySystemInformation
global NtOpenSection
global NtQueryTimer
global NtFsControlFile
global NtWriteVirtualMemory
global NtCloseObjectAuditAlarm
global NtDuplicateObject
global NtQueryAttributesFile
global NtClearEvent
global NtReadVirtualMemory
global NtOpenEvent
global NtAdjustPrivilegesToken
global NtDuplicateToken
global NtContinue
global NtQueryDefaultUILanguage
global NtQueueApcThread
global NtYieldExecution
global NtAddAtom
global NtCreateEvent
global NtQueryVolumeInformationFile
global NtCreateSection
global NtFlushBuffersFile
global NtApphelpCacheControl
global NtCreateProcessEx
global NtCreateThread
global NtIsProcessInJob
global NtProtectVirtualMemory
global NtQuerySection
global NtResumeThread
global NtTerminateThread
global NtReadRequestData
global NtCreateFile
global NtQueryEvent
global NtWriteRequestData
global NtOpenDirectoryObject
global NtAccessCheckByTypeAndAuditAlarm
global NtWaitForMultipleObjects
global NtSetInformationObject
global NtCancelIoFile
global NtTraceEvent
global NtPowerInformation
global NtSetValueKey
global NtCancelTimer
global NtSetTimer
global NtAccessCheckByType
global NtAccessCheckByTypeResultList
global NtAccessCheckByTypeResultListAndAuditAlarm
global NtAccessCheckByTypeResultListAndAuditAlarmByHandle
global NtAcquireProcessActivityReference
global NtAddAtomEx
global NtAddBootEntry
global NtAddDriverEntry
global NtAdjustGroupsToken
global NtAdjustTokenClaimsAndDeviceGroups
global NtAlertResumeThread
global NtAlertThread
global NtAlertThreadByThreadId
global NtAllocateLocallyUniqueId
global NtAllocateReserveObject
global NtAllocateUserPhysicalPages
global NtAllocateUuids
global NtAllocateVirtualMemoryEx
global NtAlpcAcceptConnectPort
global NtAlpcCancelMessage
global NtAlpcConnectPort
global NtAlpcConnectPortEx
global NtAlpcCreatePort
global NtAlpcCreatePortSection
global NtAlpcCreateResourceReserve
global NtAlpcCreateSectionView
global NtAlpcCreateSecurityContext
global NtAlpcDeletePortSection
global NtAlpcDeleteResourceReserve
global NtAlpcDeleteSectionView
global NtAlpcDeleteSecurityContext
global NtAlpcDisconnectPort
global NtAlpcImpersonateClientContainerOfPort
global NtAlpcImpersonateClientOfPort
global NtAlpcOpenSenderProcess
global NtAlpcOpenSenderThread
global NtAlpcQueryInformation
global NtAlpcQueryInformationMessage
global NtAlpcRevokeSecurityContext
global NtAlpcSendWaitReceivePort
global NtAlpcSetInformation
global NtAreMappedFilesTheSame
global NtAssignProcessToJobObject
global NtAssociateWaitCompletionPacket
global NtCallEnclave
global NtCancelIoFileEx
global NtCancelSynchronousIoFile
global NtCancelTimer2
global NtCancelWaitCompletionPacket
global NtCommitComplete
global NtCommitEnlistment
global NtCommitRegistryTransaction
global NtCommitTransaction
global NtCompactKeys
global NtCompareObjects
global NtCompareSigningLevels
global NtCompareTokens
global NtCompleteConnectPort
global NtCompressKey
global NtConnectPort
global NtConvertBetweenAuxiliaryCounterAndPerformanceCounter
global NtCreateDebugObject
global NtCreateDirectoryObject
global NtCreateDirectoryObjectEx
global NtCreateEnclave
global NtCreateEnlistment
global NtCreateEventPair
global NtCreateIRTimer
global NtCreateIoCompletion
global NtCreateJobObject
global NtCreateJobSet
global NtCreateKeyTransacted
global NtCreateKeyedEvent
global NtCreateLowBoxToken
global NtCreateMailslotFile
global NtCreateMutant
global NtCreateNamedPipeFile
global NtCreatePagingFile
global NtCreatePartition
global NtCreatePort
global NtCreatePrivateNamespace
global NtCreateProcess
global NtCreateProfile
global NtCreateProfileEx
global NtCreateRegistryTransaction
global NtCreateResourceManager
global NtCreateSemaphore
global NtCreateSymbolicLinkObject
global NtCreateThreadEx
global NtCreateTimer
global NtCreateTimer2
global NtCreateToken
global NtCreateTokenEx
global NtCreateTransaction
global NtCreateTransactionManager
global NtCreateUserProcess
global NtCreateWaitCompletionPacket
global NtCreateWaitablePort
global NtCreateWnfStateName
global NtCreateWorkerFactory
global NtDebugActiveProcess
global NtDebugContinue
global NtDeleteAtom
global NtDeleteBootEntry
global NtDeleteDriverEntry
global NtDeleteFile
global NtDeleteKey
global NtDeleteObjectAuditAlarm
global NtDeletePrivateNamespace
global NtDeleteValueKey
global NtDeleteWnfStateData
global NtDeleteWnfStateName
global NtDisableLastKnownGood
global NtDisplayString
global NtDrawText
global NtEnableLastKnownGood
global NtEnumerateBootEntries
global NtEnumerateDriverEntries
global NtEnumerateSystemEnvironmentValuesEx
global NtEnumerateTransactionObject
global NtExtendSection
global NtFilterBootOption
global NtFilterToken
global NtFilterTokenEx
global NtFlushBuffersFileEx
global NtFlushInstallUILanguage
global NtFlushInstructionCache
global NtFlushKey
global NtFlushProcessWriteBuffers
global NtFlushVirtualMemory
global NtFlushWriteBuffer
global NtFreeUserPhysicalPages
global NtFreezeRegistry
global NtFreezeTransactions
global NtGetCachedSigningLevel
global NtGetCompleteWnfStateSubscription
global NtGetContextThread
global NtGetCurrentProcessorNumber
global NtGetCurrentProcessorNumberEx
global NtGetDevicePowerState
global NtGetMUIRegistryInfo
global NtGetNextProcess
global NtGetNextThread
global NtGetNlsSectionPtr
global NtGetNotificationResourceManager
global NtGetWriteWatch
global NtImpersonateAnonymousToken
global NtImpersonateThread
global NtInitializeEnclave
global NtInitializeNlsFiles
global NtInitializeRegistry
global NtInitiatePowerAction
global NtIsSystemResumeAutomatic
global NtIsUILanguageComitted
global NtListenPort
global NtLoadDriver
global NtLoadEnclaveData
global NtLoadHotPatch
global NtLoadKey
global NtLoadKey2
global NtLoadKeyEx
global NtLockFile
global NtLockProductActivationKeys
global NtLockRegistryKey
global NtLockVirtualMemory
global NtMakePermanentObject
global NtMakeTemporaryObject
global NtManagePartition
global NtMapCMFModule
global NtMapUserPhysicalPages
global NtMapViewOfSectionEx
global NtModifyBootEntry
global NtModifyDriverEntry
global NtNotifyChangeDirectoryFile
global NtNotifyChangeDirectoryFileEx
global NtNotifyChangeKey
global NtNotifyChangeMultipleKeys
global NtNotifyChangeSession
global NtOpenEnlistment
global NtOpenEventPair
global NtOpenIoCompletion
global NtOpenJobObject
global NtOpenKeyEx
global NtOpenKeyTransacted
global NtOpenKeyTransactedEx
global NtOpenKeyedEvent
global NtOpenMutant
global NtOpenObjectAuditAlarm
global NtOpenPartition
global NtOpenPrivateNamespace
global NtOpenProcessToken
global NtOpenRegistryTransaction
global NtOpenResourceManager
global NtOpenSemaphore
global NtOpenSession
global NtOpenSymbolicLinkObject
global NtOpenThread
global NtOpenTimer
global NtOpenTransaction
global NtOpenTransactionManager
global NtPlugPlayControl
global NtPrePrepareComplete
global NtPrePrepareEnlistment
global NtPrepareComplete
global NtPrepareEnlistment
global NtPrivilegeCheck
global NtPrivilegeObjectAuditAlarm
global NtPrivilegedServiceAuditAlarm
global NtPropagationComplete
global NtPropagationFailed
global NtPulseEvent
global NtQueryAuxiliaryCounterFrequency
global NtQueryBootEntryOrder
global NtQueryBootOptions
global NtQueryDebugFilterState
global NtQueryDirectoryFileEx
global NtQueryDirectoryObject
global NtQueryDriverEntryOrder
global NtQueryEaFile
global NtQueryFullAttributesFile
global NtQueryInformationAtom
global NtQueryInformationByName
global NtQueryInformationEnlistment
global NtQueryInformationJobObject
global NtQueryInformationPort
global NtQueryInformationResourceManager
global NtQueryInformationTransaction
global NtQueryInformationTransactionManager
global NtQueryInformationWorkerFactory
global NtQueryInstallUILanguage
global NtQueryIntervalProfile
global NtQueryIoCompletion
global NtQueryLicenseValue
global NtQueryMultipleValueKey
global NtQueryMutant
global NtQueryOpenSubKeys
global NtQueryOpenSubKeysEx
global NtQueryPortInformationProcess
global NtQueryQuotaInformationFile
global NtQuerySecurityAttributesToken
global NtQuerySecurityObject
global NtQuerySecurityPolicy
global NtQuerySemaphore
global NtQuerySymbolicLinkObject
global NtQuerySystemEnvironmentValue
global NtQuerySystemEnvironmentValueEx
global NtQuerySystemInformationEx
global NtQueryTimerResolution
global NtQueryWnfStateData
global NtQueryWnfStateNameInformation
global NtQueueApcThreadEx
global NtRaiseException
global NtRaiseHardError
global NtReadOnlyEnlistment
global NtRecoverEnlistment
global NtRecoverResourceManager
global NtRecoverTransactionManager
global NtRegisterProtocolAddressInformation
global NtRegisterThreadTerminatePort
global NtReleaseKeyedEvent
global NtReleaseWorkerFactoryWorker
global NtRemoveIoCompletionEx
global NtRemoveProcessDebug
global NtRenameKey
global NtRenameTransactionManager
global NtReplaceKey
global NtReplacePartitionUnit
global NtReplyWaitReplyPort
global NtRequestPort
global NtResetEvent
global NtResetWriteWatch
global NtRestoreKey
global NtResumeProcess
global NtRevertContainerImpersonation
global NtRollbackComplete
global NtRollbackEnlistment
global NtRollbackRegistryTransaction
global NtRollbackTransaction
global NtRollforwardTransactionManager
global NtSaveKey
global NtSaveKeyEx
global NtSaveMergedKeys
global NtSecureConnectPort
global NtSerializeBoot
global NtSetBootEntryOrder
global NtSetBootOptions
global NtSetCachedSigningLevel
global NtSetCachedSigningLevel2
global NtSetContextThread
global NtSetDebugFilterState
global NtSetDefaultHardErrorPort
global NtSetDefaultLocale
global NtSetDefaultUILanguage
global NtSetDriverEntryOrder
global NtSetEaFile
global NtSetHighEventPair
global NtSetHighWaitLowEventPair
global NtSetIRTimer
global NtSetInformationDebugObject
global NtSetInformationEnlistment
global NtSetInformationJobObject
global NtSetInformationKey
global NtSetInformationResourceManager
global NtSetInformationSymbolicLink
global NtSetInformationToken
global NtSetInformationTransaction
global NtSetInformationTransactionManager
global NtSetInformationVirtualMemory
global NtSetInformationWorkerFactory
global NtSetIntervalProfile
global NtSetIoCompletion
global NtSetIoCompletionEx
global NtSetLdtEntries
global NtSetLowEventPair
global NtSetLowWaitHighEventPair
global NtSetQuotaInformationFile
global NtSetSecurityObject
global NtSetSystemEnvironmentValue
global NtSetSystemEnvironmentValueEx
global NtSetSystemInformation
global NtSetSystemPowerState
global NtSetSystemTime
global NtSetThreadExecutionState
global NtSetTimer2
global NtSetTimerEx
global NtSetTimerResolution
global NtSetUuidSeed
global NtSetVolumeInformationFile
global NtSetWnfProcessNotificationEvent
global NtShutdownSystem
global NtShutdownWorkerFactory
global NtSignalAndWaitForSingleObject
global NtSinglePhaseReject
global NtStartProfile
global NtStopProfile
global NtSubscribeWnfStateChange
global NtSuspendProcess
global NtSuspendThread
global NtSystemDebugControl
global NtTerminateEnclave
global NtTerminateJobObject
global NtTestAlert
global NtThawRegistry
global NtThawTransactions
global NtTraceControl
global NtTranslateFilePath
global NtUmsThreadYield
global NtUnloadDriver
global NtUnloadKey
global NtUnloadKey2
global NtUnloadKeyEx
global NtUnlockFile
global NtUnlockVirtualMemory
global NtUnmapViewOfSectionEx
global NtUnsubscribeWnfStateChange
global NtUpdateWnfStateData
global NtVdmControl
global NtWaitForAlertByThreadId
global NtWaitForDebugEvent
global NtWaitForKeyedEvent
global NtWaitForWorkViaWorkerFactory
global NtWaitHighEventPair
global NtWaitLowEventPair
global NtAcquireCMFViewOwnership
global NtCancelDeviceWakeupRequest
global NtClearAllSavepointsTransaction
global NtClearSavepointTransaction
global NtRollbackSavepointTransaction
global NtSavepointTransaction
global NtSavepointComplete
global NtCreateSectionEx
global NtCreateCrossVmEvent
global NtGetPlugPlayEvent
global NtListTransactions
global NtMarshallTransaction
global NtPullTransaction
global NtReleaseCMFViewOwnership
global NtWaitForWnfNotifications
global NtStartTm
global NtSetInformationProcess
global NtRequestDeviceWakeup
global NtRequestWakeupLatency
global NtQuerySystemTime
global NtManageHotPatch
global NtContinueEx

global WhisperMain
extern SW2_GetSyscallNumber
    
WhisperMain:
    pop rax
    mov [rsp+ 8], rcx              ; Save registers.
    mov [rsp+16], rdx
    mov [rsp+24], r8
    mov [rsp+32], r9
    sub rsp, 28h
    mov ecx, dword [currentHash]
    call SW2_GetSyscallNumber
    add rsp, 28h
    mov rcx, [rsp+ 8]              ; Restore registers.
    mov rdx, [rsp+16]
    mov r8, [rsp+24]
    mov r9, [rsp+32]
    mov r10, rcx
    syscall                        ; Issue syscall
    ret

NtAccessCheck:
    mov dword [currentHash], 000D84B05h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWorkerFactoryWorkerReady:
    mov dword [currentHash], 09FA1B93Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAcceptConnectPort:
    mov dword [currentHash], 024B2213Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMapUserPhysicalPagesScatter:
    mov dword [currentHash], 027822D1Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForSingleObject:
    mov dword [currentHash], 0A698B634h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCallbackReturn:
    mov dword [currentHash], 046DA6906h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReadFile:
    mov dword [currentHash], 02D78E329h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeviceIoControlFile:
    mov dword [currentHash], 05CBC501Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWriteFile:
    mov dword [currentHash], 0C159CE3Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRemoveIoCompletion:
    mov dword [currentHash], 00689869Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReleaseSemaphore:
    mov dword [currentHash], 04C1E34C0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplyWaitReceivePort:
    mov dword [currentHash], 061729E19h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplyPort:
    mov dword [currentHash], 0A133CB2Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationThread:
    mov dword [currentHash], 0882FC281h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetEvent:
    mov dword [currentHash], 0DD40C0C9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtClose:
    mov dword [currentHash], 0489CDDA5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryObject:
    mov dword [currentHash], 0FA54F6FBh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationFile:
    mov dword [currentHash], 0F9781779h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenKey:
    mov dword [currentHash], 00466E83Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateValueKey:
    mov dword [currentHash], 02A5F37CAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFindAtom:
    mov dword [currentHash], 0B5238AA1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDefaultLocale:
    mov dword [currentHash], 0A3237C62h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryKey:
    mov dword [currentHash], 092A6AF1Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryValueKey:
    mov dword [currentHash], 0B9099CAAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateVirtualMemory:
    mov dword [currentHash], 09790911Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationProcess:
    mov dword [currentHash], 0612F4AB0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForMultipleObjects32:
    mov dword [currentHash], 016CA3625h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWriteFileGather:
    mov dword [currentHash], 03A24D23Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateKey:
    mov dword [currentHash], 07E814F3Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFreeVirtualMemory:
    mov dword [currentHash], 0C596A942h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtImpersonateClientOfPort:
    mov dword [currentHash], 0783265BCh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReleaseMutant:
    mov dword [currentHash], 03BBC3426h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationToken:
    mov dword [currentHash], 0A17ECBFAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRequestWaitReplyPort:
    mov dword [currentHash], 02DB14823h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryVirtualMemory:
    mov dword [currentHash], 039D0395Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenThreadToken:
    mov dword [currentHash], 01D840F08h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationThread:
    mov dword [currentHash], 02E8A3C3Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenProcess:
    mov dword [currentHash], 0BE20A5ACh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationFile:
    mov dword [currentHash], 0B63F582Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMapViewOfSection:
    mov dword [currentHash], 046EA2639h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckAndAuditAlarm:
    mov dword [currentHash], 018BE1A52h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnmapViewOfSection:
    mov dword [currentHash], 00A9E080Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplyWaitReceivePortEx:
    mov dword [currentHash], 0696B3BB1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTerminateProcess:
    mov dword [currentHash], 021A32630h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetEventBoostPriority:
    mov dword [currentHash], 00C961A1Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReadFileScatter:
    mov dword [currentHash], 039921B2Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenThreadTokenEx:
    mov dword [currentHash], 0148CA0B0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenProcessTokenEx:
    mov dword [currentHash], 0C6C3807Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryPerformanceCounter:
    mov dword [currentHash], 073D595C1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateKey:
    mov dword [currentHash], 01B1F4ECDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenFile:
    mov dword [currentHash], 0F4A573B9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDelayExecution:
    mov dword [currentHash], 00A800811h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDirectoryFile:
    mov dword [currentHash], 028BEF888h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySystemInformation:
    mov dword [currentHash], 0DA4BDCDFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenSection:
    mov dword [currentHash], 01CC63E57h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryTimer:
    mov dword [currentHash], 0C3971FBAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFsControlFile:
    mov dword [currentHash], 0A8A9920Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWriteVirtualMemory:
    mov dword [currentHash], 00F912503h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCloseObjectAuditAlarm:
    mov dword [currentHash], 06EB06A26h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDuplicateObject:
    mov dword [currentHash], 008B13A3Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryAttributesFile:
    mov dword [currentHash], 03AB80E66h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtClearEvent:
    mov dword [currentHash], 06EF46B64h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReadVirtualMemory:
    mov dword [currentHash], 0D39D2AFEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenEvent:
    mov dword [currentHash], 092B1D167h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAdjustPrivilegesToken:
    mov dword [currentHash], 01DA2F11Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDuplicateToken:
    mov dword [currentHash], 0DE6AC4E9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtContinue:
    mov dword [currentHash], 04ED93916h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDefaultUILanguage:
    mov dword [currentHash], 09C3B8F87h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueueApcThread:
    mov dword [currentHash], 08EA41A9Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtYieldExecution:
    mov dword [currentHash], 02EB8042Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAddAtom:
    mov dword [currentHash], 04D47AE51h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateEvent:
    mov dword [currentHash], 0E64DF5AAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryVolumeInformationFile:
    mov dword [currentHash], 0DE4FF0CCh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateSection:
    mov dword [currentHash], 0248D2A15h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushBuffersFile:
    mov dword [currentHash], 0E85B3662h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtApphelpCacheControl:
    mov dword [currentHash], 0BDAD26ABh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateProcessEx:
    mov dword [currentHash], 00C924647h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateThread:
    mov dword [currentHash], 010B44209h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtIsProcessInJob:
    mov dword [currentHash], 064C2A691h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtProtectVirtualMemory:
    mov dword [currentHash], 04F954517h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySection:
    mov dword [currentHash], 0C844E4DFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtResumeThread:
    mov dword [currentHash], 0B898BA26h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTerminateThread:
    mov dword [currentHash], 04C8E022Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReadRequestData:
    mov dword [currentHash], 0C3BDF0EFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateFile:
    mov dword [currentHash], 056E78957h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryEvent:
    mov dword [currentHash], 07A4129E6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWriteRequestData:
    mov dword [currentHash], 0E4059212h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenDirectoryObject:
    mov dword [currentHash], 0855FB1C0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckByTypeAndAuditAlarm:
    mov dword [currentHash], 0CF40EFCFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForMultipleObjects:
    mov dword [currentHash], 0D52DEDE7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationObject:
    mov dword [currentHash], 002213A8Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelIoFile:
    mov dword [currentHash], 09AFB5DC7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTraceEvent:
    mov dword [currentHash], 0CEF22697h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPowerInformation:
    mov dword [currentHash], 030AE11FDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetValueKey:
    mov dword [currentHash], 009DD2E40h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelTimer:
    mov dword [currentHash], 0ACA6F468h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetTimer:
    mov dword [currentHash], 0379E1D26h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckByType:
    mov dword [currentHash], 09CC67084h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckByTypeResultList:
    mov dword [currentHash], 07ED37A5Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckByTypeResultListAndAuditAlarm:
    mov dword [currentHash], 0D2D4D540h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAccessCheckByTypeResultListAndAuditAlarmByHandle:
    mov dword [currentHash], 0A99663A0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAcquireProcessActivityReference:
    mov dword [currentHash], 03AE3533Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAddAtomEx:
    mov dword [currentHash], 0FD15DDAEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAddBootEntry:
    mov dword [currentHash], 001903128h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAddDriverEntry:
    mov dword [currentHash], 019F76978h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAdjustGroupsToken:
    mov dword [currentHash], 025917530h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAdjustTokenClaimsAndDeviceGroups:
    mov dword [currentHash], 0FA66FCF4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlertResumeThread:
    mov dword [currentHash], 0309A3E33h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlertThread:
    mov dword [currentHash], 0284312D5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlertThreadByThreadId:
    mov dword [currentHash], 0A4B8E61Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateLocallyUniqueId:
    mov dword [currentHash], 0CC0FCFA8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateReserveObject:
    mov dword [currentHash], 08E23BEAFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateUserPhysicalPages:
    mov dword [currentHash], 02F9D6816h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateUuids:
    mov dword [currentHash], 017A4E4DAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAllocateVirtualMemoryEx:
    mov dword [currentHash], 0B880EA6Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcAcceptConnectPort:
    mov dword [currentHash], 040B75B38h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCancelMessage:
    mov dword [currentHash], 017B6322Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcConnectPort:
    mov dword [currentHash], 03269C007h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcConnectPortEx:
    mov dword [currentHash], 0E06E3731h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCreatePort:
    mov dword [currentHash], 058CA7552h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCreatePortSection:
    mov dword [currentHash], 00ADA0241h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCreateResourceReserve:
    mov dword [currentHash], 010A10C1Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCreateSectionView:
    mov dword [currentHash], 0148C7113h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcCreateSecurityContext:
    mov dword [currentHash], 008B21F3Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcDeletePortSection:
    mov dword [currentHash], 0E157C602h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcDeleteResourceReserve:
    mov dword [currentHash], 028A8D4F3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcDeleteSectionView:
    mov dword [currentHash], 086B7571Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcDeleteSecurityContext:
    mov dword [currentHash], 0EE960206h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcDisconnectPort:
    mov dword [currentHash], 0A6F2A060h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcImpersonateClientContainerOfPort:
    mov dword [currentHash], 020B3C728h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcImpersonateClientOfPort:
    mov dword [currentHash], 0D44DC7E2h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcOpenSenderProcess:
    mov dword [currentHash], 0EFBB2DEBh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcOpenSenderThread:
    mov dword [currentHash], 0A805BAABh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcQueryInformation:
    mov dword [currentHash], 09D44BDCAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcQueryInformationMessage:
    mov dword [currentHash], 0C751C6EAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcRevokeSecurityContext:
    mov dword [currentHash], 0D742F2D3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcSendWaitReceivePort:
    mov dword [currentHash], 022B23B36h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAlpcSetInformation:
    mov dword [currentHash], 000E80279h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAreMappedFilesTheSame:
    mov dword [currentHash], 0F7D4DA63h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAssignProcessToJobObject:
    mov dword [currentHash], 0301C1B43h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAssociateWaitCompletionPacket:
    mov dword [currentHash], 0073C3780h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCallEnclave:
    mov dword [currentHash], 022D31278h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelIoFileEx:
    mov dword [currentHash], 0C73D0B79h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelSynchronousIoFile:
    mov dword [currentHash], 026A60A20h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelTimer2:
    mov dword [currentHash], 0C40A1C84h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelWaitCompletionPacket:
    mov dword [currentHash], 007833D0Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCommitComplete:
    mov dword [currentHash], 0DA2BF4A0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCommitEnlistment:
    mov dword [currentHash], 059009E53h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCommitRegistryTransaction:
    mov dword [currentHash], 04E810C51h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCommitTransaction:
    mov dword [currentHash], 03852F60Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompactKeys:
    mov dword [currentHash], 043B77820h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompareObjects:
    mov dword [currentHash], 09226A562h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompareSigningLevels:
    mov dword [currentHash], 070EA917Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompareTokens:
    mov dword [currentHash], 079D57755h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompleteConnectPort:
    mov dword [currentHash], 020B63D38h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCompressKey:
    mov dword [currentHash], 0ABD1AA4Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtConnectPort:
    mov dword [currentHash], 07EA87B3Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtConvertBetweenAuxiliaryCounterAndPerformanceCounter:
    mov dword [currentHash], 07FCC111Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateDebugObject:
    mov dword [currentHash], 070584915h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateDirectoryObject:
    mov dword [currentHash], 0BB91A91Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateDirectoryObjectEx:
    mov dword [currentHash], 0AC89F658h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateEnclave:
    mov dword [currentHash], 0EC551C48h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateEnlistment:
    mov dword [currentHash], 025982E1Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateEventPair:
    mov dword [currentHash], 01696320Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateIRTimer:
    mov dword [currentHash], 0CD9BFD38h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateIoCompletion:
    mov dword [currentHash], 0C6B02420h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateJobObject:
    mov dword [currentHash], 03C9D04D1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateJobSet:
    mov dword [currentHash], 020AE760Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateKeyTransacted:
    mov dword [currentHash], 0121EF303h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateKeyedEvent:
    mov dword [currentHash], 0C1AB2FB6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateLowBoxToken:
    mov dword [currentHash], 04F946DC4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateMailslotFile:
    mov dword [currentHash], 0243DCA3Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateMutant:
    mov dword [currentHash], 0DDB3BE64h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateNamedPipeFile:
    mov dword [currentHash], 02ABD122Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreatePagingFile:
    mov dword [currentHash], 05CCB5E52h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreatePartition:
    mov dword [currentHash], 015A0694Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreatePort:
    mov dword [currentHash], 002881B06h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreatePrivateNamespace:
    mov dword [currentHash], 09DBE43FFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateProcess:
    mov dword [currentHash], 029B92F28h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateProfile:
    mov dword [currentHash], 026BE292Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateProfileEx:
    mov dword [currentHash], 00D934B4Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateRegistryTransaction:
    mov dword [currentHash], 0CF54CBC6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateResourceManager:
    mov dword [currentHash], 0183CC170h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateSemaphore:
    mov dword [currentHash], 0085A7AB2h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateSymbolicLinkObject:
    mov dword [currentHash], 0F2D8DC65h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateThreadEx:
    mov dword [currentHash], 044BC86C6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateTimer:
    mov dword [currentHash], 00350DD10h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateTimer2:
    mov dword [currentHash], 01353BA0Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateToken:
    mov dword [currentHash], 0C75AF5FAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateTokenEx:
    mov dword [currentHash], 03AA0F7E5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateTransaction:
    mov dword [currentHash], 046CD4267h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateTransactionManager:
    mov dword [currentHash], 0172507A4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateUserProcess:
    mov dword [currentHash], 0398A3A14h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateWaitCompletionPacket:
    mov dword [currentHash], 0A99DD171h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateWaitablePort:
    mov dword [currentHash], 0E673E1E0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateWnfStateName:
    mov dword [currentHash], 0148A2D1Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateWorkerFactory:
    mov dword [currentHash], 0BEAED64Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDebugActiveProcess:
    mov dword [currentHash], 07E3097ACh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDebugContinue:
    mov dword [currentHash], 030244728h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteAtom:
    mov dword [currentHash], 054C15756h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteBootEntry:
    mov dword [currentHash], 009950306h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteDriverEntry:
    mov dword [currentHash], 0CB97FF2Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteFile:
    mov dword [currentHash], 014B25392h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteKey:
    mov dword [currentHash], 069D34C78h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteObjectAuditAlarm:
    mov dword [currentHash], 07AA47C30h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeletePrivateNamespace:
    mov dword [currentHash], 06ACC6F55h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteValueKey:
    mov dword [currentHash], 02A9F0905h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteWnfStateData:
    mov dword [currentHash], 002C292F0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDeleteWnfStateName:
    mov dword [currentHash], 076B8FD9Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDisableLastKnownGood:
    mov dword [currentHash], 07BAA4570h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDisplayString:
    mov dword [currentHash], 0FEA3D422h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtDrawText:
    mov dword [currentHash], 012AB093Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnableLastKnownGood:
    mov dword [currentHash], 0E47B9E7Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateBootEntries:
    mov dword [currentHash], 018CD1B51h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateDriverEntries:
    mov dword [currentHash], 0E8DC14B4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateSystemEnvironmentValuesEx:
    mov dword [currentHash], 01D90CDC8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtEnumerateTransactionObject:
    mov dword [currentHash], 01935E84Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtExtendSection:
    mov dword [currentHash], 03368ECC1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFilterBootOption:
    mov dword [currentHash], 00CA6CEF6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFilterToken:
    mov dword [currentHash], 06420B86Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFilterTokenEx:
    mov dword [currentHash], 0A64FA2F0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushBuffersFileEx:
    mov dword [currentHash], 0AA399A81h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushInstallUILanguage:
    mov dword [currentHash], 0BB895C88h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushInstructionCache:
    mov dword [currentHash], 08B588FF9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushKey:
    mov dword [currentHash], 01C1F79E3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushProcessWriteBuffers:
    mov dword [currentHash], 000BF0C2Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushVirtualMemory:
    mov dword [currentHash], 0C9D12CBEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFlushWriteBuffer:
    mov dword [currentHash], 0831AAD8Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFreeUserPhysicalPages:
    mov dword [currentHash], 081BCB61Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFreezeRegistry:
    mov dword [currentHash], 0008B0607h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtFreezeTransactions:
    mov dword [currentHash], 04F9D3777h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetCachedSigningLevel:
    mov dword [currentHash], 0B67AF0C0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetCompleteWnfStateSubscription:
    mov dword [currentHash], 03CB13C23h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetContextThread:
    mov dword [currentHash], 0F4C8FE5Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetCurrentProcessorNumber:
    mov dword [currentHash], 0D7B2C512h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetCurrentProcessorNumberEx:
    mov dword [currentHash], 010AFC3F5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetDevicePowerState:
    mov dword [currentHash], 036B61836h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetMUIRegistryInfo:
    mov dword [currentHash], 06A10444Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetNextProcess:
    mov dword [currentHash], 0015FE333h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetNextThread:
    mov dword [currentHash], 0306C32D5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetNlsSectionPtr:
    mov dword [currentHash], 03E16219Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetNotificationResourceManager:
    mov dword [currentHash], 00F9F6B42h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetWriteWatch:
    mov dword [currentHash], 0AD6FD7FDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtImpersonateAnonymousToken:
    mov dword [currentHash], 03016E42Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtImpersonateThread:
    mov dword [currentHash], 0328E1037h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtInitializeEnclave:
    mov dword [currentHash], 0F0AEDA22h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtInitializeNlsFiles:
    mov dword [currentHash], 01317DD54h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtInitializeRegistry:
    mov dword [currentHash], 02C8C342Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtInitiatePowerAction:
    mov dword [currentHash], 00EA16475h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtIsSystemResumeAutomatic:
    mov dword [currentHash], 086887393h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtIsUILanguageComitted:
    mov dword [currentHash], 063861293h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtListenPort:
    mov dword [currentHash], 0A4AEA130h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadDriver:
    mov dword [currentHash], 05CD7764Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadEnclaveData:
    mov dword [currentHash], 0F303C9D9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadHotPatch:
    mov dword [currentHash], 09EAF9630h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadKey:
    mov dword [currentHash], 05BE25E61h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadKey2:
    mov dword [currentHash], 03AB9CE3Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLoadKeyEx:
    mov dword [currentHash], 00584FD84h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLockFile:
    mov dword [currentHash], 0E038E8AAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLockProductActivationKeys:
    mov dword [currentHash], 0E742ECD4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLockRegistryKey:
    mov dword [currentHash], 06DCB5C4Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtLockVirtualMemory:
    mov dword [currentHash], 031B4D4DBh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMakePermanentObject:
    mov dword [currentHash], 012017ADCh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMakeTemporaryObject:
    mov dword [currentHash], 006DD7E31h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtManagePartition:
    mov dword [currentHash], 0868D8118h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMapCMFModule:
    mov dword [currentHash], 068265372h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMapUserPhysicalPages:
    mov dword [currentHash], 08DB5F64Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMapViewOfSectionEx:
    mov dword [currentHash], 060D329E2h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtModifyBootEntry:
    mov dword [currentHash], 009803938h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtModifyDriverEntry:
    mov dword [currentHash], 009983950h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtNotifyChangeDirectoryFile:
    mov dword [currentHash], 0BC3BAC80h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtNotifyChangeDirectoryFileEx:
    mov dword [currentHash], 080BBC407h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtNotifyChangeKey:
    mov dword [currentHash], 0859A6385h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtNotifyChangeMultipleKeys:
    mov dword [currentHash], 08794009Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtNotifyChangeSession:
    mov dword [currentHash], 001D750F4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenEnlistment:
    mov dword [currentHash], 049CB7C4Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenEventPair:
    mov dword [currentHash], 0C292C607h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenIoCompletion:
    mov dword [currentHash], 0148235D1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenJobObject:
    mov dword [currentHash], 082A050FDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenKeyEx:
    mov dword [currentHash], 0765A9025h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenKeyTransacted:
    mov dword [currentHash], 0DCBCEE62h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenKeyTransactedEx:
    mov dword [currentHash], 026DFE061h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenKeyedEvent:
    mov dword [currentHash], 0C88A2AFDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenMutant:
    mov dword [currentHash], 072E27B7Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenObjectAuditAlarm:
    mov dword [currentHash], 00A85261Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenPartition:
    mov dword [currentHash], 0B4AA53BAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenPrivateNamespace:
    mov dword [currentHash], 01EAE213Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenProcessToken:
    mov dword [currentHash], 0E5219BE2h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenRegistryTransaction:
    mov dword [currentHash], 01E40D914h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenResourceManager:
    mov dword [currentHash], 0259D313Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenSemaphore:
    mov dword [currentHash], 04E9A9322h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenSession:
    mov dword [currentHash], 0EBCD17AEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenSymbolicLinkObject:
    mov dword [currentHash], 00FA1372Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenThread:
    mov dword [currentHash], 002315609h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenTimer:
    mov dword [currentHash], 06A52E243h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenTransaction:
    mov dword [currentHash], 0E8C19E25h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtOpenTransactionManager:
    mov dword [currentHash], 03DA6D7BAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPlugPlayControl:
    mov dword [currentHash], 04F184BF3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrePrepareComplete:
    mov dword [currentHash], 02ED3C45Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrePrepareEnlistment:
    mov dword [currentHash], 0D9BEC63Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrepareComplete:
    mov dword [currentHash], 0089003FEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrepareEnlistment:
    mov dword [currentHash], 0B629CDDEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrivilegeCheck:
    mov dword [currentHash], 00AA6F9F8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrivilegeObjectAuditAlarm:
    mov dword [currentHash], 010AEEAC2h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPrivilegedServiceAuditAlarm:
    mov dword [currentHash], 0905F1D46h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPropagationComplete:
    mov dword [currentHash], 01CB9FEF6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPropagationFailed:
    mov dword [currentHash], 09E997DC7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPulseEvent:
    mov dword [currentHash], 0F64AC7ECh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryAuxiliaryCounterFrequency:
    mov dword [currentHash], 03BB11617h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryBootEntryOrder:
    mov dword [currentHash], 087AE138Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryBootOptions:
    mov dword [currentHash], 0C5A93FC1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDebugFilterState:
    mov dword [currentHash], 0F6B518F4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDirectoryFileEx:
    mov dword [currentHash], 02C37108Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDirectoryObject:
    mov dword [currentHash], 0163D38A6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryDriverEntryOrder:
    mov dword [currentHash], 0B3869513h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryEaFile:
    mov dword [currentHash], 06432B598h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryFullAttributesFile:
    mov dword [currentHash], 01C7DC8CEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationAtom:
    mov dword [currentHash], 0A938CD31h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationByName:
    mov dword [currentHash], 0F42B87FDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationEnlistment:
    mov dword [currentHash], 0D448F7DEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationJobObject:
    mov dword [currentHash], 072508F50h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationPort:
    mov dword [currentHash], 0E579FCD7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationResourceManager:
    mov dword [currentHash], 0E7577177h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationTransaction:
    mov dword [currentHash], 002172C8Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationTransactionManager:
    mov dword [currentHash], 0C5992AE5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInformationWorkerFactory:
    mov dword [currentHash], 0FC95CA39h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryInstallUILanguage:
    mov dword [currentHash], 01342D01Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryIntervalProfile:
    mov dword [currentHash], 028A07664h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryIoCompletion:
    mov dword [currentHash], 09F36A3B4h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryLicenseValue:
    mov dword [currentHash], 0B421DA2Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryMultipleValueKey:
    mov dword [currentHash], 04195622Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryMutant:
    mov dword [currentHash], 0F453CDE6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryOpenSubKeys:
    mov dword [currentHash], 08AD0A572h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryOpenSubKeysEx:
    mov dword [currentHash], 0AFA3F576h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryPortInformationProcess:
    mov dword [currentHash], 041D4444Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryQuotaInformationFile:
    mov dword [currentHash], 0BAB944BAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySecurityAttributesToken:
    mov dword [currentHash], 032153A8Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySecurityObject:
    mov dword [currentHash], 036AB5EB7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySecurityPolicy:
    mov dword [currentHash], 03C8B013Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySemaphore:
    mov dword [currentHash], 043560DF0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySymbolicLinkObject:
    mov dword [currentHash], 01435FC29h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySystemEnvironmentValue:
    mov dword [currentHash], 0FC20F3C0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySystemEnvironmentValueEx:
    mov dword [currentHash], 0FFE0FB5Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySystemInformationEx:
    mov dword [currentHash], 0969554AEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryTimerResolution:
    mov dword [currentHash], 048D26801h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryWnfStateData:
    mov dword [currentHash], 062FB700Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueryWnfStateNameInformation:
    mov dword [currentHash], 0DE44DED7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQueueApcThreadEx:
    mov dword [currentHash], 02A3E6884h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRaiseException:
    mov dword [currentHash], 0C149205Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRaiseHardError:
    mov dword [currentHash], 007982B3Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReadOnlyEnlistment:
    mov dword [currentHash], 00FA90E3Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRecoverEnlistment:
    mov dword [currentHash], 09B359EA3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRecoverResourceManager:
    mov dword [currentHash], 06833B099h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRecoverTransactionManager:
    mov dword [currentHash], 03FA81530h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRegisterProtocolAddressInformation:
    mov dword [currentHash], 0180F7E1Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRegisterThreadTerminatePort:
    mov dword [currentHash], 020B2C6E0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReleaseKeyedEvent:
    mov dword [currentHash], 0CE4EDBCCh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReleaseWorkerFactoryWorker:
    mov dword [currentHash], 0F86DD6B5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRemoveIoCompletionEx:
    mov dword [currentHash], 08416B2A8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRemoveProcessDebug:
    mov dword [currentHash], 0AA3A6912h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRenameKey:
    mov dword [currentHash], 03AF26529h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRenameTransactionManager:
    mov dword [currentHash], 0C79EDC37h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplaceKey:
    mov dword [currentHash], 08AD7A178h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplacePartitionUnit:
    mov dword [currentHash], 026332AA8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReplyWaitReplyPort:
    mov dword [currentHash], 0A0358FAEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRequestPort:
    mov dword [currentHash], 0E97EF6F5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtResetEvent:
    mov dword [currentHash], 0CF127F37h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtResetWriteWatch:
    mov dword [currentHash], 0C2B1C912h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRestoreKey:
    mov dword [currentHash], 096A2F748h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtResumeProcess:
    mov dword [currentHash], 0722C69A1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRevertContainerImpersonation:
    mov dword [currentHash], 0452E49BDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollbackComplete:
    mov dword [currentHash], 0273ABE04h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollbackEnlistment:
    mov dword [currentHash], 07E421BDAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollbackRegistryTransaction:
    mov dword [currentHash], 00CFE1673h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollbackTransaction:
    mov dword [currentHash], 0920A969Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollforwardTransactionManager:
    mov dword [currentHash], 0160644C7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSaveKey:
    mov dword [currentHash], 01682C8D5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSaveKeyEx:
    mov dword [currentHash], 0C457E3E8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSaveMergedKeys:
    mov dword [currentHash], 067FC6274h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSecureConnectPort:
    mov dword [currentHash], 0608E592Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSerializeBoot:
    mov dword [currentHash], 072E24C61h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetBootEntryOrder:
    mov dword [currentHash], 033B61D2Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetBootOptions:
    mov dword [currentHash], 05387591Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetCachedSigningLevel:
    mov dword [currentHash], 02ABAA598h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetCachedSigningLevel2:
    mov dword [currentHash], 0B29040B5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetContextThread:
    mov dword [currentHash], 03CBCE60Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetDebugFilterState:
    mov dword [currentHash], 03290DBDEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetDefaultHardErrorPort:
    mov dword [currentHash], 0257724E9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetDefaultLocale:
    mov dword [currentHash], 08D2C8599h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetDefaultUILanguage:
    mov dword [currentHash], 08B35AB6Eh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetDriverEntryOrder:
    mov dword [currentHash], 095AEE742h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetEaFile:
    mov dword [currentHash], 0E138E9DDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetHighEventPair:
    mov dword [currentHash], 060D47A71h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetHighWaitLowEventPair:
    mov dword [currentHash], 090B19827h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetIRTimer:
    mov dword [currentHash], 08FA8F140h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationDebugObject:
    mov dword [currentHash], 0071D79EFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationEnlistment:
    mov dword [currentHash], 00E56E804h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationJobObject:
    mov dword [currentHash], 073569D24h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationKey:
    mov dword [currentHash], 0020837B5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationResourceManager:
    mov dword [currentHash], 0FD9309EAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationSymbolicLink:
    mov dword [currentHash], 0AE3BA6AEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationToken:
    mov dword [currentHash], 0AF9FF534h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationTransaction:
    mov dword [currentHash], 0108A361Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationTransactionManager:
    mov dword [currentHash], 0725FEC74h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationVirtualMemory:
    mov dword [currentHash], 019901313h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationWorkerFactory:
    mov dword [currentHash], 00A8E1816h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetIntervalProfile:
    mov dword [currentHash], 03499AE98h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetIoCompletion:
    mov dword [currentHash], 09681921Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetIoCompletionEx:
    mov dword [currentHash], 0989A24BEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetLdtEntries:
    mov dword [currentHash], 0B91DBA86h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetLowEventPair:
    mov dword [currentHash], 010B7C4F1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetLowWaitHighEventPair:
    mov dword [currentHash], 0E4D1D40Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetQuotaInformationFile:
    mov dword [currentHash], 068FEA148h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSecurityObject:
    mov dword [currentHash], 01A2464D9h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSystemEnvironmentValue:
    mov dword [currentHash], 0C256ED92h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSystemEnvironmentValueEx:
    mov dword [currentHash], 02FC4F2A1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSystemInformation:
    mov dword [currentHash], 09C069A9Fh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSystemPowerState:
    mov dword [currentHash], 01F3D8800h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetSystemTime:
    mov dword [currentHash], 094B3C98Bh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetThreadExecutionState:
    mov dword [currentHash], 000BA2834h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetTimer2:
    mov dword [currentHash], 011A97007h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetTimerEx:
    mov dword [currentHash], 030B7726Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetTimerResolution:
    mov dword [currentHash], 0D649F6D7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetUuidSeed:
    mov dword [currentHash], 0158DD430h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetVolumeInformationFile:
    mov dword [currentHash], 0D8CB47F8h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetWnfProcessNotificationEvent:
    mov dword [currentHash], 03E941334h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtShutdownSystem:
    mov dword [currentHash], 0068CFEC7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtShutdownWorkerFactory:
    mov dword [currentHash], 00898362Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSignalAndWaitForSingleObject:
    mov dword [currentHash], 000BE0E03h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSinglePhaseReject:
    mov dword [currentHash], 01AA13E39h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtStartProfile:
    mov dword [currentHash], 0289C722Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtStopProfile:
    mov dword [currentHash], 0C88938DFh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSubscribeWnfStateChange:
    mov dword [currentHash], 022A16304h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSuspendProcess:
    mov dword [currentHash], 0519C7000h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSuspendThread:
    mov dword [currentHash], 03A1F24BDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSystemDebugControl:
    mov dword [currentHash], 0C09EC476h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTerminateEnclave:
    mov dword [currentHash], 0EE33C6FEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTerminateJobObject:
    mov dword [currentHash], 0BAB8B224h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTestAlert:
    mov dword [currentHash], 04ED13358h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtThawRegistry:
    mov dword [currentHash], 006EF4E21h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtThawTransactions:
    mov dword [currentHash], 00796193Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTraceControl:
    mov dword [currentHash], 0DF8A2BDDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtTranslateFilePath:
    mov dword [currentHash], 0FA3081FCh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUmsThreadYield:
    mov dword [currentHash], 0F85A28EEh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnloadDriver:
    mov dword [currentHash], 0D69F05C1h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnloadKey:
    mov dword [currentHash], 0EA3E8DCDh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnloadKey2:
    mov dword [currentHash], 027D4615Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnloadKeyEx:
    mov dword [currentHash], 067F32B36h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnlockFile:
    mov dword [currentHash], 0903DC0F6h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnlockVirtualMemory:
    mov dword [currentHash], 098118E80h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnmapViewOfSectionEx:
    mov dword [currentHash], 0F29131EBh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUnsubscribeWnfStateChange:
    mov dword [currentHash], 050CE5756h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtUpdateWnfStateData:
    mov dword [currentHash], 0DEDCEA46h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtVdmControl:
    mov dword [currentHash], 0BD9039A7h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForAlertByThreadId:
    mov dword [currentHash], 0143F7CCAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForDebugEvent:
    mov dword [currentHash], 090B06FDAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForKeyedEvent:
    mov dword [currentHash], 0D08A3618h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForWorkViaWorkerFactory:
    mov dword [currentHash], 0C89DE634h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitHighEventPair:
    mov dword [currentHash], 0A31DBFB0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitLowEventPair:
    mov dword [currentHash], 050B3B4E5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtAcquireCMFViewOwnership:
    mov dword [currentHash], 0FA6D1A7Ah    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCancelDeviceWakeupRequest:
    mov dword [currentHash], 033EDFBB0h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtClearAllSavepointsTransaction:
    mov dword [currentHash], 00294280Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtClearSavepointTransaction:
    mov dword [currentHash], 01288301Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRollbackSavepointTransaction:
    mov dword [currentHash], 0CB28EFBAh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSavepointTransaction:
    mov dword [currentHash], 0009A27CBh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSavepointComplete:
    mov dword [currentHash], 02AB2163Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateSectionEx:
    mov dword [currentHash], 0F8993BC3h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtCreateCrossVmEvent:
    mov dword [currentHash], 092CDBB10h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtGetPlugPlayEvent:
    mov dword [currentHash], 008858F96h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtListTransactions:
    mov dword [currentHash], 00D982B33h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtMarshallTransaction:
    mov dword [currentHash], 02A6FF427h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtPullTransaction:
    mov dword [currentHash], 0898FA91Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtReleaseCMFViewOwnership:
    mov dword [currentHash], 00D95254Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtWaitForWnfNotifications:
    mov dword [currentHash], 00D97290Dh    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtStartTm:
    mov dword [currentHash], 021F27B5Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtSetInformationProcess:
    mov dword [currentHash], 0922881A5h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRequestDeviceWakeup:
    mov dword [currentHash], 003AF3904h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtRequestWakeupLatency:
    mov dword [currentHash], 03285536Ch    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtQuerySystemTime:
    mov dword [currentHash], 07EB95963h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtManageHotPatch:
    mov dword [currentHash], 01321D914h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

NtContinueEx:
    mov dword [currentHash], 0F7CEB332h    ; Load function hash into global variable.
    call WhisperMain                       ; Resolve function hash into syscall number and make the call

