.686
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 

.data
stubReturn      dd 0
returnAddress   dd 0
espBookmark     dd 0
syscallNumber   dd 0
syscallAddress  dd 0

.code

EXTERN SW2_GetSyscallNumber: PROC
EXTERN SW2_GetRandomSyscallAddress: PROC

WhisperMain PROC
    pop eax                                 ; Remove return address from CALL instruction
    mov dword ptr [stubReturn], eax         ; Save the return address to the stub
    push esp
    pop eax
    add eax, 04h
    push dword ptr [eax]
    pop returnAddress                       ; Save the original return address
    add eax, 04h
    push eax
    pop espBookmark                         ; Save original ESP
    call SW2_GetSyscallNumber               ; Resolve function hash into syscall number
    add esp, 4                              ; Restore ESP
    mov dword ptr [syscallNumber], eax      ; Save the syscall number
    xor eax, eax
    mov ecx, fs:[0c0h]
    test ecx, ecx
    je _x86
    inc eax
_x86: 
    push eax                                ; Push 0 for x86, 1 for Wow64
    lea edx, dword ptr [esp+04h]
    call SW2_GetRandomSyscallAddress        ; Get a memory address of random syscall
    mov dword ptr [syscallAddress], eax     ; Save the address
    mov esp, dword ptr [espBookmark]        ; Restore ESP
    mov eax, dword ptr [syscallNumber]      ; Restore the syscall number
    call dword ptr syscallAddress           ; Call the random syscall
    mov esp, dword ptr [espBookmark]        ; Restore ESP
    push dword ptr [returnAddress]          ; Restore the return address
    ret
WhisperMain ENDP

NtAccessCheck PROC
    push 000D84B05h
    call WhisperMain
NtAccessCheck ENDP

NtWorkerFactoryWorkerReady PROC
    push 09FA1B93Ch
    call WhisperMain
NtWorkerFactoryWorkerReady ENDP

NtAcceptConnectPort PROC
    push 024B2213Ch
    call WhisperMain
NtAcceptConnectPort ENDP

NtMapUserPhysicalPagesScatter PROC
    push 027822D1Fh
    call WhisperMain
NtMapUserPhysicalPagesScatter ENDP

NtWaitForSingleObject PROC
    push 0A698B634h
    call WhisperMain
NtWaitForSingleObject ENDP

NtCallbackReturn PROC
    push 046DA6906h
    call WhisperMain
NtCallbackReturn ENDP

NtReadFile PROC
    push 02D78E329h
    call WhisperMain
NtReadFile ENDP

NtDeviceIoControlFile PROC
    push 05CBC501Eh
    call WhisperMain
NtDeviceIoControlFile ENDP

NtWriteFile PROC
    push 0C159CE3Bh
    call WhisperMain
NtWriteFile ENDP

NtRemoveIoCompletion PROC
    push 00689869Fh
    call WhisperMain
NtRemoveIoCompletion ENDP

NtReleaseSemaphore PROC
    push 04C1E34C0h
    call WhisperMain
NtReleaseSemaphore ENDP

NtReplyWaitReceivePort PROC
    push 061729E19h
    call WhisperMain
NtReplyWaitReceivePort ENDP

NtReplyPort PROC
    push 0A133CB2Dh
    call WhisperMain
NtReplyPort ENDP

NtSetInformationThread PROC
    push 0882FC281h
    call WhisperMain
NtSetInformationThread ENDP

NtSetEvent PROC
    push 0DD40C0C9h
    call WhisperMain
NtSetEvent ENDP

NtClose PROC
    push 0489CDDA5h
    call WhisperMain
NtClose ENDP

NtQueryObject PROC
    push 0FA54F6FBh
    call WhisperMain
NtQueryObject ENDP

NtQueryInformationFile PROC
    push 0F9781779h
    call WhisperMain
NtQueryInformationFile ENDP

NtOpenKey PROC
    push 00466E83Ch
    call WhisperMain
NtOpenKey ENDP

NtEnumerateValueKey PROC
    push 02A5F37CAh
    call WhisperMain
NtEnumerateValueKey ENDP

NtFindAtom PROC
    push 0B5238AA1h
    call WhisperMain
NtFindAtom ENDP

NtQueryDefaultLocale PROC
    push 0A3237C62h
    call WhisperMain
NtQueryDefaultLocale ENDP

NtQueryKey PROC
    push 092A6AF1Ch
    call WhisperMain
NtQueryKey ENDP

NtQueryValueKey PROC
    push 0B9099CAAh
    call WhisperMain
NtQueryValueKey ENDP

NtAllocateVirtualMemory PROC
    push 09790911Fh
    call WhisperMain
NtAllocateVirtualMemory ENDP

NtQueryInformationProcess PROC
    push 0612F4AB0h
    call WhisperMain
NtQueryInformationProcess ENDP

NtWaitForMultipleObjects32 PROC
    push 016CA3625h
    call WhisperMain
NtWaitForMultipleObjects32 ENDP

NtWriteFileGather PROC
    push 03A24D23Eh
    call WhisperMain
NtWriteFileGather ENDP

NtCreateKey PROC
    push 07E814F3Bh
    call WhisperMain
NtCreateKey ENDP

NtFreeVirtualMemory PROC
    push 0C596A942h
    call WhisperMain
NtFreeVirtualMemory ENDP

NtImpersonateClientOfPort PROC
    push 0783265BCh
    call WhisperMain
NtImpersonateClientOfPort ENDP

NtReleaseMutant PROC
    push 03BBC3426h
    call WhisperMain
NtReleaseMutant ENDP

NtQueryInformationToken PROC
    push 0A17ECBFAh
    call WhisperMain
NtQueryInformationToken ENDP

NtRequestWaitReplyPort PROC
    push 02DB14823h
    call WhisperMain
NtRequestWaitReplyPort ENDP

NtQueryVirtualMemory PROC
    push 039D0395Fh
    call WhisperMain
NtQueryVirtualMemory ENDP

NtOpenThreadToken PROC
    push 01D840F08h
    call WhisperMain
NtOpenThreadToken ENDP

NtQueryInformationThread PROC
    push 02E8A3C3Bh
    call WhisperMain
NtQueryInformationThread ENDP

NtOpenProcess PROC
    push 0BE20A5ACh
    call WhisperMain
NtOpenProcess ENDP

NtSetInformationFile PROC
    push 0B63F582Ch
    call WhisperMain
NtSetInformationFile ENDP

NtMapViewOfSection PROC
    push 046EA2639h
    call WhisperMain
NtMapViewOfSection ENDP

NtAccessCheckAndAuditAlarm PROC
    push 018BE1A52h
    call WhisperMain
NtAccessCheckAndAuditAlarm ENDP

NtUnmapViewOfSection PROC
    push 00A9E080Fh
    call WhisperMain
NtUnmapViewOfSection ENDP

NtReplyWaitReceivePortEx PROC
    push 0696B3BB1h
    call WhisperMain
NtReplyWaitReceivePortEx ENDP

NtTerminateProcess PROC
    push 021A32630h
    call WhisperMain
NtTerminateProcess ENDP

NtSetEventBoostPriority PROC
    push 00C961A1Eh
    call WhisperMain
NtSetEventBoostPriority ENDP

NtReadFileScatter PROC
    push 039921B2Fh
    call WhisperMain
NtReadFileScatter ENDP

NtOpenThreadTokenEx PROC
    push 0148CA0B0h
    call WhisperMain
NtOpenThreadTokenEx ENDP

NtOpenProcessTokenEx PROC
    push 0C6C3807Dh
    call WhisperMain
NtOpenProcessTokenEx ENDP

NtQueryPerformanceCounter PROC
    push 073D595C1h
    call WhisperMain
NtQueryPerformanceCounter ENDP

NtEnumerateKey PROC
    push 01B1F4ECDh
    call WhisperMain
NtEnumerateKey ENDP

NtOpenFile PROC
    push 0F4A573B9h
    call WhisperMain
NtOpenFile ENDP

NtDelayExecution PROC
    push 00A800811h
    call WhisperMain
NtDelayExecution ENDP

NtQueryDirectoryFile PROC
    push 028BEF888h
    call WhisperMain
NtQueryDirectoryFile ENDP

NtQuerySystemInformation PROC
    push 0DA4BDCDFh
    call WhisperMain
NtQuerySystemInformation ENDP

NtOpenSection PROC
    push 01CC63E57h
    call WhisperMain
NtOpenSection ENDP

NtQueryTimer PROC
    push 0C3971FBAh
    call WhisperMain
NtQueryTimer ENDP

NtFsControlFile PROC
    push 0A8A9920Eh
    call WhisperMain
NtFsControlFile ENDP

NtWriteVirtualMemory PROC
    push 00F912503h
    call WhisperMain
NtWriteVirtualMemory ENDP

NtCloseObjectAuditAlarm PROC
    push 06EB06A26h
    call WhisperMain
NtCloseObjectAuditAlarm ENDP

NtDuplicateObject PROC
    push 008B13A3Fh
    call WhisperMain
NtDuplicateObject ENDP

NtQueryAttributesFile PROC
    push 03AB80E66h
    call WhisperMain
NtQueryAttributesFile ENDP

NtClearEvent PROC
    push 06EF46B64h
    call WhisperMain
NtClearEvent ENDP

NtReadVirtualMemory PROC
    push 0D39D2AFEh
    call WhisperMain
NtReadVirtualMemory ENDP

NtOpenEvent PROC
    push 092B1D167h
    call WhisperMain
NtOpenEvent ENDP

NtAdjustPrivilegesToken PROC
    push 01DA2F11Eh
    call WhisperMain
NtAdjustPrivilegesToken ENDP

NtDuplicateToken PROC
    push 0DE6AC4E9h
    call WhisperMain
NtDuplicateToken ENDP

NtContinue PROC
    push 04ED93916h
    call WhisperMain
NtContinue ENDP

NtQueryDefaultUILanguage PROC
    push 09C3B8F87h
    call WhisperMain
NtQueryDefaultUILanguage ENDP

NtQueueApcThread PROC
    push 08EA41A9Bh
    call WhisperMain
NtQueueApcThread ENDP

NtYieldExecution PROC
    push 02EB8042Dh
    call WhisperMain
NtYieldExecution ENDP

NtAddAtom PROC
    push 04D47AE51h
    call WhisperMain
NtAddAtom ENDP

NtCreateEvent PROC
    push 0E64DF5AAh
    call WhisperMain
NtCreateEvent ENDP

NtQueryVolumeInformationFile PROC
    push 0DE4FF0CCh
    call WhisperMain
NtQueryVolumeInformationFile ENDP

NtCreateSection PROC
    push 0248D2A15h
    call WhisperMain
NtCreateSection ENDP

NtFlushBuffersFile PROC
    push 0E85B3662h
    call WhisperMain
NtFlushBuffersFile ENDP

NtApphelpCacheControl PROC
    push 0BDAD26ABh
    call WhisperMain
NtApphelpCacheControl ENDP

NtCreateProcessEx PROC
    push 00C924647h
    call WhisperMain
NtCreateProcessEx ENDP

NtCreateThread PROC
    push 010B44209h
    call WhisperMain
NtCreateThread ENDP

NtIsProcessInJob PROC
    push 064C2A691h
    call WhisperMain
NtIsProcessInJob ENDP

NtProtectVirtualMemory PROC
    push 04F954517h
    call WhisperMain
NtProtectVirtualMemory ENDP

NtQuerySection PROC
    push 0C844E4DFh
    call WhisperMain
NtQuerySection ENDP

NtResumeThread PROC
    push 0B898BA26h
    call WhisperMain
NtResumeThread ENDP

NtTerminateThread PROC
    push 04C8E022Fh
    call WhisperMain
NtTerminateThread ENDP

NtReadRequestData PROC
    push 0C3BDF0EFh
    call WhisperMain
NtReadRequestData ENDP

NtCreateFile PROC
    push 056E78957h
    call WhisperMain
NtCreateFile ENDP

NtQueryEvent PROC
    push 07A4129E6h
    call WhisperMain
NtQueryEvent ENDP

NtWriteRequestData PROC
    push 0E4059212h
    call WhisperMain
NtWriteRequestData ENDP

NtOpenDirectoryObject PROC
    push 0855FB1C0h
    call WhisperMain
NtOpenDirectoryObject ENDP

NtAccessCheckByTypeAndAuditAlarm PROC
    push 0CF40EFCFh
    call WhisperMain
NtAccessCheckByTypeAndAuditAlarm ENDP

NtWaitForMultipleObjects PROC
    push 0D52DEDE7h
    call WhisperMain
NtWaitForMultipleObjects ENDP

NtSetInformationObject PROC
    push 002213A8Ch
    call WhisperMain
NtSetInformationObject ENDP

NtCancelIoFile PROC
    push 09AFB5DC7h
    call WhisperMain
NtCancelIoFile ENDP

NtTraceEvent PROC
    push 0CEF22697h
    call WhisperMain
NtTraceEvent ENDP

NtPowerInformation PROC
    push 030AE11FDh
    call WhisperMain
NtPowerInformation ENDP

NtSetValueKey PROC
    push 009DD2E40h
    call WhisperMain
NtSetValueKey ENDP

NtCancelTimer PROC
    push 0ACA6F468h
    call WhisperMain
NtCancelTimer ENDP

NtSetTimer PROC
    push 0379E1D26h
    call WhisperMain
NtSetTimer ENDP

NtAccessCheckByType PROC
    push 09CC67084h
    call WhisperMain
NtAccessCheckByType ENDP

NtAccessCheckByTypeResultList PROC
    push 07ED37A5Bh
    call WhisperMain
NtAccessCheckByTypeResultList ENDP

NtAccessCheckByTypeResultListAndAuditAlarm PROC
    push 0D2D4D540h
    call WhisperMain
NtAccessCheckByTypeResultListAndAuditAlarm ENDP

NtAccessCheckByTypeResultListAndAuditAlarmByHandle PROC
    push 0A99663A0h
    call WhisperMain
NtAccessCheckByTypeResultListAndAuditAlarmByHandle ENDP

NtAcquireProcessActivityReference PROC
    push 03AE3533Eh
    call WhisperMain
NtAcquireProcessActivityReference ENDP

NtAddAtomEx PROC
    push 0FD15DDAEh
    call WhisperMain
NtAddAtomEx ENDP

NtAddBootEntry PROC
    push 001903128h
    call WhisperMain
NtAddBootEntry ENDP

NtAddDriverEntry PROC
    push 019F76978h
    call WhisperMain
NtAddDriverEntry ENDP

NtAdjustGroupsToken PROC
    push 025917530h
    call WhisperMain
NtAdjustGroupsToken ENDP

NtAdjustTokenClaimsAndDeviceGroups PROC
    push 0FA66FCF4h
    call WhisperMain
NtAdjustTokenClaimsAndDeviceGroups ENDP

NtAlertResumeThread PROC
    push 0309A3E33h
    call WhisperMain
NtAlertResumeThread ENDP

NtAlertThread PROC
    push 0284312D5h
    call WhisperMain
NtAlertThread ENDP

NtAlertThreadByThreadId PROC
    push 0A4B8E61Eh
    call WhisperMain
NtAlertThreadByThreadId ENDP

NtAllocateLocallyUniqueId PROC
    push 0CC0FCFA8h
    call WhisperMain
NtAllocateLocallyUniqueId ENDP

NtAllocateReserveObject PROC
    push 08E23BEAFh
    call WhisperMain
NtAllocateReserveObject ENDP

NtAllocateUserPhysicalPages PROC
    push 02F9D6816h
    call WhisperMain
NtAllocateUserPhysicalPages ENDP

NtAllocateUuids PROC
    push 017A4E4DAh
    call WhisperMain
NtAllocateUuids ENDP

NtAllocateVirtualMemoryEx PROC
    push 0B880EA6Bh
    call WhisperMain
NtAllocateVirtualMemoryEx ENDP

NtAlpcAcceptConnectPort PROC
    push 040B75B38h
    call WhisperMain
NtAlpcAcceptConnectPort ENDP

NtAlpcCancelMessage PROC
    push 017B6322Ch
    call WhisperMain
NtAlpcCancelMessage ENDP

NtAlpcConnectPort PROC
    push 03269C007h
    call WhisperMain
NtAlpcConnectPort ENDP

NtAlpcConnectPortEx PROC
    push 0E06E3731h
    call WhisperMain
NtAlpcConnectPortEx ENDP

NtAlpcCreatePort PROC
    push 058CA7552h
    call WhisperMain
NtAlpcCreatePort ENDP

NtAlpcCreatePortSection PROC
    push 00ADA0241h
    call WhisperMain
NtAlpcCreatePortSection ENDP

NtAlpcCreateResourceReserve PROC
    push 010A10C1Bh
    call WhisperMain
NtAlpcCreateResourceReserve ENDP

NtAlpcCreateSectionView PROC
    push 0148C7113h
    call WhisperMain
NtAlpcCreateSectionView ENDP

NtAlpcCreateSecurityContext PROC
    push 008B21F3Ah
    call WhisperMain
NtAlpcCreateSecurityContext ENDP

NtAlpcDeletePortSection PROC
    push 0E157C602h
    call WhisperMain
NtAlpcDeletePortSection ENDP

NtAlpcDeleteResourceReserve PROC
    push 028A8D4F3h
    call WhisperMain
NtAlpcDeleteResourceReserve ENDP

NtAlpcDeleteSectionView PROC
    push 086B7571Dh
    call WhisperMain
NtAlpcDeleteSectionView ENDP

NtAlpcDeleteSecurityContext PROC
    push 0EE960206h
    call WhisperMain
NtAlpcDeleteSecurityContext ENDP

NtAlpcDisconnectPort PROC
    push 0A6F2A060h
    call WhisperMain
NtAlpcDisconnectPort ENDP

NtAlpcImpersonateClientContainerOfPort PROC
    push 020B3C728h
    call WhisperMain
NtAlpcImpersonateClientContainerOfPort ENDP

NtAlpcImpersonateClientOfPort PROC
    push 0D44DC7E2h
    call WhisperMain
NtAlpcImpersonateClientOfPort ENDP

NtAlpcOpenSenderProcess PROC
    push 0EFBB2DEBh
    call WhisperMain
NtAlpcOpenSenderProcess ENDP

NtAlpcOpenSenderThread PROC
    push 0A805BAABh
    call WhisperMain
NtAlpcOpenSenderThread ENDP

NtAlpcQueryInformation PROC
    push 09D44BDCAh
    call WhisperMain
NtAlpcQueryInformation ENDP

NtAlpcQueryInformationMessage PROC
    push 0C751C6EAh
    call WhisperMain
NtAlpcQueryInformationMessage ENDP

NtAlpcRevokeSecurityContext PROC
    push 0D742F2D3h
    call WhisperMain
NtAlpcRevokeSecurityContext ENDP

NtAlpcSendWaitReceivePort PROC
    push 022B23B36h
    call WhisperMain
NtAlpcSendWaitReceivePort ENDP

NtAlpcSetInformation PROC
    push 000E80279h
    call WhisperMain
NtAlpcSetInformation ENDP

NtAreMappedFilesTheSame PROC
    push 0F7D4DA63h
    call WhisperMain
NtAreMappedFilesTheSame ENDP

NtAssignProcessToJobObject PROC
    push 0301C1B43h
    call WhisperMain
NtAssignProcessToJobObject ENDP

NtAssociateWaitCompletionPacket PROC
    push 0073C3780h
    call WhisperMain
NtAssociateWaitCompletionPacket ENDP

NtCallEnclave PROC
    push 022D31278h
    call WhisperMain
NtCallEnclave ENDP

NtCancelIoFileEx PROC
    push 0C73D0B79h
    call WhisperMain
NtCancelIoFileEx ENDP

NtCancelSynchronousIoFile PROC
    push 026A60A20h
    call WhisperMain
NtCancelSynchronousIoFile ENDP

NtCancelTimer2 PROC
    push 0C40A1C84h
    call WhisperMain
NtCancelTimer2 ENDP

NtCancelWaitCompletionPacket PROC
    push 007833D0Ch
    call WhisperMain
NtCancelWaitCompletionPacket ENDP

NtCommitComplete PROC
    push 0DA2BF4A0h
    call WhisperMain
NtCommitComplete ENDP

NtCommitEnlistment PROC
    push 059009E53h
    call WhisperMain
NtCommitEnlistment ENDP

NtCommitRegistryTransaction PROC
    push 04E810C51h
    call WhisperMain
NtCommitRegistryTransaction ENDP

NtCommitTransaction PROC
    push 03852F60Fh
    call WhisperMain
NtCommitTransaction ENDP

NtCompactKeys PROC
    push 043B77820h
    call WhisperMain
NtCompactKeys ENDP

NtCompareObjects PROC
    push 09226A562h
    call WhisperMain
NtCompareObjects ENDP

NtCompareSigningLevels PROC
    push 070EA917Eh
    call WhisperMain
NtCompareSigningLevels ENDP

NtCompareTokens PROC
    push 079D57755h
    call WhisperMain
NtCompareTokens ENDP

NtCompleteConnectPort PROC
    push 020B63D38h
    call WhisperMain
NtCompleteConnectPort ENDP

NtCompressKey PROC
    push 0ABD1AA4Eh
    call WhisperMain
NtCompressKey ENDP

NtConnectPort PROC
    push 07EA87B3Ah
    call WhisperMain
NtConnectPort ENDP

NtConvertBetweenAuxiliaryCounterAndPerformanceCounter PROC
    push 07FCC111Dh
    call WhisperMain
NtConvertBetweenAuxiliaryCounterAndPerformanceCounter ENDP

NtCreateDebugObject PROC
    push 070584915h
    call WhisperMain
NtCreateDebugObject ENDP

NtCreateDirectoryObject PROC
    push 0BB91A91Fh
    call WhisperMain
NtCreateDirectoryObject ENDP

NtCreateDirectoryObjectEx PROC
    push 0AC89F658h
    call WhisperMain
NtCreateDirectoryObjectEx ENDP

NtCreateEnclave PROC
    push 0EC551C48h
    call WhisperMain
NtCreateEnclave ENDP

NtCreateEnlistment PROC
    push 025982E1Fh
    call WhisperMain
NtCreateEnlistment ENDP

NtCreateEventPair PROC
    push 01696320Bh
    call WhisperMain
NtCreateEventPair ENDP

NtCreateIRTimer PROC
    push 0CD9BFD38h
    call WhisperMain
NtCreateIRTimer ENDP

NtCreateIoCompletion PROC
    push 0C6B02420h
    call WhisperMain
NtCreateIoCompletion ENDP

NtCreateJobObject PROC
    push 03C9D04D1h
    call WhisperMain
NtCreateJobObject ENDP

NtCreateJobSet PROC
    push 020AE760Dh
    call WhisperMain
NtCreateJobSet ENDP

NtCreateKeyTransacted PROC
    push 0121EF303h
    call WhisperMain
NtCreateKeyTransacted ENDP

NtCreateKeyedEvent PROC
    push 0C1AB2FB6h
    call WhisperMain
NtCreateKeyedEvent ENDP

NtCreateLowBoxToken PROC
    push 04F946DC4h
    call WhisperMain
NtCreateLowBoxToken ENDP

NtCreateMailslotFile PROC
    push 0243DCA3Eh
    call WhisperMain
NtCreateMailslotFile ENDP

NtCreateMutant PROC
    push 0DDB3BE64h
    call WhisperMain
NtCreateMutant ENDP

NtCreateNamedPipeFile PROC
    push 02ABD122Ah
    call WhisperMain
NtCreateNamedPipeFile ENDP

NtCreatePagingFile PROC
    push 05CCB5E52h
    call WhisperMain
NtCreatePagingFile ENDP

NtCreatePartition PROC
    push 015A0694Ah
    call WhisperMain
NtCreatePartition ENDP

NtCreatePort PROC
    push 002881B06h
    call WhisperMain
NtCreatePort ENDP

NtCreatePrivateNamespace PROC
    push 09DBE43FFh
    call WhisperMain
NtCreatePrivateNamespace ENDP

NtCreateProcess PROC
    push 029B92F28h
    call WhisperMain
NtCreateProcess ENDP

NtCreateProfile PROC
    push 026BE292Ch
    call WhisperMain
NtCreateProfile ENDP

NtCreateProfileEx PROC
    push 00D934B4Eh
    call WhisperMain
NtCreateProfileEx ENDP

NtCreateRegistryTransaction PROC
    push 0CF54CBC6h
    call WhisperMain
NtCreateRegistryTransaction ENDP

NtCreateResourceManager PROC
    push 0183CC170h
    call WhisperMain
NtCreateResourceManager ENDP

NtCreateSemaphore PROC
    push 0085A7AB2h
    call WhisperMain
NtCreateSemaphore ENDP

NtCreateSymbolicLinkObject PROC
    push 0F2D8DC65h
    call WhisperMain
NtCreateSymbolicLinkObject ENDP

NtCreateThreadEx PROC
    push 044BC86C6h
    call WhisperMain
NtCreateThreadEx ENDP

NtCreateTimer PROC
    push 00350DD10h
    call WhisperMain
NtCreateTimer ENDP

NtCreateTimer2 PROC
    push 01353BA0Dh
    call WhisperMain
NtCreateTimer2 ENDP

NtCreateToken PROC
    push 0C75AF5FAh
    call WhisperMain
NtCreateToken ENDP

NtCreateTokenEx PROC
    push 03AA0F7E5h
    call WhisperMain
NtCreateTokenEx ENDP

NtCreateTransaction PROC
    push 046CD4267h
    call WhisperMain
NtCreateTransaction ENDP

NtCreateTransactionManager PROC
    push 0172507A4h
    call WhisperMain
NtCreateTransactionManager ENDP

NtCreateUserProcess PROC
    push 0398A3A14h
    call WhisperMain
NtCreateUserProcess ENDP

NtCreateWaitCompletionPacket PROC
    push 0A99DD171h
    call WhisperMain
NtCreateWaitCompletionPacket ENDP

NtCreateWaitablePort PROC
    push 0E673E1E0h
    call WhisperMain
NtCreateWaitablePort ENDP

NtCreateWnfStateName PROC
    push 0148A2D1Fh
    call WhisperMain
NtCreateWnfStateName ENDP

NtCreateWorkerFactory PROC
    push 0BEAED64Fh
    call WhisperMain
NtCreateWorkerFactory ENDP

NtDebugActiveProcess PROC
    push 07E3097ACh
    call WhisperMain
NtDebugActiveProcess ENDP

NtDebugContinue PROC
    push 030244728h
    call WhisperMain
NtDebugContinue ENDP

NtDeleteAtom PROC
    push 054C15756h
    call WhisperMain
NtDeleteAtom ENDP

NtDeleteBootEntry PROC
    push 009950306h
    call WhisperMain
NtDeleteBootEntry ENDP

NtDeleteDriverEntry PROC
    push 0CB97FF2Ah
    call WhisperMain
NtDeleteDriverEntry ENDP

NtDeleteFile PROC
    push 014B25392h
    call WhisperMain
NtDeleteFile ENDP

NtDeleteKey PROC
    push 069D34C78h
    call WhisperMain
NtDeleteKey ENDP

NtDeleteObjectAuditAlarm PROC
    push 07AA47C30h
    call WhisperMain
NtDeleteObjectAuditAlarm ENDP

NtDeletePrivateNamespace PROC
    push 06ACC6F55h
    call WhisperMain
NtDeletePrivateNamespace ENDP

NtDeleteValueKey PROC
    push 02A9F0905h
    call WhisperMain
NtDeleteValueKey ENDP

NtDeleteWnfStateData PROC
    push 002C292F0h
    call WhisperMain
NtDeleteWnfStateData ENDP

NtDeleteWnfStateName PROC
    push 076B8FD9Bh
    call WhisperMain
NtDeleteWnfStateName ENDP

NtDisableLastKnownGood PROC
    push 07BAA4570h
    call WhisperMain
NtDisableLastKnownGood ENDP

NtDisplayString PROC
    push 0FEA3D422h
    call WhisperMain
NtDisplayString ENDP

NtDrawText PROC
    push 012AB093Ch
    call WhisperMain
NtDrawText ENDP

NtEnableLastKnownGood PROC
    push 0E47B9E7Dh
    call WhisperMain
NtEnableLastKnownGood ENDP

NtEnumerateBootEntries PROC
    push 018CD1B51h
    call WhisperMain
NtEnumerateBootEntries ENDP

NtEnumerateDriverEntries PROC
    push 0E8DC14B4h
    call WhisperMain
NtEnumerateDriverEntries ENDP

NtEnumerateSystemEnvironmentValuesEx PROC
    push 01D90CDC8h
    call WhisperMain
NtEnumerateSystemEnvironmentValuesEx ENDP

NtEnumerateTransactionObject PROC
    push 01935E84Bh
    call WhisperMain
NtEnumerateTransactionObject ENDP

NtExtendSection PROC
    push 03368ECC1h
    call WhisperMain
NtExtendSection ENDP

NtFilterBootOption PROC
    push 00CA6CEF6h
    call WhisperMain
NtFilterBootOption ENDP

NtFilterToken PROC
    push 06420B86Eh
    call WhisperMain
NtFilterToken ENDP

NtFilterTokenEx PROC
    push 0A64FA2F0h
    call WhisperMain
NtFilterTokenEx ENDP

NtFlushBuffersFileEx PROC
    push 0AA399A81h
    call WhisperMain
NtFlushBuffersFileEx ENDP

NtFlushInstallUILanguage PROC
    push 0BB895C88h
    call WhisperMain
NtFlushInstallUILanguage ENDP

NtFlushInstructionCache PROC
    push 08B588FF9h
    call WhisperMain
NtFlushInstructionCache ENDP

NtFlushKey PROC
    push 01C1F79E3h
    call WhisperMain
NtFlushKey ENDP

NtFlushProcessWriteBuffers PROC
    push 000BF0C2Eh
    call WhisperMain
NtFlushProcessWriteBuffers ENDP

NtFlushVirtualMemory PROC
    push 0C9D12CBEh
    call WhisperMain
NtFlushVirtualMemory ENDP

NtFlushWriteBuffer PROC
    push 0831AAD8Bh
    call WhisperMain
NtFlushWriteBuffer ENDP

NtFreeUserPhysicalPages PROC
    push 081BCB61Ch
    call WhisperMain
NtFreeUserPhysicalPages ENDP

NtFreezeRegistry PROC
    push 0008B0607h
    call WhisperMain
NtFreezeRegistry ENDP

NtFreezeTransactions PROC
    push 04F9D3777h
    call WhisperMain
NtFreezeTransactions ENDP

NtGetCachedSigningLevel PROC
    push 0B67AF0C0h
    call WhisperMain
NtGetCachedSigningLevel ENDP

NtGetCompleteWnfStateSubscription PROC
    push 03CB13C23h
    call WhisperMain
NtGetCompleteWnfStateSubscription ENDP

NtGetContextThread PROC
    push 0F4C8FE5Fh
    call WhisperMain
NtGetContextThread ENDP

NtGetCurrentProcessorNumber PROC
    push 0D7B2C512h
    call WhisperMain
NtGetCurrentProcessorNumber ENDP

NtGetCurrentProcessorNumberEx PROC
    push 010AFC3F5h
    call WhisperMain
NtGetCurrentProcessorNumberEx ENDP

NtGetDevicePowerState PROC
    push 036B61836h
    call WhisperMain
NtGetDevicePowerState ENDP

NtGetMUIRegistryInfo PROC
    push 06A10444Fh
    call WhisperMain
NtGetMUIRegistryInfo ENDP

NtGetNextProcess PROC
    push 0015FE333h
    call WhisperMain
NtGetNextProcess ENDP

NtGetNextThread PROC
    push 0306C32D5h
    call WhisperMain
NtGetNextThread ENDP

NtGetNlsSectionPtr PROC
    push 03E16219Fh
    call WhisperMain
NtGetNlsSectionPtr ENDP

NtGetNotificationResourceManager PROC
    push 00F9F6B42h
    call WhisperMain
NtGetNotificationResourceManager ENDP

NtGetWriteWatch PROC
    push 0AD6FD7FDh
    call WhisperMain
NtGetWriteWatch ENDP

NtImpersonateAnonymousToken PROC
    push 03016E42Ch
    call WhisperMain
NtImpersonateAnonymousToken ENDP

NtImpersonateThread PROC
    push 0328E1037h
    call WhisperMain
NtImpersonateThread ENDP

NtInitializeEnclave PROC
    push 0F0AEDA22h
    call WhisperMain
NtInitializeEnclave ENDP

NtInitializeNlsFiles PROC
    push 01317DD54h
    call WhisperMain
NtInitializeNlsFiles ENDP

NtInitializeRegistry PROC
    push 02C8C342Bh
    call WhisperMain
NtInitializeRegistry ENDP

NtInitiatePowerAction PROC
    push 00EA16475h
    call WhisperMain
NtInitiatePowerAction ENDP

NtIsSystemResumeAutomatic PROC
    push 086887393h
    call WhisperMain
NtIsSystemResumeAutomatic ENDP

NtIsUILanguageComitted PROC
    push 063861293h
    call WhisperMain
NtIsUILanguageComitted ENDP

NtListenPort PROC
    push 0A4AEA130h
    call WhisperMain
NtListenPort ENDP

NtLoadDriver PROC
    push 05CD7764Ch
    call WhisperMain
NtLoadDriver ENDP

NtLoadEnclaveData PROC
    push 0F303C9D9h
    call WhisperMain
NtLoadEnclaveData ENDP

NtLoadHotPatch PROC
    push 09EAF9630h
    call WhisperMain
NtLoadHotPatch ENDP

NtLoadKey PROC
    push 05BE25E61h
    call WhisperMain
NtLoadKey ENDP

NtLoadKey2 PROC
    push 03AB9CE3Fh
    call WhisperMain
NtLoadKey2 ENDP

NtLoadKeyEx PROC
    push 00584FD84h
    call WhisperMain
NtLoadKeyEx ENDP

NtLockFile PROC
    push 0E038E8AAh
    call WhisperMain
NtLockFile ENDP

NtLockProductActivationKeys PROC
    push 0E742ECD4h
    call WhisperMain
NtLockProductActivationKeys ENDP

NtLockRegistryKey PROC
    push 06DCB5C4Ch
    call WhisperMain
NtLockRegistryKey ENDP

NtLockVirtualMemory PROC
    push 031B4D4DBh
    call WhisperMain
NtLockVirtualMemory ENDP

NtMakePermanentObject PROC
    push 012017ADCh
    call WhisperMain
NtMakePermanentObject ENDP

NtMakeTemporaryObject PROC
    push 006DD7E31h
    call WhisperMain
NtMakeTemporaryObject ENDP

NtManagePartition PROC
    push 0868D8118h
    call WhisperMain
NtManagePartition ENDP

NtMapCMFModule PROC
    push 068265372h
    call WhisperMain
NtMapCMFModule ENDP

NtMapUserPhysicalPages PROC
    push 08DB5F64Eh
    call WhisperMain
NtMapUserPhysicalPages ENDP

NtMapViewOfSectionEx PROC
    push 060D329E2h
    call WhisperMain
NtMapViewOfSectionEx ENDP

NtModifyBootEntry PROC
    push 009803938h
    call WhisperMain
NtModifyBootEntry ENDP

NtModifyDriverEntry PROC
    push 009983950h
    call WhisperMain
NtModifyDriverEntry ENDP

NtNotifyChangeDirectoryFile PROC
    push 0BC3BAC80h
    call WhisperMain
NtNotifyChangeDirectoryFile ENDP

NtNotifyChangeDirectoryFileEx PROC
    push 080BBC407h
    call WhisperMain
NtNotifyChangeDirectoryFileEx ENDP

NtNotifyChangeKey PROC
    push 0859A6385h
    call WhisperMain
NtNotifyChangeKey ENDP

NtNotifyChangeMultipleKeys PROC
    push 08794009Fh
    call WhisperMain
NtNotifyChangeMultipleKeys ENDP

NtNotifyChangeSession PROC
    push 001D750F4h
    call WhisperMain
NtNotifyChangeSession ENDP

NtOpenEnlistment PROC
    push 049CB7C4Dh
    call WhisperMain
NtOpenEnlistment ENDP

NtOpenEventPair PROC
    push 0C292C607h
    call WhisperMain
NtOpenEventPair ENDP

NtOpenIoCompletion PROC
    push 0148235D1h
    call WhisperMain
NtOpenIoCompletion ENDP

NtOpenJobObject PROC
    push 082A050FDh
    call WhisperMain
NtOpenJobObject ENDP

NtOpenKeyEx PROC
    push 0765A9025h
    call WhisperMain
NtOpenKeyEx ENDP

NtOpenKeyTransacted PROC
    push 0DCBCEE62h
    call WhisperMain
NtOpenKeyTransacted ENDP

NtOpenKeyTransactedEx PROC
    push 026DFE061h
    call WhisperMain
NtOpenKeyTransactedEx ENDP

NtOpenKeyedEvent PROC
    push 0C88A2AFDh
    call WhisperMain
NtOpenKeyedEvent ENDP

NtOpenMutant PROC
    push 072E27B7Eh
    call WhisperMain
NtOpenMutant ENDP

NtOpenObjectAuditAlarm PROC
    push 00A85261Ah
    call WhisperMain
NtOpenObjectAuditAlarm ENDP

NtOpenPartition PROC
    push 0B4AA53BAh
    call WhisperMain
NtOpenPartition ENDP

NtOpenPrivateNamespace PROC
    push 01EAE213Ch
    call WhisperMain
NtOpenPrivateNamespace ENDP

NtOpenProcessToken PROC
    push 0E5219BE2h
    call WhisperMain
NtOpenProcessToken ENDP

NtOpenRegistryTransaction PROC
    push 01E40D914h
    call WhisperMain
NtOpenRegistryTransaction ENDP

NtOpenResourceManager PROC
    push 0259D313Ch
    call WhisperMain
NtOpenResourceManager ENDP

NtOpenSemaphore PROC
    push 04E9A9322h
    call WhisperMain
NtOpenSemaphore ENDP

NtOpenSession PROC
    push 0EBCD17AEh
    call WhisperMain
NtOpenSession ENDP

NtOpenSymbolicLinkObject PROC
    push 00FA1372Ch
    call WhisperMain
NtOpenSymbolicLinkObject ENDP

NtOpenThread PROC
    push 002315609h
    call WhisperMain
NtOpenThread ENDP

NtOpenTimer PROC
    push 06A52E243h
    call WhisperMain
NtOpenTimer ENDP

NtOpenTransaction PROC
    push 0E8C19E25h
    call WhisperMain
NtOpenTransaction ENDP

NtOpenTransactionManager PROC
    push 03DA6D7BAh
    call WhisperMain
NtOpenTransactionManager ENDP

NtPlugPlayControl PROC
    push 04F184BF3h
    call WhisperMain
NtPlugPlayControl ENDP

NtPrePrepareComplete PROC
    push 02ED3C45Ch
    call WhisperMain
NtPrePrepareComplete ENDP

NtPrePrepareEnlistment PROC
    push 0D9BEC63Dh
    call WhisperMain
NtPrePrepareEnlistment ENDP

NtPrepareComplete PROC
    push 0089003FEh
    call WhisperMain
NtPrepareComplete ENDP

NtPrepareEnlistment PROC
    push 0B629CDDEh
    call WhisperMain
NtPrepareEnlistment ENDP

NtPrivilegeCheck PROC
    push 00AA6F9F8h
    call WhisperMain
NtPrivilegeCheck ENDP

NtPrivilegeObjectAuditAlarm PROC
    push 010AEEAC2h
    call WhisperMain
NtPrivilegeObjectAuditAlarm ENDP

NtPrivilegedServiceAuditAlarm PROC
    push 0905F1D46h
    call WhisperMain
NtPrivilegedServiceAuditAlarm ENDP

NtPropagationComplete PROC
    push 01CB9FEF6h
    call WhisperMain
NtPropagationComplete ENDP

NtPropagationFailed PROC
    push 09E997DC7h
    call WhisperMain
NtPropagationFailed ENDP

NtPulseEvent PROC
    push 0F64AC7ECh
    call WhisperMain
NtPulseEvent ENDP

NtQueryAuxiliaryCounterFrequency PROC
    push 03BB11617h
    call WhisperMain
NtQueryAuxiliaryCounterFrequency ENDP

NtQueryBootEntryOrder PROC
    push 087AE138Dh
    call WhisperMain
NtQueryBootEntryOrder ENDP

NtQueryBootOptions PROC
    push 0C5A93FC1h
    call WhisperMain
NtQueryBootOptions ENDP

NtQueryDebugFilterState PROC
    push 0F6B518F4h
    call WhisperMain
NtQueryDebugFilterState ENDP

NtQueryDirectoryFileEx PROC
    push 02C37108Ch
    call WhisperMain
NtQueryDirectoryFileEx ENDP

NtQueryDirectoryObject PROC
    push 0163D38A6h
    call WhisperMain
NtQueryDirectoryObject ENDP

NtQueryDriverEntryOrder PROC
    push 0B3869513h
    call WhisperMain
NtQueryDriverEntryOrder ENDP

NtQueryEaFile PROC
    push 06432B598h
    call WhisperMain
NtQueryEaFile ENDP

NtQueryFullAttributesFile PROC
    push 01C7DC8CEh
    call WhisperMain
NtQueryFullAttributesFile ENDP

NtQueryInformationAtom PROC
    push 0A938CD31h
    call WhisperMain
NtQueryInformationAtom ENDP

NtQueryInformationByName PROC
    push 0F42B87FDh
    call WhisperMain
NtQueryInformationByName ENDP

NtQueryInformationEnlistment PROC
    push 0D448F7DEh
    call WhisperMain
NtQueryInformationEnlistment ENDP

NtQueryInformationJobObject PROC
    push 072508F50h
    call WhisperMain
NtQueryInformationJobObject ENDP

NtQueryInformationPort PROC
    push 0E579FCD7h
    call WhisperMain
NtQueryInformationPort ENDP

NtQueryInformationResourceManager PROC
    push 0E7577177h
    call WhisperMain
NtQueryInformationResourceManager ENDP

NtQueryInformationTransaction PROC
    push 002172C8Fh
    call WhisperMain
NtQueryInformationTransaction ENDP

NtQueryInformationTransactionManager PROC
    push 0C5992AE5h
    call WhisperMain
NtQueryInformationTransactionManager ENDP

NtQueryInformationWorkerFactory PROC
    push 0FC95CA39h
    call WhisperMain
NtQueryInformationWorkerFactory ENDP

NtQueryInstallUILanguage PROC
    push 01342D01Ah
    call WhisperMain
NtQueryInstallUILanguage ENDP

NtQueryIntervalProfile PROC
    push 028A07664h
    call WhisperMain
NtQueryIntervalProfile ENDP

NtQueryIoCompletion PROC
    push 09F36A3B4h
    call WhisperMain
NtQueryIoCompletion ENDP

NtQueryLicenseValue PROC
    push 0B421DA2Ah
    call WhisperMain
NtQueryLicenseValue ENDP

NtQueryMultipleValueKey PROC
    push 04195622Ch
    call WhisperMain
NtQueryMultipleValueKey ENDP

NtQueryMutant PROC
    push 0F453CDE6h
    call WhisperMain
NtQueryMutant ENDP

NtQueryOpenSubKeys PROC
    push 08AD0A572h
    call WhisperMain
NtQueryOpenSubKeys ENDP

NtQueryOpenSubKeysEx PROC
    push 0AFA3F576h
    call WhisperMain
NtQueryOpenSubKeysEx ENDP

NtQueryPortInformationProcess PROC
    push 041D4444Ch
    call WhisperMain
NtQueryPortInformationProcess ENDP

NtQueryQuotaInformationFile PROC
    push 0BAB944BAh
    call WhisperMain
NtQueryQuotaInformationFile ENDP

NtQuerySecurityAttributesToken PROC
    push 032153A8Fh
    call WhisperMain
NtQuerySecurityAttributesToken ENDP

NtQuerySecurityObject PROC
    push 036AB5EB7h
    call WhisperMain
NtQuerySecurityObject ENDP

NtQuerySecurityPolicy PROC
    push 03C8B013Fh
    call WhisperMain
NtQuerySecurityPolicy ENDP

NtQuerySemaphore PROC
    push 043560DF0h
    call WhisperMain
NtQuerySemaphore ENDP

NtQuerySymbolicLinkObject PROC
    push 01435FC29h
    call WhisperMain
NtQuerySymbolicLinkObject ENDP

NtQuerySystemEnvironmentValue PROC
    push 0FC20F3C0h
    call WhisperMain
NtQuerySystemEnvironmentValue ENDP

NtQuerySystemEnvironmentValueEx PROC
    push 0FFE0FB5Ch
    call WhisperMain
NtQuerySystemEnvironmentValueEx ENDP

NtQuerySystemInformationEx PROC
    push 0969554AEh
    call WhisperMain
NtQuerySystemInformationEx ENDP

NtQueryTimerResolution PROC
    push 048D26801h
    call WhisperMain
NtQueryTimerResolution ENDP

NtQueryWnfStateData PROC
    push 062FB700Ah
    call WhisperMain
NtQueryWnfStateData ENDP

NtQueryWnfStateNameInformation PROC
    push 0DE44DED7h
    call WhisperMain
NtQueryWnfStateNameInformation ENDP

NtQueueApcThreadEx PROC
    push 02A3E6884h
    call WhisperMain
NtQueueApcThreadEx ENDP

NtRaiseException PROC
    push 0C149205Ah
    call WhisperMain
NtRaiseException ENDP

NtRaiseHardError PROC
    push 007982B3Bh
    call WhisperMain
NtRaiseHardError ENDP

NtReadOnlyEnlistment PROC
    push 00FA90E3Bh
    call WhisperMain
NtReadOnlyEnlistment ENDP

NtRecoverEnlistment PROC
    push 09B359EA3h
    call WhisperMain
NtRecoverEnlistment ENDP

NtRecoverResourceManager PROC
    push 06833B099h
    call WhisperMain
NtRecoverResourceManager ENDP

NtRecoverTransactionManager PROC
    push 03FA81530h
    call WhisperMain
NtRecoverTransactionManager ENDP

NtRegisterProtocolAddressInformation PROC
    push 0180F7E1Fh
    call WhisperMain
NtRegisterProtocolAddressInformation ENDP

NtRegisterThreadTerminatePort PROC
    push 020B2C6E0h
    call WhisperMain
NtRegisterThreadTerminatePort ENDP

NtReleaseKeyedEvent PROC
    push 0CE4EDBCCh
    call WhisperMain
NtReleaseKeyedEvent ENDP

NtReleaseWorkerFactoryWorker PROC
    push 0F86DD6B5h
    call WhisperMain
NtReleaseWorkerFactoryWorker ENDP

NtRemoveIoCompletionEx PROC
    push 08416B2A8h
    call WhisperMain
NtRemoveIoCompletionEx ENDP

NtRemoveProcessDebug PROC
    push 0AA3A6912h
    call WhisperMain
NtRemoveProcessDebug ENDP

NtRenameKey PROC
    push 03AF26529h
    call WhisperMain
NtRenameKey ENDP

NtRenameTransactionManager PROC
    push 0C79EDC37h
    call WhisperMain
NtRenameTransactionManager ENDP

NtReplaceKey PROC
    push 08AD7A178h
    call WhisperMain
NtReplaceKey ENDP

NtReplacePartitionUnit PROC
    push 026332AA8h
    call WhisperMain
NtReplacePartitionUnit ENDP

NtReplyWaitReplyPort PROC
    push 0A0358FAEh
    call WhisperMain
NtReplyWaitReplyPort ENDP

NtRequestPort PROC
    push 0E97EF6F5h
    call WhisperMain
NtRequestPort ENDP

NtResetEvent PROC
    push 0CF127F37h
    call WhisperMain
NtResetEvent ENDP

NtResetWriteWatch PROC
    push 0C2B1C912h
    call WhisperMain
NtResetWriteWatch ENDP

NtRestoreKey PROC
    push 096A2F748h
    call WhisperMain
NtRestoreKey ENDP

NtResumeProcess PROC
    push 0722C69A1h
    call WhisperMain
NtResumeProcess ENDP

NtRevertContainerImpersonation PROC
    push 0452E49BDh
    call WhisperMain
NtRevertContainerImpersonation ENDP

NtRollbackComplete PROC
    push 0273ABE04h
    call WhisperMain
NtRollbackComplete ENDP

NtRollbackEnlistment PROC
    push 07E421BDAh
    call WhisperMain
NtRollbackEnlistment ENDP

NtRollbackRegistryTransaction PROC
    push 00CFE1673h
    call WhisperMain
NtRollbackRegistryTransaction ENDP

NtRollbackTransaction PROC
    push 0920A969Bh
    call WhisperMain
NtRollbackTransaction ENDP

NtRollforwardTransactionManager PROC
    push 0160644C7h
    call WhisperMain
NtRollforwardTransactionManager ENDP

NtSaveKey PROC
    push 01682C8D5h
    call WhisperMain
NtSaveKey ENDP

NtSaveKeyEx PROC
    push 0C457E3E8h
    call WhisperMain
NtSaveKeyEx ENDP

NtSaveMergedKeys PROC
    push 067FC6274h
    call WhisperMain
NtSaveMergedKeys ENDP

NtSecureConnectPort PROC
    push 0608E592Ch
    call WhisperMain
NtSecureConnectPort ENDP

NtSerializeBoot PROC
    push 072E24C61h
    call WhisperMain
NtSerializeBoot ENDP

NtSetBootEntryOrder PROC
    push 033B61D2Bh
    call WhisperMain
NtSetBootEntryOrder ENDP

NtSetBootOptions PROC
    push 05387591Bh
    call WhisperMain
NtSetBootOptions ENDP

NtSetCachedSigningLevel PROC
    push 02ABAA598h
    call WhisperMain
NtSetCachedSigningLevel ENDP

NtSetCachedSigningLevel2 PROC
    push 0B29040B5h
    call WhisperMain
NtSetCachedSigningLevel2 ENDP

NtSetContextThread PROC
    push 03CBCE60Ah
    call WhisperMain
NtSetContextThread ENDP

NtSetDebugFilterState PROC
    push 03290DBDEh
    call WhisperMain
NtSetDebugFilterState ENDP

NtSetDefaultHardErrorPort PROC
    push 0257724E9h
    call WhisperMain
NtSetDefaultHardErrorPort ENDP

NtSetDefaultLocale PROC
    push 08D2C8599h
    call WhisperMain
NtSetDefaultLocale ENDP

NtSetDefaultUILanguage PROC
    push 08B35AB6Eh
    call WhisperMain
NtSetDefaultUILanguage ENDP

NtSetDriverEntryOrder PROC
    push 095AEE742h
    call WhisperMain
NtSetDriverEntryOrder ENDP

NtSetEaFile PROC
    push 0E138E9DDh
    call WhisperMain
NtSetEaFile ENDP

NtSetHighEventPair PROC
    push 060D47A71h
    call WhisperMain
NtSetHighEventPair ENDP

NtSetHighWaitLowEventPair PROC
    push 090B19827h
    call WhisperMain
NtSetHighWaitLowEventPair ENDP

NtSetIRTimer PROC
    push 08FA8F140h
    call WhisperMain
NtSetIRTimer ENDP

NtSetInformationDebugObject PROC
    push 0071D79EFh
    call WhisperMain
NtSetInformationDebugObject ENDP

NtSetInformationEnlistment PROC
    push 00E56E804h
    call WhisperMain
NtSetInformationEnlistment ENDP

NtSetInformationJobObject PROC
    push 073569D24h
    call WhisperMain
NtSetInformationJobObject ENDP

NtSetInformationKey PROC
    push 0020837B5h
    call WhisperMain
NtSetInformationKey ENDP

NtSetInformationResourceManager PROC
    push 0FD9309EAh
    call WhisperMain
NtSetInformationResourceManager ENDP

NtSetInformationSymbolicLink PROC
    push 0AE3BA6AEh
    call WhisperMain
NtSetInformationSymbolicLink ENDP

NtSetInformationToken PROC
    push 0AF9FF534h
    call WhisperMain
NtSetInformationToken ENDP

NtSetInformationTransaction PROC
    push 0108A361Bh
    call WhisperMain
NtSetInformationTransaction ENDP

NtSetInformationTransactionManager PROC
    push 0725FEC74h
    call WhisperMain
NtSetInformationTransactionManager ENDP

NtSetInformationVirtualMemory PROC
    push 019901313h
    call WhisperMain
NtSetInformationVirtualMemory ENDP

NtSetInformationWorkerFactory PROC
    push 00A8E1816h
    call WhisperMain
NtSetInformationWorkerFactory ENDP

NtSetIntervalProfile PROC
    push 03499AE98h
    call WhisperMain
NtSetIntervalProfile ENDP

NtSetIoCompletion PROC
    push 09681921Bh
    call WhisperMain
NtSetIoCompletion ENDP

NtSetIoCompletionEx PROC
    push 0989A24BEh
    call WhisperMain
NtSetIoCompletionEx ENDP

NtSetLdtEntries PROC
    push 0B91DBA86h
    call WhisperMain
NtSetLdtEntries ENDP

NtSetLowEventPair PROC
    push 010B7C4F1h
    call WhisperMain
NtSetLowEventPair ENDP

NtSetLowWaitHighEventPair PROC
    push 0E4D1D40Ch
    call WhisperMain
NtSetLowWaitHighEventPair ENDP

NtSetQuotaInformationFile PROC
    push 068FEA148h
    call WhisperMain
NtSetQuotaInformationFile ENDP

NtSetSecurityObject PROC
    push 01A2464D9h
    call WhisperMain
NtSetSecurityObject ENDP

NtSetSystemEnvironmentValue PROC
    push 0C256ED92h
    call WhisperMain
NtSetSystemEnvironmentValue ENDP

NtSetSystemEnvironmentValueEx PROC
    push 02FC4F2A1h
    call WhisperMain
NtSetSystemEnvironmentValueEx ENDP

NtSetSystemInformation PROC
    push 09C069A9Fh
    call WhisperMain
NtSetSystemInformation ENDP

NtSetSystemPowerState PROC
    push 01F3D8800h
    call WhisperMain
NtSetSystemPowerState ENDP

NtSetSystemTime PROC
    push 094B3C98Bh
    call WhisperMain
NtSetSystemTime ENDP

NtSetThreadExecutionState PROC
    push 000BA2834h
    call WhisperMain
NtSetThreadExecutionState ENDP

NtSetTimer2 PROC
    push 011A97007h
    call WhisperMain
NtSetTimer2 ENDP

NtSetTimerEx PROC
    push 030B7726Ch
    call WhisperMain
NtSetTimerEx ENDP

NtSetTimerResolution PROC
    push 0D649F6D7h
    call WhisperMain
NtSetTimerResolution ENDP

NtSetUuidSeed PROC
    push 0158DD430h
    call WhisperMain
NtSetUuidSeed ENDP

NtSetVolumeInformationFile PROC
    push 0D8CB47F8h
    call WhisperMain
NtSetVolumeInformationFile ENDP

NtSetWnfProcessNotificationEvent PROC
    push 03E941334h
    call WhisperMain
NtSetWnfProcessNotificationEvent ENDP

NtShutdownSystem PROC
    push 0068CFEC7h
    call WhisperMain
NtShutdownSystem ENDP

NtShutdownWorkerFactory PROC
    push 00898362Ch
    call WhisperMain
NtShutdownWorkerFactory ENDP

NtSignalAndWaitForSingleObject PROC
    push 000BE0E03h
    call WhisperMain
NtSignalAndWaitForSingleObject ENDP

NtSinglePhaseReject PROC
    push 01AA13E39h
    call WhisperMain
NtSinglePhaseReject ENDP

NtStartProfile PROC
    push 0289C722Ch
    call WhisperMain
NtStartProfile ENDP

NtStopProfile PROC
    push 0C88938DFh
    call WhisperMain
NtStopProfile ENDP

NtSubscribeWnfStateChange PROC
    push 022A16304h
    call WhisperMain
NtSubscribeWnfStateChange ENDP

NtSuspendProcess PROC
    push 0519C7000h
    call WhisperMain
NtSuspendProcess ENDP

NtSuspendThread PROC
    push 03A1F24BDh
    call WhisperMain
NtSuspendThread ENDP

NtSystemDebugControl PROC
    push 0C09EC476h
    call WhisperMain
NtSystemDebugControl ENDP

NtTerminateEnclave PROC
    push 0EE33C6FEh
    call WhisperMain
NtTerminateEnclave ENDP

NtTerminateJobObject PROC
    push 0BAB8B224h
    call WhisperMain
NtTerminateJobObject ENDP

NtTestAlert PROC
    push 04ED13358h
    call WhisperMain
NtTestAlert ENDP

NtThawRegistry PROC
    push 006EF4E21h
    call WhisperMain
NtThawRegistry ENDP

NtThawTransactions PROC
    push 00796193Dh
    call WhisperMain
NtThawTransactions ENDP

NtTraceControl PROC
    push 0DF8A2BDDh
    call WhisperMain
NtTraceControl ENDP

NtTranslateFilePath PROC
    push 0FA3081FCh
    call WhisperMain
NtTranslateFilePath ENDP

NtUmsThreadYield PROC
    push 0F85A28EEh
    call WhisperMain
NtUmsThreadYield ENDP

NtUnloadDriver PROC
    push 0D69F05C1h
    call WhisperMain
NtUnloadDriver ENDP

NtUnloadKey PROC
    push 0EA3E8DCDh
    call WhisperMain
NtUnloadKey ENDP

NtUnloadKey2 PROC
    push 027D4615Ch
    call WhisperMain
NtUnloadKey2 ENDP

NtUnloadKeyEx PROC
    push 067F32B36h
    call WhisperMain
NtUnloadKeyEx ENDP

NtUnlockFile PROC
    push 0903DC0F6h
    call WhisperMain
NtUnlockFile ENDP

NtUnlockVirtualMemory PROC
    push 098118E80h
    call WhisperMain
NtUnlockVirtualMemory ENDP

NtUnmapViewOfSectionEx PROC
    push 0F29131EBh
    call WhisperMain
NtUnmapViewOfSectionEx ENDP

NtUnsubscribeWnfStateChange PROC
    push 050CE5756h
    call WhisperMain
NtUnsubscribeWnfStateChange ENDP

NtUpdateWnfStateData PROC
    push 0DEDCEA46h
    call WhisperMain
NtUpdateWnfStateData ENDP

NtVdmControl PROC
    push 0BD9039A7h
    call WhisperMain
NtVdmControl ENDP

NtWaitForAlertByThreadId PROC
    push 0143F7CCAh
    call WhisperMain
NtWaitForAlertByThreadId ENDP

NtWaitForDebugEvent PROC
    push 090B06FDAh
    call WhisperMain
NtWaitForDebugEvent ENDP

NtWaitForKeyedEvent PROC
    push 0D08A3618h
    call WhisperMain
NtWaitForKeyedEvent ENDP

NtWaitForWorkViaWorkerFactory PROC
    push 0C89DE634h
    call WhisperMain
NtWaitForWorkViaWorkerFactory ENDP

NtWaitHighEventPair PROC
    push 0A31DBFB0h
    call WhisperMain
NtWaitHighEventPair ENDP

NtWaitLowEventPair PROC
    push 050B3B4E5h
    call WhisperMain
NtWaitLowEventPair ENDP

NtAcquireCMFViewOwnership PROC
    push 0FA6D1A7Ah
    call WhisperMain
NtAcquireCMFViewOwnership ENDP

NtCancelDeviceWakeupRequest PROC
    push 033EDFBB0h
    call WhisperMain
NtCancelDeviceWakeupRequest ENDP

NtClearAllSavepointsTransaction PROC
    push 00294280Dh
    call WhisperMain
NtClearAllSavepointsTransaction ENDP

NtClearSavepointTransaction PROC
    push 01288301Dh
    call WhisperMain
NtClearSavepointTransaction ENDP

NtRollbackSavepointTransaction PROC
    push 0CB28EFBAh
    call WhisperMain
NtRollbackSavepointTransaction ENDP

NtSavepointTransaction PROC
    push 0009A27CBh
    call WhisperMain
NtSavepointTransaction ENDP

NtSavepointComplete PROC
    push 02AB2163Ch
    call WhisperMain
NtSavepointComplete ENDP

NtCreateSectionEx PROC
    push 0F8993BC3h
    call WhisperMain
NtCreateSectionEx ENDP

NtCreateCrossVmEvent PROC
    push 092CDBB10h
    call WhisperMain
NtCreateCrossVmEvent ENDP

NtGetPlugPlayEvent PROC
    push 008858F96h
    call WhisperMain
NtGetPlugPlayEvent ENDP

NtListTransactions PROC
    push 00D982B33h
    call WhisperMain
NtListTransactions ENDP

NtMarshallTransaction PROC
    push 02A6FF427h
    call WhisperMain
NtMarshallTransaction ENDP

NtPullTransaction PROC
    push 0898FA91Dh
    call WhisperMain
NtPullTransaction ENDP

NtReleaseCMFViewOwnership PROC
    push 00D95254Dh
    call WhisperMain
NtReleaseCMFViewOwnership ENDP

NtWaitForWnfNotifications PROC
    push 00D97290Dh
    call WhisperMain
NtWaitForWnfNotifications ENDP

NtStartTm PROC
    push 021F27B5Ch
    call WhisperMain
NtStartTm ENDP

NtSetInformationProcess PROC
    push 0922881A5h
    call WhisperMain
NtSetInformationProcess ENDP

NtRequestDeviceWakeup PROC
    push 003AF3904h
    call WhisperMain
NtRequestDeviceWakeup ENDP

NtRequestWakeupLatency PROC
    push 03285536Ch
    call WhisperMain
NtRequestWakeupLatency ENDP

NtQuerySystemTime PROC
    push 07EB95963h
    call WhisperMain
NtQuerySystemTime ENDP

NtManageHotPatch PROC
    push 01321D914h
    call WhisperMain
NtManageHotPatch ENDP

NtContinueEx PROC
    push 0F7CEB332h
    call WhisperMain
NtContinueEx ENDP

end