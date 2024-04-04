.data
currentHash     dd  0
returnAddress   dq  0
syscallNumber   dd  0
syscallAddress  dq  0

.code
EXTERN SW2_GetSyscallNumber: PROC
EXTERN SW2_GetRandomSyscallAddress: PROC
    
WhisperMain PROC
    pop rax
    mov [rsp+ 8], rcx                       ; Save registers.
    mov [rsp+16], rdx
    mov [rsp+24], r8
    mov [rsp+32], r9
    sub rsp, 28h
    mov ecx, currentHash
    call SW2_GetSyscallNumber
    mov dword ptr [syscallNumber], eax      ; Save the syscall number
    xor rcx, rcx
    call SW2_GetRandomSyscallAddress        ; Get a random syscall address
    mov qword ptr [syscallAddress], rax     ; Save the random syscall address
    xor rax, rax
    mov eax, syscallNumber
    add rsp, 28h
    mov rcx, [rsp+ 8]                       ; Restore registers.
    mov rdx, [rsp+16]
    mov r8, [rsp+24]
    mov r9, [rsp+32]
    mov r10, rcx
    pop qword ptr [returnAddress]           ; Save the original return address
    call qword ptr [syscallAddress]         ; Call the random syscall instruction
    push qword ptr [returnAddress]          ; Restore the original return address
    ret
WhisperMain ENDP

NtAccessCheck PROC
    mov currentHash, 000D84B05h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheck ENDP

NtWorkerFactoryWorkerReady PROC
    mov currentHash, 09FA1B93Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWorkerFactoryWorkerReady ENDP

NtAcceptConnectPort PROC
    mov currentHash, 024B2213Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAcceptConnectPort ENDP

NtMapUserPhysicalPagesScatter PROC
    mov currentHash, 027822D1Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMapUserPhysicalPagesScatter ENDP

NtWaitForSingleObject PROC
    mov currentHash, 0A698B634h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForSingleObject ENDP

NtCallbackReturn PROC
    mov currentHash, 046DA6906h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCallbackReturn ENDP

NtReadFile PROC
    mov currentHash, 02D78E329h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReadFile ENDP

NtDeviceIoControlFile PROC
    mov currentHash, 05CBC501Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeviceIoControlFile ENDP

NtWriteFile PROC
    mov currentHash, 0C159CE3Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWriteFile ENDP

NtRemoveIoCompletion PROC
    mov currentHash, 00689869Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRemoveIoCompletion ENDP

NtReleaseSemaphore PROC
    mov currentHash, 04C1E34C0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReleaseSemaphore ENDP

NtReplyWaitReceivePort PROC
    mov currentHash, 061729E19h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplyWaitReceivePort ENDP

NtReplyPort PROC
    mov currentHash, 0A133CB2Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplyPort ENDP

NtSetInformationThread PROC
    mov currentHash, 0882FC281h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationThread ENDP

NtSetEvent PROC
    mov currentHash, 0DD40C0C9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetEvent ENDP

NtClose PROC
    mov currentHash, 0489CDDA5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtClose ENDP

NtQueryObject PROC
    mov currentHash, 0FA54F6FBh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryObject ENDP

NtQueryInformationFile PROC
    mov currentHash, 0F9781779h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationFile ENDP

NtOpenKey PROC
    mov currentHash, 00466E83Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenKey ENDP

NtEnumerateValueKey PROC
    mov currentHash, 02A5F37CAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateValueKey ENDP

NtFindAtom PROC
    mov currentHash, 0B5238AA1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFindAtom ENDP

NtQueryDefaultLocale PROC
    mov currentHash, 0A3237C62h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDefaultLocale ENDP

NtQueryKey PROC
    mov currentHash, 092A6AF1Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryKey ENDP

NtQueryValueKey PROC
    mov currentHash, 0B9099CAAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryValueKey ENDP

NtAllocateVirtualMemory PROC
    mov currentHash, 09790911Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateVirtualMemory ENDP

NtQueryInformationProcess PROC
    mov currentHash, 0612F4AB0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationProcess ENDP

NtWaitForMultipleObjects32 PROC
    mov currentHash, 016CA3625h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForMultipleObjects32 ENDP

NtWriteFileGather PROC
    mov currentHash, 03A24D23Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWriteFileGather ENDP

NtCreateKey PROC
    mov currentHash, 07E814F3Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateKey ENDP

NtFreeVirtualMemory PROC
    mov currentHash, 0C596A942h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFreeVirtualMemory ENDP

NtImpersonateClientOfPort PROC
    mov currentHash, 0783265BCh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtImpersonateClientOfPort ENDP

NtReleaseMutant PROC
    mov currentHash, 03BBC3426h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReleaseMutant ENDP

NtQueryInformationToken PROC
    mov currentHash, 0A17ECBFAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationToken ENDP

NtRequestWaitReplyPort PROC
    mov currentHash, 02DB14823h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRequestWaitReplyPort ENDP

NtQueryVirtualMemory PROC
    mov currentHash, 039D0395Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryVirtualMemory ENDP

NtOpenThreadToken PROC
    mov currentHash, 01D840F08h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenThreadToken ENDP

NtQueryInformationThread PROC
    mov currentHash, 02E8A3C3Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationThread ENDP

NtOpenProcess PROC
    mov currentHash, 0BE20A5ACh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenProcess ENDP

NtSetInformationFile PROC
    mov currentHash, 0B63F582Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationFile ENDP

NtMapViewOfSection PROC
    mov currentHash, 046EA2639h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMapViewOfSection ENDP

NtAccessCheckAndAuditAlarm PROC
    mov currentHash, 018BE1A52h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckAndAuditAlarm ENDP

NtUnmapViewOfSection PROC
    mov currentHash, 00A9E080Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnmapViewOfSection ENDP

NtReplyWaitReceivePortEx PROC
    mov currentHash, 0696B3BB1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplyWaitReceivePortEx ENDP

NtTerminateProcess PROC
    mov currentHash, 021A32630h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTerminateProcess ENDP

NtSetEventBoostPriority PROC
    mov currentHash, 00C961A1Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetEventBoostPriority ENDP

NtReadFileScatter PROC
    mov currentHash, 039921B2Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReadFileScatter ENDP

NtOpenThreadTokenEx PROC
    mov currentHash, 0148CA0B0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenThreadTokenEx ENDP

NtOpenProcessTokenEx PROC
    mov currentHash, 0C6C3807Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenProcessTokenEx ENDP

NtQueryPerformanceCounter PROC
    mov currentHash, 073D595C1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryPerformanceCounter ENDP

NtEnumerateKey PROC
    mov currentHash, 01B1F4ECDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateKey ENDP

NtOpenFile PROC
    mov currentHash, 0F4A573B9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenFile ENDP

NtDelayExecution PROC
    mov currentHash, 00A800811h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDelayExecution ENDP

NtQueryDirectoryFile PROC
    mov currentHash, 028BEF888h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDirectoryFile ENDP

NtQuerySystemInformation PROC
    mov currentHash, 0DA4BDCDFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySystemInformation ENDP

NtOpenSection PROC
    mov currentHash, 01CC63E57h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenSection ENDP

NtQueryTimer PROC
    mov currentHash, 0C3971FBAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryTimer ENDP

NtFsControlFile PROC
    mov currentHash, 0A8A9920Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFsControlFile ENDP

NtWriteVirtualMemory PROC
    mov currentHash, 00F912503h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWriteVirtualMemory ENDP

NtCloseObjectAuditAlarm PROC
    mov currentHash, 06EB06A26h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCloseObjectAuditAlarm ENDP

NtDuplicateObject PROC
    mov currentHash, 008B13A3Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDuplicateObject ENDP

NtQueryAttributesFile PROC
    mov currentHash, 03AB80E66h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryAttributesFile ENDP

NtClearEvent PROC
    mov currentHash, 06EF46B64h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtClearEvent ENDP

NtReadVirtualMemory PROC
    mov currentHash, 0D39D2AFEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReadVirtualMemory ENDP

NtOpenEvent PROC
    mov currentHash, 092B1D167h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenEvent ENDP

NtAdjustPrivilegesToken PROC
    mov currentHash, 01DA2F11Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAdjustPrivilegesToken ENDP

NtDuplicateToken PROC
    mov currentHash, 0DE6AC4E9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDuplicateToken ENDP

NtContinue PROC
    mov currentHash, 04ED93916h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtContinue ENDP

NtQueryDefaultUILanguage PROC
    mov currentHash, 09C3B8F87h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDefaultUILanguage ENDP

NtQueueApcThread PROC
    mov currentHash, 08EA41A9Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueueApcThread ENDP

NtYieldExecution PROC
    mov currentHash, 02EB8042Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtYieldExecution ENDP

NtAddAtom PROC
    mov currentHash, 04D47AE51h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAddAtom ENDP

NtCreateEvent PROC
    mov currentHash, 0E64DF5AAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateEvent ENDP

NtQueryVolumeInformationFile PROC
    mov currentHash, 0DE4FF0CCh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryVolumeInformationFile ENDP

NtCreateSection PROC
    mov currentHash, 0248D2A15h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateSection ENDP

NtFlushBuffersFile PROC
    mov currentHash, 0E85B3662h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushBuffersFile ENDP

NtApphelpCacheControl PROC
    mov currentHash, 0BDAD26ABh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtApphelpCacheControl ENDP

NtCreateProcessEx PROC
    mov currentHash, 00C924647h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateProcessEx ENDP

NtCreateThread PROC
    mov currentHash, 010B44209h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateThread ENDP

NtIsProcessInJob PROC
    mov currentHash, 064C2A691h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtIsProcessInJob ENDP

NtProtectVirtualMemory PROC
    mov currentHash, 04F954517h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtProtectVirtualMemory ENDP

NtQuerySection PROC
    mov currentHash, 0C844E4DFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySection ENDP

NtResumeThread PROC
    mov currentHash, 0B898BA26h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtResumeThread ENDP

NtTerminateThread PROC
    mov currentHash, 04C8E022Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTerminateThread ENDP

NtReadRequestData PROC
    mov currentHash, 0C3BDF0EFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReadRequestData ENDP

NtCreateFile PROC
    mov currentHash, 056E78957h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateFile ENDP

NtQueryEvent PROC
    mov currentHash, 07A4129E6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryEvent ENDP

NtWriteRequestData PROC
    mov currentHash, 0E4059212h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWriteRequestData ENDP

NtOpenDirectoryObject PROC
    mov currentHash, 0855FB1C0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenDirectoryObject ENDP

NtAccessCheckByTypeAndAuditAlarm PROC
    mov currentHash, 0CF40EFCFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckByTypeAndAuditAlarm ENDP

NtWaitForMultipleObjects PROC
    mov currentHash, 0D52DEDE7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForMultipleObjects ENDP

NtSetInformationObject PROC
    mov currentHash, 002213A8Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationObject ENDP

NtCancelIoFile PROC
    mov currentHash, 09AFB5DC7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelIoFile ENDP

NtTraceEvent PROC
    mov currentHash, 0CEF22697h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTraceEvent ENDP

NtPowerInformation PROC
    mov currentHash, 030AE11FDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPowerInformation ENDP

NtSetValueKey PROC
    mov currentHash, 009DD2E40h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetValueKey ENDP

NtCancelTimer PROC
    mov currentHash, 0ACA6F468h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelTimer ENDP

NtSetTimer PROC
    mov currentHash, 0379E1D26h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetTimer ENDP

NtAccessCheckByType PROC
    mov currentHash, 09CC67084h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckByType ENDP

NtAccessCheckByTypeResultList PROC
    mov currentHash, 07ED37A5Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckByTypeResultList ENDP

NtAccessCheckByTypeResultListAndAuditAlarm PROC
    mov currentHash, 0D2D4D540h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckByTypeResultListAndAuditAlarm ENDP

NtAccessCheckByTypeResultListAndAuditAlarmByHandle PROC
    mov currentHash, 0A99663A0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAccessCheckByTypeResultListAndAuditAlarmByHandle ENDP

NtAcquireProcessActivityReference PROC
    mov currentHash, 03AE3533Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAcquireProcessActivityReference ENDP

NtAddAtomEx PROC
    mov currentHash, 0FD15DDAEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAddAtomEx ENDP

NtAddBootEntry PROC
    mov currentHash, 001903128h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAddBootEntry ENDP

NtAddDriverEntry PROC
    mov currentHash, 019F76978h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAddDriverEntry ENDP

NtAdjustGroupsToken PROC
    mov currentHash, 025917530h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAdjustGroupsToken ENDP

NtAdjustTokenClaimsAndDeviceGroups PROC
    mov currentHash, 0FA66FCF4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAdjustTokenClaimsAndDeviceGroups ENDP

NtAlertResumeThread PROC
    mov currentHash, 0309A3E33h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlertResumeThread ENDP

NtAlertThread PROC
    mov currentHash, 0284312D5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlertThread ENDP

NtAlertThreadByThreadId PROC
    mov currentHash, 0A4B8E61Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlertThreadByThreadId ENDP

NtAllocateLocallyUniqueId PROC
    mov currentHash, 0CC0FCFA8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateLocallyUniqueId ENDP

NtAllocateReserveObject PROC
    mov currentHash, 08E23BEAFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateReserveObject ENDP

NtAllocateUserPhysicalPages PROC
    mov currentHash, 02F9D6816h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateUserPhysicalPages ENDP

NtAllocateUuids PROC
    mov currentHash, 017A4E4DAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateUuids ENDP

NtAllocateVirtualMemoryEx PROC
    mov currentHash, 0B880EA6Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAllocateVirtualMemoryEx ENDP

NtAlpcAcceptConnectPort PROC
    mov currentHash, 040B75B38h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcAcceptConnectPort ENDP

NtAlpcCancelMessage PROC
    mov currentHash, 017B6322Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCancelMessage ENDP

NtAlpcConnectPort PROC
    mov currentHash, 03269C007h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcConnectPort ENDP

NtAlpcConnectPortEx PROC
    mov currentHash, 0E06E3731h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcConnectPortEx ENDP

NtAlpcCreatePort PROC
    mov currentHash, 058CA7552h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCreatePort ENDP

NtAlpcCreatePortSection PROC
    mov currentHash, 00ADA0241h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCreatePortSection ENDP

NtAlpcCreateResourceReserve PROC
    mov currentHash, 010A10C1Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCreateResourceReserve ENDP

NtAlpcCreateSectionView PROC
    mov currentHash, 0148C7113h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCreateSectionView ENDP

NtAlpcCreateSecurityContext PROC
    mov currentHash, 008B21F3Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcCreateSecurityContext ENDP

NtAlpcDeletePortSection PROC
    mov currentHash, 0E157C602h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcDeletePortSection ENDP

NtAlpcDeleteResourceReserve PROC
    mov currentHash, 028A8D4F3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcDeleteResourceReserve ENDP

NtAlpcDeleteSectionView PROC
    mov currentHash, 086B7571Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcDeleteSectionView ENDP

NtAlpcDeleteSecurityContext PROC
    mov currentHash, 0EE960206h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcDeleteSecurityContext ENDP

NtAlpcDisconnectPort PROC
    mov currentHash, 0A6F2A060h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcDisconnectPort ENDP

NtAlpcImpersonateClientContainerOfPort PROC
    mov currentHash, 020B3C728h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcImpersonateClientContainerOfPort ENDP

NtAlpcImpersonateClientOfPort PROC
    mov currentHash, 0D44DC7E2h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcImpersonateClientOfPort ENDP

NtAlpcOpenSenderProcess PROC
    mov currentHash, 0EFBB2DEBh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcOpenSenderProcess ENDP

NtAlpcOpenSenderThread PROC
    mov currentHash, 0A805BAABh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcOpenSenderThread ENDP

NtAlpcQueryInformation PROC
    mov currentHash, 09D44BDCAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcQueryInformation ENDP

NtAlpcQueryInformationMessage PROC
    mov currentHash, 0C751C6EAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcQueryInformationMessage ENDP

NtAlpcRevokeSecurityContext PROC
    mov currentHash, 0D742F2D3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcRevokeSecurityContext ENDP

NtAlpcSendWaitReceivePort PROC
    mov currentHash, 022B23B36h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcSendWaitReceivePort ENDP

NtAlpcSetInformation PROC
    mov currentHash, 000E80279h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAlpcSetInformation ENDP

NtAreMappedFilesTheSame PROC
    mov currentHash, 0F7D4DA63h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAreMappedFilesTheSame ENDP

NtAssignProcessToJobObject PROC
    mov currentHash, 0301C1B43h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAssignProcessToJobObject ENDP

NtAssociateWaitCompletionPacket PROC
    mov currentHash, 0073C3780h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAssociateWaitCompletionPacket ENDP

NtCallEnclave PROC
    mov currentHash, 022D31278h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCallEnclave ENDP

NtCancelIoFileEx PROC
    mov currentHash, 0C73D0B79h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelIoFileEx ENDP

NtCancelSynchronousIoFile PROC
    mov currentHash, 026A60A20h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelSynchronousIoFile ENDP

NtCancelTimer2 PROC
    mov currentHash, 0C40A1C84h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelTimer2 ENDP

NtCancelWaitCompletionPacket PROC
    mov currentHash, 007833D0Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelWaitCompletionPacket ENDP

NtCommitComplete PROC
    mov currentHash, 0DA2BF4A0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCommitComplete ENDP

NtCommitEnlistment PROC
    mov currentHash, 059009E53h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCommitEnlistment ENDP

NtCommitRegistryTransaction PROC
    mov currentHash, 04E810C51h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCommitRegistryTransaction ENDP

NtCommitTransaction PROC
    mov currentHash, 03852F60Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCommitTransaction ENDP

NtCompactKeys PROC
    mov currentHash, 043B77820h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompactKeys ENDP

NtCompareObjects PROC
    mov currentHash, 09226A562h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompareObjects ENDP

NtCompareSigningLevels PROC
    mov currentHash, 070EA917Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompareSigningLevels ENDP

NtCompareTokens PROC
    mov currentHash, 079D57755h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompareTokens ENDP

NtCompleteConnectPort PROC
    mov currentHash, 020B63D38h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompleteConnectPort ENDP

NtCompressKey PROC
    mov currentHash, 0ABD1AA4Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCompressKey ENDP

NtConnectPort PROC
    mov currentHash, 07EA87B3Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtConnectPort ENDP

NtConvertBetweenAuxiliaryCounterAndPerformanceCounter PROC
    mov currentHash, 07FCC111Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtConvertBetweenAuxiliaryCounterAndPerformanceCounter ENDP

NtCreateDebugObject PROC
    mov currentHash, 070584915h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateDebugObject ENDP

NtCreateDirectoryObject PROC
    mov currentHash, 0BB91A91Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateDirectoryObject ENDP

NtCreateDirectoryObjectEx PROC
    mov currentHash, 0AC89F658h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateDirectoryObjectEx ENDP

NtCreateEnclave PROC
    mov currentHash, 0EC551C48h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateEnclave ENDP

NtCreateEnlistment PROC
    mov currentHash, 025982E1Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateEnlistment ENDP

NtCreateEventPair PROC
    mov currentHash, 01696320Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateEventPair ENDP

NtCreateIRTimer PROC
    mov currentHash, 0CD9BFD38h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateIRTimer ENDP

NtCreateIoCompletion PROC
    mov currentHash, 0C6B02420h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateIoCompletion ENDP

NtCreateJobObject PROC
    mov currentHash, 03C9D04D1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateJobObject ENDP

NtCreateJobSet PROC
    mov currentHash, 020AE760Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateJobSet ENDP

NtCreateKeyTransacted PROC
    mov currentHash, 0121EF303h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateKeyTransacted ENDP

NtCreateKeyedEvent PROC
    mov currentHash, 0C1AB2FB6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateKeyedEvent ENDP

NtCreateLowBoxToken PROC
    mov currentHash, 04F946DC4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateLowBoxToken ENDP

NtCreateMailslotFile PROC
    mov currentHash, 0243DCA3Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateMailslotFile ENDP

NtCreateMutant PROC
    mov currentHash, 0DDB3BE64h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateMutant ENDP

NtCreateNamedPipeFile PROC
    mov currentHash, 02ABD122Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateNamedPipeFile ENDP

NtCreatePagingFile PROC
    mov currentHash, 05CCB5E52h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreatePagingFile ENDP

NtCreatePartition PROC
    mov currentHash, 015A0694Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreatePartition ENDP

NtCreatePort PROC
    mov currentHash, 002881B06h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreatePort ENDP

NtCreatePrivateNamespace PROC
    mov currentHash, 09DBE43FFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreatePrivateNamespace ENDP

NtCreateProcess PROC
    mov currentHash, 029B92F28h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateProcess ENDP

NtCreateProfile PROC
    mov currentHash, 026BE292Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateProfile ENDP

NtCreateProfileEx PROC
    mov currentHash, 00D934B4Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateProfileEx ENDP

NtCreateRegistryTransaction PROC
    mov currentHash, 0CF54CBC6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateRegistryTransaction ENDP

NtCreateResourceManager PROC
    mov currentHash, 0183CC170h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateResourceManager ENDP

NtCreateSemaphore PROC
    mov currentHash, 0085A7AB2h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateSemaphore ENDP

NtCreateSymbolicLinkObject PROC
    mov currentHash, 0F2D8DC65h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateSymbolicLinkObject ENDP

NtCreateThreadEx PROC
    mov currentHash, 044BC86C6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateThreadEx ENDP

NtCreateTimer PROC
    mov currentHash, 00350DD10h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateTimer ENDP

NtCreateTimer2 PROC
    mov currentHash, 01353BA0Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateTimer2 ENDP

NtCreateToken PROC
    mov currentHash, 0C75AF5FAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateToken ENDP

NtCreateTokenEx PROC
    mov currentHash, 03AA0F7E5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateTokenEx ENDP

NtCreateTransaction PROC
    mov currentHash, 046CD4267h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateTransaction ENDP

NtCreateTransactionManager PROC
    mov currentHash, 0172507A4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateTransactionManager ENDP

NtCreateUserProcess PROC
    mov currentHash, 0398A3A14h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateUserProcess ENDP

NtCreateWaitCompletionPacket PROC
    mov currentHash, 0A99DD171h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateWaitCompletionPacket ENDP

NtCreateWaitablePort PROC
    mov currentHash, 0E673E1E0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateWaitablePort ENDP

NtCreateWnfStateName PROC
    mov currentHash, 0148A2D1Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateWnfStateName ENDP

NtCreateWorkerFactory PROC
    mov currentHash, 0BEAED64Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateWorkerFactory ENDP

NtDebugActiveProcess PROC
    mov currentHash, 07E3097ACh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDebugActiveProcess ENDP

NtDebugContinue PROC
    mov currentHash, 030244728h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDebugContinue ENDP

NtDeleteAtom PROC
    mov currentHash, 054C15756h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteAtom ENDP

NtDeleteBootEntry PROC
    mov currentHash, 009950306h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteBootEntry ENDP

NtDeleteDriverEntry PROC
    mov currentHash, 0CB97FF2Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteDriverEntry ENDP

NtDeleteFile PROC
    mov currentHash, 014B25392h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteFile ENDP

NtDeleteKey PROC
    mov currentHash, 069D34C78h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteKey ENDP

NtDeleteObjectAuditAlarm PROC
    mov currentHash, 07AA47C30h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteObjectAuditAlarm ENDP

NtDeletePrivateNamespace PROC
    mov currentHash, 06ACC6F55h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeletePrivateNamespace ENDP

NtDeleteValueKey PROC
    mov currentHash, 02A9F0905h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteValueKey ENDP

NtDeleteWnfStateData PROC
    mov currentHash, 002C292F0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteWnfStateData ENDP

NtDeleteWnfStateName PROC
    mov currentHash, 076B8FD9Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDeleteWnfStateName ENDP

NtDisableLastKnownGood PROC
    mov currentHash, 07BAA4570h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDisableLastKnownGood ENDP

NtDisplayString PROC
    mov currentHash, 0FEA3D422h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDisplayString ENDP

NtDrawText PROC
    mov currentHash, 012AB093Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtDrawText ENDP

NtEnableLastKnownGood PROC
    mov currentHash, 0E47B9E7Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnableLastKnownGood ENDP

NtEnumerateBootEntries PROC
    mov currentHash, 018CD1B51h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateBootEntries ENDP

NtEnumerateDriverEntries PROC
    mov currentHash, 0E8DC14B4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateDriverEntries ENDP

NtEnumerateSystemEnvironmentValuesEx PROC
    mov currentHash, 01D90CDC8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateSystemEnvironmentValuesEx ENDP

NtEnumerateTransactionObject PROC
    mov currentHash, 01935E84Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtEnumerateTransactionObject ENDP

NtExtendSection PROC
    mov currentHash, 03368ECC1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtExtendSection ENDP

NtFilterBootOption PROC
    mov currentHash, 00CA6CEF6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFilterBootOption ENDP

NtFilterToken PROC
    mov currentHash, 06420B86Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFilterToken ENDP

NtFilterTokenEx PROC
    mov currentHash, 0A64FA2F0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFilterTokenEx ENDP

NtFlushBuffersFileEx PROC
    mov currentHash, 0AA399A81h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushBuffersFileEx ENDP

NtFlushInstallUILanguage PROC
    mov currentHash, 0BB895C88h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushInstallUILanguage ENDP

NtFlushInstructionCache PROC
    mov currentHash, 08B588FF9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushInstructionCache ENDP

NtFlushKey PROC
    mov currentHash, 01C1F79E3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushKey ENDP

NtFlushProcessWriteBuffers PROC
    mov currentHash, 000BF0C2Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushProcessWriteBuffers ENDP

NtFlushVirtualMemory PROC
    mov currentHash, 0C9D12CBEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushVirtualMemory ENDP

NtFlushWriteBuffer PROC
    mov currentHash, 0831AAD8Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFlushWriteBuffer ENDP

NtFreeUserPhysicalPages PROC
    mov currentHash, 081BCB61Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFreeUserPhysicalPages ENDP

NtFreezeRegistry PROC
    mov currentHash, 0008B0607h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFreezeRegistry ENDP

NtFreezeTransactions PROC
    mov currentHash, 04F9D3777h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtFreezeTransactions ENDP

NtGetCachedSigningLevel PROC
    mov currentHash, 0B67AF0C0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetCachedSigningLevel ENDP

NtGetCompleteWnfStateSubscription PROC
    mov currentHash, 03CB13C23h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetCompleteWnfStateSubscription ENDP

NtGetContextThread PROC
    mov currentHash, 0F4C8FE5Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetContextThread ENDP

NtGetCurrentProcessorNumber PROC
    mov currentHash, 0D7B2C512h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetCurrentProcessorNumber ENDP

NtGetCurrentProcessorNumberEx PROC
    mov currentHash, 010AFC3F5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetCurrentProcessorNumberEx ENDP

NtGetDevicePowerState PROC
    mov currentHash, 036B61836h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetDevicePowerState ENDP

NtGetMUIRegistryInfo PROC
    mov currentHash, 06A10444Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetMUIRegistryInfo ENDP

NtGetNextProcess PROC
    mov currentHash, 0015FE333h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetNextProcess ENDP

NtGetNextThread PROC
    mov currentHash, 0306C32D5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetNextThread ENDP

NtGetNlsSectionPtr PROC
    mov currentHash, 03E16219Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetNlsSectionPtr ENDP

NtGetNotificationResourceManager PROC
    mov currentHash, 00F9F6B42h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetNotificationResourceManager ENDP

NtGetWriteWatch PROC
    mov currentHash, 0AD6FD7FDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetWriteWatch ENDP

NtImpersonateAnonymousToken PROC
    mov currentHash, 03016E42Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtImpersonateAnonymousToken ENDP

NtImpersonateThread PROC
    mov currentHash, 0328E1037h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtImpersonateThread ENDP

NtInitializeEnclave PROC
    mov currentHash, 0F0AEDA22h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtInitializeEnclave ENDP

NtInitializeNlsFiles PROC
    mov currentHash, 01317DD54h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtInitializeNlsFiles ENDP

NtInitializeRegistry PROC
    mov currentHash, 02C8C342Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtInitializeRegistry ENDP

NtInitiatePowerAction PROC
    mov currentHash, 00EA16475h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtInitiatePowerAction ENDP

NtIsSystemResumeAutomatic PROC
    mov currentHash, 086887393h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtIsSystemResumeAutomatic ENDP

NtIsUILanguageComitted PROC
    mov currentHash, 063861293h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtIsUILanguageComitted ENDP

NtListenPort PROC
    mov currentHash, 0A4AEA130h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtListenPort ENDP

NtLoadDriver PROC
    mov currentHash, 05CD7764Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadDriver ENDP

NtLoadEnclaveData PROC
    mov currentHash, 0F303C9D9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadEnclaveData ENDP

NtLoadHotPatch PROC
    mov currentHash, 09EAF9630h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadHotPatch ENDP

NtLoadKey PROC
    mov currentHash, 05BE25E61h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadKey ENDP

NtLoadKey2 PROC
    mov currentHash, 03AB9CE3Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadKey2 ENDP

NtLoadKeyEx PROC
    mov currentHash, 00584FD84h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLoadKeyEx ENDP

NtLockFile PROC
    mov currentHash, 0E038E8AAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLockFile ENDP

NtLockProductActivationKeys PROC
    mov currentHash, 0E742ECD4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLockProductActivationKeys ENDP

NtLockRegistryKey PROC
    mov currentHash, 06DCB5C4Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLockRegistryKey ENDP

NtLockVirtualMemory PROC
    mov currentHash, 031B4D4DBh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtLockVirtualMemory ENDP

NtMakePermanentObject PROC
    mov currentHash, 012017ADCh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMakePermanentObject ENDP

NtMakeTemporaryObject PROC
    mov currentHash, 006DD7E31h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMakeTemporaryObject ENDP

NtManagePartition PROC
    mov currentHash, 0868D8118h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtManagePartition ENDP

NtMapCMFModule PROC
    mov currentHash, 068265372h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMapCMFModule ENDP

NtMapUserPhysicalPages PROC
    mov currentHash, 08DB5F64Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMapUserPhysicalPages ENDP

NtMapViewOfSectionEx PROC
    mov currentHash, 060D329E2h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMapViewOfSectionEx ENDP

NtModifyBootEntry PROC
    mov currentHash, 009803938h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtModifyBootEntry ENDP

NtModifyDriverEntry PROC
    mov currentHash, 009983950h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtModifyDriverEntry ENDP

NtNotifyChangeDirectoryFile PROC
    mov currentHash, 0BC3BAC80h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtNotifyChangeDirectoryFile ENDP

NtNotifyChangeDirectoryFileEx PROC
    mov currentHash, 080BBC407h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtNotifyChangeDirectoryFileEx ENDP

NtNotifyChangeKey PROC
    mov currentHash, 0859A6385h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtNotifyChangeKey ENDP

NtNotifyChangeMultipleKeys PROC
    mov currentHash, 08794009Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtNotifyChangeMultipleKeys ENDP

NtNotifyChangeSession PROC
    mov currentHash, 001D750F4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtNotifyChangeSession ENDP

NtOpenEnlistment PROC
    mov currentHash, 049CB7C4Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenEnlistment ENDP

NtOpenEventPair PROC
    mov currentHash, 0C292C607h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenEventPair ENDP

NtOpenIoCompletion PROC
    mov currentHash, 0148235D1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenIoCompletion ENDP

NtOpenJobObject PROC
    mov currentHash, 082A050FDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenJobObject ENDP

NtOpenKeyEx PROC
    mov currentHash, 0765A9025h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenKeyEx ENDP

NtOpenKeyTransacted PROC
    mov currentHash, 0DCBCEE62h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenKeyTransacted ENDP

NtOpenKeyTransactedEx PROC
    mov currentHash, 026DFE061h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenKeyTransactedEx ENDP

NtOpenKeyedEvent PROC
    mov currentHash, 0C88A2AFDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenKeyedEvent ENDP

NtOpenMutant PROC
    mov currentHash, 072E27B7Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenMutant ENDP

NtOpenObjectAuditAlarm PROC
    mov currentHash, 00A85261Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenObjectAuditAlarm ENDP

NtOpenPartition PROC
    mov currentHash, 0B4AA53BAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenPartition ENDP

NtOpenPrivateNamespace PROC
    mov currentHash, 01EAE213Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenPrivateNamespace ENDP

NtOpenProcessToken PROC
    mov currentHash, 0E5219BE2h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenProcessToken ENDP

NtOpenRegistryTransaction PROC
    mov currentHash, 01E40D914h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenRegistryTransaction ENDP

NtOpenResourceManager PROC
    mov currentHash, 0259D313Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenResourceManager ENDP

NtOpenSemaphore PROC
    mov currentHash, 04E9A9322h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenSemaphore ENDP

NtOpenSession PROC
    mov currentHash, 0EBCD17AEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenSession ENDP

NtOpenSymbolicLinkObject PROC
    mov currentHash, 00FA1372Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenSymbolicLinkObject ENDP

NtOpenThread PROC
    mov currentHash, 002315609h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenThread ENDP

NtOpenTimer PROC
    mov currentHash, 06A52E243h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenTimer ENDP

NtOpenTransaction PROC
    mov currentHash, 0E8C19E25h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenTransaction ENDP

NtOpenTransactionManager PROC
    mov currentHash, 03DA6D7BAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtOpenTransactionManager ENDP

NtPlugPlayControl PROC
    mov currentHash, 04F184BF3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPlugPlayControl ENDP

NtPrePrepareComplete PROC
    mov currentHash, 02ED3C45Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrePrepareComplete ENDP

NtPrePrepareEnlistment PROC
    mov currentHash, 0D9BEC63Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrePrepareEnlistment ENDP

NtPrepareComplete PROC
    mov currentHash, 0089003FEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrepareComplete ENDP

NtPrepareEnlistment PROC
    mov currentHash, 0B629CDDEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrepareEnlistment ENDP

NtPrivilegeCheck PROC
    mov currentHash, 00AA6F9F8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrivilegeCheck ENDP

NtPrivilegeObjectAuditAlarm PROC
    mov currentHash, 010AEEAC2h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrivilegeObjectAuditAlarm ENDP

NtPrivilegedServiceAuditAlarm PROC
    mov currentHash, 0905F1D46h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPrivilegedServiceAuditAlarm ENDP

NtPropagationComplete PROC
    mov currentHash, 01CB9FEF6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPropagationComplete ENDP

NtPropagationFailed PROC
    mov currentHash, 09E997DC7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPropagationFailed ENDP

NtPulseEvent PROC
    mov currentHash, 0F64AC7ECh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPulseEvent ENDP

NtQueryAuxiliaryCounterFrequency PROC
    mov currentHash, 03BB11617h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryAuxiliaryCounterFrequency ENDP

NtQueryBootEntryOrder PROC
    mov currentHash, 087AE138Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryBootEntryOrder ENDP

NtQueryBootOptions PROC
    mov currentHash, 0C5A93FC1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryBootOptions ENDP

NtQueryDebugFilterState PROC
    mov currentHash, 0F6B518F4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDebugFilterState ENDP

NtQueryDirectoryFileEx PROC
    mov currentHash, 02C37108Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDirectoryFileEx ENDP

NtQueryDirectoryObject PROC
    mov currentHash, 0163D38A6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDirectoryObject ENDP

NtQueryDriverEntryOrder PROC
    mov currentHash, 0B3869513h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryDriverEntryOrder ENDP

NtQueryEaFile PROC
    mov currentHash, 06432B598h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryEaFile ENDP

NtQueryFullAttributesFile PROC
    mov currentHash, 01C7DC8CEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryFullAttributesFile ENDP

NtQueryInformationAtom PROC
    mov currentHash, 0A938CD31h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationAtom ENDP

NtQueryInformationByName PROC
    mov currentHash, 0F42B87FDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationByName ENDP

NtQueryInformationEnlistment PROC
    mov currentHash, 0D448F7DEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationEnlistment ENDP

NtQueryInformationJobObject PROC
    mov currentHash, 072508F50h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationJobObject ENDP

NtQueryInformationPort PROC
    mov currentHash, 0E579FCD7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationPort ENDP

NtQueryInformationResourceManager PROC
    mov currentHash, 0E7577177h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationResourceManager ENDP

NtQueryInformationTransaction PROC
    mov currentHash, 002172C8Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationTransaction ENDP

NtQueryInformationTransactionManager PROC
    mov currentHash, 0C5992AE5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationTransactionManager ENDP

NtQueryInformationWorkerFactory PROC
    mov currentHash, 0FC95CA39h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInformationWorkerFactory ENDP

NtQueryInstallUILanguage PROC
    mov currentHash, 01342D01Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryInstallUILanguage ENDP

NtQueryIntervalProfile PROC
    mov currentHash, 028A07664h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryIntervalProfile ENDP

NtQueryIoCompletion PROC
    mov currentHash, 09F36A3B4h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryIoCompletion ENDP

NtQueryLicenseValue PROC
    mov currentHash, 0B421DA2Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryLicenseValue ENDP

NtQueryMultipleValueKey PROC
    mov currentHash, 04195622Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryMultipleValueKey ENDP

NtQueryMutant PROC
    mov currentHash, 0F453CDE6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryMutant ENDP

NtQueryOpenSubKeys PROC
    mov currentHash, 08AD0A572h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryOpenSubKeys ENDP

NtQueryOpenSubKeysEx PROC
    mov currentHash, 0AFA3F576h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryOpenSubKeysEx ENDP

NtQueryPortInformationProcess PROC
    mov currentHash, 041D4444Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryPortInformationProcess ENDP

NtQueryQuotaInformationFile PROC
    mov currentHash, 0BAB944BAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryQuotaInformationFile ENDP

NtQuerySecurityAttributesToken PROC
    mov currentHash, 032153A8Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySecurityAttributesToken ENDP

NtQuerySecurityObject PROC
    mov currentHash, 036AB5EB7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySecurityObject ENDP

NtQuerySecurityPolicy PROC
    mov currentHash, 03C8B013Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySecurityPolicy ENDP

NtQuerySemaphore PROC
    mov currentHash, 043560DF0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySemaphore ENDP

NtQuerySymbolicLinkObject PROC
    mov currentHash, 01435FC29h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySymbolicLinkObject ENDP

NtQuerySystemEnvironmentValue PROC
    mov currentHash, 0FC20F3C0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySystemEnvironmentValue ENDP

NtQuerySystemEnvironmentValueEx PROC
    mov currentHash, 0FFE0FB5Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySystemEnvironmentValueEx ENDP

NtQuerySystemInformationEx PROC
    mov currentHash, 0969554AEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySystemInformationEx ENDP

NtQueryTimerResolution PROC
    mov currentHash, 048D26801h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryTimerResolution ENDP

NtQueryWnfStateData PROC
    mov currentHash, 062FB700Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryWnfStateData ENDP

NtQueryWnfStateNameInformation PROC
    mov currentHash, 0DE44DED7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueryWnfStateNameInformation ENDP

NtQueueApcThreadEx PROC
    mov currentHash, 02A3E6884h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQueueApcThreadEx ENDP

NtRaiseException PROC
    mov currentHash, 0C149205Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRaiseException ENDP

NtRaiseHardError PROC
    mov currentHash, 007982B3Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRaiseHardError ENDP

NtReadOnlyEnlistment PROC
    mov currentHash, 00FA90E3Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReadOnlyEnlistment ENDP

NtRecoverEnlistment PROC
    mov currentHash, 09B359EA3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRecoverEnlistment ENDP

NtRecoverResourceManager PROC
    mov currentHash, 06833B099h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRecoverResourceManager ENDP

NtRecoverTransactionManager PROC
    mov currentHash, 03FA81530h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRecoverTransactionManager ENDP

NtRegisterProtocolAddressInformation PROC
    mov currentHash, 0180F7E1Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRegisterProtocolAddressInformation ENDP

NtRegisterThreadTerminatePort PROC
    mov currentHash, 020B2C6E0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRegisterThreadTerminatePort ENDP

NtReleaseKeyedEvent PROC
    mov currentHash, 0CE4EDBCCh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReleaseKeyedEvent ENDP

NtReleaseWorkerFactoryWorker PROC
    mov currentHash, 0F86DD6B5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReleaseWorkerFactoryWorker ENDP

NtRemoveIoCompletionEx PROC
    mov currentHash, 08416B2A8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRemoveIoCompletionEx ENDP

NtRemoveProcessDebug PROC
    mov currentHash, 0AA3A6912h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRemoveProcessDebug ENDP

NtRenameKey PROC
    mov currentHash, 03AF26529h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRenameKey ENDP

NtRenameTransactionManager PROC
    mov currentHash, 0C79EDC37h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRenameTransactionManager ENDP

NtReplaceKey PROC
    mov currentHash, 08AD7A178h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplaceKey ENDP

NtReplacePartitionUnit PROC
    mov currentHash, 026332AA8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplacePartitionUnit ENDP

NtReplyWaitReplyPort PROC
    mov currentHash, 0A0358FAEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReplyWaitReplyPort ENDP

NtRequestPort PROC
    mov currentHash, 0E97EF6F5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRequestPort ENDP

NtResetEvent PROC
    mov currentHash, 0CF127F37h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtResetEvent ENDP

NtResetWriteWatch PROC
    mov currentHash, 0C2B1C912h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtResetWriteWatch ENDP

NtRestoreKey PROC
    mov currentHash, 096A2F748h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRestoreKey ENDP

NtResumeProcess PROC
    mov currentHash, 0722C69A1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtResumeProcess ENDP

NtRevertContainerImpersonation PROC
    mov currentHash, 0452E49BDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRevertContainerImpersonation ENDP

NtRollbackComplete PROC
    mov currentHash, 0273ABE04h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollbackComplete ENDP

NtRollbackEnlistment PROC
    mov currentHash, 07E421BDAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollbackEnlistment ENDP

NtRollbackRegistryTransaction PROC
    mov currentHash, 00CFE1673h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollbackRegistryTransaction ENDP

NtRollbackTransaction PROC
    mov currentHash, 0920A969Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollbackTransaction ENDP

NtRollforwardTransactionManager PROC
    mov currentHash, 0160644C7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollforwardTransactionManager ENDP

NtSaveKey PROC
    mov currentHash, 01682C8D5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSaveKey ENDP

NtSaveKeyEx PROC
    mov currentHash, 0C457E3E8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSaveKeyEx ENDP

NtSaveMergedKeys PROC
    mov currentHash, 067FC6274h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSaveMergedKeys ENDP

NtSecureConnectPort PROC
    mov currentHash, 0608E592Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSecureConnectPort ENDP

NtSerializeBoot PROC
    mov currentHash, 072E24C61h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSerializeBoot ENDP

NtSetBootEntryOrder PROC
    mov currentHash, 033B61D2Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetBootEntryOrder ENDP

NtSetBootOptions PROC
    mov currentHash, 05387591Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetBootOptions ENDP

NtSetCachedSigningLevel PROC
    mov currentHash, 02ABAA598h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetCachedSigningLevel ENDP

NtSetCachedSigningLevel2 PROC
    mov currentHash, 0B29040B5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetCachedSigningLevel2 ENDP

NtSetContextThread PROC
    mov currentHash, 03CBCE60Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetContextThread ENDP

NtSetDebugFilterState PROC
    mov currentHash, 03290DBDEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetDebugFilterState ENDP

NtSetDefaultHardErrorPort PROC
    mov currentHash, 0257724E9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetDefaultHardErrorPort ENDP

NtSetDefaultLocale PROC
    mov currentHash, 08D2C8599h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetDefaultLocale ENDP

NtSetDefaultUILanguage PROC
    mov currentHash, 08B35AB6Eh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetDefaultUILanguage ENDP

NtSetDriverEntryOrder PROC
    mov currentHash, 095AEE742h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetDriverEntryOrder ENDP

NtSetEaFile PROC
    mov currentHash, 0E138E9DDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetEaFile ENDP

NtSetHighEventPair PROC
    mov currentHash, 060D47A71h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetHighEventPair ENDP

NtSetHighWaitLowEventPair PROC
    mov currentHash, 090B19827h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetHighWaitLowEventPair ENDP

NtSetIRTimer PROC
    mov currentHash, 08FA8F140h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetIRTimer ENDP

NtSetInformationDebugObject PROC
    mov currentHash, 0071D79EFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationDebugObject ENDP

NtSetInformationEnlistment PROC
    mov currentHash, 00E56E804h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationEnlistment ENDP

NtSetInformationJobObject PROC
    mov currentHash, 073569D24h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationJobObject ENDP

NtSetInformationKey PROC
    mov currentHash, 0020837B5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationKey ENDP

NtSetInformationResourceManager PROC
    mov currentHash, 0FD9309EAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationResourceManager ENDP

NtSetInformationSymbolicLink PROC
    mov currentHash, 0AE3BA6AEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationSymbolicLink ENDP

NtSetInformationToken PROC
    mov currentHash, 0AF9FF534h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationToken ENDP

NtSetInformationTransaction PROC
    mov currentHash, 0108A361Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationTransaction ENDP

NtSetInformationTransactionManager PROC
    mov currentHash, 0725FEC74h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationTransactionManager ENDP

NtSetInformationVirtualMemory PROC
    mov currentHash, 019901313h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationVirtualMemory ENDP

NtSetInformationWorkerFactory PROC
    mov currentHash, 00A8E1816h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationWorkerFactory ENDP

NtSetIntervalProfile PROC
    mov currentHash, 03499AE98h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetIntervalProfile ENDP

NtSetIoCompletion PROC
    mov currentHash, 09681921Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetIoCompletion ENDP

NtSetIoCompletionEx PROC
    mov currentHash, 0989A24BEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetIoCompletionEx ENDP

NtSetLdtEntries PROC
    mov currentHash, 0B91DBA86h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetLdtEntries ENDP

NtSetLowEventPair PROC
    mov currentHash, 010B7C4F1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetLowEventPair ENDP

NtSetLowWaitHighEventPair PROC
    mov currentHash, 0E4D1D40Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetLowWaitHighEventPair ENDP

NtSetQuotaInformationFile PROC
    mov currentHash, 068FEA148h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetQuotaInformationFile ENDP

NtSetSecurityObject PROC
    mov currentHash, 01A2464D9h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSecurityObject ENDP

NtSetSystemEnvironmentValue PROC
    mov currentHash, 0C256ED92h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSystemEnvironmentValue ENDP

NtSetSystemEnvironmentValueEx PROC
    mov currentHash, 02FC4F2A1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSystemEnvironmentValueEx ENDP

NtSetSystemInformation PROC
    mov currentHash, 09C069A9Fh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSystemInformation ENDP

NtSetSystemPowerState PROC
    mov currentHash, 01F3D8800h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSystemPowerState ENDP

NtSetSystemTime PROC
    mov currentHash, 094B3C98Bh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetSystemTime ENDP

NtSetThreadExecutionState PROC
    mov currentHash, 000BA2834h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetThreadExecutionState ENDP

NtSetTimer2 PROC
    mov currentHash, 011A97007h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetTimer2 ENDP

NtSetTimerEx PROC
    mov currentHash, 030B7726Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetTimerEx ENDP

NtSetTimerResolution PROC
    mov currentHash, 0D649F6D7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetTimerResolution ENDP

NtSetUuidSeed PROC
    mov currentHash, 0158DD430h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetUuidSeed ENDP

NtSetVolumeInformationFile PROC
    mov currentHash, 0D8CB47F8h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetVolumeInformationFile ENDP

NtSetWnfProcessNotificationEvent PROC
    mov currentHash, 03E941334h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetWnfProcessNotificationEvent ENDP

NtShutdownSystem PROC
    mov currentHash, 0068CFEC7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtShutdownSystem ENDP

NtShutdownWorkerFactory PROC
    mov currentHash, 00898362Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtShutdownWorkerFactory ENDP

NtSignalAndWaitForSingleObject PROC
    mov currentHash, 000BE0E03h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSignalAndWaitForSingleObject ENDP

NtSinglePhaseReject PROC
    mov currentHash, 01AA13E39h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSinglePhaseReject ENDP

NtStartProfile PROC
    mov currentHash, 0289C722Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtStartProfile ENDP

NtStopProfile PROC
    mov currentHash, 0C88938DFh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtStopProfile ENDP

NtSubscribeWnfStateChange PROC
    mov currentHash, 022A16304h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSubscribeWnfStateChange ENDP

NtSuspendProcess PROC
    mov currentHash, 0519C7000h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSuspendProcess ENDP

NtSuspendThread PROC
    mov currentHash, 03A1F24BDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSuspendThread ENDP

NtSystemDebugControl PROC
    mov currentHash, 0C09EC476h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSystemDebugControl ENDP

NtTerminateEnclave PROC
    mov currentHash, 0EE33C6FEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTerminateEnclave ENDP

NtTerminateJobObject PROC
    mov currentHash, 0BAB8B224h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTerminateJobObject ENDP

NtTestAlert PROC
    mov currentHash, 04ED13358h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTestAlert ENDP

NtThawRegistry PROC
    mov currentHash, 006EF4E21h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtThawRegistry ENDP

NtThawTransactions PROC
    mov currentHash, 00796193Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtThawTransactions ENDP

NtTraceControl PROC
    mov currentHash, 0DF8A2BDDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTraceControl ENDP

NtTranslateFilePath PROC
    mov currentHash, 0FA3081FCh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtTranslateFilePath ENDP

NtUmsThreadYield PROC
    mov currentHash, 0F85A28EEh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUmsThreadYield ENDP

NtUnloadDriver PROC
    mov currentHash, 0D69F05C1h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnloadDriver ENDP

NtUnloadKey PROC
    mov currentHash, 0EA3E8DCDh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnloadKey ENDP

NtUnloadKey2 PROC
    mov currentHash, 027D4615Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnloadKey2 ENDP

NtUnloadKeyEx PROC
    mov currentHash, 067F32B36h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnloadKeyEx ENDP

NtUnlockFile PROC
    mov currentHash, 0903DC0F6h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnlockFile ENDP

NtUnlockVirtualMemory PROC
    mov currentHash, 098118E80h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnlockVirtualMemory ENDP

NtUnmapViewOfSectionEx PROC
    mov currentHash, 0F29131EBh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnmapViewOfSectionEx ENDP

NtUnsubscribeWnfStateChange PROC
    mov currentHash, 050CE5756h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUnsubscribeWnfStateChange ENDP

NtUpdateWnfStateData PROC
    mov currentHash, 0DEDCEA46h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtUpdateWnfStateData ENDP

NtVdmControl PROC
    mov currentHash, 0BD9039A7h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtVdmControl ENDP

NtWaitForAlertByThreadId PROC
    mov currentHash, 0143F7CCAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForAlertByThreadId ENDP

NtWaitForDebugEvent PROC
    mov currentHash, 090B06FDAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForDebugEvent ENDP

NtWaitForKeyedEvent PROC
    mov currentHash, 0D08A3618h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForKeyedEvent ENDP

NtWaitForWorkViaWorkerFactory PROC
    mov currentHash, 0C89DE634h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForWorkViaWorkerFactory ENDP

NtWaitHighEventPair PROC
    mov currentHash, 0A31DBFB0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitHighEventPair ENDP

NtWaitLowEventPair PROC
    mov currentHash, 050B3B4E5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitLowEventPair ENDP

NtAcquireCMFViewOwnership PROC
    mov currentHash, 0FA6D1A7Ah    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtAcquireCMFViewOwnership ENDP

NtCancelDeviceWakeupRequest PROC
    mov currentHash, 033EDFBB0h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCancelDeviceWakeupRequest ENDP

NtClearAllSavepointsTransaction PROC
    mov currentHash, 00294280Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtClearAllSavepointsTransaction ENDP

NtClearSavepointTransaction PROC
    mov currentHash, 01288301Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtClearSavepointTransaction ENDP

NtRollbackSavepointTransaction PROC
    mov currentHash, 0CB28EFBAh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRollbackSavepointTransaction ENDP

NtSavepointTransaction PROC
    mov currentHash, 0009A27CBh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSavepointTransaction ENDP

NtSavepointComplete PROC
    mov currentHash, 02AB2163Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSavepointComplete ENDP

NtCreateSectionEx PROC
    mov currentHash, 0F8993BC3h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateSectionEx ENDP

NtCreateCrossVmEvent PROC
    mov currentHash, 092CDBB10h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtCreateCrossVmEvent ENDP

NtGetPlugPlayEvent PROC
    mov currentHash, 008858F96h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtGetPlugPlayEvent ENDP

NtListTransactions PROC
    mov currentHash, 00D982B33h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtListTransactions ENDP

NtMarshallTransaction PROC
    mov currentHash, 02A6FF427h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtMarshallTransaction ENDP

NtPullTransaction PROC
    mov currentHash, 0898FA91Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtPullTransaction ENDP

NtReleaseCMFViewOwnership PROC
    mov currentHash, 00D95254Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtReleaseCMFViewOwnership ENDP

NtWaitForWnfNotifications PROC
    mov currentHash, 00D97290Dh    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtWaitForWnfNotifications ENDP

NtStartTm PROC
    mov currentHash, 021F27B5Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtStartTm ENDP

NtSetInformationProcess PROC
    mov currentHash, 0922881A5h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtSetInformationProcess ENDP

NtRequestDeviceWakeup PROC
    mov currentHash, 003AF3904h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRequestDeviceWakeup ENDP

NtRequestWakeupLatency PROC
    mov currentHash, 03285536Ch    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtRequestWakeupLatency ENDP

NtQuerySystemTime PROC
    mov currentHash, 07EB95963h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtQuerySystemTime ENDP

NtManageHotPatch PROC
    mov currentHash, 01321D914h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtManageHotPatch ENDP

NtContinueEx PROC
    mov currentHash, 0F7CEB332h    ; Load function hash into global variable.
    call WhisperMain               ; Resolve function hash into syscall number and make the call
NtContinueEx ENDP

end