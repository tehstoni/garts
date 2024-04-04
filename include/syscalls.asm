// In syscalls.h or a relevant header file
extern UINT_PTR sysAddrNtAllocateVirtualMemory;
extern UINT_PTR sysAddrNtWriteVirtualMemory;


.CODE  ;

;
SysNtAllocateVirtualMemory PROC
    mov r10, rcx
    mov eax, 18h
    jmp QWORD PTR [sysAddrNtAllocateVirtualMemory]
SysNtAllocateVirtualMemory ENDP


;
SysNtWriteVirtualMemory PROC
    mov r10, rcx
    mov eax, 3Ah
    jmp QWORD PTR [sysAddrNtWriteVirtualMemory]
SysNtWriteVirtualMemory ENDP

END  ;