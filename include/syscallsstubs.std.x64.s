.intel_syntax noprefix
.data
currentHash:    .long   0

.text
.global NtAccessCheck
.global NtWorkerFactoryWorkerReady
.global NtAcceptConnectPort
.global NtMapUserPhysicalPagesScatter
.global NtWaitForSingleObject
.global NtCallbackReturn
.global NtReadFile
.global NtDeviceIoControlFile
.global NtWriteFile
.global NtRemoveIoCompletion
.global NtReleaseSemaphore
.global NtReplyWaitReceivePort
.global NtReplyPort
.global NtSetInformationThread
.global NtSetEvent
.global NtClose
.global NtQueryObject
.global NtQueryInformationFile
.global NtOpenKey
.global NtEnumerateValueKey
.global NtFindAtom
.global NtQueryDefaultLocale
.global NtQueryKey
.global NtQueryValueKey
.global NtAllocateVirtualMemory
.global NtQueryInformationProcess
.global NtWaitForMultipleObjects32
.global NtWriteFileGather
.global NtCreateKey
.global NtFreeVirtualMemory
.global NtImpersonateClientOfPort
.global NtReleaseMutant
.global NtQueryInformationToken
.global NtRequestWaitReplyPort
.global NtQueryVirtualMemory
.global NtOpenThreadToken
.global NtQueryInformationThread
.global NtOpenProcess
.global NtSetInformationFile
.global NtMapViewOfSection
.global NtAccessCheckAndAuditAlarm
.global NtUnmapViewOfSection
.global NtReplyWaitReceivePortEx
.global NtTerminateProcess
.global NtSetEventBoostPriority
.global NtReadFileScatter
.global NtOpenThreadTokenEx
.global NtOpenProcessTokenEx
.global NtQueryPerformanceCounter
.global NtEnumerateKey
.global NtOpenFile
.global NtDelayExecution
.global NtQueryDirectoryFile
.global NtQuerySystemInformation
.global NtOpenSection
.global NtQueryTimer
.global NtFsControlFile
.global NtWriteVirtualMemory
.global NtCloseObjectAuditAlarm
.global NtDuplicateObject
.global NtQueryAttributesFile
.global NtClearEvent
.global NtReadVirtualMemory
.global NtOpenEvent
.global NtAdjustPrivilegesToken
.global NtDuplicateToken
.global NtContinue
.global NtQueryDefaultUILanguage
.global NtQueueApcThread
.global NtYieldExecution
.global NtAddAtom
.global NtCreateEvent
.global NtQueryVolumeInformationFile
.global NtCreateSection
.global NtFlushBuffersFile
.global NtApphelpCacheControl
.global NtCreateProcessEx
.global NtCreateThread
.global NtIsProcessInJob
.global NtProtectVirtualMemory
.global NtQuerySection
.global NtResumeThread
.global NtTerminateThread
.global NtReadRequestData
.global NtCreateFile
.global NtQueryEvent
.global NtWriteRequestData
.global NtOpenDirectoryObject
.global NtAccessCheckByTypeAndAuditAlarm
.global NtWaitForMultipleObjects
.global NtSetInformationObject
.global NtCancelIoFile
.global NtTraceEvent
.global NtPowerInformation
.global NtSetValueKey
.global NtCancelTimer
.global NtSetTimer
.global NtAccessCheckByType
.global NtAccessCheckByTypeResultList
.global NtAccessCheckByTypeResultListAndAuditAlarm
.global NtAccessCheckByTypeResultListAndAuditAlarmByHandle
.global NtAcquireProcessActivityReference
.global NtAddAtomEx
.global NtAddBootEntry
.global NtAddDriverEntry
.global NtAdjustGroupsToken
.global NtAdjustTokenClaimsAndDeviceGroups
.global NtAlertResumeThread
.global NtAlertThread
.global NtAlertThreadByThreadId
.global NtAllocateLocallyUniqueId
.global NtAllocateReserveObject
.global NtAllocateUserPhysicalPages
.global NtAllocateUuids
.global NtAllocateVirtualMemoryEx
.global NtAlpcAcceptConnectPort
.global NtAlpcCancelMessage
.global NtAlpcConnectPort
.global NtAlpcConnectPortEx
.global NtAlpcCreatePort
.global NtAlpcCreatePortSection
.global NtAlpcCreateResourceReserve
.global NtAlpcCreateSectionView
.global NtAlpcCreateSecurityContext
.global NtAlpcDeletePortSection
.global NtAlpcDeleteResourceReserve
.global NtAlpcDeleteSectionView
.global NtAlpcDeleteSecurityContext
.global NtAlpcDisconnectPort
.global NtAlpcImpersonateClientContainerOfPort
.global NtAlpcImpersonateClientOfPort
.global NtAlpcOpenSenderProcess
.global NtAlpcOpenSenderThread
.global NtAlpcQueryInformation
.global NtAlpcQueryInformationMessage
.global NtAlpcRevokeSecurityContext
.global NtAlpcSendWaitReceivePort
.global NtAlpcSetInformation
.global NtAreMappedFilesTheSame
.global NtAssignProcessToJobObject
.global NtAssociateWaitCompletionPacket
.global NtCallEnclave
.global NtCancelIoFileEx
.global NtCancelSynchronousIoFile
.global NtCancelTimer2
.global NtCancelWaitCompletionPacket
.global NtCommitComplete
.global NtCommitEnlistment
.global NtCommitRegistryTransaction
.global NtCommitTransaction
.global NtCompactKeys
.global NtCompareObjects
.global NtCompareSigningLevels
.global NtCompareTokens
.global NtCompleteConnectPort
.global NtCompressKey
.global NtConnectPort
.global NtConvertBetweenAuxiliaryCounterAndPerformanceCounter
.global NtCreateDebugObject
.global NtCreateDirectoryObject
.global NtCreateDirectoryObjectEx
.global NtCreateEnclave
.global NtCreateEnlistment
.global NtCreateEventPair
.global NtCreateIRTimer
.global NtCreateIoCompletion
.global NtCreateJobObject
.global NtCreateJobSet
.global NtCreateKeyTransacted
.global NtCreateKeyedEvent
.global NtCreateLowBoxToken
.global NtCreateMailslotFile
.global NtCreateMutant
.global NtCreateNamedPipeFile
.global NtCreatePagingFile
.global NtCreatePartition
.global NtCreatePort
.global NtCreatePrivateNamespace
.global NtCreateProcess
.global NtCreateProfile
.global NtCreateProfileEx
.global NtCreateRegistryTransaction
.global NtCreateResourceManager
.global NtCreateSemaphore
.global NtCreateSymbolicLinkObject
.global NtCreateThreadEx
.global NtCreateTimer
.global NtCreateTimer2
.global NtCreateToken
.global NtCreateTokenEx
.global NtCreateTransaction
.global NtCreateTransactionManager
.global NtCreateUserProcess
.global NtCreateWaitCompletionPacket
.global NtCreateWaitablePort
.global NtCreateWnfStateName
.global NtCreateWorkerFactory
.global NtDebugActiveProcess
.global NtDebugContinue
.global NtDeleteAtom
.global NtDeleteBootEntry
.global NtDeleteDriverEntry
.global NtDeleteFile
.global NtDeleteKey
.global NtDeleteObjectAuditAlarm
.global NtDeletePrivateNamespace
.global NtDeleteValueKey
.global NtDeleteWnfStateData
.global NtDeleteWnfStateName
.global NtDisableLastKnownGood
.global NtDisplayString
.global NtDrawText
.global NtEnableLastKnownGood
.global NtEnumerateBootEntries
.global NtEnumerateDriverEntries
.global NtEnumerateSystemEnvironmentValuesEx
.global NtEnumerateTransactionObject
.global NtExtendSection
.global NtFilterBootOption
.global NtFilterToken
.global NtFilterTokenEx
.global NtFlushBuffersFileEx
.global NtFlushInstallUILanguage
.global NtFlushInstructionCache
.global NtFlushKey
.global NtFlushProcessWriteBuffers
.global NtFlushVirtualMemory
.global NtFlushWriteBuffer
.global NtFreeUserPhysicalPages
.global NtFreezeRegistry
.global NtFreezeTransactions
.global NtGetCachedSigningLevel
.global NtGetCompleteWnfStateSubscription
.global NtGetContextThread
.global NtGetCurrentProcessorNumber
.global NtGetCurrentProcessorNumberEx
.global NtGetDevicePowerState
.global NtGetMUIRegistryInfo
.global NtGetNextProcess
.global NtGetNextThread
.global NtGetNlsSectionPtr
.global NtGetNotificationResourceManager
.global NtGetWriteWatch
.global NtImpersonateAnonymousToken
.global NtImpersonateThread
.global NtInitializeEnclave
.global NtInitializeNlsFiles
.global NtInitializeRegistry
.global NtInitiatePowerAction
.global NtIsSystemResumeAutomatic
.global NtIsUILanguageComitted
.global NtListenPort
.global NtLoadDriver
.global NtLoadEnclaveData
.global NtLoadHotPatch
.global NtLoadKey
.global NtLoadKey2
.global NtLoadKeyEx
.global NtLockFile
.global NtLockProductActivationKeys
.global NtLockRegistryKey
.global NtLockVirtualMemory
.global NtMakePermanentObject
.global NtMakeTemporaryObject
.global NtManagePartition
.global NtMapCMFModule
.global NtMapUserPhysicalPages
.global NtMapViewOfSectionEx
.global NtModifyBootEntry
.global NtModifyDriverEntry
.global NtNotifyChangeDirectoryFile
.global NtNotifyChangeDirectoryFileEx
.global NtNotifyChangeKey
.global NtNotifyChangeMultipleKeys
.global NtNotifyChangeSession
.global NtOpenEnlistment
.global NtOpenEventPair
.global NtOpenIoCompletion
.global NtOpenJobObject
.global NtOpenKeyEx
.global NtOpenKeyTransacted
.global NtOpenKeyTransactedEx
.global NtOpenKeyedEvent
.global NtOpenMutant
.global NtOpenObjectAuditAlarm
.global NtOpenPartition
.global NtOpenPrivateNamespace
.global NtOpenProcessToken
.global NtOpenRegistryTransaction
.global NtOpenResourceManager
.global NtOpenSemaphore
.global NtOpenSession
.global NtOpenSymbolicLinkObject
.global NtOpenThread
.global NtOpenTimer
.global NtOpenTransaction
.global NtOpenTransactionManager
.global NtPlugPlayControl
.global NtPrePrepareComplete
.global NtPrePrepareEnlistment
.global NtPrepareComplete
.global NtPrepareEnlistment
.global NtPrivilegeCheck
.global NtPrivilegeObjectAuditAlarm
.global NtPrivilegedServiceAuditAlarm
.global NtPropagationComplete
.global NtPropagationFailed
.global NtPulseEvent
.global NtQueryAuxiliaryCounterFrequency
.global NtQueryBootEntryOrder
.global NtQueryBootOptions
.global NtQueryDebugFilterState
.global NtQueryDirectoryFileEx
.global NtQueryDirectoryObject
.global NtQueryDriverEntryOrder
.global NtQueryEaFile
.global NtQueryFullAttributesFile
.global NtQueryInformationAtom
.global NtQueryInformationByName
.global NtQueryInformationEnlistment
.global NtQueryInformationJobObject
.global NtQueryInformationPort
.global NtQueryInformationResourceManager
.global NtQueryInformationTransaction
.global NtQueryInformationTransactionManager
.global NtQueryInformationWorkerFactory
.global NtQueryInstallUILanguage
.global NtQueryIntervalProfile
.global NtQueryIoCompletion
.global NtQueryLicenseValue
.global NtQueryMultipleValueKey
.global NtQueryMutant
.global NtQueryOpenSubKeys
.global NtQueryOpenSubKeysEx
.global NtQueryPortInformationProcess
.global NtQueryQuotaInformationFile
.global NtQuerySecurityAttributesToken
.global NtQuerySecurityObject
.global NtQuerySecurityPolicy
.global NtQuerySemaphore
.global NtQuerySymbolicLinkObject
.global NtQuerySystemEnvironmentValue
.global NtQuerySystemEnvironmentValueEx
.global NtQuerySystemInformationEx
.global NtQueryTimerResolution
.global NtQueryWnfStateData
.global NtQueryWnfStateNameInformation
.global NtQueueApcThreadEx
.global NtRaiseException
.global NtRaiseHardError
.global NtReadOnlyEnlistment
.global NtRecoverEnlistment
.global NtRecoverResourceManager
.global NtRecoverTransactionManager
.global NtRegisterProtocolAddressInformation
.global NtRegisterThreadTerminatePort
.global NtReleaseKeyedEvent
.global NtReleaseWorkerFactoryWorker
.global NtRemoveIoCompletionEx
.global NtRemoveProcessDebug
.global NtRenameKey
.global NtRenameTransactionManager
.global NtReplaceKey
.global NtReplacePartitionUnit
.global NtReplyWaitReplyPort
.global NtRequestPort
.global NtResetEvent
.global NtResetWriteWatch
.global NtRestoreKey
.global NtResumeProcess
.global NtRevertContainerImpersonation
.global NtRollbackComplete
.global NtRollbackEnlistment
.global NtRollbackRegistryTransaction
.global NtRollbackTransaction
.global NtRollforwardTransactionManager
.global NtSaveKey
.global NtSaveKeyEx
.global NtSaveMergedKeys
.global NtSecureConnectPort
.global NtSerializeBoot
.global NtSetBootEntryOrder
.global NtSetBootOptions
.global NtSetCachedSigningLevel
.global NtSetCachedSigningLevel2
.global NtSetContextThread
.global NtSetDebugFilterState
.global NtSetDefaultHardErrorPort
.global NtSetDefaultLocale
.global NtSetDefaultUILanguage
.global NtSetDriverEntryOrder
.global NtSetEaFile
.global NtSetHighEventPair
.global NtSetHighWaitLowEventPair
.global NtSetIRTimer
.global NtSetInformationDebugObject
.global NtSetInformationEnlistment
.global NtSetInformationJobObject
.global NtSetInformationKey
.global NtSetInformationResourceManager
.global NtSetInformationSymbolicLink
.global NtSetInformationToken
.global NtSetInformationTransaction
.global NtSetInformationTransactionManager
.global NtSetInformationVirtualMemory
.global NtSetInformationWorkerFactory
.global NtSetIntervalProfile
.global NtSetIoCompletion
.global NtSetIoCompletionEx
.global NtSetLdtEntries
.global NtSetLowEventPair
.global NtSetLowWaitHighEventPair
.global NtSetQuotaInformationFile
.global NtSetSecurityObject
.global NtSetSystemEnvironmentValue
.global NtSetSystemEnvironmentValueEx
.global NtSetSystemInformation
.global NtSetSystemPowerState
.global NtSetSystemTime
.global NtSetThreadExecutionState
.global NtSetTimer2
.global NtSetTimerEx
.global NtSetTimerResolution
.global NtSetUuidSeed
.global NtSetVolumeInformationFile
.global NtSetWnfProcessNotificationEvent
.global NtShutdownSystem
.global NtShutdownWorkerFactory
.global NtSignalAndWaitForSingleObject
.global NtSinglePhaseReject
.global NtStartProfile
.global NtStopProfile
.global NtSubscribeWnfStateChange
.global NtSuspendProcess
.global NtSuspendThread
.global NtSystemDebugControl
.global NtTerminateEnclave
.global NtTerminateJobObject
.global NtTestAlert
.global NtThawRegistry
.global NtThawTransactions
.global NtTraceControl
.global NtTranslateFilePath
.global NtUmsThreadYield
.global NtUnloadDriver
.global NtUnloadKey
.global NtUnloadKey2
.global NtUnloadKeyEx
.global NtUnlockFile
.global NtUnlockVirtualMemory
.global NtUnmapViewOfSectionEx
.global NtUnsubscribeWnfStateChange
.global NtUpdateWnfStateData
.global NtVdmControl
.global NtWaitForAlertByThreadId
.global NtWaitForDebugEvent
.global NtWaitForKeyedEvent
.global NtWaitForWorkViaWorkerFactory
.global NtWaitHighEventPair
.global NtWaitLowEventPair
.global NtAcquireCMFViewOwnership
.global NtCancelDeviceWakeupRequest
.global NtClearAllSavepointsTransaction
.global NtClearSavepointTransaction
.global NtRollbackSavepointTransaction
.global NtSavepointTransaction
.global NtSavepointComplete
.global NtCreateSectionEx
.global NtCreateCrossVmEvent
.global NtGetPlugPlayEvent
.global NtListTransactions
.global NtMarshallTransaction
.global NtPullTransaction
.global NtReleaseCMFViewOwnership
.global NtWaitForWnfNotifications
.global NtStartTm
.global NtSetInformationProcess
.global NtRequestDeviceWakeup
.global NtRequestWakeupLatency
.global NtQuerySystemTime
.global NtManageHotPatch
.global NtContinueEx

.global WhisperMain
.extern SW2_GetSyscallNumber
    
WhisperMain:
    pop rax
    mov [rsp+ 8], rcx              # Save registers.
    mov [rsp+16], rdx
    mov [rsp+24], r8
    mov [rsp+32], r9
    sub rsp, 0x28
    mov ecx, dword ptr [currentHash + RIP]
    call SW2_GetSyscallNumber
    add rsp, 0x28
    mov rcx, [rsp+ 8]              # Restore registers.
    mov rdx, [rsp+16]
    mov r8, [rsp+24]
    mov r9, [rsp+32]
    mov r10, rcx
    syscall                        # Issue syscall
    ret

NtAccessCheck:
    mov dword ptr [currentHash + RIP], 0x000D84B05   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWorkerFactoryWorkerReady:
    mov dword ptr [currentHash + RIP], 0x09FA1B93C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAcceptConnectPort:
    mov dword ptr [currentHash + RIP], 0x024B2213C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMapUserPhysicalPagesScatter:
    mov dword ptr [currentHash + RIP], 0x027822D1F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForSingleObject:
    mov dword ptr [currentHash + RIP], 0x0A698B634   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCallbackReturn:
    mov dword ptr [currentHash + RIP], 0x046DA6906   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReadFile:
    mov dword ptr [currentHash + RIP], 0x02D78E329   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeviceIoControlFile:
    mov dword ptr [currentHash + RIP], 0x05CBC501E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWriteFile:
    mov dword ptr [currentHash + RIP], 0x0C159CE3B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRemoveIoCompletion:
    mov dword ptr [currentHash + RIP], 0x00689869F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReleaseSemaphore:
    mov dword ptr [currentHash + RIP], 0x04C1E34C0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplyWaitReceivePort:
    mov dword ptr [currentHash + RIP], 0x061729E19   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplyPort:
    mov dword ptr [currentHash + RIP], 0x0A133CB2D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationThread:
    mov dword ptr [currentHash + RIP], 0x0882FC281   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetEvent:
    mov dword ptr [currentHash + RIP], 0x0DD40C0C9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtClose:
    mov dword ptr [currentHash + RIP], 0x0489CDDA5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryObject:
    mov dword ptr [currentHash + RIP], 0x0FA54F6FB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationFile:
    mov dword ptr [currentHash + RIP], 0x0F9781779   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenKey:
    mov dword ptr [currentHash + RIP], 0x00466E83C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateValueKey:
    mov dword ptr [currentHash + RIP], 0x02A5F37CA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFindAtom:
    mov dword ptr [currentHash + RIP], 0x0B5238AA1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDefaultLocale:
    mov dword ptr [currentHash + RIP], 0x0A3237C62   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryKey:
    mov dword ptr [currentHash + RIP], 0x092A6AF1C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryValueKey:
    mov dword ptr [currentHash + RIP], 0x0B9099CAA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x09790911F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationProcess:
    mov dword ptr [currentHash + RIP], 0x0612F4AB0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForMultipleObjects32:
    mov dword ptr [currentHash + RIP], 0x016CA3625   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWriteFileGather:
    mov dword ptr [currentHash + RIP], 0x03A24D23E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateKey:
    mov dword ptr [currentHash + RIP], 0x07E814F3B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFreeVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x0C596A942   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtImpersonateClientOfPort:
    mov dword ptr [currentHash + RIP], 0x0783265BC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReleaseMutant:
    mov dword ptr [currentHash + RIP], 0x03BBC3426   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationToken:
    mov dword ptr [currentHash + RIP], 0x0A17ECBFA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRequestWaitReplyPort:
    mov dword ptr [currentHash + RIP], 0x02DB14823   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x039D0395F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenThreadToken:
    mov dword ptr [currentHash + RIP], 0x01D840F08   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationThread:
    mov dword ptr [currentHash + RIP], 0x02E8A3C3B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenProcess:
    mov dword ptr [currentHash + RIP], 0x0BE20A5AC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationFile:
    mov dword ptr [currentHash + RIP], 0x0B63F582C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMapViewOfSection:
    mov dword ptr [currentHash + RIP], 0x046EA2639   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckAndAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x018BE1A52   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnmapViewOfSection:
    mov dword ptr [currentHash + RIP], 0x00A9E080F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplyWaitReceivePortEx:
    mov dword ptr [currentHash + RIP], 0x0696B3BB1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTerminateProcess:
    mov dword ptr [currentHash + RIP], 0x021A32630   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetEventBoostPriority:
    mov dword ptr [currentHash + RIP], 0x00C961A1E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReadFileScatter:
    mov dword ptr [currentHash + RIP], 0x039921B2F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenThreadTokenEx:
    mov dword ptr [currentHash + RIP], 0x0148CA0B0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenProcessTokenEx:
    mov dword ptr [currentHash + RIP], 0x0C6C3807D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryPerformanceCounter:
    mov dword ptr [currentHash + RIP], 0x073D595C1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateKey:
    mov dword ptr [currentHash + RIP], 0x01B1F4ECD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenFile:
    mov dword ptr [currentHash + RIP], 0x0F4A573B9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDelayExecution:
    mov dword ptr [currentHash + RIP], 0x00A800811   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDirectoryFile:
    mov dword ptr [currentHash + RIP], 0x028BEF888   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySystemInformation:
    mov dword ptr [currentHash + RIP], 0x0DA4BDCDF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenSection:
    mov dword ptr [currentHash + RIP], 0x01CC63E57   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryTimer:
    mov dword ptr [currentHash + RIP], 0x0C3971FBA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFsControlFile:
    mov dword ptr [currentHash + RIP], 0x0A8A9920E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWriteVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x00F912503   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCloseObjectAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x06EB06A26   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDuplicateObject:
    mov dword ptr [currentHash + RIP], 0x008B13A3F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryAttributesFile:
    mov dword ptr [currentHash + RIP], 0x03AB80E66   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtClearEvent:
    mov dword ptr [currentHash + RIP], 0x06EF46B64   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReadVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x0D39D2AFE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenEvent:
    mov dword ptr [currentHash + RIP], 0x092B1D167   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAdjustPrivilegesToken:
    mov dword ptr [currentHash + RIP], 0x01DA2F11E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDuplicateToken:
    mov dword ptr [currentHash + RIP], 0x0DE6AC4E9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtContinue:
    mov dword ptr [currentHash + RIP], 0x04ED93916   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDefaultUILanguage:
    mov dword ptr [currentHash + RIP], 0x09C3B8F87   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueueApcThread:
    mov dword ptr [currentHash + RIP], 0x08EA41A9B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtYieldExecution:
    mov dword ptr [currentHash + RIP], 0x02EB8042D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAddAtom:
    mov dword ptr [currentHash + RIP], 0x04D47AE51   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateEvent:
    mov dword ptr [currentHash + RIP], 0x0E64DF5AA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryVolumeInformationFile:
    mov dword ptr [currentHash + RIP], 0x0DE4FF0CC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateSection:
    mov dword ptr [currentHash + RIP], 0x0248D2A15   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushBuffersFile:
    mov dword ptr [currentHash + RIP], 0x0E85B3662   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtApphelpCacheControl:
    mov dword ptr [currentHash + RIP], 0x0BDAD26AB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateProcessEx:
    mov dword ptr [currentHash + RIP], 0x00C924647   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateThread:
    mov dword ptr [currentHash + RIP], 0x010B44209   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtIsProcessInJob:
    mov dword ptr [currentHash + RIP], 0x064C2A691   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtProtectVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x04F954517   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySection:
    mov dword ptr [currentHash + RIP], 0x0C844E4DF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtResumeThread:
    mov dword ptr [currentHash + RIP], 0x0B898BA26   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTerminateThread:
    mov dword ptr [currentHash + RIP], 0x04C8E022F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReadRequestData:
    mov dword ptr [currentHash + RIP], 0x0C3BDF0EF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateFile:
    mov dword ptr [currentHash + RIP], 0x056E78957   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryEvent:
    mov dword ptr [currentHash + RIP], 0x07A4129E6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWriteRequestData:
    mov dword ptr [currentHash + RIP], 0x0E4059212   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenDirectoryObject:
    mov dword ptr [currentHash + RIP], 0x0855FB1C0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckByTypeAndAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x0CF40EFCF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForMultipleObjects:
    mov dword ptr [currentHash + RIP], 0x0D52DEDE7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationObject:
    mov dword ptr [currentHash + RIP], 0x002213A8C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelIoFile:
    mov dword ptr [currentHash + RIP], 0x09AFB5DC7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTraceEvent:
    mov dword ptr [currentHash + RIP], 0x0CEF22697   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPowerInformation:
    mov dword ptr [currentHash + RIP], 0x030AE11FD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetValueKey:
    mov dword ptr [currentHash + RIP], 0x009DD2E40   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelTimer:
    mov dword ptr [currentHash + RIP], 0x0ACA6F468   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetTimer:
    mov dword ptr [currentHash + RIP], 0x0379E1D26   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckByType:
    mov dword ptr [currentHash + RIP], 0x09CC67084   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckByTypeResultList:
    mov dword ptr [currentHash + RIP], 0x07ED37A5B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckByTypeResultListAndAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x0D2D4D540   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAccessCheckByTypeResultListAndAuditAlarmByHandle:
    mov dword ptr [currentHash + RIP], 0x0A99663A0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAcquireProcessActivityReference:
    mov dword ptr [currentHash + RIP], 0x03AE3533E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAddAtomEx:
    mov dword ptr [currentHash + RIP], 0x0FD15DDAE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAddBootEntry:
    mov dword ptr [currentHash + RIP], 0x001903128   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAddDriverEntry:
    mov dword ptr [currentHash + RIP], 0x019F76978   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAdjustGroupsToken:
    mov dword ptr [currentHash + RIP], 0x025917530   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAdjustTokenClaimsAndDeviceGroups:
    mov dword ptr [currentHash + RIP], 0x0FA66FCF4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlertResumeThread:
    mov dword ptr [currentHash + RIP], 0x0309A3E33   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlertThread:
    mov dword ptr [currentHash + RIP], 0x0284312D5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlertThreadByThreadId:
    mov dword ptr [currentHash + RIP], 0x0A4B8E61E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateLocallyUniqueId:
    mov dword ptr [currentHash + RIP], 0x0CC0FCFA8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateReserveObject:
    mov dword ptr [currentHash + RIP], 0x08E23BEAF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateUserPhysicalPages:
    mov dword ptr [currentHash + RIP], 0x02F9D6816   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateUuids:
    mov dword ptr [currentHash + RIP], 0x017A4E4DA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAllocateVirtualMemoryEx:
    mov dword ptr [currentHash + RIP], 0x0B880EA6B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcAcceptConnectPort:
    mov dword ptr [currentHash + RIP], 0x040B75B38   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCancelMessage:
    mov dword ptr [currentHash + RIP], 0x017B6322C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcConnectPort:
    mov dword ptr [currentHash + RIP], 0x03269C007   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcConnectPortEx:
    mov dword ptr [currentHash + RIP], 0x0E06E3731   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCreatePort:
    mov dword ptr [currentHash + RIP], 0x058CA7552   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCreatePortSection:
    mov dword ptr [currentHash + RIP], 0x00ADA0241   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCreateResourceReserve:
    mov dword ptr [currentHash + RIP], 0x010A10C1B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCreateSectionView:
    mov dword ptr [currentHash + RIP], 0x0148C7113   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcCreateSecurityContext:
    mov dword ptr [currentHash + RIP], 0x008B21F3A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcDeletePortSection:
    mov dword ptr [currentHash + RIP], 0x0E157C602   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcDeleteResourceReserve:
    mov dword ptr [currentHash + RIP], 0x028A8D4F3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcDeleteSectionView:
    mov dword ptr [currentHash + RIP], 0x086B7571D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcDeleteSecurityContext:
    mov dword ptr [currentHash + RIP], 0x0EE960206   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcDisconnectPort:
    mov dword ptr [currentHash + RIP], 0x0A6F2A060   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcImpersonateClientContainerOfPort:
    mov dword ptr [currentHash + RIP], 0x020B3C728   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcImpersonateClientOfPort:
    mov dword ptr [currentHash + RIP], 0x0D44DC7E2   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcOpenSenderProcess:
    mov dword ptr [currentHash + RIP], 0x0EFBB2DEB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcOpenSenderThread:
    mov dword ptr [currentHash + RIP], 0x0A805BAAB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcQueryInformation:
    mov dword ptr [currentHash + RIP], 0x09D44BDCA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcQueryInformationMessage:
    mov dword ptr [currentHash + RIP], 0x0C751C6EA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcRevokeSecurityContext:
    mov dword ptr [currentHash + RIP], 0x0D742F2D3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcSendWaitReceivePort:
    mov dword ptr [currentHash + RIP], 0x022B23B36   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAlpcSetInformation:
    mov dword ptr [currentHash + RIP], 0x000E80279   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAreMappedFilesTheSame:
    mov dword ptr [currentHash + RIP], 0x0F7D4DA63   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAssignProcessToJobObject:
    mov dword ptr [currentHash + RIP], 0x0301C1B43   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAssociateWaitCompletionPacket:
    mov dword ptr [currentHash + RIP], 0x0073C3780   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCallEnclave:
    mov dword ptr [currentHash + RIP], 0x022D31278   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelIoFileEx:
    mov dword ptr [currentHash + RIP], 0x0C73D0B79   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelSynchronousIoFile:
    mov dword ptr [currentHash + RIP], 0x026A60A20   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelTimer2:
    mov dword ptr [currentHash + RIP], 0x0C40A1C84   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelWaitCompletionPacket:
    mov dword ptr [currentHash + RIP], 0x007833D0C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCommitComplete:
    mov dword ptr [currentHash + RIP], 0x0DA2BF4A0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCommitEnlistment:
    mov dword ptr [currentHash + RIP], 0x059009E53   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCommitRegistryTransaction:
    mov dword ptr [currentHash + RIP], 0x04E810C51   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCommitTransaction:
    mov dword ptr [currentHash + RIP], 0x03852F60F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompactKeys:
    mov dword ptr [currentHash + RIP], 0x043B77820   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompareObjects:
    mov dword ptr [currentHash + RIP], 0x09226A562   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompareSigningLevels:
    mov dword ptr [currentHash + RIP], 0x070EA917E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompareTokens:
    mov dword ptr [currentHash + RIP], 0x079D57755   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompleteConnectPort:
    mov dword ptr [currentHash + RIP], 0x020B63D38   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCompressKey:
    mov dword ptr [currentHash + RIP], 0x0ABD1AA4E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtConnectPort:
    mov dword ptr [currentHash + RIP], 0x07EA87B3A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtConvertBetweenAuxiliaryCounterAndPerformanceCounter:
    mov dword ptr [currentHash + RIP], 0x07FCC111D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateDebugObject:
    mov dword ptr [currentHash + RIP], 0x070584915   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateDirectoryObject:
    mov dword ptr [currentHash + RIP], 0x0BB91A91F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateDirectoryObjectEx:
    mov dword ptr [currentHash + RIP], 0x0AC89F658   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateEnclave:
    mov dword ptr [currentHash + RIP], 0x0EC551C48   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateEnlistment:
    mov dword ptr [currentHash + RIP], 0x025982E1F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateEventPair:
    mov dword ptr [currentHash + RIP], 0x01696320B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateIRTimer:
    mov dword ptr [currentHash + RIP], 0x0CD9BFD38   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateIoCompletion:
    mov dword ptr [currentHash + RIP], 0x0C6B02420   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateJobObject:
    mov dword ptr [currentHash + RIP], 0x03C9D04D1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateJobSet:
    mov dword ptr [currentHash + RIP], 0x020AE760D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateKeyTransacted:
    mov dword ptr [currentHash + RIP], 0x0121EF303   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateKeyedEvent:
    mov dword ptr [currentHash + RIP], 0x0C1AB2FB6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateLowBoxToken:
    mov dword ptr [currentHash + RIP], 0x04F946DC4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateMailslotFile:
    mov dword ptr [currentHash + RIP], 0x0243DCA3E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateMutant:
    mov dword ptr [currentHash + RIP], 0x0DDB3BE64   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateNamedPipeFile:
    mov dword ptr [currentHash + RIP], 0x02ABD122A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreatePagingFile:
    mov dword ptr [currentHash + RIP], 0x05CCB5E52   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreatePartition:
    mov dword ptr [currentHash + RIP], 0x015A0694A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreatePort:
    mov dword ptr [currentHash + RIP], 0x002881B06   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreatePrivateNamespace:
    mov dword ptr [currentHash + RIP], 0x09DBE43FF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateProcess:
    mov dword ptr [currentHash + RIP], 0x029B92F28   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateProfile:
    mov dword ptr [currentHash + RIP], 0x026BE292C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateProfileEx:
    mov dword ptr [currentHash + RIP], 0x00D934B4E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateRegistryTransaction:
    mov dword ptr [currentHash + RIP], 0x0CF54CBC6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateResourceManager:
    mov dword ptr [currentHash + RIP], 0x0183CC170   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateSemaphore:
    mov dword ptr [currentHash + RIP], 0x0085A7AB2   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateSymbolicLinkObject:
    mov dword ptr [currentHash + RIP], 0x0F2D8DC65   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateThreadEx:
    mov dword ptr [currentHash + RIP], 0x044BC86C6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateTimer:
    mov dword ptr [currentHash + RIP], 0x00350DD10   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateTimer2:
    mov dword ptr [currentHash + RIP], 0x01353BA0D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateToken:
    mov dword ptr [currentHash + RIP], 0x0C75AF5FA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateTokenEx:
    mov dword ptr [currentHash + RIP], 0x03AA0F7E5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateTransaction:
    mov dword ptr [currentHash + RIP], 0x046CD4267   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateTransactionManager:
    mov dword ptr [currentHash + RIP], 0x0172507A4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateUserProcess:
    mov dword ptr [currentHash + RIP], 0x0398A3A14   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateWaitCompletionPacket:
    mov dword ptr [currentHash + RIP], 0x0A99DD171   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateWaitablePort:
    mov dword ptr [currentHash + RIP], 0x0E673E1E0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateWnfStateName:
    mov dword ptr [currentHash + RIP], 0x0148A2D1F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateWorkerFactory:
    mov dword ptr [currentHash + RIP], 0x0BEAED64F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDebugActiveProcess:
    mov dword ptr [currentHash + RIP], 0x07E3097AC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDebugContinue:
    mov dword ptr [currentHash + RIP], 0x030244728   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteAtom:
    mov dword ptr [currentHash + RIP], 0x054C15756   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteBootEntry:
    mov dword ptr [currentHash + RIP], 0x009950306   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteDriverEntry:
    mov dword ptr [currentHash + RIP], 0x0CB97FF2A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteFile:
    mov dword ptr [currentHash + RIP], 0x014B25392   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteKey:
    mov dword ptr [currentHash + RIP], 0x069D34C78   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteObjectAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x07AA47C30   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeletePrivateNamespace:
    mov dword ptr [currentHash + RIP], 0x06ACC6F55   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteValueKey:
    mov dword ptr [currentHash + RIP], 0x02A9F0905   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteWnfStateData:
    mov dword ptr [currentHash + RIP], 0x002C292F0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDeleteWnfStateName:
    mov dword ptr [currentHash + RIP], 0x076B8FD9B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDisableLastKnownGood:
    mov dword ptr [currentHash + RIP], 0x07BAA4570   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDisplayString:
    mov dword ptr [currentHash + RIP], 0x0FEA3D422   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtDrawText:
    mov dword ptr [currentHash + RIP], 0x012AB093C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnableLastKnownGood:
    mov dword ptr [currentHash + RIP], 0x0E47B9E7D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateBootEntries:
    mov dword ptr [currentHash + RIP], 0x018CD1B51   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateDriverEntries:
    mov dword ptr [currentHash + RIP], 0x0E8DC14B4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateSystemEnvironmentValuesEx:
    mov dword ptr [currentHash + RIP], 0x01D90CDC8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtEnumerateTransactionObject:
    mov dword ptr [currentHash + RIP], 0x01935E84B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtExtendSection:
    mov dword ptr [currentHash + RIP], 0x03368ECC1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFilterBootOption:
    mov dword ptr [currentHash + RIP], 0x00CA6CEF6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFilterToken:
    mov dword ptr [currentHash + RIP], 0x06420B86E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFilterTokenEx:
    mov dword ptr [currentHash + RIP], 0x0A64FA2F0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushBuffersFileEx:
    mov dword ptr [currentHash + RIP], 0x0AA399A81   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushInstallUILanguage:
    mov dword ptr [currentHash + RIP], 0x0BB895C88   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushInstructionCache:
    mov dword ptr [currentHash + RIP], 0x08B588FF9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushKey:
    mov dword ptr [currentHash + RIP], 0x01C1F79E3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushProcessWriteBuffers:
    mov dword ptr [currentHash + RIP], 0x000BF0C2E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x0C9D12CBE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFlushWriteBuffer:
    mov dword ptr [currentHash + RIP], 0x0831AAD8B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFreeUserPhysicalPages:
    mov dword ptr [currentHash + RIP], 0x081BCB61C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFreezeRegistry:
    mov dword ptr [currentHash + RIP], 0x0008B0607   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtFreezeTransactions:
    mov dword ptr [currentHash + RIP], 0x04F9D3777   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetCachedSigningLevel:
    mov dword ptr [currentHash + RIP], 0x0B67AF0C0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetCompleteWnfStateSubscription:
    mov dword ptr [currentHash + RIP], 0x03CB13C23   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetContextThread:
    mov dword ptr [currentHash + RIP], 0x0F4C8FE5F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetCurrentProcessorNumber:
    mov dword ptr [currentHash + RIP], 0x0D7B2C512   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetCurrentProcessorNumberEx:
    mov dword ptr [currentHash + RIP], 0x010AFC3F5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetDevicePowerState:
    mov dword ptr [currentHash + RIP], 0x036B61836   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetMUIRegistryInfo:
    mov dword ptr [currentHash + RIP], 0x06A10444F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetNextProcess:
    mov dword ptr [currentHash + RIP], 0x0015FE333   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetNextThread:
    mov dword ptr [currentHash + RIP], 0x0306C32D5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetNlsSectionPtr:
    mov dword ptr [currentHash + RIP], 0x03E16219F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetNotificationResourceManager:
    mov dword ptr [currentHash + RIP], 0x00F9F6B42   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetWriteWatch:
    mov dword ptr [currentHash + RIP], 0x0AD6FD7FD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtImpersonateAnonymousToken:
    mov dword ptr [currentHash + RIP], 0x03016E42C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtImpersonateThread:
    mov dword ptr [currentHash + RIP], 0x0328E1037   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtInitializeEnclave:
    mov dword ptr [currentHash + RIP], 0x0F0AEDA22   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtInitializeNlsFiles:
    mov dword ptr [currentHash + RIP], 0x01317DD54   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtInitializeRegistry:
    mov dword ptr [currentHash + RIP], 0x02C8C342B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtInitiatePowerAction:
    mov dword ptr [currentHash + RIP], 0x00EA16475   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtIsSystemResumeAutomatic:
    mov dword ptr [currentHash + RIP], 0x086887393   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtIsUILanguageComitted:
    mov dword ptr [currentHash + RIP], 0x063861293   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtListenPort:
    mov dword ptr [currentHash + RIP], 0x0A4AEA130   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadDriver:
    mov dword ptr [currentHash + RIP], 0x05CD7764C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadEnclaveData:
    mov dword ptr [currentHash + RIP], 0x0F303C9D9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadHotPatch:
    mov dword ptr [currentHash + RIP], 0x09EAF9630   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadKey:
    mov dword ptr [currentHash + RIP], 0x05BE25E61   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadKey2:
    mov dword ptr [currentHash + RIP], 0x03AB9CE3F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLoadKeyEx:
    mov dword ptr [currentHash + RIP], 0x00584FD84   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLockFile:
    mov dword ptr [currentHash + RIP], 0x0E038E8AA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLockProductActivationKeys:
    mov dword ptr [currentHash + RIP], 0x0E742ECD4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLockRegistryKey:
    mov dword ptr [currentHash + RIP], 0x06DCB5C4C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtLockVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x031B4D4DB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMakePermanentObject:
    mov dword ptr [currentHash + RIP], 0x012017ADC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMakeTemporaryObject:
    mov dword ptr [currentHash + RIP], 0x006DD7E31   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtManagePartition:
    mov dword ptr [currentHash + RIP], 0x0868D8118   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMapCMFModule:
    mov dword ptr [currentHash + RIP], 0x068265372   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMapUserPhysicalPages:
    mov dword ptr [currentHash + RIP], 0x08DB5F64E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMapViewOfSectionEx:
    mov dword ptr [currentHash + RIP], 0x060D329E2   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtModifyBootEntry:
    mov dword ptr [currentHash + RIP], 0x009803938   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtModifyDriverEntry:
    mov dword ptr [currentHash + RIP], 0x009983950   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtNotifyChangeDirectoryFile:
    mov dword ptr [currentHash + RIP], 0x0BC3BAC80   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtNotifyChangeDirectoryFileEx:
    mov dword ptr [currentHash + RIP], 0x080BBC407   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtNotifyChangeKey:
    mov dword ptr [currentHash + RIP], 0x0859A6385   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtNotifyChangeMultipleKeys:
    mov dword ptr [currentHash + RIP], 0x08794009F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtNotifyChangeSession:
    mov dword ptr [currentHash + RIP], 0x001D750F4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenEnlistment:
    mov dword ptr [currentHash + RIP], 0x049CB7C4D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenEventPair:
    mov dword ptr [currentHash + RIP], 0x0C292C607   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenIoCompletion:
    mov dword ptr [currentHash + RIP], 0x0148235D1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenJobObject:
    mov dword ptr [currentHash + RIP], 0x082A050FD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenKeyEx:
    mov dword ptr [currentHash + RIP], 0x0765A9025   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenKeyTransacted:
    mov dword ptr [currentHash + RIP], 0x0DCBCEE62   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenKeyTransactedEx:
    mov dword ptr [currentHash + RIP], 0x026DFE061   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenKeyedEvent:
    mov dword ptr [currentHash + RIP], 0x0C88A2AFD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenMutant:
    mov dword ptr [currentHash + RIP], 0x072E27B7E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenObjectAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x00A85261A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenPartition:
    mov dword ptr [currentHash + RIP], 0x0B4AA53BA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenPrivateNamespace:
    mov dword ptr [currentHash + RIP], 0x01EAE213C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenProcessToken:
    mov dword ptr [currentHash + RIP], 0x0E5219BE2   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenRegistryTransaction:
    mov dword ptr [currentHash + RIP], 0x01E40D914   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenResourceManager:
    mov dword ptr [currentHash + RIP], 0x0259D313C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenSemaphore:
    mov dword ptr [currentHash + RIP], 0x04E9A9322   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenSession:
    mov dword ptr [currentHash + RIP], 0x0EBCD17AE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenSymbolicLinkObject:
    mov dword ptr [currentHash + RIP], 0x00FA1372C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenThread:
    mov dword ptr [currentHash + RIP], 0x002315609   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenTimer:
    mov dword ptr [currentHash + RIP], 0x06A52E243   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenTransaction:
    mov dword ptr [currentHash + RIP], 0x0E8C19E25   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtOpenTransactionManager:
    mov dword ptr [currentHash + RIP], 0x03DA6D7BA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPlugPlayControl:
    mov dword ptr [currentHash + RIP], 0x04F184BF3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrePrepareComplete:
    mov dword ptr [currentHash + RIP], 0x02ED3C45C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrePrepareEnlistment:
    mov dword ptr [currentHash + RIP], 0x0D9BEC63D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrepareComplete:
    mov dword ptr [currentHash + RIP], 0x0089003FE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrepareEnlistment:
    mov dword ptr [currentHash + RIP], 0x0B629CDDE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrivilegeCheck:
    mov dword ptr [currentHash + RIP], 0x00AA6F9F8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrivilegeObjectAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x010AEEAC2   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPrivilegedServiceAuditAlarm:
    mov dword ptr [currentHash + RIP], 0x0905F1D46   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPropagationComplete:
    mov dword ptr [currentHash + RIP], 0x01CB9FEF6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPropagationFailed:
    mov dword ptr [currentHash + RIP], 0x09E997DC7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPulseEvent:
    mov dword ptr [currentHash + RIP], 0x0F64AC7EC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryAuxiliaryCounterFrequency:
    mov dword ptr [currentHash + RIP], 0x03BB11617   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryBootEntryOrder:
    mov dword ptr [currentHash + RIP], 0x087AE138D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryBootOptions:
    mov dword ptr [currentHash + RIP], 0x0C5A93FC1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDebugFilterState:
    mov dword ptr [currentHash + RIP], 0x0F6B518F4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDirectoryFileEx:
    mov dword ptr [currentHash + RIP], 0x02C37108C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDirectoryObject:
    mov dword ptr [currentHash + RIP], 0x0163D38A6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryDriverEntryOrder:
    mov dword ptr [currentHash + RIP], 0x0B3869513   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryEaFile:
    mov dword ptr [currentHash + RIP], 0x06432B598   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryFullAttributesFile:
    mov dword ptr [currentHash + RIP], 0x01C7DC8CE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationAtom:
    mov dword ptr [currentHash + RIP], 0x0A938CD31   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationByName:
    mov dword ptr [currentHash + RIP], 0x0F42B87FD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationEnlistment:
    mov dword ptr [currentHash + RIP], 0x0D448F7DE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationJobObject:
    mov dword ptr [currentHash + RIP], 0x072508F50   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationPort:
    mov dword ptr [currentHash + RIP], 0x0E579FCD7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationResourceManager:
    mov dword ptr [currentHash + RIP], 0x0E7577177   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationTransaction:
    mov dword ptr [currentHash + RIP], 0x002172C8F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationTransactionManager:
    mov dword ptr [currentHash + RIP], 0x0C5992AE5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInformationWorkerFactory:
    mov dword ptr [currentHash + RIP], 0x0FC95CA39   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryInstallUILanguage:
    mov dword ptr [currentHash + RIP], 0x01342D01A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryIntervalProfile:
    mov dword ptr [currentHash + RIP], 0x028A07664   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryIoCompletion:
    mov dword ptr [currentHash + RIP], 0x09F36A3B4   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryLicenseValue:
    mov dword ptr [currentHash + RIP], 0x0B421DA2A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryMultipleValueKey:
    mov dword ptr [currentHash + RIP], 0x04195622C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryMutant:
    mov dword ptr [currentHash + RIP], 0x0F453CDE6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryOpenSubKeys:
    mov dword ptr [currentHash + RIP], 0x08AD0A572   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryOpenSubKeysEx:
    mov dword ptr [currentHash + RIP], 0x0AFA3F576   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryPortInformationProcess:
    mov dword ptr [currentHash + RIP], 0x041D4444C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryQuotaInformationFile:
    mov dword ptr [currentHash + RIP], 0x0BAB944BA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySecurityAttributesToken:
    mov dword ptr [currentHash + RIP], 0x032153A8F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySecurityObject:
    mov dword ptr [currentHash + RIP], 0x036AB5EB7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySecurityPolicy:
    mov dword ptr [currentHash + RIP], 0x03C8B013F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySemaphore:
    mov dword ptr [currentHash + RIP], 0x043560DF0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySymbolicLinkObject:
    mov dword ptr [currentHash + RIP], 0x01435FC29   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySystemEnvironmentValue:
    mov dword ptr [currentHash + RIP], 0x0FC20F3C0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySystemEnvironmentValueEx:
    mov dword ptr [currentHash + RIP], 0x0FFE0FB5C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySystemInformationEx:
    mov dword ptr [currentHash + RIP], 0x0969554AE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryTimerResolution:
    mov dword ptr [currentHash + RIP], 0x048D26801   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryWnfStateData:
    mov dword ptr [currentHash + RIP], 0x062FB700A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueryWnfStateNameInformation:
    mov dword ptr [currentHash + RIP], 0x0DE44DED7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQueueApcThreadEx:
    mov dword ptr [currentHash + RIP], 0x02A3E6884   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRaiseException:
    mov dword ptr [currentHash + RIP], 0x0C149205A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRaiseHardError:
    mov dword ptr [currentHash + RIP], 0x007982B3B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReadOnlyEnlistment:
    mov dword ptr [currentHash + RIP], 0x00FA90E3B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRecoverEnlistment:
    mov dword ptr [currentHash + RIP], 0x09B359EA3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRecoverResourceManager:
    mov dword ptr [currentHash + RIP], 0x06833B099   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRecoverTransactionManager:
    mov dword ptr [currentHash + RIP], 0x03FA81530   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRegisterProtocolAddressInformation:
    mov dword ptr [currentHash + RIP], 0x0180F7E1F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRegisterThreadTerminatePort:
    mov dword ptr [currentHash + RIP], 0x020B2C6E0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReleaseKeyedEvent:
    mov dword ptr [currentHash + RIP], 0x0CE4EDBCC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReleaseWorkerFactoryWorker:
    mov dword ptr [currentHash + RIP], 0x0F86DD6B5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRemoveIoCompletionEx:
    mov dword ptr [currentHash + RIP], 0x08416B2A8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRemoveProcessDebug:
    mov dword ptr [currentHash + RIP], 0x0AA3A6912   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRenameKey:
    mov dword ptr [currentHash + RIP], 0x03AF26529   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRenameTransactionManager:
    mov dword ptr [currentHash + RIP], 0x0C79EDC37   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplaceKey:
    mov dword ptr [currentHash + RIP], 0x08AD7A178   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplacePartitionUnit:
    mov dword ptr [currentHash + RIP], 0x026332AA8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReplyWaitReplyPort:
    mov dword ptr [currentHash + RIP], 0x0A0358FAE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRequestPort:
    mov dword ptr [currentHash + RIP], 0x0E97EF6F5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtResetEvent:
    mov dword ptr [currentHash + RIP], 0x0CF127F37   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtResetWriteWatch:
    mov dword ptr [currentHash + RIP], 0x0C2B1C912   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRestoreKey:
    mov dword ptr [currentHash + RIP], 0x096A2F748   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtResumeProcess:
    mov dword ptr [currentHash + RIP], 0x0722C69A1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRevertContainerImpersonation:
    mov dword ptr [currentHash + RIP], 0x0452E49BD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollbackComplete:
    mov dword ptr [currentHash + RIP], 0x0273ABE04   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollbackEnlistment:
    mov dword ptr [currentHash + RIP], 0x07E421BDA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollbackRegistryTransaction:
    mov dword ptr [currentHash + RIP], 0x00CFE1673   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollbackTransaction:
    mov dword ptr [currentHash + RIP], 0x0920A969B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollforwardTransactionManager:
    mov dword ptr [currentHash + RIP], 0x0160644C7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSaveKey:
    mov dword ptr [currentHash + RIP], 0x01682C8D5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSaveKeyEx:
    mov dword ptr [currentHash + RIP], 0x0C457E3E8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSaveMergedKeys:
    mov dword ptr [currentHash + RIP], 0x067FC6274   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSecureConnectPort:
    mov dword ptr [currentHash + RIP], 0x0608E592C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSerializeBoot:
    mov dword ptr [currentHash + RIP], 0x072E24C61   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetBootEntryOrder:
    mov dword ptr [currentHash + RIP], 0x033B61D2B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetBootOptions:
    mov dword ptr [currentHash + RIP], 0x05387591B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetCachedSigningLevel:
    mov dword ptr [currentHash + RIP], 0x02ABAA598   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetCachedSigningLevel2:
    mov dword ptr [currentHash + RIP], 0x0B29040B5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetContextThread:
    mov dword ptr [currentHash + RIP], 0x03CBCE60A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetDebugFilterState:
    mov dword ptr [currentHash + RIP], 0x03290DBDE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetDefaultHardErrorPort:
    mov dword ptr [currentHash + RIP], 0x0257724E9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetDefaultLocale:
    mov dword ptr [currentHash + RIP], 0x08D2C8599   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetDefaultUILanguage:
    mov dword ptr [currentHash + RIP], 0x08B35AB6E   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetDriverEntryOrder:
    mov dword ptr [currentHash + RIP], 0x095AEE742   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetEaFile:
    mov dword ptr [currentHash + RIP], 0x0E138E9DD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetHighEventPair:
    mov dword ptr [currentHash + RIP], 0x060D47A71   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetHighWaitLowEventPair:
    mov dword ptr [currentHash + RIP], 0x090B19827   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetIRTimer:
    mov dword ptr [currentHash + RIP], 0x08FA8F140   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationDebugObject:
    mov dword ptr [currentHash + RIP], 0x0071D79EF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationEnlistment:
    mov dword ptr [currentHash + RIP], 0x00E56E804   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationJobObject:
    mov dword ptr [currentHash + RIP], 0x073569D24   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationKey:
    mov dword ptr [currentHash + RIP], 0x0020837B5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationResourceManager:
    mov dword ptr [currentHash + RIP], 0x0FD9309EA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationSymbolicLink:
    mov dword ptr [currentHash + RIP], 0x0AE3BA6AE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationToken:
    mov dword ptr [currentHash + RIP], 0x0AF9FF534   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationTransaction:
    mov dword ptr [currentHash + RIP], 0x0108A361B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationTransactionManager:
    mov dword ptr [currentHash + RIP], 0x0725FEC74   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x019901313   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationWorkerFactory:
    mov dword ptr [currentHash + RIP], 0x00A8E1816   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetIntervalProfile:
    mov dword ptr [currentHash + RIP], 0x03499AE98   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetIoCompletion:
    mov dword ptr [currentHash + RIP], 0x09681921B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetIoCompletionEx:
    mov dword ptr [currentHash + RIP], 0x0989A24BE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetLdtEntries:
    mov dword ptr [currentHash + RIP], 0x0B91DBA86   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetLowEventPair:
    mov dword ptr [currentHash + RIP], 0x010B7C4F1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetLowWaitHighEventPair:
    mov dword ptr [currentHash + RIP], 0x0E4D1D40C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetQuotaInformationFile:
    mov dword ptr [currentHash + RIP], 0x068FEA148   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSecurityObject:
    mov dword ptr [currentHash + RIP], 0x01A2464D9   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSystemEnvironmentValue:
    mov dword ptr [currentHash + RIP], 0x0C256ED92   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSystemEnvironmentValueEx:
    mov dword ptr [currentHash + RIP], 0x02FC4F2A1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSystemInformation:
    mov dword ptr [currentHash + RIP], 0x09C069A9F   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSystemPowerState:
    mov dword ptr [currentHash + RIP], 0x01F3D8800   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetSystemTime:
    mov dword ptr [currentHash + RIP], 0x094B3C98B   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetThreadExecutionState:
    mov dword ptr [currentHash + RIP], 0x000BA2834   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetTimer2:
    mov dword ptr [currentHash + RIP], 0x011A97007   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetTimerEx:
    mov dword ptr [currentHash + RIP], 0x030B7726C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetTimerResolution:
    mov dword ptr [currentHash + RIP], 0x0D649F6D7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetUuidSeed:
    mov dword ptr [currentHash + RIP], 0x0158DD430   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetVolumeInformationFile:
    mov dword ptr [currentHash + RIP], 0x0D8CB47F8   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetWnfProcessNotificationEvent:
    mov dword ptr [currentHash + RIP], 0x03E941334   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtShutdownSystem:
    mov dword ptr [currentHash + RIP], 0x0068CFEC7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtShutdownWorkerFactory:
    mov dword ptr [currentHash + RIP], 0x00898362C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSignalAndWaitForSingleObject:
    mov dword ptr [currentHash + RIP], 0x000BE0E03   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSinglePhaseReject:
    mov dword ptr [currentHash + RIP], 0x01AA13E39   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtStartProfile:
    mov dword ptr [currentHash + RIP], 0x0289C722C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtStopProfile:
    mov dword ptr [currentHash + RIP], 0x0C88938DF   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSubscribeWnfStateChange:
    mov dword ptr [currentHash + RIP], 0x022A16304   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSuspendProcess:
    mov dword ptr [currentHash + RIP], 0x0519C7000   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSuspendThread:
    mov dword ptr [currentHash + RIP], 0x03A1F24BD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSystemDebugControl:
    mov dword ptr [currentHash + RIP], 0x0C09EC476   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTerminateEnclave:
    mov dword ptr [currentHash + RIP], 0x0EE33C6FE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTerminateJobObject:
    mov dword ptr [currentHash + RIP], 0x0BAB8B224   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTestAlert:
    mov dword ptr [currentHash + RIP], 0x04ED13358   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtThawRegistry:
    mov dword ptr [currentHash + RIP], 0x006EF4E21   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtThawTransactions:
    mov dword ptr [currentHash + RIP], 0x00796193D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTraceControl:
    mov dword ptr [currentHash + RIP], 0x0DF8A2BDD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtTranslateFilePath:
    mov dword ptr [currentHash + RIP], 0x0FA3081FC   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUmsThreadYield:
    mov dword ptr [currentHash + RIP], 0x0F85A28EE   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnloadDriver:
    mov dword ptr [currentHash + RIP], 0x0D69F05C1   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnloadKey:
    mov dword ptr [currentHash + RIP], 0x0EA3E8DCD   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnloadKey2:
    mov dword ptr [currentHash + RIP], 0x027D4615C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnloadKeyEx:
    mov dword ptr [currentHash + RIP], 0x067F32B36   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnlockFile:
    mov dword ptr [currentHash + RIP], 0x0903DC0F6   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnlockVirtualMemory:
    mov dword ptr [currentHash + RIP], 0x098118E80   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnmapViewOfSectionEx:
    mov dword ptr [currentHash + RIP], 0x0F29131EB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUnsubscribeWnfStateChange:
    mov dword ptr [currentHash + RIP], 0x050CE5756   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtUpdateWnfStateData:
    mov dword ptr [currentHash + RIP], 0x0DEDCEA46   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtVdmControl:
    mov dword ptr [currentHash + RIP], 0x0BD9039A7   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForAlertByThreadId:
    mov dword ptr [currentHash + RIP], 0x0143F7CCA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForDebugEvent:
    mov dword ptr [currentHash + RIP], 0x090B06FDA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForKeyedEvent:
    mov dword ptr [currentHash + RIP], 0x0D08A3618   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForWorkViaWorkerFactory:
    mov dword ptr [currentHash + RIP], 0x0C89DE634   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitHighEventPair:
    mov dword ptr [currentHash + RIP], 0x0A31DBFB0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitLowEventPair:
    mov dword ptr [currentHash + RIP], 0x050B3B4E5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtAcquireCMFViewOwnership:
    mov dword ptr [currentHash + RIP], 0x0FA6D1A7A   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCancelDeviceWakeupRequest:
    mov dword ptr [currentHash + RIP], 0x033EDFBB0   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtClearAllSavepointsTransaction:
    mov dword ptr [currentHash + RIP], 0x00294280D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtClearSavepointTransaction:
    mov dword ptr [currentHash + RIP], 0x01288301D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRollbackSavepointTransaction:
    mov dword ptr [currentHash + RIP], 0x0CB28EFBA   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSavepointTransaction:
    mov dword ptr [currentHash + RIP], 0x0009A27CB   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSavepointComplete:
    mov dword ptr [currentHash + RIP], 0x02AB2163C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateSectionEx:
    mov dword ptr [currentHash + RIP], 0x0F8993BC3   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtCreateCrossVmEvent:
    mov dword ptr [currentHash + RIP], 0x092CDBB10   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtGetPlugPlayEvent:
    mov dword ptr [currentHash + RIP], 0x008858F96   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtListTransactions:
    mov dword ptr [currentHash + RIP], 0x00D982B33   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtMarshallTransaction:
    mov dword ptr [currentHash + RIP], 0x02A6FF427   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtPullTransaction:
    mov dword ptr [currentHash + RIP], 0x0898FA91D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtReleaseCMFViewOwnership:
    mov dword ptr [currentHash + RIP], 0x00D95254D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtWaitForWnfNotifications:
    mov dword ptr [currentHash + RIP], 0x00D97290D   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtStartTm:
    mov dword ptr [currentHash + RIP], 0x021F27B5C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtSetInformationProcess:
    mov dword ptr [currentHash + RIP], 0x0922881A5   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRequestDeviceWakeup:
    mov dword ptr [currentHash + RIP], 0x003AF3904   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtRequestWakeupLatency:
    mov dword ptr [currentHash + RIP], 0x03285536C   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtQuerySystemTime:
    mov dword ptr [currentHash + RIP], 0x07EB95963   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtManageHotPatch:
    mov dword ptr [currentHash + RIP], 0x01321D914   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


NtContinueEx:
    mov dword ptr [currentHash + RIP], 0x0F7CEB332   # Load function hash into global variable.
    call WhisperMain                           # Resolve function hash into syscall number and make the call


