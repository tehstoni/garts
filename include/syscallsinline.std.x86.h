#pragma once

// Code below is adapted from @modexpblog. Read linked article for more details.
// https://www.mdsec.co.uk/2020/12/bypassing-user-mode-hooks-and-direct-invocation-of-system-calls-for-red-teams

#ifndef SW2_HEADER_H_
#define SW2_HEADER_H_

#include <windows.h>

#define SW2_SEED 0x158EF2A8
#define SW2_ROL8(v) (v << 8 | v >> 24)
#define SW2_ROR8(v) (v >> 8 | v << 24)
#define SW2_ROX8(v) ((SW2_SEED % 2) ? SW2_ROL8(v) : SW2_ROR8(v))
#define SW2_MAX_ENTRIES 500
#define SW2_RVA2VA(Type, DllBase, Rva) (Type)((ULONG_PTR) DllBase + Rva)

// Typedefs are prefixed to avoid pollution.

typedef struct _SW2_SYSCALL_ENTRY
{
    DWORD Hash;
    DWORD Address;
} SW2_SYSCALL_ENTRY, *PSW2_SYSCALL_ENTRY;

typedef struct _SW2_SYSCALL_LIST
{
    DWORD Count;
    SW2_SYSCALL_ENTRY Entries[SW2_MAX_ENTRIES];
} SW2_SYSCALL_LIST, *PSW2_SYSCALL_LIST;

typedef struct _SW2_PEB_LDR_DATA {
	BYTE Reserved1[8];
	PVOID Reserved2[3];
	LIST_ENTRY InMemoryOrderModuleList;
} SW2_PEB_LDR_DATA, *PSW2_PEB_LDR_DATA;

typedef struct _SW2_LDR_DATA_TABLE_ENTRY {
	PVOID Reserved1[2];
	LIST_ENTRY InMemoryOrderLinks;
	PVOID Reserved2[2];
	PVOID DllBase;
} SW2_LDR_DATA_TABLE_ENTRY, *PSW2_LDR_DATA_TABLE_ENTRY;

typedef struct _SW2_PEB {
	BYTE Reserved1[2];
	BYTE BeingDebugged;
	BYTE Reserved2[1];
	PVOID Reserved3[2];
	PSW2_PEB_LDR_DATA Ldr;
} SW2_PEB, *PSW2_PEB;

DWORD SW2_HashSyscall(PCSTR FunctionName);
BOOL SW2_PopulateSyscallList(void);
EXTERN_C DWORD SW2_GetSyscallNumber(DWORD FunctionHash);

typedef struct _UNICODE_STRING
{
	USHORT Length;
	USHORT MaximumLength;
	PWSTR  Buffer;
} UNICODE_STRING, *PUNICODE_STRING;

typedef struct _SYSTEM_HANDLE
{
	ULONG ProcessId;
	BYTE ObjectTypeNumber;
	BYTE Flags;
	USHORT Handle;
	PVOID Object;
	ACCESS_MASK GrantedAccess;
} SYSTEM_HANDLE, *PSYSTEM_HANDLE;

typedef struct _TOKEN_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
{
	PVOID pValue;
	ULONG ValueLength;
} TOKEN_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE, *PTOKEN_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE;

typedef struct _TOKEN_SECURITY_ATTRIBUTE_FQBN_VALUE
{
	ULONG64        Version;
	UNICODE_STRING Name;
} TOKEN_SECURITY_ATTRIBUTE_FQBN_VALUE, *PTOKEN_SECURITY_ATTRIBUTE_FQBN_VALUE;

typedef struct _WNF_TYPE_ID
{
	GUID TypeId;
} WNF_TYPE_ID, *PWNF_TYPE_ID;

typedef enum _KCONTINUE_TYPE
{
	KCONTINUE_UNWIND,
	KCONTINUE_RESUME,
	KCONTINUE_LONGJUMP,
	KCONTINUE_SET,
	KCONTINUE_LAST
} KCONTINUE_TYPE;

typedef struct _IO_STATUS_BLOCK
{
	union
	{
		NTSTATUS Status;
		VOID*    Pointer;
	};
	ULONG_PTR Information;
} IO_STATUS_BLOCK, *PIO_STATUS_BLOCK;

typedef enum _PS_CREATE_STATE
{
	PsCreateInitialState,
	PsCreateFailOnFileOpen,
	PsCreateFailOnSectionCreate,
	PsCreateFailExeFormat,
	PsCreateFailMachineMismatch,
	PsCreateFailExeName,
	PsCreateSuccess,
	PsCreateMaximumStates
} PS_CREATE_STATE, *PPS_CREATE_STATE;

typedef struct _SYSTEM_HANDLE_INFORMATION
{
	ULONG HandleCount;
	SYSTEM_HANDLE Handles[1];
} SYSTEM_HANDLE_INFORMATION, *PSYSTEM_HANDLE_INFORMATION;

typedef struct _CLIENT_ID
{
	HANDLE UniqueProcess;
	HANDLE UniqueThread;
} CLIENT_ID, *PCLIENT_ID;

typedef enum _PLUGPLAY_EVENT_CATEGORY
{
	HardwareProfileChangeEvent,
	TargetDeviceChangeEvent,
	DeviceClassChangeEvent,
	CustomDeviceEvent,
	DeviceInstallEvent,
	DeviceArrivalEvent,
	PowerEvent,
	VetoEvent,
	BlockedDriverEvent,
	InvalidIDEvent,
	MaxPlugEventCategory
} PLUGPLAY_EVENT_CATEGORY, *PPLUGPLAY_EVENT_CATEGORY;

typedef enum _PNP_VETO_TYPE
{
	PNP_VetoTypeUnknown, // unspecified
	PNP_VetoLegacyDevice, // instance path
	PNP_VetoPendingClose, // instance path
	PNP_VetoWindowsApp, // module
	PNP_VetoWindowsService, // service
	PNP_VetoOutstandingOpen, // instance path
	PNP_VetoDevice, // instance path
	PNP_VetoDriver, // driver service name
	PNP_VetoIllegalDeviceRequest, // instance path
	PNP_VetoInsufficientPower, // unspecified
	PNP_VetoNonDisableable, // instance path
	PNP_VetoLegacyDriver, // service
	PNP_VetoInsufficientRights  // unspecified
} PNP_VETO_TYPE, *PPNP_VETO_TYPE;

typedef struct _TOKEN_SECURITY_ATTRIBUTE_V1
{
	UNICODE_STRING Name;
	USHORT         ValueType;
	USHORT         Reserved;
	ULONG          Flags;
	ULONG          ValueCount;
	union
	{
		PLONG64                                      pInt64;
		PULONG64                                     pUint64;
		PUNICODE_STRING                              pString;
		PTOKEN_SECURITY_ATTRIBUTE_FQBN_VALUE         pFqbn;
		PTOKEN_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE pOctetString;
	} Values;
} TOKEN_SECURITY_ATTRIBUTE_V1, *PTOKEN_SECURITY_ATTRIBUTE_V1;

typedef VOID(KNORMAL_ROUTINE) (
	IN PVOID NormalContext,
	IN PVOID SystemArgument1,
	IN PVOID SystemArgument2);

typedef struct _PS_ATTRIBUTE
{
	ULONG  Attribute;
	SIZE_T Size;
	union
	{
		ULONG Value;
		PVOID ValuePtr;
	} u1;
	PSIZE_T ReturnLength;
} PS_ATTRIBUTE, *PPS_ATTRIBUTE;

typedef struct _WNF_STATE_NAME
{
	ULONG Data[2];
} WNF_STATE_NAME, *PWNF_STATE_NAME;

#ifndef InitializeObjectAttributes
#define InitializeObjectAttributes( p, n, a, r, s ) { \
	(p)->Length = sizeof( OBJECT_ATTRIBUTES );        \
	(p)->RootDirectory = r;                           \
	(p)->Attributes = a;                              \
	(p)->ObjectName = n;                              \
	(p)->SecurityDescriptor = s;                      \
	(p)->SecurityQualityOfService = NULL;             \
}
#endif

typedef struct _KEY_VALUE_ENTRY
{
	PUNICODE_STRING ValueName;
	ULONG           DataLength;
	ULONG           DataOffset;
	ULONG           Type;
} KEY_VALUE_ENTRY, *PKEY_VALUE_ENTRY;

typedef enum _KEY_SET_INFORMATION_CLASS
{
	KeyWriteTimeInformation,
	KeyWow64FlagsInformation,
	KeyControlFlagsInformation,
	KeySetVirtualizationInformation,
	KeySetDebugInformation,
	KeySetHandleTagsInformation,
	MaxKeySetInfoClass  // MaxKeySetInfoClass should always be the last enum.
} KEY_SET_INFORMATION_CLASS, *PKEY_SET_INFORMATION_CLASS;

typedef enum _SYSTEM_INFORMATION_CLASS
{
	SystemBasicInformation = 0,
	SystemPerformanceInformation = 2,
	SystemTimeOfDayInformation = 3,
	SystemProcessInformation = 5,
	SystemProcessorPerformanceInformation = 8,
	SystemHandleInformation = 16,
	SystemInterruptInformation = 23,
	SystemExceptionInformation = 33,
	SystemRegistryQuotaInformation = 37,
	SystemLookasideInformation = 45,
	SystemCodeIntegrityInformation = 103,
	SystemPolicyInformation = 134,
} SYSTEM_INFORMATION_CLASS, *PSYSTEM_INFORMATION_CLASS;

typedef enum _PROCESSINFOCLASS
{
	ProcessBasicInformation = 0,
	ProcessDebugPort = 7,
	ProcessWow64Information = 26,
	ProcessImageFileName = 27,
	ProcessBreakOnTermination = 29
} PROCESSINFOCLASS, *PPROCESSINFOCLASS;

typedef struct _MEMORY_RANGE_ENTRY
{
	PVOID  VirtualAddress;
	SIZE_T NumberOfBytes;
} MEMORY_RANGE_ENTRY, *PMEMORY_RANGE_ENTRY;

typedef struct _T2_SET_PARAMETERS_V0
{
	ULONG    Version;
	ULONG    Reserved;
	LONGLONG NoWakeTolerance;
} T2_SET_PARAMETERS, *PT2_SET_PARAMETERS;

typedef struct _FILE_PATH
{
	ULONG Version;
	ULONG Length;
	ULONG Type;
	CHAR  FilePath[1];
} FILE_PATH, *PFILE_PATH;

typedef struct _FILE_USER_QUOTA_INFORMATION
{
	ULONG         NextEntryOffset;
	ULONG         SidLength;
	LARGE_INTEGER ChangeTime;
	LARGE_INTEGER QuotaUsed;
	LARGE_INTEGER QuotaThreshold;
	LARGE_INTEGER QuotaLimit;
	SID           Sid[1];
} FILE_USER_QUOTA_INFORMATION, *PFILE_USER_QUOTA_INFORMATION;

typedef struct _FILE_QUOTA_LIST_INFORMATION
{
	ULONG NextEntryOffset;
	ULONG SidLength;
	SID   Sid[1];
} FILE_QUOTA_LIST_INFORMATION, *PFILE_QUOTA_LIST_INFORMATION;

typedef struct _FILE_NETWORK_OPEN_INFORMATION
{
	LARGE_INTEGER CreationTime;
	LARGE_INTEGER LastAccessTime;
	LARGE_INTEGER LastWriteTime;
	LARGE_INTEGER ChangeTime;
	LARGE_INTEGER AllocationSize;
	LARGE_INTEGER EndOfFile;
	ULONG         FileAttributes;
	ULONG         Unknown;
} FILE_NETWORK_OPEN_INFORMATION, *PFILE_NETWORK_OPEN_INFORMATION;

typedef enum _FILTER_BOOT_OPTION_OPERATION
{
	FilterBootOptionOperationOpenSystemStore,
	FilterBootOptionOperationSetElement,
	FilterBootOptionOperationDeleteElement,
	FilterBootOptionOperationMax
} FILTER_BOOT_OPTION_OPERATION, *PFILTER_BOOT_OPTION_OPERATION;

typedef enum _EVENT_TYPE
{
	NotificationEvent = 0,
	SynchronizationEvent = 1,
} EVENT_TYPE, *PEVENT_TYPE;

typedef struct _FILE_FULL_EA_INFORMATION
{
	ULONG  NextEntryOffset;
	UCHAR  Flags;
	UCHAR  EaNameLength;
	USHORT EaValueLength;
	CHAR   EaName[1];
} FILE_FULL_EA_INFORMATION, *PFILE_FULL_EA_INFORMATION;

typedef struct _FILE_GET_EA_INFORMATION
{
	ULONG NextEntryOffset;
	BYTE  EaNameLength;
	CHAR  EaName[1];
} FILE_GET_EA_INFORMATION, *PFILE_GET_EA_INFORMATION;

typedef struct _BOOT_OPTIONS
{
	ULONG Version;
	ULONG Length;
	ULONG Timeout;
	ULONG CurrentBootEntryId;
	ULONG NextBootEntryId;
	WCHAR HeadlessRedirection[1];
} BOOT_OPTIONS, *PBOOT_OPTIONS;

typedef ULONG WNF_CHANGE_STAMP, *PWNF_CHANGE_STAMP;

typedef enum _WNF_DATA_SCOPE
{
	WnfDataScopeSystem = 0,
	WnfDataScopeSession = 1,
	WnfDataScopeUser = 2,
	WnfDataScopeProcess = 3,
	WnfDataScopeMachine = 4
} WNF_DATA_SCOPE, *PWNF_DATA_SCOPE;

typedef enum _WNF_STATE_NAME_LIFETIME
{
	WnfWellKnownStateName = 0,
	WnfPermanentStateName = 1,
	WnfPersistentStateName = 2,
	WnfTemporaryStateName = 3
} WNF_STATE_NAME_LIFETIME, *PWNF_STATE_NAME_LIFETIME;

typedef enum _VIRTUAL_MEMORY_INFORMATION_CLASS
{
	VmPrefetchInformation,
	VmPagePriorityInformation,
	VmCfgCallTargetInformation
} VIRTUAL_MEMORY_INFORMATION_CLASS, *PVIRTUAL_MEMORY_INFORMATION_CLASS;

typedef enum _IO_SESSION_EVENT
{
	IoSessionEventIgnore,
	IoSessionEventCreated,
	IoSessionEventTerminated,
	IoSessionEventConnected,
	IoSessionEventDisconnected,
	IoSessionEventLogon,
	IoSessionEventLogoff,
	IoSessionEventMax
} IO_SESSION_EVENT, *PIO_SESSION_EVENT;

typedef enum _PORT_INFORMATION_CLASS
{
	PortBasicInformation,
#if DEVL
	PortDumpInformation
#endif
} PORT_INFORMATION_CLASS, *PPORT_INFORMATION_CLASS;

typedef enum _PLUGPLAY_CONTROL_CLASS
{
	PlugPlayControlEnumerateDevice,
	PlugPlayControlRegisterNewDevice,
	PlugPlayControlDeregisterDevice,
	PlugPlayControlInitializeDevice,
	PlugPlayControlStartDevice,
	PlugPlayControlUnlockDevice,
	PlugPlayControlQueryAndRemoveDevice,
	PlugPlayControlUserResponse,
	PlugPlayControlGenerateLegacyDevice,
	PlugPlayControlGetInterfaceDeviceList,
	PlugPlayControlProperty,
	PlugPlayControlDeviceClassAssociation,
	PlugPlayControlGetRelatedDevice,
	PlugPlayControlGetInterfaceDeviceAlias,
	PlugPlayControlDeviceStatus,
	PlugPlayControlGetDeviceDepth,
	PlugPlayControlQueryDeviceRelations,
	PlugPlayControlTargetDeviceRelation,
	PlugPlayControlQueryConflictList,
	PlugPlayControlRetrieveDock,
	PlugPlayControlResetDevice,
	PlugPlayControlHaltDevice,
	PlugPlayControlGetBlockedDriverList,
	MaxPlugPlayControl
} PLUGPLAY_CONTROL_CLASS, *PPLUGPLAY_CONTROL_CLASS;

typedef enum _IO_COMPLETION_INFORMATION_CLASS
{
	IoCompletionBasicInformation
} IO_COMPLETION_INFORMATION_CLASS, *PIO_COMPLETION_INFORMATION_CLASS;

typedef enum _SECTION_INHERIT
{
	ViewShare = 1,
	ViewUnmap = 2
} SECTION_INHERIT, *PSECTION_INHERIT;

typedef enum _DEBUGOBJECTINFOCLASS
{
	DebugObjectFlags = 1,
	MaxDebugObjectInfoClass
} DEBUGOBJECTINFOCLASS, *PDEBUGOBJECTINFOCLASS;

typedef enum _SEMAPHORE_INFORMATION_CLASS
{
	SemaphoreBasicInformation
} SEMAPHORE_INFORMATION_CLASS, *PSEMAPHORE_INFORMATION_CLASS;

typedef struct _PS_ATTRIBUTE_LIST
{
	SIZE_T       TotalLength;
	PS_ATTRIBUTE Attributes[1];
} PS_ATTRIBUTE_LIST, *PPS_ATTRIBUTE_LIST;

typedef enum _VDMSERVICECLASS
{
	VdmStartExecution,
	VdmQueueInterrupt,
	VdmDelayInterrupt,
	VdmInitialize,
	VdmFeatures,
	VdmSetInt21Handler,
	VdmQueryDir,
	VdmPrinterDirectIoOpen,
	VdmPrinterDirectIoClose,
	VdmPrinterInitialize,
	VdmSetLdtEntries,
	VdmSetProcessLdtInfo,
	VdmAdlibEmulation,
	VdmPMCliControl,
	VdmQueryVdmProcess
} VDMSERVICECLASS, *PVDMSERVICECLASS;

typedef struct _PS_CREATE_INFO
{
	SIZE_T Size;
	PS_CREATE_STATE State;
	union
	{
		// PsCreateInitialState
		struct {
			union {
				ULONG InitFlags;
				struct {
					UCHAR  WriteOutputOnExit : 1;
					UCHAR  DetectManifest : 1;
					UCHAR  IFEOSkipDebugger : 1;
					UCHAR  IFEODoNotPropagateKeyState : 1;
					UCHAR  SpareBits1 : 4;
					UCHAR  SpareBits2 : 8;
					USHORT ProhibitedImageCharacteristics : 16;
				};
			};
			ACCESS_MASK AdditionalFileAccess;
		} InitState;
		// PsCreateFailOnSectionCreate
		struct {
			HANDLE FileHandle;
		} FailSection;
		// PsCreateFailExeFormat
		struct {
			USHORT DllCharacteristics;
		} ExeFormat;
		// PsCreateFailExeName
		struct {
			HANDLE IFEOKey;
		} ExeName;
		// PsCreateSuccess
		struct {
			union {
				ULONG OutputFlags;
				struct {
					UCHAR  ProtectedProcess : 1;
					UCHAR  AddressSpaceOverride : 1;
					UCHAR  DevOverrideEnabled : 1; // from Image File Execution Options
					UCHAR  ManifestDetected : 1;
					UCHAR  ProtectedProcessLight : 1;
					UCHAR  SpareBits1 : 3;
					UCHAR  SpareBits2 : 8;
					USHORT SpareBits3 : 16;
				};
			};
			HANDLE    FileHandle;
			HANDLE    SectionHandle;
			ULONGLONG UserProcessParametersNative;
			ULONG     UserProcessParametersWow64;
			ULONG     CurrentParameterFlags;
			ULONGLONG PebAddressNative;
			ULONG     PebAddressWow64;
			ULONGLONG ManifestAddress;
			ULONG     ManifestSize;
		} SuccessState;
	};
} PS_CREATE_INFO, *PPS_CREATE_INFO;

typedef enum _MEMORY_INFORMATION_CLASS
{
	MemoryBasicInformation,
	MemoryWorkingSetInformation,
	MemoryMappedFilenameInformation,
	MemoryRegionInformation,
	MemoryWorkingSetExInformation,
	MemorySharedCommitInformation,
	MemoryImageInformation,
	MemoryRegionInformationEx,
	MemoryPrivilegedBasicInformation,
	MemoryEnclaveImageInformation,
	MemoryBasicInformationCapped
} MEMORY_INFORMATION_CLASS, *PMEMORY_INFORMATION_CLASS;

typedef enum _MEMORY_RESERVE_TYPE
{
	MemoryReserveUserApc,
	MemoryReserveIoCompletion,
	MemoryReserveTypeMax
} MEMORY_RESERVE_TYPE, *PMEMORY_RESERVE_TYPE;

typedef enum _ALPC_PORT_INFORMATION_CLASS
{
	AlpcBasicInformation,
	AlpcPortInformation,
	AlpcAssociateCompletionPortInformation,
	AlpcConnectedSIDInformation,
	AlpcServerInformation,
	AlpcMessageZoneInformation,
	AlpcRegisterCompletionListInformation,
	AlpcUnregisterCompletionListInformation,
	AlpcAdjustCompletionListConcurrencyCountInformation,
	AlpcRegisterCallbackInformation,
	AlpcCompletionListRundownInformation
} ALPC_PORT_INFORMATION_CLASS, *PALPC_PORT_INFORMATION_CLASS;

typedef struct _ALPC_CONTEXT_ATTR
{
	PVOID PortContext;
	PVOID MessageContext;
	ULONG SequenceNumber;
	ULONG MessageID;
	ULONG CallbackID;
} ALPC_CONTEXT_ATTR, *PALPC_CONTEXT_ATTR;

typedef struct _ALPC_DATA_VIEW_ATTR
{
	ULONG  Flags;
	HANDLE SectionHandle;
	PVOID  ViewBase;
	SIZE_T ViewSize;
} ALPC_DATA_VIEW_ATTR, *PALPC_DATA_VIEW_ATTR;

typedef struct _ALPC_SECURITY_ATTR
{
	ULONG                        Flags;
	PSECURITY_QUALITY_OF_SERVICE SecurityQos;
	HANDLE                       ContextHandle;
	ULONG                        Reserved1;
	ULONG                        Reserved2;
} ALPC_SECURITY_ATTR, *PALPC_SECURITY_ATTR;

typedef PVOID* PPVOID;

typedef enum _KPROFILE_SOURCE
{
	ProfileTime = 0,
	ProfileAlignmentFixup = 1,
	ProfileTotalIssues = 2,
	ProfilePipelineDry = 3,
	ProfileLoadInstructions = 4,
	ProfilePipelineFrozen = 5,
	ProfileBranchInstructions = 6,
	ProfileTotalNonissues = 7,
	ProfileDcacheMisses = 8,
	ProfileIcacheMisses = 9,
	ProfileCacheMisses = 10,
	ProfileBranchMispredictions = 11,
	ProfileStoreInstructions = 12,
	ProfileFpInstructions = 13,
	ProfileIntegerInstructions = 14,
	Profile2Issue = 15,
	Profile3Issue = 16,
	Profile4Issue = 17,
	ProfileSpecialInstructions = 18,
	ProfileTotalCycles = 19,
	ProfileIcacheIssues = 20,
	ProfileDcacheAccesses = 21,
	ProfileMemoryBarrierCycles = 22,
	ProfileLoadLinkedIssues = 23,
	ProfileMaximum = 24,
} KPROFILE_SOURCE, *PKPROFILE_SOURCE;

typedef enum _ALPC_MESSAGE_INFORMATION_CLASS
{
	AlpcMessageSidInformation,
	AlpcMessageTokenModifiedIdInformation
} ALPC_MESSAGE_INFORMATION_CLASS, *PALPC_MESSAGE_INFORMATION_CLASS;

typedef enum _WORKERFACTORYINFOCLASS
{
	WorkerFactoryTimeout,
	WorkerFactoryRetryTimeout,
	WorkerFactoryIdleTimeout,
	WorkerFactoryBindingCount,
	WorkerFactoryThreadMinimum,
	WorkerFactoryThreadMaximum,
	WorkerFactoryPaused,
	WorkerFactoryBasicInformation,
	WorkerFactoryAdjustThreadGoal,
	WorkerFactoryCallbackType,
	WorkerFactoryStackInformation,
	MaxWorkerFactoryInfoClass
} WORKERFACTORYINFOCLASS, *PWORKERFACTORYINFOCLASS;

typedef enum _MEMORY_PARTITION_INFORMATION_CLASS
{
	SystemMemoryPartitionInformation,
	SystemMemoryPartitionMoveMemory,
	SystemMemoryPartitionAddPagefile,
	SystemMemoryPartitionCombineMemory,
	SystemMemoryPartitionInitialAddMemory,
	SystemMemoryPartitionGetMemoryEvents,
	SystemMemoryPartitionMax
} MEMORY_PARTITION_INFORMATION_CLASS, *PMEMORY_PARTITION_INFORMATION_CLASS;

typedef enum _MUTANT_INFORMATION_CLASS
{
	MutantBasicInformation,
	MutantOwnerInformation
} MUTANT_INFORMATION_CLASS, *PMUTANT_INFORMATION_CLASS;

typedef enum _ATOM_INFORMATION_CLASS
{
	AtomBasicInformation,
	AtomTableInformation
} ATOM_INFORMATION_CLASS, *PATOM_INFORMATION_CLASS;

typedef enum _SHUTDOWN_ACTION {
	ShutdownNoReboot,
	ShutdownReboot,
	ShutdownPowerOff
} SHUTDOWN_ACTION;

typedef VOID(CALLBACK* PTIMER_APC_ROUTINE)(
	IN PVOID TimerContext,
	IN ULONG TimerLowValue,
	IN LONG TimerHighValue);

typedef enum _KEY_VALUE_INFORMATION_CLASS {
	KeyValueBasicInformation = 0,
	KeyValueFullInformation,
	KeyValuePartialInformation,
	KeyValueFullInformationAlign64,
	KeyValuePartialInformationAlign64,
	MaxKeyValueInfoClass
} KEY_VALUE_INFORMATION_CLASS;

typedef LANGID* PLANGID;

typedef struct _PLUGPLAY_EVENT_BLOCK
{
	GUID EventGuid;
	PLUGPLAY_EVENT_CATEGORY EventCategory;
	PULONG Result;
	ULONG Flags;
	ULONG TotalSize;
	PVOID DeviceObject;

	union
	{
		struct
		{
			GUID ClassGuid;
			WCHAR SymbolicLinkName[1];
		} DeviceClass;
		struct
		{
			WCHAR DeviceIds[1];
		} TargetDevice;
		struct
		{
			WCHAR DeviceId[1];
		} InstallDevice;
		struct
		{
			PVOID NotificationStructure;
			WCHAR DeviceIds[1];
		} CustomNotification;
		struct
		{
			PVOID Notification;
		} ProfileNotification;
		struct
		{
			ULONG NotificationCode;
			ULONG NotificationData;
		} PowerNotification;
		struct
		{
			PNP_VETO_TYPE VetoType;
			WCHAR DeviceIdVetoNameBuffer[1]; // DeviceId<null>VetoName<null><null>
		} VetoNotification;
		struct
		{
			GUID BlockedDriverGuid;
		} BlockedDriverNotification;
		struct
		{
			WCHAR ParentId[1];
		} InvalidIDNotification;
	} u;
} PLUGPLAY_EVENT_BLOCK, *PPLUGPLAY_EVENT_BLOCK;

typedef VOID(NTAPI* PIO_APC_ROUTINE) (
	IN PVOID            ApcContext,
	IN PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG            Reserved);

typedef KNORMAL_ROUTINE* PKNORMAL_ROUTINE;

typedef enum _DIRECTORY_NOTIFY_INFORMATION_CLASS
{
	DirectoryNotifyInformation = 1,
	DirectoryNotifyExtendedInformation = 2,
} DIRECTORY_NOTIFY_INFORMATION_CLASS, *PDIRECTORY_NOTIFY_INFORMATION_CLASS;

typedef enum _EVENT_INFORMATION_CLASS
{
	EventBasicInformation
} EVENT_INFORMATION_CLASS, *PEVENT_INFORMATION_CLASS;

typedef struct _ALPC_MESSAGE_ATTRIBUTES
{
	unsigned long AllocatedAttributes;
	unsigned long ValidAttributes;
} ALPC_MESSAGE_ATTRIBUTES, *PALPC_MESSAGE_ATTRIBUTES;

typedef struct _ALPC_PORT_ATTRIBUTES
{
	ULONG                       Flags;
	SECURITY_QUALITY_OF_SERVICE SecurityQos;
	SIZE_T                      MaxMessageLength;
	SIZE_T                      MemoryBandwidth;
	SIZE_T                      MaxPoolUsage;
	SIZE_T                      MaxSectionSize;
	SIZE_T                      MaxViewSize;
	SIZE_T                      MaxTotalSectionSize;
	ULONG                       DupObjectTypes;
#ifdef _WIN64
	ULONG                       Reserved;
#endif
} ALPC_PORT_ATTRIBUTES, *PALPC_PORT_ATTRIBUTES;

typedef enum _IO_SESSION_STATE
{
	IoSessionStateCreated = 1,
	IoSessionStateInitialized = 2,
	IoSessionStateConnected = 3,
	IoSessionStateDisconnected = 4,
	IoSessionStateDisconnectedLoggedOn = 5,
	IoSessionStateLoggedOn = 6,
	IoSessionStateLoggedOff = 7,
	IoSessionStateTerminated = 8,
	IoSessionStateMax = 9,
} IO_SESSION_STATE, *PIO_SESSION_STATE;

typedef const WNF_STATE_NAME *PCWNF_STATE_NAME;

typedef const WNF_TYPE_ID *PCWNF_TYPE_ID;

typedef struct _WNF_DELIVERY_DESCRIPTOR
{
	unsigned __int64 SubscriptionId;
	WNF_STATE_NAME   StateName;
	unsigned long    ChangeStamp;
	unsigned long    StateDataSize;
	unsigned long    EventMask;
	WNF_TYPE_ID      TypeId;
	unsigned long    StateDataOffset;
} WNF_DELIVERY_DESCRIPTOR, *PWNF_DELIVERY_DESCRIPTOR;

typedef enum _DEBUG_CONTROL_CODE
{
	SysDbgQueryModuleInformation = 0,
	SysDbgQueryTraceInformation = 1,
	SysDbgSetTracePoint = 2,
	SysDbgSetSpecialCall = 3,
	SysDbgClearSpecialCalls = 4,
	SysDbgQuerySpecialCalls = 5,
	SysDbgBreakPoint = 6,
	SysDbgQueryVersion = 7,
	SysDbgReadVirtual = 8,
	SysDbgWriteVirtual = 9,
	SysDbgReadPhysical = 10,
	SysDbgWritePhysical = 11,
	SysDbgReadControlSpace = 12,
	SysDbgWriteControlSpace = 13,
	SysDbgReadIoSpace = 14,
	SysDbgWriteIoSpace = 15,
	SysDbgReadMsr = 16,
	SysDbgWriteMsr = 17,
	SysDbgReadBusData = 18,
	SysDbgWriteBusData = 19,
	SysDbgCheckLowMemory = 20,
	SysDbgEnableKernelDebugger = 21,
	SysDbgDisableKernelDebugger = 22,
	SysDbgGetAutoKdEnable = 23,
	SysDbgSetAutoKdEnable = 24,
	SysDbgGetPrintBufferSize = 25,
	SysDbgSetPrintBufferSize = 26,
	SysDbgGetKdUmExceptionEnable = 27,
	SysDbgSetKdUmExceptionEnable = 28,
	SysDbgGetTriageDump = 29,
	SysDbgGetKdBlockEnable = 30,
	SysDbgSetKdBlockEnable = 31
} DEBUG_CONTROL_CODE, *PDEBUG_CONTROL_CODE;

typedef struct _PORT_MESSAGE
{
	union
	{
		union
		{
			struct
			{
				short DataLength;
				short TotalLength;
			} s1;
			unsigned long Length;
		};
	} u1;
	union
	{
		union
		{
			struct
			{
				short Type;
				short DataInfoOffset;
			} s2;
			unsigned long ZeroInit;
		};
	} u2;
	union
	{
		CLIENT_ID ClientId;
		double    DoNotUseThisField;
	};
	unsigned long MessageId;
	union
	{
		unsigned __int64 ClientViewSize;
		struct
		{
			unsigned long CallbackId;
			long          __PADDING__[1];
		};
	};
} PORT_MESSAGE, *PPORT_MESSAGE;

typedef struct FILE_BASIC_INFORMATION
{
	LARGE_INTEGER CreationTime;
	LARGE_INTEGER LastAccessTime;
	LARGE_INTEGER LastWriteTime;
	LARGE_INTEGER ChangeTime;
	ULONG         FileAttributes;
} FILE_BASIC_INFORMATION, *PFILE_BASIC_INFORMATION;

typedef struct _PORT_SECTION_READ
{
	ULONG Length;
	ULONG ViewSize;
	ULONG ViewBase;
} PORT_SECTION_READ, *PPORT_SECTION_READ;

typedef struct _PORT_SECTION_WRITE
{
	ULONG  Length;
	HANDLE SectionHandle;
	ULONG  SectionOffset;
	ULONG  ViewSize;
	PVOID  ViewBase;
	PVOID  TargetViewBase;
} PORT_SECTION_WRITE, *PPORT_SECTION_WRITE;

typedef enum _TIMER_TYPE
{
	NotificationTimer,
	SynchronizationTimer
} TIMER_TYPE, *PTIMER_TYPE;

typedef struct _BOOT_ENTRY
{
	ULONG Version;
	ULONG Length;
	ULONG Id;
	ULONG Attributes;
	ULONG FriendlyNameOffset;
	ULONG BootFilePathOffset;
	ULONG OsOptionsLength;
	UCHAR OsOptions[ANYSIZE_ARRAY];
} BOOT_ENTRY, *PBOOT_ENTRY;

typedef struct _EFI_DRIVER_ENTRY
{
	ULONG Version;
	ULONG Length;
	ULONG Id;
	ULONG Attributes;
	ULONG FriendlyNameOffset;
	ULONG DriverFilePathOffset;
} EFI_DRIVER_ENTRY, *PEFI_DRIVER_ENTRY;

typedef USHORT RTL_ATOM, *PRTL_ATOM;

typedef enum _TIMER_SET_INFORMATION_CLASS
{
	TimerSetCoalescableTimer,
	MaxTimerInfoClass
} TIMER_SET_INFORMATION_CLASS, *PTIMER_SET_INFORMATION_CLASS;

typedef enum _FSINFOCLASS
{
	FileFsVolumeInformation = 1,
	FileFsLabelInformation = 2,
	FileFsSizeInformation = 3,
	FileFsDeviceInformation = 4,
	FileFsAttributeInformation = 5,
	FileFsControlInformation = 6,
	FileFsFullSizeInformation = 7,
	FileFsObjectIdInformation = 8,
	FileFsDriverPathInformation = 9,
	FileFsVolumeFlagsInformation = 10,
	FileFsSectorSizeInformation = 11,
	FileFsDataCopyInformation = 12,
	FileFsMetadataSizeInformation = 13,
	FileFsFullSizeInformationEx = 14,
	FileFsMaximumInformation = 15,
} FSINFOCLASS, *PFSINFOCLASS;

typedef enum _WAIT_TYPE
{
	WaitAll = 0,
	WaitAny = 1
} WAIT_TYPE, *PWAIT_TYPE;

typedef struct _USER_STACK
{
	PVOID FixedStackBase;
	PVOID FixedStackLimit;
	PVOID ExpandableStackBase;
	PVOID ExpandableStackLimit;
	PVOID ExpandableStackBottom;
} USER_STACK, *PUSER_STACK;

typedef enum _SECTION_INFORMATION_CLASS
{
	SectionBasicInformation,
	SectionImageInformation,
} SECTION_INFORMATION_CLASS, *PSECTION_INFORMATION_CLASS;

typedef enum _APPHELPCACHESERVICECLASS
{
	ApphelpCacheServiceLookup = 0,
	ApphelpCacheServiceRemove = 1,
	ApphelpCacheServiceUpdate = 2,
	ApphelpCacheServiceFlush = 3,
	ApphelpCacheServiceDump = 4,
	ApphelpDBGReadRegistry = 0x100,
	ApphelpDBGWriteRegistry = 0x101,
} APPHELPCACHESERVICECLASS, *PAPPHELPCACHESERVICECLASS;

typedef struct _TOKEN_SECURITY_ATTRIBUTES_INFORMATION
{
	USHORT Version;
	USHORT Reserved;
	ULONG  AttributeCount;
	union
	{
		PTOKEN_SECURITY_ATTRIBUTE_V1 pAttributeV1;
	} Attribute;
} TOKEN_SECURITY_ATTRIBUTES_INFORMATION, *PTOKEN_SECURITY_ATTRIBUTES_INFORMATION;

typedef struct _FILE_IO_COMPLETION_INFORMATION
{
	PVOID           KeyContext;
	PVOID           ApcContext;
	IO_STATUS_BLOCK IoStatusBlock;
} FILE_IO_COMPLETION_INFORMATION, *PFILE_IO_COMPLETION_INFORMATION;

typedef PVOID PT2_CANCEL_PARAMETERS;

typedef enum _THREADINFOCLASS
{
	ThreadBasicInformation,
	ThreadTimes,
	ThreadPriority,
	ThreadBasePriority,
	ThreadAffinityMask,
	ThreadImpersonationToken,
	ThreadDescriptorTableEntry,
	ThreadEnableAlignmentFaultFixup,
	ThreadEventPair_Reusable,
	ThreadQuerySetWin32StartAddress,
	ThreadZeroTlsCell,
	ThreadPerformanceCount,
	ThreadAmILastThread,
	ThreadIdealProcessor,
	ThreadPriorityBoost,
	ThreadSetTlsArrayAddress,
	ThreadIsIoPending,
	ThreadHideFromDebugger,
	ThreadBreakOnTermination,
	MaxThreadInfoClass
} THREADINFOCLASS, *PTHREADINFOCLASS;

typedef enum _OBJECT_INFORMATION_CLASS
{
	ObjectBasicInformation,
	ObjectNameInformation,
	ObjectTypeInformation,
	ObjectAllTypesInformation,
	ObjectHandleInformation
} OBJECT_INFORMATION_CLASS, *POBJECT_INFORMATION_CLASS;

typedef enum _FILE_INFORMATION_CLASS
{
	FileDirectoryInformation = 1,
	FileFullDirectoryInformation = 2,
	FileBothDirectoryInformation = 3,
	FileBasicInformation = 4,
	FileStandardInformation = 5,
	FileInternalInformation = 6,
	FileEaInformation = 7,
	FileAccessInformation = 8,
	FileNameInformation = 9,
	FileRenameInformation = 10,
	FileLinkInformation = 11,
	FileNamesInformation = 12,
	FileDispositionInformation = 13,
	FilePositionInformation = 14,
	FileFullEaInformation = 15,
	FileModeInformation = 16,
	FileAlignmentInformation = 17,
	FileAllInformation = 18,
	FileAllocationInformation = 19,
	FileEndOfFileInformation = 20,
	FileAlternateNameInformation = 21,
	FileStreamInformation = 22,
	FilePipeInformation = 23,
	FilePipeLocalInformation = 24,
	FilePipeRemoteInformation = 25,
	FileMailslotQueryInformation = 26,
	FileMailslotSetInformation = 27,
	FileCompressionInformation = 28,
	FileObjectIdInformation = 29,
	FileCompletionInformation = 30,
	FileMoveClusterInformation = 31,
	FileQuotaInformation = 32,
	FileReparsePointInformation = 33,
	FileNetworkOpenInformation = 34,
	FileAttributeTagInformation = 35,
	FileTrackingInformation = 36,
	FileIdBothDirectoryInformation = 37,
	FileIdFullDirectoryInformation = 38,
	FileValidDataLengthInformation = 39,
	FileShortNameInformation = 40,
	FileIoCompletionNotificationInformation = 41,
	FileIoStatusBlockRangeInformation = 42,
	FileIoPriorityHintInformation = 43,
	FileSfioReserveInformation = 44,
	FileSfioVolumeInformation = 45,
	FileHardLinkInformation = 46,
	FileProcessIdsUsingFileInformation = 47,
	FileNormalizedNameInformation = 48,
	FileNetworkPhysicalNameInformation = 49,
	FileIdGlobalTxDirectoryInformation = 50,
	FileIsRemoteDeviceInformation = 51,
	FileUnusedInformation = 52,
	FileNumaNodeInformation = 53,
	FileStandardLinkInformation = 54,
	FileRemoteProtocolInformation = 55,
	FileRenameInformationBypassAccessCheck = 56,
	FileLinkInformationBypassAccessCheck = 57,
	FileVolumeNameInformation = 58,
	FileIdInformation = 59,
	FileIdExtdDirectoryInformation = 60,
	FileReplaceCompletionInformation = 61,
	FileHardLinkFullIdInformation = 62,
	FileIdExtdBothDirectoryInformation = 63,
	FileDispositionInformationEx = 64,
	FileRenameInformationEx = 65,
	FileRenameInformationExBypassAccessCheck = 66,
	FileMaximumInformation = 67,
} FILE_INFORMATION_CLASS, *PFILE_INFORMATION_CLASS;

typedef enum _KEY_INFORMATION_CLASS
{
	KeyBasicInformation = 0,
	KeyNodeInformation = 1,
	KeyFullInformation = 2,
	KeyNameInformation = 3,
	KeyCachedInformation = 4,
	KeyFlagsInformation = 5,
	KeyVirtualizationInformation = 6,
	KeyHandleTagsInformation = 7,
	MaxKeyInfoClass = 8
} KEY_INFORMATION_CLASS, *PKEY_INFORMATION_CLASS;

typedef struct _OBJECT_ATTRIBUTES
{
	ULONG           Length;
	HANDLE          RootDirectory;
	PUNICODE_STRING ObjectName;
	ULONG           Attributes;
	PVOID           SecurityDescriptor;
	PVOID           SecurityQualityOfService;
} OBJECT_ATTRIBUTES, *POBJECT_ATTRIBUTES;

typedef enum _TIMER_INFORMATION_CLASS
{
	TimerBasicInformation
} TIMER_INFORMATION_CLASS, *PTIMER_INFORMATION_CLASS;

typedef struct _KCONTINUE_ARGUMENT
{
	KCONTINUE_TYPE ContinueType;
	ULONG          ContinueFlags;
	ULONGLONG      Reserved[2];
} KCONTINUE_ARGUMENT, *PKCONTINUE_ARGUMENT;

EXTERN_C NTSTATUS NtAccessCheck(
	IN PSECURITY_DESCRIPTOR pSecurityDescriptor,
	IN HANDLE ClientToken,
	IN ACCESS_MASK DesiaredAccess,
	IN PGENERIC_MAPPING GenericMapping,
	OUT PPRIVILEGE_SET PrivilegeSet OPTIONAL,
	IN OUT PULONG PrivilegeSetLength,
	OUT PACCESS_MASK GrantedAccess,
	OUT PBOOLEAN AccessStatus);

EXTERN_C NTSTATUS NtWorkerFactoryWorkerReady(
	IN HANDLE WorkerFactoryHandle);

EXTERN_C NTSTATUS NtAcceptConnectPort(
	OUT PHANDLE ServerPortHandle,
	IN ULONG AlternativeReceivePortHandle OPTIONAL,
	IN PPORT_MESSAGE ConnectionReply,
	IN BOOLEAN AcceptConnection,
	IN OUT PPORT_SECTION_WRITE ServerSharedMemory OPTIONAL,
	OUT PPORT_SECTION_READ ClientSharedMemory OPTIONAL);

EXTERN_C NTSTATUS NtMapUserPhysicalPagesScatter(
	IN PVOID VirtualAddresses,
	IN PULONG NumberOfPages,
	IN PULONG UserPfnArray OPTIONAL);

EXTERN_C NTSTATUS NtWaitForSingleObject(
	IN HANDLE ObjectHandle,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER TimeOut OPTIONAL);

EXTERN_C NTSTATUS NtCallbackReturn(
	IN PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputLength,
	IN NTSTATUS Status);

EXTERN_C NTSTATUS NtReadFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	OUT PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PVOID Buffer,
	IN ULONG Length,
	IN PLARGE_INTEGER ByteOffset OPTIONAL,
	IN PULONG Key OPTIONAL);

EXTERN_C NTSTATUS NtDeviceIoControlFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG IoControlCode,
	IN PVOID InputBuffer OPTIONAL,
	IN ULONG InputBufferLength,
	OUT PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputBufferLength);

EXTERN_C NTSTATUS NtWriteFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PVOID Buffer,
	IN ULONG Length,
	IN PLARGE_INTEGER ByteOffset OPTIONAL,
	IN PULONG Key OPTIONAL);

EXTERN_C NTSTATUS NtRemoveIoCompletion(
	IN HANDLE IoCompletionHandle,
	OUT PULONG KeyContext,
	OUT PULONG ApcContext,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtReleaseSemaphore(
	IN HANDLE SemaphoreHandle,
	IN LONG ReleaseCount,
	OUT PLONG PreviousCount OPTIONAL);

EXTERN_C NTSTATUS NtReplyWaitReceivePort(
	IN HANDLE PortHandle,
	OUT PVOID PortContext OPTIONAL,
	IN PPORT_MESSAGE ReplyMessage OPTIONAL,
	OUT PPORT_MESSAGE ReceiveMessage);

EXTERN_C NTSTATUS NtReplyPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE ReplyMessage);

EXTERN_C NTSTATUS NtSetInformationThread(
	IN HANDLE ThreadHandle,
	IN THREADINFOCLASS ThreadInformationClass,
	IN PVOID ThreadInformation,
	IN ULONG ThreadInformationLength);

EXTERN_C NTSTATUS NtSetEvent(
	IN HANDLE EventHandle,
	OUT PULONG PreviousState OPTIONAL);

EXTERN_C NTSTATUS NtClose(
	IN HANDLE Handle);

EXTERN_C NTSTATUS NtQueryObject(
	IN HANDLE Handle,
	IN OBJECT_INFORMATION_CLASS ObjectInformationClass,
	OUT PVOID ObjectInformation OPTIONAL,
	IN ULONG ObjectInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID FileInformation,
	IN ULONG Length,
	IN FILE_INFORMATION_CLASS FileInformationClass);

EXTERN_C NTSTATUS NtOpenKey(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtEnumerateValueKey(
	IN HANDLE KeyHandle,
	IN ULONG Index,
	IN KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
	OUT PVOID KeyValueInformation OPTIONAL,
	IN ULONG Length,
	OUT PULONG ResultLength);

EXTERN_C NTSTATUS NtFindAtom(
	IN PWSTR AtomName OPTIONAL,
	IN ULONG Length,
	OUT PUSHORT Atom OPTIONAL);

EXTERN_C NTSTATUS NtQueryDefaultLocale(
	IN BOOLEAN UserProfile,
	OUT PLCID DefaultLocaleId);

EXTERN_C NTSTATUS NtQueryKey(
	IN HANDLE KeyHandle,
	IN KEY_INFORMATION_CLASS KeyInformationClass,
	OUT PVOID KeyInformation OPTIONAL,
	IN ULONG Length,
	OUT PULONG ResultLength);

EXTERN_C NTSTATUS NtQueryValueKey(
	IN HANDLE KeyHandle,
	IN PUNICODE_STRING ValueName,
	IN KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
	OUT PVOID KeyValueInformation OPTIONAL,
	IN ULONG Length,
	OUT PULONG ResultLength);

EXTERN_C NTSTATUS NtAllocateVirtualMemory(
	IN HANDLE ProcessHandle,
	IN OUT PVOID * BaseAddress,
	IN ULONG ZeroBits,
	IN OUT PSIZE_T RegionSize,
	IN ULONG AllocationType,
	IN ULONG Protect);

EXTERN_C NTSTATUS NtQueryInformationProcess(
	IN HANDLE ProcessHandle,
	IN PROCESSINFOCLASS ProcessInformationClass,
	OUT PVOID ProcessInformation,
	IN ULONG ProcessInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtWaitForMultipleObjects32(
	IN ULONG ObjectCount,
	IN PHANDLE Handles,
	IN WAIT_TYPE WaitType,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtWriteFileGather(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PFILE_SEGMENT_ELEMENT SegmentArray,
	IN ULONG Length,
	IN PLARGE_INTEGER ByteOffset,
	IN PULONG Key OPTIONAL);

EXTERN_C NTSTATUS NtCreateKey(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN ULONG TitleIndex,
	IN PUNICODE_STRING Class OPTIONAL,
	IN ULONG CreateOptions,
	OUT PULONG Disposition OPTIONAL);

EXTERN_C NTSTATUS NtFreeVirtualMemory(
	IN HANDLE ProcessHandle,
	IN OUT PVOID * BaseAddress,
	IN OUT PSIZE_T RegionSize,
	IN ULONG FreeType);

EXTERN_C NTSTATUS NtImpersonateClientOfPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE Message);

EXTERN_C NTSTATUS NtReleaseMutant(
	IN HANDLE MutantHandle,
	OUT PULONG PreviousCount OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationToken(
	IN HANDLE TokenHandle,
	IN TOKEN_INFORMATION_CLASS TokenInformationClass,
	OUT PVOID TokenInformation,
	IN ULONG TokenInformationLength,
	OUT PULONG ReturnLength);

EXTERN_C NTSTATUS NtRequestWaitReplyPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE RequestMessage,
	OUT PPORT_MESSAGE ReplyMessage);

EXTERN_C NTSTATUS NtQueryVirtualMemory(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN MEMORY_INFORMATION_CLASS MemoryInformationClass,
	OUT PVOID MemoryInformation,
	IN SIZE_T MemoryInformationLength,
	OUT PSIZE_T ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtOpenThreadToken(
	IN HANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN BOOLEAN OpenAsSelf,
	OUT PHANDLE TokenHandle);

EXTERN_C NTSTATUS NtQueryInformationThread(
	IN HANDLE ThreadHandle,
	IN THREADINFOCLASS ThreadInformationClass,
	OUT PVOID ThreadInformation,
	IN ULONG ThreadInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtOpenProcess(
	OUT PHANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN PCLIENT_ID ClientId OPTIONAL);

EXTERN_C NTSTATUS NtSetInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PVOID FileInformation,
	IN ULONG Length,
	IN FILE_INFORMATION_CLASS FileInformationClass);

EXTERN_C NTSTATUS NtMapViewOfSection(
	IN HANDLE SectionHandle,
	IN HANDLE ProcessHandle,
	IN OUT PVOID BaseAddress,
	IN ULONG ZeroBits,
	IN SIZE_T CommitSize,
	IN OUT PLARGE_INTEGER SectionOffset OPTIONAL,
	IN OUT PSIZE_T ViewSize,
	IN SECTION_INHERIT InheritDisposition,
	IN ULONG AllocationType,
	IN ULONG Win32Protect);

EXTERN_C NTSTATUS NtAccessCheckAndAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN PUNICODE_STRING ObjectTypeName,
	IN PUNICODE_STRING ObjectName,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN ACCESS_MASK DesiredAccess,
	IN PGENERIC_MAPPING GenericMapping,
	IN BOOLEAN ObjectCreation,
	OUT PACCESS_MASK GrantedAccess,
	OUT PBOOLEAN AccessStatus,
	OUT PBOOLEAN GenerateOnClose);

EXTERN_C NTSTATUS NtUnmapViewOfSection(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress);

EXTERN_C NTSTATUS NtReplyWaitReceivePortEx(
	IN HANDLE PortHandle,
	OUT PULONG PortContext OPTIONAL,
	IN PPORT_MESSAGE ReplyMessage OPTIONAL,
	OUT PPORT_MESSAGE ReceiveMessage,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtTerminateProcess(
	IN HANDLE ProcessHandle OPTIONAL,
	IN NTSTATUS ExitStatus);

EXTERN_C NTSTATUS NtSetEventBoostPriority(
	IN HANDLE EventHandle);

EXTERN_C NTSTATUS NtReadFileScatter(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PFILE_SEGMENT_ELEMENT SegmentArray,
	IN ULONG Length,
	IN PLARGE_INTEGER ByteOffset OPTIONAL,
	IN PULONG Key OPTIONAL);

EXTERN_C NTSTATUS NtOpenThreadTokenEx(
	IN HANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN BOOLEAN OpenAsSelf,
	IN ULONG HandleAttributes,
	OUT PHANDLE TokenHandle);

EXTERN_C NTSTATUS NtOpenProcessTokenEx(
	IN HANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	IN ULONG HandleAttributes,
	OUT PHANDLE TokenHandle);

EXTERN_C NTSTATUS NtQueryPerformanceCounter(
	OUT PLARGE_INTEGER PerformanceCounter,
	OUT PLARGE_INTEGER PerformanceFrequency OPTIONAL);

EXTERN_C NTSTATUS NtEnumerateKey(
	IN HANDLE KeyHandle,
	IN ULONG Index,
	IN KEY_INFORMATION_CLASS KeyInformationClass,
	OUT PVOID KeyInformation OPTIONAL,
	IN ULONG Length,
	OUT PULONG ResultLength);

EXTERN_C NTSTATUS NtOpenFile(
	OUT PHANDLE FileHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG ShareAccess,
	IN ULONG OpenOptions);

EXTERN_C NTSTATUS NtDelayExecution(
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER DelayInterval);

EXTERN_C NTSTATUS NtQueryDirectoryFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID FileInformation,
	IN ULONG Length,
	IN FILE_INFORMATION_CLASS FileInformationClass,
	IN BOOLEAN ReturnSingleEntry,
	IN PUNICODE_STRING FileName OPTIONAL,
	IN BOOLEAN RestartScan);

EXTERN_C NTSTATUS NtQuerySystemInformation(
	IN SYSTEM_INFORMATION_CLASS SystemInformationClass,
	IN OUT PVOID SystemInformation,
	IN ULONG SystemInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtOpenSection(
	OUT PHANDLE SectionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtQueryTimer(
	IN HANDLE TimerHandle,
	IN TIMER_INFORMATION_CLASS TimerInformationClass,
	OUT PVOID TimerInformation,
	IN ULONG TimerInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtFsControlFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG FsControlCode,
	IN PVOID InputBuffer OPTIONAL,
	IN ULONG InputBufferLength,
	OUT PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputBufferLength);

EXTERN_C NTSTATUS NtWriteVirtualMemory(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN PVOID Buffer,
	IN SIZE_T NumberOfBytesToWrite,
	OUT PSIZE_T NumberOfBytesWritten OPTIONAL);

EXTERN_C NTSTATUS NtCloseObjectAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN BOOLEAN GenerateOnClose);

EXTERN_C NTSTATUS NtDuplicateObject(
	IN HANDLE SourceProcessHandle,
	IN HANDLE SourceHandle,
	IN HANDLE TargetProcessHandle OPTIONAL,
	OUT PHANDLE TargetHandle OPTIONAL,
	IN ACCESS_MASK DesiredAccess,
	IN ULONG HandleAttributes,
	IN ULONG Options);

EXTERN_C NTSTATUS NtQueryAttributesFile(
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PFILE_BASIC_INFORMATION FileInformation);

EXTERN_C NTSTATUS NtClearEvent(
	IN HANDLE EventHandle);

EXTERN_C NTSTATUS NtReadVirtualMemory(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress OPTIONAL,
	OUT PVOID Buffer,
	IN SIZE_T BufferSize,
	OUT PSIZE_T NumberOfBytesRead OPTIONAL);

EXTERN_C NTSTATUS NtOpenEvent(
	OUT PHANDLE EventHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtAdjustPrivilegesToken(
	IN HANDLE TokenHandle,
	IN BOOLEAN DisableAllPrivileges,
	IN PTOKEN_PRIVILEGES NewState OPTIONAL,
	IN ULONG BufferLength,
	OUT PTOKEN_PRIVILEGES PreviousState OPTIONAL,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtDuplicateToken(
	IN HANDLE ExistingTokenHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN BOOLEAN EffectiveOnly,
	IN TOKEN_TYPE TokenType,
	OUT PHANDLE NewTokenHandle);

EXTERN_C NTSTATUS NtContinue(
	IN PCONTEXT ContextRecord,
	IN BOOLEAN TestAlert);

EXTERN_C NTSTATUS NtQueryDefaultUILanguage(
	OUT PLANGID DefaultUILanguageId);

EXTERN_C NTSTATUS NtQueueApcThread(
	IN HANDLE ThreadHandle,
	IN PKNORMAL_ROUTINE ApcRoutine,
	IN PVOID ApcArgument1 OPTIONAL,
	IN PVOID ApcArgument2 OPTIONAL,
	IN PVOID ApcArgument3 OPTIONAL);

EXTERN_C NTSTATUS NtYieldExecution();

EXTERN_C NTSTATUS NtAddAtom(
	IN PWSTR AtomName OPTIONAL,
	IN ULONG Length,
	OUT PUSHORT Atom OPTIONAL);

EXTERN_C NTSTATUS NtCreateEvent(
	OUT PHANDLE EventHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN EVENT_TYPE EventType,
	IN BOOLEAN InitialState);

EXTERN_C NTSTATUS NtQueryVolumeInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID FsInformation,
	IN ULONG Length,
	IN FSINFOCLASS FsInformationClass);

EXTERN_C NTSTATUS NtCreateSection(
	OUT PHANDLE SectionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PLARGE_INTEGER MaximumSize OPTIONAL,
	IN ULONG SectionPageProtection,
	IN ULONG AllocationAttributes,
	IN HANDLE FileHandle OPTIONAL);

EXTERN_C NTSTATUS NtFlushBuffersFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtApphelpCacheControl(
	IN APPHELPCACHESERVICECLASS Service,
	IN PVOID ServiceData);

EXTERN_C NTSTATUS NtCreateProcessEx(
	OUT PHANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE ParentProcess,
	IN ULONG Flags,
	IN HANDLE SectionHandle OPTIONAL,
	IN HANDLE DebugPort OPTIONAL,
	IN HANDLE ExceptionPort OPTIONAL,
	IN ULONG JobMemberLevel);

EXTERN_C NTSTATUS NtCreateThread(
	OUT PHANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE ProcessHandle,
	OUT PCLIENT_ID ClientId,
	IN PCONTEXT ThreadContext,
	IN PUSER_STACK InitialTeb,
	IN BOOLEAN CreateSuspended);

EXTERN_C NTSTATUS NtIsProcessInJob(
	IN HANDLE ProcessHandle,
	IN HANDLE JobHandle OPTIONAL);

EXTERN_C NTSTATUS NtProtectVirtualMemory(
	IN HANDLE ProcessHandle,
	IN OUT PVOID * BaseAddress,
	IN OUT PSIZE_T RegionSize,
	IN ULONG NewProtect,
	OUT PULONG OldProtect);

EXTERN_C NTSTATUS NtQuerySection(
	IN HANDLE SectionHandle,
	IN SECTION_INFORMATION_CLASS SectionInformationClass,
	OUT PVOID SectionInformation,
	IN ULONG SectionInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtResumeThread(
	IN HANDLE ThreadHandle,
	IN OUT PULONG PreviousSuspendCount OPTIONAL);

EXTERN_C NTSTATUS NtTerminateThread(
	IN HANDLE ThreadHandle,
	IN NTSTATUS ExitStatus);

EXTERN_C NTSTATUS NtReadRequestData(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE Message,
	IN ULONG DataEntryIndex,
	OUT PVOID Buffer,
	IN ULONG BufferSize,
	OUT PULONG NumberOfBytesRead OPTIONAL);

EXTERN_C NTSTATUS NtCreateFile(
	OUT PHANDLE FileHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PLARGE_INTEGER AllocationSize OPTIONAL,
	IN ULONG FileAttributes,
	IN ULONG ShareAccess,
	IN ULONG CreateDisposition,
	IN ULONG CreateOptions,
	IN PVOID EaBuffer OPTIONAL,
	IN ULONG EaLength);

EXTERN_C NTSTATUS NtQueryEvent(
	IN HANDLE EventHandle,
	IN EVENT_INFORMATION_CLASS EventInformationClass,
	OUT PVOID EventInformation,
	IN ULONG EventInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtWriteRequestData(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE Request,
	IN ULONG DataIndex,
	IN PVOID Buffer,
	IN ULONG Length,
	OUT PULONG ResultLength OPTIONAL);

EXTERN_C NTSTATUS NtOpenDirectoryObject(
	OUT PHANDLE DirectoryHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtAccessCheckByTypeAndAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN PUNICODE_STRING ObjectTypeName,
	IN PUNICODE_STRING ObjectName,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN PSID PrincipalSelfSid OPTIONAL,
	IN ACCESS_MASK DesiredAccess,
	IN AUDIT_EVENT_TYPE AuditType,
	IN ULONG Flags,
	IN POBJECT_TYPE_LIST ObjectTypeList OPTIONAL,
	IN ULONG ObjectTypeListLength,
	IN PGENERIC_MAPPING GenericMapping,
	IN BOOLEAN ObjectCreation,
	OUT PACCESS_MASK GrantedAccess,
	OUT PULONG AccessStatus,
	OUT PBOOLEAN GenerateOnClose);

EXTERN_C NTSTATUS NtWaitForMultipleObjects(
	IN ULONG Count,
	IN PHANDLE Handles,
	IN WAIT_TYPE WaitType,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtSetInformationObject(
	IN HANDLE Handle,
	IN OBJECT_INFORMATION_CLASS ObjectInformationClass,
	IN PVOID ObjectInformation,
	IN ULONG ObjectInformationLength);

EXTERN_C NTSTATUS NtCancelIoFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtTraceEvent(
	IN HANDLE TraceHandle,
	IN ULONG Flags,
	IN ULONG FieldSize,
	IN PVOID Fields);

EXTERN_C NTSTATUS NtPowerInformation(
	IN POWER_INFORMATION_LEVEL InformationLevel,
	IN PVOID InputBuffer OPTIONAL,
	IN ULONG InputBufferLength,
	OUT PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputBufferLength);

EXTERN_C NTSTATUS NtSetValueKey(
	IN HANDLE KeyHandle,
	IN PUNICODE_STRING ValueName,
	IN ULONG TitleIndex OPTIONAL,
	IN ULONG Type,
	IN PVOID SystemData,
	IN ULONG DataSize);

EXTERN_C NTSTATUS NtCancelTimer(
	IN HANDLE TimerHandle,
	OUT PBOOLEAN CurrentState OPTIONAL);

EXTERN_C NTSTATUS NtSetTimer(
	IN HANDLE TimerHandle,
	IN PLARGE_INTEGER DueTime,
	IN PTIMER_APC_ROUTINE TimerApcRoutine OPTIONAL,
	IN PVOID TimerContext OPTIONAL,
	IN BOOLEAN ResumeTimer,
	IN LONG Period OPTIONAL,
	OUT PBOOLEAN PreviousState OPTIONAL);

EXTERN_C NTSTATUS NtAccessCheckByType(
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN PSID PrincipalSelfSid OPTIONAL,
	IN HANDLE ClientToken,
	IN ULONG DesiredAccess,
	IN POBJECT_TYPE_LIST ObjectTypeList,
	IN ULONG ObjectTypeListLength,
	IN PGENERIC_MAPPING GenericMapping,
	OUT PPRIVILEGE_SET PrivilegeSet,
	IN OUT PULONG PrivilegeSetLength,
	OUT PACCESS_MASK GrantedAccess,
	OUT PULONG AccessStatus);

EXTERN_C NTSTATUS NtAccessCheckByTypeResultList(
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN PSID PrincipalSelfSid OPTIONAL,
	IN HANDLE ClientToken,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_TYPE_LIST ObjectTypeList,
	IN ULONG ObjectTypeListLength,
	IN PGENERIC_MAPPING GenericMapping,
	OUT PPRIVILEGE_SET PrivilegeSet,
	IN OUT PULONG PrivilegeSetLength,
	OUT PACCESS_MASK GrantedAccess,
	OUT PULONG AccessStatus);

EXTERN_C NTSTATUS NtAccessCheckByTypeResultListAndAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN PUNICODE_STRING ObjectTypeName,
	IN PUNICODE_STRING ObjectName,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN PSID PrincipalSelfSid OPTIONAL,
	IN ACCESS_MASK DesiredAccess,
	IN AUDIT_EVENT_TYPE AuditType,
	IN ULONG Flags,
	IN POBJECT_TYPE_LIST ObjectTypeList OPTIONAL,
	IN ULONG ObjectTypeListLength,
	IN PGENERIC_MAPPING GenericMapping,
	IN BOOLEAN ObjectCreation,
	OUT PACCESS_MASK GrantedAccess,
	OUT PULONG AccessStatus,
	OUT PULONG GenerateOnClose);

EXTERN_C NTSTATUS NtAccessCheckByTypeResultListAndAuditAlarmByHandle(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN HANDLE ClientToken,
	IN PUNICODE_STRING ObjectTypeName,
	IN PUNICODE_STRING ObjectName,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor,
	IN PSID PrincipalSelfSid OPTIONAL,
	IN ACCESS_MASK DesiredAccess,
	IN AUDIT_EVENT_TYPE AuditType,
	IN ULONG Flags,
	IN POBJECT_TYPE_LIST ObjectTypeList OPTIONAL,
	IN ULONG ObjectTypeListLength,
	IN PGENERIC_MAPPING GenericMapping,
	IN BOOLEAN ObjectCreation,
	OUT PACCESS_MASK GrantedAccess,
	OUT PULONG AccessStatus,
	OUT PULONG GenerateOnClose);

EXTERN_C NTSTATUS NtAcquireProcessActivityReference();

EXTERN_C NTSTATUS NtAddAtomEx(
	IN PWSTR AtomName,
	IN ULONG Length,
	IN PRTL_ATOM Atom,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtAddBootEntry(
	IN PBOOT_ENTRY BootEntry,
	OUT PULONG Id OPTIONAL);

EXTERN_C NTSTATUS NtAddDriverEntry(
	IN PEFI_DRIVER_ENTRY DriverEntry,
	OUT PULONG Id OPTIONAL);

EXTERN_C NTSTATUS NtAdjustGroupsToken(
	IN HANDLE TokenHandle,
	IN BOOLEAN ResetToDefault,
	IN PTOKEN_GROUPS NewState OPTIONAL,
	IN ULONG BufferLength OPTIONAL,
	OUT PTOKEN_GROUPS PreviousState OPTIONAL,
	OUT PULONG ReturnLength);

EXTERN_C NTSTATUS NtAdjustTokenClaimsAndDeviceGroups(
	IN HANDLE TokenHandle,
	IN BOOLEAN UserResetToDefault,
	IN BOOLEAN DeviceResetToDefault,
	IN BOOLEAN DeviceGroupsResetToDefault,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION NewUserState OPTIONAL,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION NewDeviceState OPTIONAL,
	IN PTOKEN_GROUPS NewDeviceGroupsState OPTIONAL,
	IN ULONG UserBufferLength,
	OUT PTOKEN_SECURITY_ATTRIBUTES_INFORMATION PreviousUserState OPTIONAL,
	IN ULONG DeviceBufferLength,
	OUT PTOKEN_SECURITY_ATTRIBUTES_INFORMATION PreviousDeviceState OPTIONAL,
	IN ULONG DeviceGroupsBufferLength,
	OUT PTOKEN_GROUPS PreviousDeviceGroups OPTIONAL,
	OUT PULONG UserReturnLength OPTIONAL,
	OUT PULONG DeviceReturnLength OPTIONAL,
	OUT PULONG DeviceGroupsReturnBufferLength OPTIONAL);

EXTERN_C NTSTATUS NtAlertResumeThread(
	IN HANDLE ThreadHandle,
	OUT PULONG PreviousSuspendCount OPTIONAL);

EXTERN_C NTSTATUS NtAlertThread(
	IN HANDLE ThreadHandle);

EXTERN_C NTSTATUS NtAlertThreadByThreadId(
	IN ULONG ThreadId);

EXTERN_C NTSTATUS NtAllocateLocallyUniqueId(
	OUT PLUID Luid);

EXTERN_C NTSTATUS NtAllocateReserveObject(
	OUT PHANDLE MemoryReserveHandle,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN MEMORY_RESERVE_TYPE Type);

EXTERN_C NTSTATUS NtAllocateUserPhysicalPages(
	IN HANDLE ProcessHandle,
	IN OUT PULONG NumberOfPages,
	OUT PULONG UserPfnArray);

EXTERN_C NTSTATUS NtAllocateUuids(
	OUT PLARGE_INTEGER Time,
	OUT PULONG Range,
	OUT PULONG Sequence,
	OUT PUCHAR Seed);

EXTERN_C NTSTATUS NtAllocateVirtualMemoryEx(
	IN HANDLE ProcessHandle,
	IN OUT PPVOID lpAddress,
	IN ULONG_PTR ZeroBits,
	IN OUT PSIZE_T pSize,
	IN ULONG flAllocationType,
	IN OUT PVOID DataBuffer OPTIONAL,
	IN ULONG DataCount);

EXTERN_C NTSTATUS NtAlpcAcceptConnectPort(
	OUT PHANDLE PortHandle,
	IN HANDLE ConnectionPortHandle,
	IN ULONG Flags,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PALPC_PORT_ATTRIBUTES PortAttributes OPTIONAL,
	IN PVOID PortContext OPTIONAL,
	IN PPORT_MESSAGE ConnectionRequest,
	IN OUT PALPC_MESSAGE_ATTRIBUTES ConnectionMessageAttributes OPTIONAL,
	IN BOOLEAN AcceptConnection);

EXTERN_C NTSTATUS NtAlpcCancelMessage(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN PALPC_CONTEXT_ATTR MessageContext);

EXTERN_C NTSTATUS NtAlpcConnectPort(
	OUT PHANDLE PortHandle,
	IN PUNICODE_STRING PortName,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PALPC_PORT_ATTRIBUTES PortAttributes OPTIONAL,
	IN ULONG Flags,
	IN PSID RequiredServerSid OPTIONAL,
	IN OUT PPORT_MESSAGE ConnectionMessage OPTIONAL,
	IN OUT PULONG BufferLength OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES OutMessageAttributes OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES InMessageAttributes OPTIONAL,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtAlpcConnectPortEx(
	OUT PHANDLE PortHandle,
	IN POBJECT_ATTRIBUTES ConnectionPortObjectAttributes,
	IN POBJECT_ATTRIBUTES ClientPortObjectAttributes OPTIONAL,
	IN PALPC_PORT_ATTRIBUTES PortAttributes OPTIONAL,
	IN ULONG Flags,
	IN PSECURITY_DESCRIPTOR ServerSecurityRequirements OPTIONAL,
	IN OUT PPORT_MESSAGE ConnectionMessage OPTIONAL,
	IN OUT PSIZE_T BufferLength OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES OutMessageAttributes OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES InMessageAttributes OPTIONAL,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtAlpcCreatePort(
	OUT PHANDLE PortHandle,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PALPC_PORT_ATTRIBUTES PortAttributes OPTIONAL);

EXTERN_C NTSTATUS NtAlpcCreatePortSection(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN HANDLE SectionHandle OPTIONAL,
	IN SIZE_T SectionSize,
	OUT PHANDLE AlpcSectionHandle,
	OUT PSIZE_T ActualSectionSize);

EXTERN_C NTSTATUS NtAlpcCreateResourceReserve(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN SIZE_T MessageSize,
	OUT PHANDLE ResourceId);

EXTERN_C NTSTATUS NtAlpcCreateSectionView(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN OUT PALPC_DATA_VIEW_ATTR ViewAttributes);

EXTERN_C NTSTATUS NtAlpcCreateSecurityContext(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN OUT PALPC_SECURITY_ATTR SecurityAttribute);

EXTERN_C NTSTATUS NtAlpcDeletePortSection(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN HANDLE SectionHandle);

EXTERN_C NTSTATUS NtAlpcDeleteResourceReserve(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN HANDLE ResourceId);

EXTERN_C NTSTATUS NtAlpcDeleteSectionView(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN PVOID ViewBase);

EXTERN_C NTSTATUS NtAlpcDeleteSecurityContext(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN HANDLE ContextHandle);

EXTERN_C NTSTATUS NtAlpcDisconnectPort(
	IN HANDLE PortHandle,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtAlpcImpersonateClientContainerOfPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE Message,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtAlpcImpersonateClientOfPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE Message,
	IN PVOID Flags);

EXTERN_C NTSTATUS NtAlpcOpenSenderProcess(
	OUT PHANDLE ProcessHandle,
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE PortMessage,
	IN ULONG Flags,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtAlpcOpenSenderThread(
	OUT PHANDLE ThreadHandle,
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE PortMessage,
	IN ULONG Flags,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtAlpcQueryInformation(
	IN HANDLE PortHandle OPTIONAL,
	IN ALPC_PORT_INFORMATION_CLASS PortInformationClass,
	IN OUT PVOID PortInformation,
	IN ULONG Length,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtAlpcQueryInformationMessage(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE PortMessage,
	IN ALPC_MESSAGE_INFORMATION_CLASS MessageInformationClass,
	OUT PVOID MessageInformation OPTIONAL,
	IN ULONG Length,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtAlpcRevokeSecurityContext(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN HANDLE ContextHandle);

EXTERN_C NTSTATUS NtAlpcSendWaitReceivePort(
	IN HANDLE PortHandle,
	IN ULONG Flags,
	IN PPORT_MESSAGE SendMessage OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES SendMessageAttributes OPTIONAL,
	OUT PPORT_MESSAGE ReceiveMessage OPTIONAL,
	IN OUT PSIZE_T BufferLength OPTIONAL,
	IN OUT PALPC_MESSAGE_ATTRIBUTES ReceiveMessageAttributes OPTIONAL,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtAlpcSetInformation(
	IN HANDLE PortHandle,
	IN ALPC_PORT_INFORMATION_CLASS PortInformationClass,
	IN PVOID PortInformation OPTIONAL,
	IN ULONG Length);

EXTERN_C NTSTATUS NtAreMappedFilesTheSame(
	IN PVOID File1MappedAsAnImage,
	IN PVOID File2MappedAsFile);

EXTERN_C NTSTATUS NtAssignProcessToJobObject(
	IN HANDLE JobHandle,
	IN HANDLE ProcessHandle);

EXTERN_C NTSTATUS NtAssociateWaitCompletionPacket(
	IN HANDLE WaitCompletionPacketHandle,
	IN HANDLE IoCompletionHandle,
	IN HANDLE TargetObjectHandle,
	IN PVOID KeyContext OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	IN NTSTATUS IoStatus,
	IN ULONG_PTR IoStatusInformation,
	OUT PBOOLEAN AlreadySignaled OPTIONAL);

EXTERN_C NTSTATUS NtCallEnclave(
	IN PENCLAVE_ROUTINE Routine,
	IN PVOID Parameter,
	IN BOOLEAN WaitForThread,
	IN OUT PVOID ReturnValue OPTIONAL);

EXTERN_C NTSTATUS NtCancelIoFileEx(
	IN HANDLE FileHandle,
	IN PIO_STATUS_BLOCK IoRequestToCancel OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtCancelSynchronousIoFile(
	IN HANDLE ThreadHandle,
	IN PIO_STATUS_BLOCK IoRequestToCancel OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtCancelTimer2(
	IN HANDLE TimerHandle,
	IN PT2_CANCEL_PARAMETERS Parameters);

EXTERN_C NTSTATUS NtCancelWaitCompletionPacket(
	IN HANDLE WaitCompletionPacketHandle,
	IN BOOLEAN RemoveSignaledPacket);

EXTERN_C NTSTATUS NtCommitComplete(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtCommitEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtCommitRegistryTransaction(
	IN HANDLE RegistryHandle,
	IN BOOL Wait);

EXTERN_C NTSTATUS NtCommitTransaction(
	IN HANDLE TransactionHandle,
	IN BOOLEAN Wait);

EXTERN_C NTSTATUS NtCompactKeys(
	IN ULONG Count,
	IN HANDLE KeyArray);

EXTERN_C NTSTATUS NtCompareObjects(
	IN HANDLE FirstObjectHandle,
	IN HANDLE SecondObjectHandle);

EXTERN_C NTSTATUS NtCompareSigningLevels(
	IN ULONG UnknownParameter1,
	IN ULONG UnknownParameter2);

EXTERN_C NTSTATUS NtCompareTokens(
	IN HANDLE FirstTokenHandle,
	IN HANDLE SecondTokenHandle,
	OUT PBOOLEAN Equal);

EXTERN_C NTSTATUS NtCompleteConnectPort(
	IN HANDLE PortHandle);

EXTERN_C NTSTATUS NtCompressKey(
	IN HANDLE Key);

EXTERN_C NTSTATUS NtConnectPort(
	OUT PHANDLE PortHandle,
	IN PUNICODE_STRING PortName,
	IN PSECURITY_QUALITY_OF_SERVICE SecurityQos,
	IN OUT PPORT_SECTION_WRITE ClientView OPTIONAL,
	IN OUT PPORT_SECTION_READ ServerView OPTIONAL,
	OUT PULONG MaxMessageLength OPTIONAL,
	IN OUT PVOID ConnectionInformation OPTIONAL,
	IN OUT PULONG ConnectionInformationLength OPTIONAL);

EXTERN_C NTSTATUS NtConvertBetweenAuxiliaryCounterAndPerformanceCounter(
	IN ULONG UnknownParameter1,
	IN ULONG UnknownParameter2,
	IN ULONG UnknownParameter3,
	IN ULONG UnknownParameter4);

EXTERN_C NTSTATUS NtCreateDebugObject(
	OUT PHANDLE DebugObjectHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtCreateDirectoryObject(
	OUT PHANDLE DirectoryHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtCreateDirectoryObjectEx(
	OUT PHANDLE DirectoryHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN HANDLE ShadowDirectoryHandle,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtCreateEnclave(
	IN HANDLE ProcessHandle,
	IN OUT PVOID BaseAddress,
	IN ULONG_PTR ZeroBits,
	IN SIZE_T Size,
	IN SIZE_T InitialCommitment,
	IN ULONG EnclaveType,
	IN PVOID EnclaveInformation,
	IN ULONG EnclaveInformationLength,
	OUT PULONG EnclaveError OPTIONAL);

EXTERN_C NTSTATUS NtCreateEnlistment(
	OUT PHANDLE EnlistmentHandle,
	IN ACCESS_MASK DesiredAccess,
	IN HANDLE ResourceManagerHandle,
	IN HANDLE TransactionHandle,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG CreateOptions OPTIONAL,
	IN NOTIFICATION_MASK NotificationMask,
	IN PVOID EnlistmentKey OPTIONAL);

EXTERN_C NTSTATUS NtCreateEventPair(
	OUT PHANDLE EventPairHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL);

EXTERN_C NTSTATUS NtCreateIRTimer(
	OUT PHANDLE TimerHandle,
	IN ACCESS_MASK DesiredAccess);

EXTERN_C NTSTATUS NtCreateIoCompletion(
	OUT PHANDLE IoCompletionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG Count OPTIONAL);

EXTERN_C NTSTATUS NtCreateJobObject(
	OUT PHANDLE JobHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL);

EXTERN_C NTSTATUS NtCreateJobSet(
	IN ULONG NumJob,
	IN PJOB_SET_ARRAY UserJobSet,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtCreateKeyTransacted(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN ULONG TitleIndex,
	IN PUNICODE_STRING Class OPTIONAL,
	IN ULONG CreateOptions,
	IN HANDLE TransactionHandle,
	OUT PULONG Disposition OPTIONAL);

EXTERN_C NTSTATUS NtCreateKeyedEvent(
	OUT PHANDLE KeyedEventHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtCreateLowBoxToken(
	OUT PHANDLE TokenHandle,
	IN HANDLE ExistingTokenHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PSID PackageSid,
	IN ULONG CapabilityCount,
	IN PSID_AND_ATTRIBUTES Capabilities OPTIONAL,
	IN ULONG HandleCount,
	IN HANDLE Handles OPTIONAL);

EXTERN_C NTSTATUS NtCreateMailslotFile(
	OUT PHANDLE FileHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG CreateOptions,
	IN ULONG MailslotQuota,
	IN ULONG MaximumMessageSize,
	IN PLARGE_INTEGER ReadTimeout);

EXTERN_C NTSTATUS NtCreateMutant(
	OUT PHANDLE MutantHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN BOOLEAN InitialOwner);

EXTERN_C NTSTATUS NtCreateNamedPipeFile(
	OUT PHANDLE FileHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG ShareAccess,
	IN ULONG CreateDisposition,
	IN ULONG CreateOptions,
	IN BOOLEAN NamedPipeType,
	IN BOOLEAN ReadMode,
	IN BOOLEAN CompletionMode,
	IN ULONG MaximumInstances,
	IN ULONG InboundQuota,
	IN ULONG OutboundQuota,
	IN PLARGE_INTEGER DefaultTimeout OPTIONAL);

EXTERN_C NTSTATUS NtCreatePagingFile(
	IN PUNICODE_STRING PageFileName,
	IN PULARGE_INTEGER MinimumSize,
	IN PULARGE_INTEGER MaximumSize,
	IN ULONG Priority);

EXTERN_C NTSTATUS NtCreatePartition(
	OUT PHANDLE PartitionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG PreferredNode);

EXTERN_C NTSTATUS NtCreatePort(
	OUT PHANDLE PortHandle,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG MaxConnectionInfoLength,
	IN ULONG MaxMessageLength,
	IN ULONG MaxPoolUsage OPTIONAL);

EXTERN_C NTSTATUS NtCreatePrivateNamespace(
	OUT PHANDLE NamespaceHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN PVOID BoundaryDescriptor);

EXTERN_C NTSTATUS NtCreateProcess(
	OUT PHANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE ParentProcess,
	IN BOOLEAN InheritObjectTable,
	IN HANDLE SectionHandle OPTIONAL,
	IN HANDLE DebugPort OPTIONAL,
	IN HANDLE ExceptionPort OPTIONAL);

EXTERN_C NTSTATUS NtCreateProfile(
	OUT PHANDLE ProfileHandle,
	IN HANDLE Process OPTIONAL,
	IN PVOID ProfileBase,
	IN ULONG ProfileSize,
	IN ULONG BucketSize,
	IN PULONG Buffer,
	IN ULONG BufferSize,
	IN KPROFILE_SOURCE ProfileSource,
	IN ULONG Affinity);

EXTERN_C NTSTATUS NtCreateProfileEx(
	OUT PHANDLE ProfileHandle,
	IN HANDLE Process OPTIONAL,
	IN PVOID ProfileBase,
	IN SIZE_T ProfileSize,
	IN ULONG BucketSize,
	IN PULONG Buffer,
	IN ULONG BufferSize,
	IN KPROFILE_SOURCE ProfileSource,
	IN USHORT GroupCount,
	IN PGROUP_AFFINITY GroupAffinity);

EXTERN_C NTSTATUS NtCreateRegistryTransaction(
	OUT PHANDLE Handle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN DWORD Flags);

EXTERN_C NTSTATUS NtCreateResourceManager(
	OUT PHANDLE ResourceManagerHandle,
	IN ACCESS_MASK DesiredAccess,
	IN HANDLE TmHandle,
	IN LPGUID RmGuid,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG CreateOptions OPTIONAL,
	IN PUNICODE_STRING Description OPTIONAL);

EXTERN_C NTSTATUS NtCreateSemaphore(
	OUT PHANDLE SemaphoreHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN LONG InitialCount,
	IN LONG MaximumCount);

EXTERN_C NTSTATUS NtCreateSymbolicLinkObject(
	OUT PHANDLE LinkHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN PUNICODE_STRING LinkTarget);

EXTERN_C NTSTATUS NtCreateThreadEx(
	OUT PHANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE ProcessHandle,
	IN PVOID StartRoutine,
	IN PVOID Argument OPTIONAL,
	IN ULONG CreateFlags,
	IN SIZE_T ZeroBits,
	IN SIZE_T StackSize,
	IN SIZE_T MaximumStackSize,
	IN PPS_ATTRIBUTE_LIST AttributeList OPTIONAL);

EXTERN_C NTSTATUS NtCreateTimer(
	OUT PHANDLE TimerHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN TIMER_TYPE TimerType);

EXTERN_C NTSTATUS NtCreateTimer2(
	OUT PHANDLE TimerHandle,
	IN PVOID Reserved1 OPTIONAL,
	IN PVOID Reserved2 OPTIONAL,
	IN ULONG Attributes,
	IN ACCESS_MASK DesiredAccess);

EXTERN_C NTSTATUS NtCreateToken(
	OUT PHANDLE TokenHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN TOKEN_TYPE TokenType,
	IN PLUID AuthenticationId,
	IN PLARGE_INTEGER ExpirationTime,
	IN PTOKEN_USER User,
	IN PTOKEN_GROUPS Groups,
	IN PTOKEN_PRIVILEGES Privileges,
	IN PTOKEN_OWNER Owner OPTIONAL,
	IN PTOKEN_PRIMARY_GROUP PrimaryGroup,
	IN PTOKEN_DEFAULT_DACL DefaultDacl OPTIONAL,
	IN PTOKEN_SOURCE TokenSource);

EXTERN_C NTSTATUS NtCreateTokenEx(
	OUT PHANDLE TokenHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN TOKEN_TYPE TokenType,
	IN PLUID AuthenticationId,
	IN PLARGE_INTEGER ExpirationTime,
	IN PTOKEN_USER User,
	IN PTOKEN_GROUPS Groups,
	IN PTOKEN_PRIVILEGES Privileges,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION UserAttributes OPTIONAL,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION DeviceAttributes OPTIONAL,
	IN PTOKEN_GROUPS DeviceGroups OPTIONAL,
	IN PTOKEN_MANDATORY_POLICY TokenMandatoryPolicy OPTIONAL,
	IN PTOKEN_OWNER Owner OPTIONAL,
	IN PTOKEN_PRIMARY_GROUP PrimaryGroup,
	IN PTOKEN_DEFAULT_DACL DefaultDacl OPTIONAL,
	IN PTOKEN_SOURCE TokenSource);

EXTERN_C NTSTATUS NtCreateTransaction(
	OUT PHANDLE TransactionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN LPGUID Uow OPTIONAL,
	IN HANDLE TmHandle OPTIONAL,
	IN ULONG CreateOptions OPTIONAL,
	IN ULONG IsolationLevel OPTIONAL,
	IN ULONG IsolationFlags OPTIONAL,
	IN PLARGE_INTEGER Timeout OPTIONAL,
	IN PUNICODE_STRING Description OPTIONAL);

EXTERN_C NTSTATUS NtCreateTransactionManager(
	OUT PHANDLE TmHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PUNICODE_STRING LogFileName OPTIONAL,
	IN ULONG CreateOptions OPTIONAL,
	IN ULONG CommitStrength OPTIONAL);

EXTERN_C NTSTATUS NtCreateUserProcess(
	OUT PHANDLE ProcessHandle,
	OUT PHANDLE ThreadHandle,
	IN ACCESS_MASK ProcessDesiredAccess,
	IN ACCESS_MASK ThreadDesiredAccess,
	IN POBJECT_ATTRIBUTES ProcessObjectAttributes OPTIONAL,
	IN POBJECT_ATTRIBUTES ThreadObjectAttributes OPTIONAL,
	IN ULONG ProcessFlags,
	IN ULONG ThreadFlags,
	IN PVOID ProcessParameters OPTIONAL,
	IN OUT PPS_CREATE_INFO CreateInfo,
	IN PPS_ATTRIBUTE_LIST AttributeList OPTIONAL);

EXTERN_C NTSTATUS NtCreateWaitCompletionPacket(
	OUT PHANDLE WaitCompletionPacketHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL);

EXTERN_C NTSTATUS NtCreateWaitablePort(
	OUT PHANDLE PortHandle,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN ULONG MaxConnectionInfoLength,
	IN ULONG MaxMessageLength,
	IN ULONG MaxPoolUsage OPTIONAL);

EXTERN_C NTSTATUS NtCreateWnfStateName(
	OUT PCWNF_STATE_NAME StateName,
	IN WNF_STATE_NAME_LIFETIME NameLifetime,
	IN WNF_DATA_SCOPE DataScope,
	IN BOOLEAN PersistData,
	IN PCWNF_TYPE_ID TypeId OPTIONAL,
	IN ULONG MaximumStateSize,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor);

EXTERN_C NTSTATUS NtCreateWorkerFactory(
	OUT PHANDLE WorkerFactoryHandleReturn,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE CompletionPortHandle,
	IN HANDLE WorkerProcessHandle,
	IN PVOID StartRoutine,
	IN PVOID StartParameter OPTIONAL,
	IN ULONG MaxThreadCount OPTIONAL,
	IN SIZE_T StackReserve OPTIONAL,
	IN SIZE_T StackCommit OPTIONAL);

EXTERN_C NTSTATUS NtDebugActiveProcess(
	IN HANDLE ProcessHandle,
	IN HANDLE DebugObjectHandle);

EXTERN_C NTSTATUS NtDebugContinue(
	IN HANDLE DebugObjectHandle,
	IN PCLIENT_ID ClientId,
	IN NTSTATUS ContinueStatus);

EXTERN_C NTSTATUS NtDeleteAtom(
	IN USHORT Atom);

EXTERN_C NTSTATUS NtDeleteBootEntry(
	IN ULONG Id);

EXTERN_C NTSTATUS NtDeleteDriverEntry(
	IN ULONG Id);

EXTERN_C NTSTATUS NtDeleteFile(
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtDeleteKey(
	IN HANDLE KeyHandle);

EXTERN_C NTSTATUS NtDeleteObjectAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN BOOLEAN GenerateOnClose);

EXTERN_C NTSTATUS NtDeletePrivateNamespace(
	IN HANDLE NamespaceHandle);

EXTERN_C NTSTATUS NtDeleteValueKey(
	IN HANDLE KeyHandle,
	IN PUNICODE_STRING ValueName);

EXTERN_C NTSTATUS NtDeleteWnfStateData(
	IN PCWNF_STATE_NAME StateName,
	IN PVOID ExplicitScope OPTIONAL);

EXTERN_C NTSTATUS NtDeleteWnfStateName(
	IN PCWNF_STATE_NAME StateName);

EXTERN_C NTSTATUS NtDisableLastKnownGood();

EXTERN_C NTSTATUS NtDisplayString(
	IN PUNICODE_STRING String);

EXTERN_C NTSTATUS NtDrawText(
	IN PUNICODE_STRING String);

EXTERN_C NTSTATUS NtEnableLastKnownGood();

EXTERN_C NTSTATUS NtEnumerateBootEntries(
	OUT PVOID Buffer OPTIONAL,
	IN OUT PULONG BufferLength);

EXTERN_C NTSTATUS NtEnumerateDriverEntries(
	OUT PVOID Buffer OPTIONAL,
	IN OUT PULONG BufferLength);

EXTERN_C NTSTATUS NtEnumerateSystemEnvironmentValuesEx(
	IN ULONG InformationClass,
	OUT PVOID Buffer,
	IN OUT PULONG BufferLength);

EXTERN_C NTSTATUS NtEnumerateTransactionObject(
	IN HANDLE RootObjectHandle OPTIONAL,
	IN KTMOBJECT_TYPE QueryType,
	IN OUT PKTMOBJECT_CURSOR ObjectCursor,
	IN ULONG ObjectCursorLength,
	OUT PULONG ReturnLength);

EXTERN_C NTSTATUS NtExtendSection(
	IN HANDLE SectionHandle,
	IN OUT PLARGE_INTEGER NewSectionSize);

EXTERN_C NTSTATUS NtFilterBootOption(
	IN FILTER_BOOT_OPTION_OPERATION FilterOperation,
	IN ULONG ObjectType,
	IN ULONG ElementType,
	IN PVOID SystemData OPTIONAL,
	IN ULONG DataSize);

EXTERN_C NTSTATUS NtFilterToken(
	IN HANDLE ExistingTokenHandle,
	IN ULONG Flags,
	IN PTOKEN_GROUPS SidsToDisable OPTIONAL,
	IN PTOKEN_PRIVILEGES PrivilegesToDelete OPTIONAL,
	IN PTOKEN_GROUPS RestrictedSids OPTIONAL,
	OUT PHANDLE NewTokenHandle);

EXTERN_C NTSTATUS NtFilterTokenEx(
	IN HANDLE TokenHandle,
	IN ULONG Flags,
	IN PTOKEN_GROUPS SidsToDisable OPTIONAL,
	IN PTOKEN_PRIVILEGES PrivilegesToDelete OPTIONAL,
	IN PTOKEN_GROUPS RestrictedSids OPTIONAL,
	IN ULONG DisableUserClaimsCount,
	IN PUNICODE_STRING UserClaimsToDisable OPTIONAL,
	IN ULONG DisableDeviceClaimsCount,
	IN PUNICODE_STRING DeviceClaimsToDisable OPTIONAL,
	IN PTOKEN_GROUPS DeviceGroupsToDisable OPTIONAL,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION RestrictedUserAttributes OPTIONAL,
	IN PTOKEN_SECURITY_ATTRIBUTES_INFORMATION RestrictedDeviceAttributes OPTIONAL,
	IN PTOKEN_GROUPS RestrictedDeviceGroups OPTIONAL,
	OUT PHANDLE NewTokenHandle);

EXTERN_C NTSTATUS NtFlushBuffersFileEx(
	IN HANDLE FileHandle,
	IN ULONG Flags,
	IN PVOID Parameters,
	IN ULONG ParametersSize,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtFlushInstallUILanguage(
	IN LANGID InstallUILanguage,
	IN ULONG SetComittedFlag);

EXTERN_C NTSTATUS NtFlushInstructionCache(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress OPTIONAL,
	IN ULONG Length);

EXTERN_C NTSTATUS NtFlushKey(
	IN HANDLE KeyHandle);

EXTERN_C NTSTATUS NtFlushProcessWriteBuffers();

EXTERN_C NTSTATUS NtFlushVirtualMemory(
	IN HANDLE ProcessHandle,
	IN OUT PVOID BaseAddress,
	IN OUT PULONG RegionSize,
	OUT PIO_STATUS_BLOCK IoStatusBlock);

EXTERN_C NTSTATUS NtFlushWriteBuffer();

EXTERN_C NTSTATUS NtFreeUserPhysicalPages(
	IN HANDLE ProcessHandle,
	IN OUT PULONG NumberOfPages,
	IN PULONG UserPfnArray);

EXTERN_C NTSTATUS NtFreezeRegistry(
	IN ULONG TimeOutInSeconds);

EXTERN_C NTSTATUS NtFreezeTransactions(
	IN PLARGE_INTEGER FreezeTimeout,
	IN PLARGE_INTEGER ThawTimeout);

EXTERN_C NTSTATUS NtGetCachedSigningLevel(
	IN HANDLE File,
	OUT PULONG Flags,
	OUT PSE_SIGNING_LEVEL SigningLevel,
	OUT PUCHAR Thumbprint OPTIONAL,
	IN OUT PULONG ThumbprintSize OPTIONAL,
	OUT PULONG ThumbprintAlgorithm OPTIONAL);

EXTERN_C NTSTATUS NtGetCompleteWnfStateSubscription(
	IN PCWNF_STATE_NAME OldDescriptorStateName OPTIONAL,
	IN PLARGE_INTEGER OldSubscriptionId OPTIONAL,
	IN ULONG OldDescriptorEventMask OPTIONAL,
	IN ULONG OldDescriptorStatus OPTIONAL,
	OUT PWNF_DELIVERY_DESCRIPTOR NewDeliveryDescriptor,
	IN ULONG DescriptorSize);

EXTERN_C NTSTATUS NtGetContextThread(
	IN HANDLE ThreadHandle,
	IN OUT PCONTEXT ThreadContext);

EXTERN_C NTSTATUS NtGetCurrentProcessorNumber();

EXTERN_C NTSTATUS NtGetCurrentProcessorNumberEx(
	OUT PULONG ProcNumber OPTIONAL);

EXTERN_C NTSTATUS NtGetDevicePowerState(
	IN HANDLE Device,
	OUT PDEVICE_POWER_STATE State);

EXTERN_C NTSTATUS NtGetMUIRegistryInfo(
	IN ULONG Flags,
	IN OUT PULONG DataSize,
	OUT PVOID SystemData);

EXTERN_C NTSTATUS NtGetNextProcess(
	IN HANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	IN ULONG HandleAttributes,
	IN ULONG Flags,
	OUT PHANDLE NewProcessHandle);

EXTERN_C NTSTATUS NtGetNextThread(
	IN HANDLE ProcessHandle,
	IN HANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN ULONG HandleAttributes,
	IN ULONG Flags,
	OUT PHANDLE NewThreadHandle);

EXTERN_C NTSTATUS NtGetNlsSectionPtr(
	IN ULONG SectionType,
	IN ULONG SectionData,
	IN PVOID ContextData,
	OUT PVOID SectionPointer,
	OUT PULONG SectionSize);

EXTERN_C NTSTATUS NtGetNotificationResourceManager(
	IN HANDLE ResourceManagerHandle,
	OUT PTRANSACTION_NOTIFICATION TransactionNotification,
	IN ULONG NotificationLength,
	IN PLARGE_INTEGER Timeout OPTIONAL,
	OUT PULONG ReturnLength OPTIONAL,
	IN ULONG Asynchronous,
	IN ULONG AsynchronousContext OPTIONAL);

EXTERN_C NTSTATUS NtGetWriteWatch(
	IN HANDLE ProcessHandle,
	IN ULONG Flags,
	IN PVOID BaseAddress,
	IN ULONG RegionSize,
	OUT PULONG UserAddressArray,
	IN OUT PULONG EntriesInUserAddressArray,
	OUT PULONG Granularity);

EXTERN_C NTSTATUS NtImpersonateAnonymousToken(
	IN HANDLE ThreadHandle);

EXTERN_C NTSTATUS NtImpersonateThread(
	IN HANDLE ServerThreadHandle,
	IN HANDLE ClientThreadHandle,
	IN PSECURITY_QUALITY_OF_SERVICE SecurityQos);

EXTERN_C NTSTATUS NtInitializeEnclave(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN PVOID EnclaveInformation,
	IN ULONG EnclaveInformationLength,
	OUT PULONG EnclaveError OPTIONAL);

EXTERN_C NTSTATUS NtInitializeNlsFiles(
	OUT PVOID BaseAddress,
	OUT PLCID DefaultLocaleId,
	OUT PLARGE_INTEGER DefaultCasingTableSize);

EXTERN_C NTSTATUS NtInitializeRegistry(
	IN USHORT BootCondition);

EXTERN_C NTSTATUS NtInitiatePowerAction(
	IN POWER_ACTION SystemAction,
	IN SYSTEM_POWER_STATE LightestSystemState,
	IN ULONG Flags,
	IN BOOLEAN Asynchronous);

EXTERN_C NTSTATUS NtIsSystemResumeAutomatic();

EXTERN_C NTSTATUS NtIsUILanguageComitted();

EXTERN_C NTSTATUS NtListenPort(
	IN HANDLE PortHandle,
	OUT PPORT_MESSAGE ConnectionRequest);

EXTERN_C NTSTATUS NtLoadDriver(
	IN PUNICODE_STRING DriverServiceName);

EXTERN_C NTSTATUS NtLoadEnclaveData(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN PVOID Buffer,
	IN SIZE_T BufferSize,
	IN ULONG Protect,
	IN PVOID PageInformation,
	IN ULONG PageInformationLength,
	OUT PSIZE_T NumberOfBytesWritten OPTIONAL,
	OUT PULONG EnclaveError OPTIONAL);

EXTERN_C NTSTATUS NtLoadHotPatch(
	IN PUNICODE_STRING HotPatchName,
	IN ULONG LoadFlag);

EXTERN_C NTSTATUS NtLoadKey(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN POBJECT_ATTRIBUTES SourceFile);

EXTERN_C NTSTATUS NtLoadKey2(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN POBJECT_ATTRIBUTES SourceFile,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtLoadKeyEx(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN POBJECT_ATTRIBUTES SourceFile,
	IN ULONG Flags,
	IN HANDLE TrustClassKey OPTIONAL,
	IN HANDLE Event OPTIONAL,
	IN ACCESS_MASK DesiredAccess OPTIONAL,
	OUT PHANDLE RootHandle OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatus OPTIONAL);

EXTERN_C NTSTATUS NtLockFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PULARGE_INTEGER ByteOffset,
	IN PULARGE_INTEGER Length,
	IN ULONG Key,
	IN BOOLEAN FailImmediately,
	IN BOOLEAN ExclusiveLock);

EXTERN_C NTSTATUS NtLockProductActivationKeys(
	IN OUT PULONG pPrivateVer OPTIONAL,
	OUT PULONG pSafeMode OPTIONAL);

EXTERN_C NTSTATUS NtLockRegistryKey(
	IN HANDLE KeyHandle);

EXTERN_C NTSTATUS NtLockVirtualMemory(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN PULONG RegionSize,
	IN ULONG MapType);

EXTERN_C NTSTATUS NtMakePermanentObject(
	IN HANDLE Handle);

EXTERN_C NTSTATUS NtMakeTemporaryObject(
	IN HANDLE Handle);

EXTERN_C NTSTATUS NtManagePartition(
	IN HANDLE TargetHandle,
	IN HANDLE SourceHandle,
	IN MEMORY_PARTITION_INFORMATION_CLASS PartitionInformationClass,
	IN OUT PVOID PartitionInformation,
	IN ULONG PartitionInformationLength);

EXTERN_C NTSTATUS NtMapCMFModule(
	IN ULONG What,
	IN ULONG Index,
	OUT PULONG CacheIndexOut OPTIONAL,
	OUT PULONG CacheFlagsOut OPTIONAL,
	OUT PULONG ViewSizeOut OPTIONAL,
	OUT PVOID BaseAddress OPTIONAL);

EXTERN_C NTSTATUS NtMapUserPhysicalPages(
	IN PVOID VirtualAddress,
	IN PULONG NumberOfPages,
	IN PULONG UserPfnArray OPTIONAL);

EXTERN_C NTSTATUS NtMapViewOfSectionEx(
	IN HANDLE SectionHandle,
	IN HANDLE ProcessHandle,
	IN OUT PLARGE_INTEGER SectionOffset,
	IN OUT PPVOID BaseAddress,
	IN OUT PSIZE_T ViewSize,
	IN ULONG AllocationType,
	IN ULONG Protect,
	IN OUT PVOID DataBuffer OPTIONAL,
	IN ULONG DataCount);

EXTERN_C NTSTATUS NtModifyBootEntry(
	IN PBOOT_ENTRY BootEntry);

EXTERN_C NTSTATUS NtModifyDriverEntry(
	IN PEFI_DRIVER_ENTRY DriverEntry);

EXTERN_C NTSTATUS NtNotifyChangeDirectoryFile(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PFILE_NOTIFY_INFORMATION Buffer,
	IN ULONG Length,
	IN ULONG CompletionFilter,
	IN BOOLEAN WatchTree);

EXTERN_C NTSTATUS NtNotifyChangeDirectoryFileEx(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID Buffer,
	IN ULONG Length,
	IN ULONG CompletionFilter,
	IN BOOLEAN WatchTree,
	IN DIRECTORY_NOTIFY_INFORMATION_CLASS DirectoryNotifyInformationClass OPTIONAL);

EXTERN_C NTSTATUS NtNotifyChangeKey(
	IN HANDLE KeyHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG CompletionFilter,
	IN BOOLEAN WatchTree,
	OUT PVOID Buffer OPTIONAL,
	IN ULONG BufferSize,
	IN BOOLEAN Asynchronous);

EXTERN_C NTSTATUS NtNotifyChangeMultipleKeys(
	IN HANDLE MasterKeyHandle,
	IN ULONG Count OPTIONAL,
	IN POBJECT_ATTRIBUTES SubordinateObjects OPTIONAL,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG CompletionFilter,
	IN BOOLEAN WatchTree,
	OUT PVOID Buffer OPTIONAL,
	IN ULONG BufferSize,
	IN BOOLEAN Asynchronous);

EXTERN_C NTSTATUS NtNotifyChangeSession(
	IN HANDLE SessionHandle,
	IN ULONG ChangeSequenceNumber,
	IN PLARGE_INTEGER ChangeTimeStamp,
	IN IO_SESSION_EVENT Event,
	IN IO_SESSION_STATE NewState,
	IN IO_SESSION_STATE PreviousState,
	IN PVOID Payload OPTIONAL,
	IN ULONG PayloadSize);

EXTERN_C NTSTATUS NtOpenEnlistment(
	OUT PHANDLE EnlistmentHandle,
	IN ACCESS_MASK DesiredAccess,
	IN HANDLE ResourceManagerHandle,
	IN LPGUID EnlistmentGuid,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL);

EXTERN_C NTSTATUS NtOpenEventPair(
	OUT PHANDLE EventPairHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenIoCompletion(
	OUT PHANDLE IoCompletionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenJobObject(
	OUT PHANDLE JobHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenKeyEx(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN ULONG OpenOptions);

EXTERN_C NTSTATUS NtOpenKeyTransacted(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN HANDLE TransactionHandle);

EXTERN_C NTSTATUS NtOpenKeyTransactedEx(
	OUT PHANDLE KeyHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN ULONG OpenOptions,
	IN HANDLE TransactionHandle);

EXTERN_C NTSTATUS NtOpenKeyedEvent(
	OUT PHANDLE KeyedEventHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenMutant(
	OUT PHANDLE MutantHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenObjectAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN PUNICODE_STRING ObjectTypeName,
	IN PUNICODE_STRING ObjectName,
	IN PSECURITY_DESCRIPTOR SecurityDescriptor OPTIONAL,
	IN HANDLE ClientToken,
	IN ACCESS_MASK DesiredAccess,
	IN ACCESS_MASK GrantedAccess,
	IN PPRIVILEGE_SET Privileges OPTIONAL,
	IN BOOLEAN ObjectCreation,
	IN BOOLEAN AccessGranted,
	OUT PBOOLEAN GenerateOnClose);

EXTERN_C NTSTATUS NtOpenPartition(
	OUT PHANDLE PartitionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenPrivateNamespace(
	OUT PHANDLE NamespaceHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PVOID BoundaryDescriptor);

EXTERN_C NTSTATUS NtOpenProcessToken(
	IN HANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	OUT PHANDLE TokenHandle);

EXTERN_C NTSTATUS NtOpenRegistryTransaction(
	OUT PHANDLE RegistryHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenResourceManager(
	OUT PHANDLE ResourceManagerHandle,
	IN ACCESS_MASK DesiredAccess,
	IN HANDLE TmHandle,
	IN LPGUID ResourceManagerGuid OPTIONAL,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL);

EXTERN_C NTSTATUS NtOpenSemaphore(
	OUT PHANDLE SemaphoreHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenSession(
	OUT PHANDLE SessionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenSymbolicLinkObject(
	OUT PHANDLE LinkHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenThread(
	OUT PHANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN PCLIENT_ID ClientId OPTIONAL);

EXTERN_C NTSTATUS NtOpenTimer(
	OUT PHANDLE TimerHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes);

EXTERN_C NTSTATUS NtOpenTransaction(
	OUT PHANDLE TransactionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	IN LPGUID Uow,
	IN HANDLE TmHandle OPTIONAL);

EXTERN_C NTSTATUS NtOpenTransactionManager(
	OUT PHANDLE TmHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PUNICODE_STRING LogFileName OPTIONAL,
	IN LPGUID TmIdentity OPTIONAL,
	IN ULONG OpenOptions OPTIONAL);

EXTERN_C NTSTATUS NtPlugPlayControl(
	IN PLUGPLAY_CONTROL_CLASS PnPControlClass,
	IN OUT PVOID PnPControlData,
	IN ULONG PnPControlDataLength);

EXTERN_C NTSTATUS NtPrePrepareComplete(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtPrePrepareEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtPrepareComplete(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtPrepareEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtPrivilegeCheck(
	IN HANDLE ClientToken,
	IN OUT PPRIVILEGE_SET RequiredPrivileges,
	OUT PBOOLEAN Result);

EXTERN_C NTSTATUS NtPrivilegeObjectAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PVOID HandleId OPTIONAL,
	IN HANDLE ClientToken,
	IN ACCESS_MASK DesiredAccess,
	IN PPRIVILEGE_SET Privileges,
	IN BOOLEAN AccessGranted);

EXTERN_C NTSTATUS NtPrivilegedServiceAuditAlarm(
	IN PUNICODE_STRING SubsystemName,
	IN PUNICODE_STRING ServiceName,
	IN HANDLE ClientToken,
	IN PPRIVILEGE_SET Privileges,
	IN BOOLEAN AccessGranted);

EXTERN_C NTSTATUS NtPropagationComplete(
	IN HANDLE ResourceManagerHandle,
	IN ULONG RequestCookie,
	IN ULONG BufferLength,
	IN PVOID Buffer);

EXTERN_C NTSTATUS NtPropagationFailed(
	IN HANDLE ResourceManagerHandle,
	IN ULONG RequestCookie,
	IN NTSTATUS PropStatus);

EXTERN_C NTSTATUS NtPulseEvent(
	IN HANDLE EventHandle,
	OUT PULONG PreviousState OPTIONAL);

EXTERN_C NTSTATUS NtQueryAuxiliaryCounterFrequency(
	OUT PULONGLONG lpAuxiliaryCounterFrequency);

EXTERN_C NTSTATUS NtQueryBootEntryOrder(
	OUT PULONG Ids OPTIONAL,
	IN OUT PULONG Count);

EXTERN_C NTSTATUS NtQueryBootOptions(
	OUT PBOOT_OPTIONS BootOptions OPTIONAL,
	IN OUT PULONG BootOptionsLength);

EXTERN_C NTSTATUS NtQueryDebugFilterState(
	IN ULONG ComponentId,
	IN ULONG Level);

EXTERN_C NTSTATUS NtQueryDirectoryFileEx(
	IN HANDLE FileHandle,
	IN HANDLE Event OPTIONAL,
	IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID FileInformation,
	IN ULONG Length,
	IN FILE_INFORMATION_CLASS FileInformationClass,
	IN ULONG QueryFlags,
	IN PUNICODE_STRING FileName OPTIONAL);

EXTERN_C NTSTATUS NtQueryDirectoryObject(
	IN HANDLE DirectoryHandle,
	OUT PVOID Buffer OPTIONAL,
	IN ULONG Length,
	IN BOOLEAN ReturnSingleEntry,
	IN BOOLEAN RestartScan,
	IN OUT PULONG Context,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryDriverEntryOrder(
	IN PULONG Ids OPTIONAL,
	IN OUT PULONG Count);

EXTERN_C NTSTATUS NtQueryEaFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PFILE_FULL_EA_INFORMATION Buffer,
	IN ULONG Length,
	IN BOOLEAN ReturnSingleEntry,
	IN PFILE_GET_EA_INFORMATION EaList OPTIONAL,
	IN ULONG EaListLength,
	IN PULONG EaIndex OPTIONAL,
	IN BOOLEAN RestartScan);

EXTERN_C NTSTATUS NtQueryFullAttributesFile(
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PFILE_NETWORK_OPEN_INFORMATION FileInformation);

EXTERN_C NTSTATUS NtQueryInformationAtom(
	IN USHORT Atom,
	IN ATOM_INFORMATION_CLASS AtomInformationClass,
	OUT PVOID AtomInformation,
	IN ULONG AtomInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationByName(
	IN POBJECT_ATTRIBUTES ObjectAttributes,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PVOID FileInformation,
	IN ULONG Length,
	IN FILE_INFORMATION_CLASS FileInformationClass);

EXTERN_C NTSTATUS NtQueryInformationEnlistment(
	IN HANDLE EnlistmentHandle,
	IN ENLISTMENT_INFORMATION_CLASS EnlistmentInformationClass,
	OUT PVOID EnlistmentInformation,
	IN ULONG EnlistmentInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationJobObject(
	IN HANDLE JobHandle,
	IN JOBOBJECTINFOCLASS JobObjectInformationClass,
	OUT PVOID JobObjectInformation,
	IN ULONG JobObjectInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationPort(
	IN HANDLE PortHandle,
	IN PORT_INFORMATION_CLASS PortInformationClass,
	OUT PVOID PortInformation,
	IN ULONG Length,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationResourceManager(
	IN HANDLE ResourceManagerHandle,
	IN RESOURCEMANAGER_INFORMATION_CLASS ResourceManagerInformationClass,
	OUT PVOID ResourceManagerInformation,
	IN ULONG ResourceManagerInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationTransaction(
	IN HANDLE TransactionHandle,
	IN TRANSACTION_INFORMATION_CLASS TransactionInformationClass,
	OUT PVOID TransactionInformation,
	IN ULONG TransactionInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationTransactionManager(
	IN HANDLE TransactionManagerHandle,
	IN TRANSACTIONMANAGER_INFORMATION_CLASS TransactionManagerInformationClass,
	OUT PVOID TransactionManagerInformation,
	IN ULONG TransactionManagerInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInformationWorkerFactory(
	IN HANDLE WorkerFactoryHandle,
	IN WORKERFACTORYINFOCLASS WorkerFactoryInformationClass,
	OUT PVOID WorkerFactoryInformation,
	IN ULONG WorkerFactoryInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryInstallUILanguage(
	OUT PLANGID InstallUILanguageId);

EXTERN_C NTSTATUS NtQueryIntervalProfile(
	IN KPROFILE_SOURCE ProfileSource,
	OUT PULONG Interval);

EXTERN_C NTSTATUS NtQueryIoCompletion(
	IN HANDLE IoCompletionHandle,
	IN IO_COMPLETION_INFORMATION_CLASS IoCompletionInformationClass,
	OUT PVOID IoCompletionInformation,
	IN ULONG IoCompletionInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryLicenseValue(
	IN PUNICODE_STRING ValueName,
	OUT PULONG Type OPTIONAL,
	OUT PVOID SystemData OPTIONAL,
	IN ULONG DataSize,
	OUT PULONG ResultDataSize);

EXTERN_C NTSTATUS NtQueryMultipleValueKey(
	IN HANDLE KeyHandle,
	IN OUT PKEY_VALUE_ENTRY ValueEntries,
	IN ULONG EntryCount,
	OUT PVOID ValueBuffer,
	IN PULONG BufferLength,
	OUT PULONG RequiredBufferLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryMutant(
	IN HANDLE MutantHandle,
	IN MUTANT_INFORMATION_CLASS MutantInformationClass,
	OUT PVOID MutantInformation,
	IN ULONG MutantInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryOpenSubKeys(
	IN POBJECT_ATTRIBUTES TargetKey,
	OUT PULONG HandleCount);

EXTERN_C NTSTATUS NtQueryOpenSubKeysEx(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN ULONG BufferLength,
	OUT PVOID Buffer,
	OUT PULONG RequiredSize);

EXTERN_C NTSTATUS NtQueryPortInformationProcess();

EXTERN_C NTSTATUS NtQueryQuotaInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	OUT PFILE_USER_QUOTA_INFORMATION Buffer,
	IN ULONG Length,
	IN BOOLEAN ReturnSingleEntry,
	IN PFILE_QUOTA_LIST_INFORMATION SidList OPTIONAL,
	IN ULONG SidListLength,
	IN PSID StartSid OPTIONAL,
	IN BOOLEAN RestartScan);

EXTERN_C NTSTATUS NtQuerySecurityAttributesToken(
	IN HANDLE TokenHandle,
	IN PUNICODE_STRING Attributes OPTIONAL,
	IN ULONG NumberOfAttributes,
	OUT PVOID Buffer,
	IN ULONG Length,
	OUT PULONG ReturnLength);

EXTERN_C NTSTATUS NtQuerySecurityObject(
	IN HANDLE Handle,
	IN SECURITY_INFORMATION SecurityInformation,
	OUT PSECURITY_DESCRIPTOR SecurityDescriptor OPTIONAL,
	IN ULONG Length,
	OUT PULONG LengthNeeded);

EXTERN_C NTSTATUS NtQuerySecurityPolicy(
	IN ULONG_PTR UnknownParameter1,
	IN ULONG_PTR UnknownParameter2,
	IN ULONG_PTR UnknownParameter3,
	IN ULONG_PTR UnknownParameter4,
	IN ULONG_PTR UnknownParameter5,
	IN ULONG_PTR UnknownParameter6);

EXTERN_C NTSTATUS NtQuerySemaphore(
	IN HANDLE SemaphoreHandle,
	IN SEMAPHORE_INFORMATION_CLASS SemaphoreInformationClass,
	OUT PVOID SemaphoreInformation,
	IN ULONG SemaphoreInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQuerySymbolicLinkObject(
	IN HANDLE LinkHandle,
	IN OUT PUNICODE_STRING LinkTarget,
	OUT PULONG ReturnedLength OPTIONAL);

EXTERN_C NTSTATUS NtQuerySystemEnvironmentValue(
	IN PUNICODE_STRING VariableName,
	OUT PVOID VariableValue,
	IN ULONG ValueLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQuerySystemEnvironmentValueEx(
	IN PUNICODE_STRING VariableName,
	IN LPGUID VendorGuid,
	OUT PVOID Value OPTIONAL,
	IN OUT PULONG ValueLength,
	OUT PULONG Attributes OPTIONAL);

EXTERN_C NTSTATUS NtQuerySystemInformationEx(
	IN SYSTEM_INFORMATION_CLASS SystemInformationClass,
	IN PVOID InputBuffer,
	IN ULONG InputBufferLength,
	OUT PVOID SystemInformation OPTIONAL,
	IN ULONG SystemInformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtQueryTimerResolution(
	OUT PULONG MaximumTime,
	OUT PULONG MinimumTime,
	OUT PULONG CurrentTime);

EXTERN_C NTSTATUS NtQueryWnfStateData(
	IN PCWNF_STATE_NAME StateName,
	IN PCWNF_TYPE_ID TypeId OPTIONAL,
	IN PVOID ExplicitScope OPTIONAL,
	OUT PWNF_CHANGE_STAMP ChangeStamp,
	OUT PVOID Buffer OPTIONAL,
	IN OUT PULONG BufferSize);

EXTERN_C NTSTATUS NtQueryWnfStateNameInformation(
	IN PCWNF_STATE_NAME StateName,
	IN PCWNF_TYPE_ID NameInfoClass,
	IN PVOID ExplicitScope OPTIONAL,
	OUT PVOID InfoBuffer,
	IN ULONG InfoBufferSize);

EXTERN_C NTSTATUS NtQueueApcThreadEx(
	IN HANDLE ThreadHandle,
	IN HANDLE UserApcReserveHandle OPTIONAL,
	IN PKNORMAL_ROUTINE ApcRoutine,
	IN PVOID ApcArgument1 OPTIONAL,
	IN PVOID ApcArgument2 OPTIONAL,
	IN PVOID ApcArgument3 OPTIONAL);

EXTERN_C NTSTATUS NtRaiseException(
	IN PEXCEPTION_RECORD ExceptionRecord,
	IN PCONTEXT ContextRecord,
	IN BOOLEAN FirstChance);

EXTERN_C NTSTATUS NtRaiseHardError(
	IN NTSTATUS ErrorStatus,
	IN ULONG NumberOfParameters,
	IN ULONG UnicodeStringParameterMask,
	IN PULONG_PTR Parameters,
	IN ULONG ValidResponseOptions,
	OUT PULONG Response);

EXTERN_C NTSTATUS NtReadOnlyEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtRecoverEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PVOID EnlistmentKey OPTIONAL);

EXTERN_C NTSTATUS NtRecoverResourceManager(
	IN HANDLE ResourceManagerHandle);

EXTERN_C NTSTATUS NtRecoverTransactionManager(
	IN HANDLE TransactionManagerHandle);

EXTERN_C NTSTATUS NtRegisterProtocolAddressInformation(
	IN HANDLE ResourceManager,
	IN LPGUID ProtocolId,
	IN ULONG ProtocolInformationSize,
	IN PVOID ProtocolInformation,
	IN ULONG CreateOptions OPTIONAL);

EXTERN_C NTSTATUS NtRegisterThreadTerminatePort(
	IN HANDLE PortHandle);

EXTERN_C NTSTATUS NtReleaseKeyedEvent(
	IN HANDLE KeyedEventHandle,
	IN PVOID KeyValue,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtReleaseWorkerFactoryWorker(
	IN HANDLE WorkerFactoryHandle);

EXTERN_C NTSTATUS NtRemoveIoCompletionEx(
	IN HANDLE IoCompletionHandle,
	OUT PFILE_IO_COMPLETION_INFORMATION IoCompletionInformation,
	IN ULONG Count,
	OUT PULONG NumEntriesRemoved,
	IN PLARGE_INTEGER Timeout OPTIONAL,
	IN BOOLEAN Alertable);

EXTERN_C NTSTATUS NtRemoveProcessDebug(
	IN HANDLE ProcessHandle,
	IN HANDLE DebugObjectHandle);

EXTERN_C NTSTATUS NtRenameKey(
	IN HANDLE KeyHandle,
	IN PUNICODE_STRING NewName);

EXTERN_C NTSTATUS NtRenameTransactionManager(
	IN PUNICODE_STRING LogFileName,
	IN LPGUID ExistingTransactionManagerGuid);

EXTERN_C NTSTATUS NtReplaceKey(
	IN POBJECT_ATTRIBUTES NewFile,
	IN HANDLE TargetHandle,
	IN POBJECT_ATTRIBUTES OldFile);

EXTERN_C NTSTATUS NtReplacePartitionUnit(
	IN PUNICODE_STRING TargetInstancePath,
	IN PUNICODE_STRING SpareInstancePath,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtReplyWaitReplyPort(
	IN HANDLE PortHandle,
	IN OUT PPORT_MESSAGE ReplyMessage);

EXTERN_C NTSTATUS NtRequestPort(
	IN HANDLE PortHandle,
	IN PPORT_MESSAGE RequestMessage);

EXTERN_C NTSTATUS NtResetEvent(
	IN HANDLE EventHandle,
	OUT PULONG PreviousState OPTIONAL);

EXTERN_C NTSTATUS NtResetWriteWatch(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN ULONG RegionSize);

EXTERN_C NTSTATUS NtRestoreKey(
	IN HANDLE KeyHandle,
	IN HANDLE FileHandle,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtResumeProcess(
	IN HANDLE ProcessHandle);

EXTERN_C NTSTATUS NtRevertContainerImpersonation();

EXTERN_C NTSTATUS NtRollbackComplete(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtRollbackEnlistment(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtRollbackRegistryTransaction(
	IN HANDLE RegistryHandle,
	IN BOOL Wait);

EXTERN_C NTSTATUS NtRollbackTransaction(
	IN HANDLE TransactionHandle,
	IN BOOLEAN Wait);

EXTERN_C NTSTATUS NtRollforwardTransactionManager(
	IN HANDLE TransactionManagerHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtSaveKey(
	IN HANDLE KeyHandle,
	IN HANDLE FileHandle);

EXTERN_C NTSTATUS NtSaveKeyEx(
	IN HANDLE KeyHandle,
	IN HANDLE FileHandle,
	IN ULONG Format);

EXTERN_C NTSTATUS NtSaveMergedKeys(
	IN HANDLE HighPrecedenceKeyHandle,
	IN HANDLE LowPrecedenceKeyHandle,
	IN HANDLE FileHandle);

EXTERN_C NTSTATUS NtSecureConnectPort(
	OUT PHANDLE PortHandle,
	IN PUNICODE_STRING PortName,
	IN PSECURITY_QUALITY_OF_SERVICE SecurityQos,
	IN OUT PPORT_SECTION_WRITE ClientView OPTIONAL,
	IN PSID RequiredServerSid OPTIONAL,
	IN OUT PPORT_SECTION_READ ServerView OPTIONAL,
	OUT PULONG MaxMessageLength OPTIONAL,
	IN OUT PVOID ConnectionInformation OPTIONAL,
	IN OUT PULONG ConnectionInformationLength OPTIONAL);

EXTERN_C NTSTATUS NtSerializeBoot();

EXTERN_C NTSTATUS NtSetBootEntryOrder(
	IN PULONG Ids,
	IN ULONG Count);

EXTERN_C NTSTATUS NtSetBootOptions(
	IN PBOOT_OPTIONS BootOptions,
	IN ULONG FieldsToChange);

EXTERN_C NTSTATUS NtSetCachedSigningLevel(
	IN ULONG Flags,
	IN SE_SIGNING_LEVEL InputSigningLevel,
	IN PHANDLE SourceFiles,
	IN ULONG SourceFileCount,
	IN HANDLE TargetFile OPTIONAL);

EXTERN_C NTSTATUS NtSetCachedSigningLevel2(
	IN ULONG Flags,
	IN ULONG InputSigningLevel,
	IN PHANDLE SourceFiles,
	IN ULONG SourceFileCount,
	IN HANDLE TargetFile OPTIONAL,
	IN PVOID LevelInformation OPTIONAL);

EXTERN_C NTSTATUS NtSetContextThread(
	IN HANDLE ThreadHandle,
	IN PCONTEXT Context);

EXTERN_C NTSTATUS NtSetDebugFilterState(
	IN ULONG ComponentId,
	IN ULONG Level,
	IN BOOLEAN State);

EXTERN_C NTSTATUS NtSetDefaultHardErrorPort(
	IN HANDLE PortHandle);

EXTERN_C NTSTATUS NtSetDefaultLocale(
	IN BOOLEAN UserProfile,
	IN LCID DefaultLocaleId);

EXTERN_C NTSTATUS NtSetDefaultUILanguage(
	IN LANGID DefaultUILanguageId);

EXTERN_C NTSTATUS NtSetDriverEntryOrder(
	IN PULONG Ids,
	IN PULONG Count);

EXTERN_C NTSTATUS NtSetEaFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PFILE_FULL_EA_INFORMATION EaBuffer,
	IN ULONG EaBufferSize);

EXTERN_C NTSTATUS NtSetHighEventPair(
	IN HANDLE EventPairHandle);

EXTERN_C NTSTATUS NtSetHighWaitLowEventPair(
	IN HANDLE EventPairHandle);

EXTERN_C NTSTATUS NtSetIRTimer(
	IN HANDLE TimerHandle,
	IN PLARGE_INTEGER DueTime OPTIONAL);

EXTERN_C NTSTATUS NtSetInformationDebugObject(
	IN HANDLE DebugObject,
	IN DEBUGOBJECTINFOCLASS InformationClass,
	IN PVOID Information,
	IN ULONG InformationLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtSetInformationEnlistment(
	IN HANDLE EnlistmentHandle,
	IN ENLISTMENT_INFORMATION_CLASS EnlistmentInformationClass,
	IN PVOID EnlistmentInformation,
	IN ULONG EnlistmentInformationLength);

EXTERN_C NTSTATUS NtSetInformationJobObject(
	IN HANDLE JobHandle,
	IN JOBOBJECTINFOCLASS JobObjectInformationClass,
	IN PVOID JobObjectInformation,
	IN ULONG JobObjectInformationLength);

EXTERN_C NTSTATUS NtSetInformationKey(
	IN HANDLE KeyHandle,
	IN KEY_SET_INFORMATION_CLASS KeySetInformationClass,
	IN PVOID KeySetInformation,
	IN ULONG KeySetInformationLength);

EXTERN_C NTSTATUS NtSetInformationResourceManager(
	IN HANDLE ResourceManagerHandle,
	IN RESOURCEMANAGER_INFORMATION_CLASS ResourceManagerInformationClass,
	IN PVOID ResourceManagerInformation,
	IN ULONG ResourceManagerInformationLength);

EXTERN_C NTSTATUS NtSetInformationSymbolicLink(
	IN HANDLE Handle,
	IN ULONG Class,
	IN PVOID Buffer,
	IN ULONG BufferLength);

EXTERN_C NTSTATUS NtSetInformationToken(
	IN HANDLE TokenHandle,
	IN TOKEN_INFORMATION_CLASS TokenInformationClass,
	IN PVOID TokenInformation,
	IN ULONG TokenInformationLength);

EXTERN_C NTSTATUS NtSetInformationTransaction(
	IN HANDLE TransactionHandle,
	IN TRANSACTIONMANAGER_INFORMATION_CLASS TransactionInformationClass,
	IN PVOID TransactionInformation,
	IN ULONG TransactionInformationLength);

EXTERN_C NTSTATUS NtSetInformationTransactionManager(
	IN HANDLE TransactionHandle,
	IN TRANSACTION_INFORMATION_CLASS TransactionInformationClass,
	IN PVOID TransactionInformation,
	IN ULONG TransactionInformationLength);

EXTERN_C NTSTATUS NtSetInformationVirtualMemory(
	IN HANDLE ProcessHandle,
	IN VIRTUAL_MEMORY_INFORMATION_CLASS VmInformationClass,
	IN ULONG_PTR NumberOfEntries,
	IN PMEMORY_RANGE_ENTRY VirtualAddresses,
	IN PVOID VmInformation,
	IN ULONG VmInformationLength);

EXTERN_C NTSTATUS NtSetInformationWorkerFactory(
	IN HANDLE WorkerFactoryHandle,
	IN WORKERFACTORYINFOCLASS WorkerFactoryInformationClass,
	IN PVOID WorkerFactoryInformation,
	IN ULONG WorkerFactoryInformationLength);

EXTERN_C NTSTATUS NtSetIntervalProfile(
	IN ULONG Interval,
	IN KPROFILE_SOURCE Source);

EXTERN_C NTSTATUS NtSetIoCompletion(
	IN HANDLE IoCompletionHandle,
	IN ULONG CompletionKey,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN NTSTATUS CompletionStatus,
	IN ULONG NumberOfBytesTransfered);

EXTERN_C NTSTATUS NtSetIoCompletionEx(
	IN HANDLE IoCompletionHandle,
	IN HANDLE IoCompletionPacketHandle,
	IN PVOID KeyContext OPTIONAL,
	IN PVOID ApcContext OPTIONAL,
	IN NTSTATUS IoStatus,
	IN ULONG_PTR IoStatusInformation);

EXTERN_C NTSTATUS NtSetLdtEntries(
	IN ULONG Selector0,
	IN ULONG Entry0Low,
	IN ULONG Entry0Hi,
	IN ULONG Selector1,
	IN ULONG Entry1Low,
	IN ULONG Entry1Hi);

EXTERN_C NTSTATUS NtSetLowEventPair(
	IN HANDLE EventPairHandle);

EXTERN_C NTSTATUS NtSetLowWaitHighEventPair(
	IN HANDLE EventPairHandle);

EXTERN_C NTSTATUS NtSetQuotaInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PFILE_USER_QUOTA_INFORMATION Buffer,
	IN ULONG Length);

EXTERN_C NTSTATUS NtSetSecurityObject(
	IN HANDLE ObjectHandle,
	IN SECURITY_INFORMATION SecurityInformationClass,
	IN PSECURITY_DESCRIPTOR DescriptorBuffer);

EXTERN_C NTSTATUS NtSetSystemEnvironmentValue(
	IN PUNICODE_STRING VariableName,
	IN PUNICODE_STRING Value);

EXTERN_C NTSTATUS NtSetSystemEnvironmentValueEx(
	IN PUNICODE_STRING VariableName,
	IN LPGUID VendorGuid,
	IN PVOID Value OPTIONAL,
	IN ULONG ValueLength,
	IN ULONG Attributes);

EXTERN_C NTSTATUS NtSetSystemInformation(
	IN SYSTEM_INFORMATION_CLASS SystemInformationClass,
	IN PVOID SystemInformation,
	IN ULONG SystemInformationLength);

EXTERN_C NTSTATUS NtSetSystemPowerState(
	IN POWER_ACTION SystemAction,
	IN SYSTEM_POWER_STATE MinSystemState,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtSetSystemTime(
	IN PLARGE_INTEGER SystemTime,
	OUT PLARGE_INTEGER PreviousTime OPTIONAL);

EXTERN_C NTSTATUS NtSetThreadExecutionState(
	IN EXECUTION_STATE ExecutionState,
	OUT PEXECUTION_STATE PreviousExecutionState);

EXTERN_C NTSTATUS NtSetTimer2(
	IN HANDLE TimerHandle,
	IN PLARGE_INTEGER DueTime,
	IN PLARGE_INTEGER Period OPTIONAL,
	IN PT2_SET_PARAMETERS Parameters);

EXTERN_C NTSTATUS NtSetTimerEx(
	IN HANDLE TimerHandle,
	IN TIMER_SET_INFORMATION_CLASS TimerSetInformationClass,
	IN OUT PVOID TimerSetInformation OPTIONAL,
	IN ULONG TimerSetInformationLength);

EXTERN_C NTSTATUS NtSetTimerResolution(
	IN ULONG DesiredResolution,
	IN BOOLEAN SetResolution,
	OUT PULONG CurrentResolution);

EXTERN_C NTSTATUS NtSetUuidSeed(
	IN PUCHAR Seed);

EXTERN_C NTSTATUS NtSetVolumeInformationFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PVOID FileSystemInformation,
	IN ULONG Length,
	IN FSINFOCLASS FileSystemInformationClass);

EXTERN_C NTSTATUS NtSetWnfProcessNotificationEvent(
	IN HANDLE NotificationEvent);

EXTERN_C NTSTATUS NtShutdownSystem(
	IN SHUTDOWN_ACTION Action);

EXTERN_C NTSTATUS NtShutdownWorkerFactory(
	IN HANDLE WorkerFactoryHandle,
	IN OUT PLONG PendingWorkerCount);

EXTERN_C NTSTATUS NtSignalAndWaitForSingleObject(
	IN HANDLE hObjectToSignal,
	IN HANDLE hObjectToWaitOn,
	IN BOOLEAN bAlertable,
	IN PLARGE_INTEGER dwMilliseconds OPTIONAL);

EXTERN_C NTSTATUS NtSinglePhaseReject(
	IN HANDLE EnlistmentHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtStartProfile(
	IN HANDLE ProfileHandle);

EXTERN_C NTSTATUS NtStopProfile(
	IN HANDLE ProfileHandle);

EXTERN_C NTSTATUS NtSubscribeWnfStateChange(
	IN PCWNF_STATE_NAME StateName,
	IN WNF_CHANGE_STAMP ChangeStamp OPTIONAL,
	IN ULONG EventMask,
	OUT PLARGE_INTEGER SubscriptionId OPTIONAL);

EXTERN_C NTSTATUS NtSuspendProcess(
	IN HANDLE ProcessHandle);

EXTERN_C NTSTATUS NtSuspendThread(
	IN HANDLE ThreadHandle,
	OUT PULONG PreviousSuspendCount);

EXTERN_C NTSTATUS NtSystemDebugControl(
	IN DEBUG_CONTROL_CODE Command,
	IN PVOID InputBuffer OPTIONAL,
	IN ULONG InputBufferLength,
	OUT PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputBufferLength,
	OUT PULONG ReturnLength OPTIONAL);

EXTERN_C NTSTATUS NtTerminateEnclave(
	IN PVOID BaseAddress,
	IN BOOLEAN WaitForThread);

EXTERN_C NTSTATUS NtTerminateJobObject(
	IN HANDLE JobHandle,
	IN NTSTATUS ExitStatus);

EXTERN_C NTSTATUS NtTestAlert();

EXTERN_C NTSTATUS NtThawRegistry();

EXTERN_C NTSTATUS NtThawTransactions();

EXTERN_C NTSTATUS NtTraceControl(
	IN ULONG FunctionCode,
	IN PVOID InputBuffer OPTIONAL,
	IN ULONG InputBufferLength,
	OUT PVOID OutputBuffer OPTIONAL,
	IN ULONG OutputBufferLength,
	OUT PULONG ReturnLength);

EXTERN_C NTSTATUS NtTranslateFilePath(
	IN PFILE_PATH InputFilePath,
	IN ULONG OutputType,
	OUT PFILE_PATH OutputFilePath OPTIONAL,
	IN OUT PULONG OutputFilePathLength OPTIONAL);

EXTERN_C NTSTATUS NtUmsThreadYield(
	IN PVOID SchedulerParam);

EXTERN_C NTSTATUS NtUnloadDriver(
	IN PUNICODE_STRING DriverServiceName);

EXTERN_C NTSTATUS NtUnloadKey(
	IN POBJECT_ATTRIBUTES DestinationKeyName);

EXTERN_C NTSTATUS NtUnloadKey2(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtUnloadKeyEx(
	IN POBJECT_ATTRIBUTES TargetKey,
	IN HANDLE Event OPTIONAL);

EXTERN_C NTSTATUS NtUnlockFile(
	IN HANDLE FileHandle,
	OUT PIO_STATUS_BLOCK IoStatusBlock,
	IN PULARGE_INTEGER ByteOffset,
	IN PULARGE_INTEGER Length,
	IN ULONG Key);

EXTERN_C NTSTATUS NtUnlockVirtualMemory(
	IN HANDLE ProcessHandle,
	IN PVOID * BaseAddress,
	IN PSIZE_T NumberOfBytesToUnlock,
	IN ULONG LockType);

EXTERN_C NTSTATUS NtUnmapViewOfSectionEx(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress OPTIONAL,
	IN ULONG Flags);

EXTERN_C NTSTATUS NtUnsubscribeWnfStateChange(
	IN PCWNF_STATE_NAME StateName);

EXTERN_C NTSTATUS NtUpdateWnfStateData(
	IN PCWNF_STATE_NAME StateName,
	IN PVOID Buffer OPTIONAL,
	IN ULONG Length OPTIONAL,
	IN PCWNF_TYPE_ID TypeId OPTIONAL,
	IN PVOID ExplicitScope OPTIONAL,
	IN WNF_CHANGE_STAMP MatchingChangeStamp,
	IN ULONG CheckStamp);

EXTERN_C NTSTATUS NtVdmControl(
	IN VDMSERVICECLASS Service,
	IN OUT PVOID ServiceData);

EXTERN_C NTSTATUS NtWaitForAlertByThreadId(
	IN HANDLE Handle,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtWaitForDebugEvent(
	IN HANDLE DebugObjectHandle,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER Timeout OPTIONAL,
	OUT PVOID WaitStateChange);

EXTERN_C NTSTATUS NtWaitForKeyedEvent(
	IN HANDLE KeyedEventHandle,
	IN PVOID Key,
	IN BOOLEAN Alertable,
	IN PLARGE_INTEGER Timeout OPTIONAL);

EXTERN_C NTSTATUS NtWaitForWorkViaWorkerFactory(
	IN HANDLE WorkerFactoryHandle,
	OUT PVOID MiniPacket);

EXTERN_C NTSTATUS NtWaitHighEventPair(
	IN HANDLE EventHandle);

EXTERN_C NTSTATUS NtWaitLowEventPair(
	IN HANDLE EventHandle);

EXTERN_C NTSTATUS NtAcquireCMFViewOwnership(
	OUT BOOLEAN TimeStamp,
	OUT BOOLEAN TokenTaken,
	IN BOOLEAN ReplaceExisting);

EXTERN_C NTSTATUS NtCancelDeviceWakeupRequest(
	IN HANDLE DeviceHandle);

EXTERN_C NTSTATUS NtClearAllSavepointsTransaction(
	IN HANDLE TransactionHandle);

EXTERN_C NTSTATUS NtClearSavepointTransaction(
	IN HANDLE TransactionHandle,
	IN ULONG SavePointId);

EXTERN_C NTSTATUS NtRollbackSavepointTransaction(
	IN HANDLE TransactionHandle,
	IN ULONG SavePointId);

EXTERN_C NTSTATUS NtSavepointTransaction(
	IN HANDLE TransactionHandle,
	IN BOOLEAN Flag,
	OUT ULONG SavePointId);

EXTERN_C NTSTATUS NtSavepointComplete(
	IN HANDLE TransactionHandle,
	IN PLARGE_INTEGER TmVirtualClock OPTIONAL);

EXTERN_C NTSTATUS NtCreateSectionEx(
	OUT PHANDLE SectionHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN PLARGE_INTEGER MaximumSize OPTIONAL,
	IN ULONG SectionPageProtection,
	IN ULONG AllocationAttributes,
	IN HANDLE FileHandle OPTIONAL,
	IN PMEM_EXTENDED_PARAMETER ExtendedParameters,
	IN ULONG ExtendedParametersCount);

EXTERN_C NTSTATUS NtCreateCrossVmEvent();

EXTERN_C NTSTATUS NtGetPlugPlayEvent(
	IN HANDLE EventHandle,
	IN PVOID Context OPTIONAL,
	OUT PPLUGPLAY_EVENT_BLOCK EventBlock,
	IN ULONG EventBufferSize);

EXTERN_C NTSTATUS NtListTransactions();

EXTERN_C NTSTATUS NtMarshallTransaction();

EXTERN_C NTSTATUS NtPullTransaction();

EXTERN_C NTSTATUS NtReleaseCMFViewOwnership();

EXTERN_C NTSTATUS NtWaitForWnfNotifications();

EXTERN_C NTSTATUS NtStartTm();

EXTERN_C NTSTATUS NtSetInformationProcess(
	IN HANDLE DeviceHandle,
	IN PROCESSINFOCLASS ProcessInformationClass,
	IN PVOID ProcessInformation,
	IN ULONG Length);

EXTERN_C NTSTATUS NtRequestDeviceWakeup(
	IN HANDLE DeviceHandle);

EXTERN_C NTSTATUS NtRequestWakeupLatency(
	IN ULONG LatencyTime);

EXTERN_C NTSTATUS NtQuerySystemTime(
	OUT PLARGE_INTEGER SystemTime);

EXTERN_C NTSTATUS NtManageHotPatch(
	IN ULONG UnknownParameter1,
	IN ULONG UnknownParameter2,
	IN ULONG UnknownParameter3,
	IN ULONG UnknownParameter4);

EXTERN_C NTSTATUS NtContinueEx(
	IN PCONTEXT ContextRecord,
	IN PKCONTINUE_ARGUMENT ContinueArgument);

#endif



#include <time.h>
#include <stdint.h>

// Code below is adapted from @modexpblog. Read linked article for more details.
// https://www.mdsec.co.uk/2020/12/bypassing-user-mode-hooks-and-direct-invocation-of-system-calls-for-red-teams

SW2_SYSCALL_LIST SW2_SyscallList = { 0, 1 };

#ifdef RANDSYSCALL
#ifndef _WIN64
uint32_t ntdllBase = 0;
#else
uint64_t ntdllBase = 0;
#endif
#endif

DWORD SW2_HashSyscall(PCSTR FunctionName)
{
    DWORD i = 0;
    DWORD Hash = SW2_SEED;

    while (FunctionName[i])
    {
        WORD PartialName = *(WORD*)((ULONG64)FunctionName + i++);
        Hash ^= PartialName + SW2_ROR8(Hash);
    }

    return Hash;
}

BOOL SW2_PopulateSyscallList(void)
{
    // Return early if the list is already populated.
    if (SW2_SyscallList.Count) return TRUE;

#if defined(_WIN64)
    PSW2_PEB Peb = (PSW2_PEB)__readgsqword(0x60);
#else
    PSW2_PEB Peb = (PSW2_PEB)__readfsdword(0x30);
#endif
    PSW2_PEB_LDR_DATA Ldr = Peb->Ldr;
    PIMAGE_EXPORT_DIRECTORY ExportDirectory = NULL;
    PVOID DllBase = NULL;

    // Get the DllBase address of NTDLL.dll. NTDLL is not guaranteed to be the second
    // in the list, so it's safer to loop through the full list and find it.
    PSW2_LDR_DATA_TABLE_ENTRY LdrEntry;
    for (LdrEntry = (PSW2_LDR_DATA_TABLE_ENTRY)Ldr->Reserved2[1]; LdrEntry->DllBase != NULL; LdrEntry = (PSW2_LDR_DATA_TABLE_ENTRY)LdrEntry->Reserved1[0])
    {
        DllBase = LdrEntry->DllBase;
        PIMAGE_DOS_HEADER DosHeader = (PIMAGE_DOS_HEADER)DllBase;
        PIMAGE_NT_HEADERS NtHeaders = SW2_RVA2VA(PIMAGE_NT_HEADERS, DllBase, DosHeader->e_lfanew);
        PIMAGE_DATA_DIRECTORY DataDirectory = (PIMAGE_DATA_DIRECTORY)NtHeaders->OptionalHeader.DataDirectory;
        DWORD VirtualAddress = DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
        if (VirtualAddress == 0) continue;

        ExportDirectory = (PIMAGE_EXPORT_DIRECTORY)SW2_RVA2VA(ULONG_PTR, DllBase, VirtualAddress);

        // If this is NTDLL.dll, exit loop.
        PCHAR DllName = SW2_RVA2VA(PCHAR, DllBase, ExportDirectory->Name);

        if ((*(ULONG*)DllName | 0x20202020) != 'ldtn') continue;
        if ((*(ULONG*)(DllName + 4) | 0x20202020) == 'ld.l') break;
    }

    if (!ExportDirectory) return FALSE;
    
#ifdef RANDSYSCALL
#ifdef _WIN64
    ntdllBase = (uint64_t)DllBase;
#else
    ntdllBase = (uint64_t)DllBase;
#endif
#endif

    DWORD NumberOfNames = ExportDirectory->NumberOfNames;
    PDWORD Functions = SW2_RVA2VA(PDWORD, DllBase, ExportDirectory->AddressOfFunctions);
    PDWORD Names = SW2_RVA2VA(PDWORD, DllBase, ExportDirectory->AddressOfNames);
    PWORD Ordinals = SW2_RVA2VA(PWORD, DllBase, ExportDirectory->AddressOfNameOrdinals);

    // Populate SW2_SyscallList with unsorted Zw* entries.
    DWORD i = 0;
    PSW2_SYSCALL_ENTRY Entries = SW2_SyscallList.Entries;
    do
    {
        PCHAR FunctionName = SW2_RVA2VA(PCHAR, DllBase, Names[NumberOfNames - 1]);

        // Is this a system call?
        if (*(USHORT*)FunctionName == 'wZ')
        {
            Entries[i].Hash = SW2_HashSyscall(FunctionName);
            Entries[i].Address = Functions[Ordinals[NumberOfNames - 1]];

            i++;
            if (i == SW2_MAX_ENTRIES) break;
        }
    } while (--NumberOfNames);

    // Save total number of system calls found.
    SW2_SyscallList.Count = i;

    // Sort the list by address in ascending order.
    for (i = 0; i < SW2_SyscallList.Count - 1; i++)
    {
        for (DWORD j = 0; j < SW2_SyscallList.Count - i - 1; j++)
        {
            if (Entries[j].Address > Entries[j + 1].Address)
            {
                // Swap entries.
                SW2_SYSCALL_ENTRY TempEntry;

                TempEntry.Hash = Entries[j].Hash;
                TempEntry.Address = Entries[j].Address;

                Entries[j].Hash = Entries[j + 1].Hash;
                Entries[j].Address = Entries[j + 1].Address;

                Entries[j + 1].Hash = TempEntry.Hash;
                Entries[j + 1].Address = TempEntry.Address;
            }
        }
    }

    return TRUE;
}

EXTERN_C DWORD SW2_GetSyscallNumber(DWORD FunctionHash)
{
    // Ensure SW2_SyscallList is populated.
    if (!SW2_PopulateSyscallList()) return -1;

    for (DWORD i = 0; i < SW2_SyscallList.Count; i++)
    {
        if (FunctionHash == SW2_SyscallList.Entries[i].Hash)
        {
            return i;
        }
    }

    return -1;
}

#ifdef RANDSYSCALL
#ifdef _WIN64
EXTERN_C uint64_t SW2_GetRandomSyscallAddress(void)
#else
EXTERN_C DWORD SW2_GetRandomSyscallAddress(int callType)
#endif
{
    int instructOffset = 0;
    int instructValue = 0;
#ifndef _WIN64
    // Wow64
    if (callType == 0)
    {
        instructOffset = 0x05;
        instructValue = 0x0E8;
    }
    // x86
    else if (callType == 1)
    {
        instructOffset = 0x05;
        instructValue = 0x0BA;
    }
#else
    instructOffset = 0x12;
    instructValue = 0x0F;
#endif
    srand(time(0));
    do
    {
        int randNum = (rand() % (SW2_SyscallList.Count + 1));
        if (*(unsigned char*)(ntdllBase + SW2_SyscallList.Entries[randNum].Address + instructOffset) == instructValue)
            return (ntdllBase + SW2_SyscallList.Entries[randNum].Address + instructOffset);
    } while(1);
}
#endif


#define WhisperMain
__asm__(".intel_syntax noprefix \n\
.global _WhisperMain \n\
_WhisperMain: \n\
    pop eax \n\
    call _SW2_GetSyscallNumber \n\
    add esp, 4 \n\
    mov ecx, dword ptr fs:0xc0 \n\
    test ecx, ecx \n\
    jne _wow64 \n\
    lea edx, dword ptr [esp+0x04] \n\
    INT 0x02e \n\
    ret \n\
_wow64: \n\
    xor ecx, ecx \n\
    lea edx, dword ptr [esp+0x04] \n\
    call dword ptr fs:0xc0 \n\
    ret \n\
");

#define ZwAccessCheck NtAccessCheck
__asm__(".intel_syntax noprefix \n\
_NtAccessCheck: \n\
    push 0x00D84B05 \n\
    call _WhisperMain \n\
");


#define ZwWorkerFactoryWorkerReady NtWorkerFactoryWorkerReady
__asm__(".intel_syntax noprefix \n\
_NtWorkerFactoryWorkerReady: \n\
    push 0x9FA1B93C \n\
    call _WhisperMain \n\
");


#define ZwAcceptConnectPort NtAcceptConnectPort
__asm__(".intel_syntax noprefix \n\
_NtAcceptConnectPort: \n\
    push 0x24B2213C \n\
    call _WhisperMain \n\
");


#define ZwMapUserPhysicalPagesScatter NtMapUserPhysicalPagesScatter
__asm__(".intel_syntax noprefix \n\
_NtMapUserPhysicalPagesScatter: \n\
    push 0x27822D1F \n\
    call _WhisperMain \n\
");


#define ZwWaitForSingleObject NtWaitForSingleObject
__asm__(".intel_syntax noprefix \n\
_NtWaitForSingleObject: \n\
    push 0xA698B634 \n\
    call _WhisperMain \n\
");


#define ZwCallbackReturn NtCallbackReturn
__asm__(".intel_syntax noprefix \n\
_NtCallbackReturn: \n\
    push 0x46DA6906 \n\
    call _WhisperMain \n\
");


#define ZwReadFile NtReadFile
__asm__(".intel_syntax noprefix \n\
_NtReadFile: \n\
    push 0x2D78E329 \n\
    call _WhisperMain \n\
");


#define ZwDeviceIoControlFile NtDeviceIoControlFile
__asm__(".intel_syntax noprefix \n\
_NtDeviceIoControlFile: \n\
    push 0x5CBC501E \n\
    call _WhisperMain \n\
");


#define ZwWriteFile NtWriteFile
__asm__(".intel_syntax noprefix \n\
_NtWriteFile: \n\
    push 0xC159CE3B \n\
    call _WhisperMain \n\
");


#define ZwRemoveIoCompletion NtRemoveIoCompletion
__asm__(".intel_syntax noprefix \n\
_NtRemoveIoCompletion: \n\
    push 0x0689869F \n\
    call _WhisperMain \n\
");


#define ZwReleaseSemaphore NtReleaseSemaphore
__asm__(".intel_syntax noprefix \n\
_NtReleaseSemaphore: \n\
    push 0x4C1E34C0 \n\
    call _WhisperMain \n\
");


#define ZwReplyWaitReceivePort NtReplyWaitReceivePort
__asm__(".intel_syntax noprefix \n\
_NtReplyWaitReceivePort: \n\
    push 0x61729E19 \n\
    call _WhisperMain \n\
");


#define ZwReplyPort NtReplyPort
__asm__(".intel_syntax noprefix \n\
_NtReplyPort: \n\
    push 0xA133CB2D \n\
    call _WhisperMain \n\
");


#define ZwSetInformationThread NtSetInformationThread
__asm__(".intel_syntax noprefix \n\
_NtSetInformationThread: \n\
    push 0x882FC281 \n\
    call _WhisperMain \n\
");


#define ZwSetEvent NtSetEvent
__asm__(".intel_syntax noprefix \n\
_NtSetEvent: \n\
    push 0xDD40C0C9 \n\
    call _WhisperMain \n\
");


#define ZwClose NtClose
__asm__(".intel_syntax noprefix \n\
_NtClose: \n\
    push 0x489CDDA5 \n\
    call _WhisperMain \n\
");


#define ZwQueryObject NtQueryObject
__asm__(".intel_syntax noprefix \n\
_NtQueryObject: \n\
    push 0xFA54F6FB \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationFile NtQueryInformationFile
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationFile: \n\
    push 0xF9781779 \n\
    call _WhisperMain \n\
");


#define ZwOpenKey NtOpenKey
__asm__(".intel_syntax noprefix \n\
_NtOpenKey: \n\
    push 0x0466E83C \n\
    call _WhisperMain \n\
");


#define ZwEnumerateValueKey NtEnumerateValueKey
__asm__(".intel_syntax noprefix \n\
_NtEnumerateValueKey: \n\
    push 0x2A5F37CA \n\
    call _WhisperMain \n\
");


#define ZwFindAtom NtFindAtom
__asm__(".intel_syntax noprefix \n\
_NtFindAtom: \n\
    push 0xB5238AA1 \n\
    call _WhisperMain \n\
");


#define ZwQueryDefaultLocale NtQueryDefaultLocale
__asm__(".intel_syntax noprefix \n\
_NtQueryDefaultLocale: \n\
    push 0xA3237C62 \n\
    call _WhisperMain \n\
");


#define ZwQueryKey NtQueryKey
__asm__(".intel_syntax noprefix \n\
_NtQueryKey: \n\
    push 0x92A6AF1C \n\
    call _WhisperMain \n\
");


#define ZwQueryValueKey NtQueryValueKey
__asm__(".intel_syntax noprefix \n\
_NtQueryValueKey: \n\
    push 0xB9099CAA \n\
    call _WhisperMain \n\
");


#define ZwAllocateVirtualMemory NtAllocateVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtAllocateVirtualMemory: \n\
    push 0x9790911F \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationProcess NtQueryInformationProcess
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationProcess: \n\
    push 0x612F4AB0 \n\
    call _WhisperMain \n\
");


#define ZwWaitForMultipleObjects32 NtWaitForMultipleObjects32
__asm__(".intel_syntax noprefix \n\
_NtWaitForMultipleObjects32: \n\
    push 0x16CA3625 \n\
    call _WhisperMain \n\
");


#define ZwWriteFileGather NtWriteFileGather
__asm__(".intel_syntax noprefix \n\
_NtWriteFileGather: \n\
    push 0x3A24D23E \n\
    call _WhisperMain \n\
");


#define ZwCreateKey NtCreateKey
__asm__(".intel_syntax noprefix \n\
_NtCreateKey: \n\
    push 0x7E814F3B \n\
    call _WhisperMain \n\
");


#define ZwFreeVirtualMemory NtFreeVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtFreeVirtualMemory: \n\
    push 0xC596A942 \n\
    call _WhisperMain \n\
");


#define ZwImpersonateClientOfPort NtImpersonateClientOfPort
__asm__(".intel_syntax noprefix \n\
_NtImpersonateClientOfPort: \n\
    push 0x783265BC \n\
    call _WhisperMain \n\
");


#define ZwReleaseMutant NtReleaseMutant
__asm__(".intel_syntax noprefix \n\
_NtReleaseMutant: \n\
    push 0x3BBC3426 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationToken NtQueryInformationToken
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationToken: \n\
    push 0xA17ECBFA \n\
    call _WhisperMain \n\
");


#define ZwRequestWaitReplyPort NtRequestWaitReplyPort
__asm__(".intel_syntax noprefix \n\
_NtRequestWaitReplyPort: \n\
    push 0x2DB14823 \n\
    call _WhisperMain \n\
");


#define ZwQueryVirtualMemory NtQueryVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtQueryVirtualMemory: \n\
    push 0x39D0395F \n\
    call _WhisperMain \n\
");


#define ZwOpenThreadToken NtOpenThreadToken
__asm__(".intel_syntax noprefix \n\
_NtOpenThreadToken: \n\
    push 0x1D840F08 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationThread NtQueryInformationThread
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationThread: \n\
    push 0x2E8A3C3B \n\
    call _WhisperMain \n\
");


#define ZwOpenProcess NtOpenProcess
__asm__(".intel_syntax noprefix \n\
_NtOpenProcess: \n\
    push 0xBE20A5AC \n\
    call _WhisperMain \n\
");


#define ZwSetInformationFile NtSetInformationFile
__asm__(".intel_syntax noprefix \n\
_NtSetInformationFile: \n\
    push 0xB63F582C \n\
    call _WhisperMain \n\
");


#define ZwMapViewOfSection NtMapViewOfSection
__asm__(".intel_syntax noprefix \n\
_NtMapViewOfSection: \n\
    push 0x46EA2639 \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckAndAuditAlarm NtAccessCheckAndAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckAndAuditAlarm: \n\
    push 0x18BE1A52 \n\
    call _WhisperMain \n\
");


#define ZwUnmapViewOfSection NtUnmapViewOfSection
__asm__(".intel_syntax noprefix \n\
_NtUnmapViewOfSection: \n\
    push 0x0A9E080F \n\
    call _WhisperMain \n\
");


#define ZwReplyWaitReceivePortEx NtReplyWaitReceivePortEx
__asm__(".intel_syntax noprefix \n\
_NtReplyWaitReceivePortEx: \n\
    push 0x696B3BB1 \n\
    call _WhisperMain \n\
");


#define ZwTerminateProcess NtTerminateProcess
__asm__(".intel_syntax noprefix \n\
_NtTerminateProcess: \n\
    push 0x21A32630 \n\
    call _WhisperMain \n\
");


#define ZwSetEventBoostPriority NtSetEventBoostPriority
__asm__(".intel_syntax noprefix \n\
_NtSetEventBoostPriority: \n\
    push 0x0C961A1E \n\
    call _WhisperMain \n\
");


#define ZwReadFileScatter NtReadFileScatter
__asm__(".intel_syntax noprefix \n\
_NtReadFileScatter: \n\
    push 0x39921B2F \n\
    call _WhisperMain \n\
");


#define ZwOpenThreadTokenEx NtOpenThreadTokenEx
__asm__(".intel_syntax noprefix \n\
_NtOpenThreadTokenEx: \n\
    push 0x148CA0B0 \n\
    call _WhisperMain \n\
");


#define ZwOpenProcessTokenEx NtOpenProcessTokenEx
__asm__(".intel_syntax noprefix \n\
_NtOpenProcessTokenEx: \n\
    push 0xC6C3807D \n\
    call _WhisperMain \n\
");


#define ZwQueryPerformanceCounter NtQueryPerformanceCounter
__asm__(".intel_syntax noprefix \n\
_NtQueryPerformanceCounter: \n\
    push 0x73D595C1 \n\
    call _WhisperMain \n\
");


#define ZwEnumerateKey NtEnumerateKey
__asm__(".intel_syntax noprefix \n\
_NtEnumerateKey: \n\
    push 0x1B1F4ECD \n\
    call _WhisperMain \n\
");


#define ZwOpenFile NtOpenFile
__asm__(".intel_syntax noprefix \n\
_NtOpenFile: \n\
    push 0xF4A573B9 \n\
    call _WhisperMain \n\
");


#define ZwDelayExecution NtDelayExecution
__asm__(".intel_syntax noprefix \n\
_NtDelayExecution: \n\
    push 0x0A800811 \n\
    call _WhisperMain \n\
");


#define ZwQueryDirectoryFile NtQueryDirectoryFile
__asm__(".intel_syntax noprefix \n\
_NtQueryDirectoryFile: \n\
    push 0x28BEF888 \n\
    call _WhisperMain \n\
");


#define ZwQuerySystemInformation NtQuerySystemInformation
__asm__(".intel_syntax noprefix \n\
_NtQuerySystemInformation: \n\
    push 0xDA4BDCDF \n\
    call _WhisperMain \n\
");


#define ZwOpenSection NtOpenSection
__asm__(".intel_syntax noprefix \n\
_NtOpenSection: \n\
    push 0x1CC63E57 \n\
    call _WhisperMain \n\
");


#define ZwQueryTimer NtQueryTimer
__asm__(".intel_syntax noprefix \n\
_NtQueryTimer: \n\
    push 0xC3971FBA \n\
    call _WhisperMain \n\
");


#define ZwFsControlFile NtFsControlFile
__asm__(".intel_syntax noprefix \n\
_NtFsControlFile: \n\
    push 0xA8A9920E \n\
    call _WhisperMain \n\
");


#define ZwWriteVirtualMemory NtWriteVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtWriteVirtualMemory: \n\
    push 0x0F912503 \n\
    call _WhisperMain \n\
");


#define ZwCloseObjectAuditAlarm NtCloseObjectAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtCloseObjectAuditAlarm: \n\
    push 0x6EB06A26 \n\
    call _WhisperMain \n\
");


#define ZwDuplicateObject NtDuplicateObject
__asm__(".intel_syntax noprefix \n\
_NtDuplicateObject: \n\
    push 0x08B13A3F \n\
    call _WhisperMain \n\
");


#define ZwQueryAttributesFile NtQueryAttributesFile
__asm__(".intel_syntax noprefix \n\
_NtQueryAttributesFile: \n\
    push 0x3AB80E66 \n\
    call _WhisperMain \n\
");


#define ZwClearEvent NtClearEvent
__asm__(".intel_syntax noprefix \n\
_NtClearEvent: \n\
    push 0x6EF46B64 \n\
    call _WhisperMain \n\
");


#define ZwReadVirtualMemory NtReadVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtReadVirtualMemory: \n\
    push 0xD39D2AFE \n\
    call _WhisperMain \n\
");


#define ZwOpenEvent NtOpenEvent
__asm__(".intel_syntax noprefix \n\
_NtOpenEvent: \n\
    push 0x92B1D167 \n\
    call _WhisperMain \n\
");


#define ZwAdjustPrivilegesToken NtAdjustPrivilegesToken
__asm__(".intel_syntax noprefix \n\
_NtAdjustPrivilegesToken: \n\
    push 0x1DA2F11E \n\
    call _WhisperMain \n\
");


#define ZwDuplicateToken NtDuplicateToken
__asm__(".intel_syntax noprefix \n\
_NtDuplicateToken: \n\
    push 0xDE6AC4E9 \n\
    call _WhisperMain \n\
");


#define ZwContinue NtContinue
__asm__(".intel_syntax noprefix \n\
_NtContinue: \n\
    push 0x4ED93916 \n\
    call _WhisperMain \n\
");


#define ZwQueryDefaultUILanguage NtQueryDefaultUILanguage
__asm__(".intel_syntax noprefix \n\
_NtQueryDefaultUILanguage: \n\
    push 0x9C3B8F87 \n\
    call _WhisperMain \n\
");


#define ZwQueueApcThread NtQueueApcThread
__asm__(".intel_syntax noprefix \n\
_NtQueueApcThread: \n\
    push 0x8EA41A9B \n\
    call _WhisperMain \n\
");


#define ZwYieldExecution NtYieldExecution
__asm__(".intel_syntax noprefix \n\
_NtYieldExecution: \n\
    push 0x2EB8042D \n\
    call _WhisperMain \n\
");


#define ZwAddAtom NtAddAtom
__asm__(".intel_syntax noprefix \n\
_NtAddAtom: \n\
    push 0x4D47AE51 \n\
    call _WhisperMain \n\
");


#define ZwCreateEvent NtCreateEvent
__asm__(".intel_syntax noprefix \n\
_NtCreateEvent: \n\
    push 0xE64DF5AA \n\
    call _WhisperMain \n\
");


#define ZwQueryVolumeInformationFile NtQueryVolumeInformationFile
__asm__(".intel_syntax noprefix \n\
_NtQueryVolumeInformationFile: \n\
    push 0xDE4FF0CC \n\
    call _WhisperMain \n\
");


#define ZwCreateSection NtCreateSection
__asm__(".intel_syntax noprefix \n\
_NtCreateSection: \n\
    push 0x248D2A15 \n\
    call _WhisperMain \n\
");


#define ZwFlushBuffersFile NtFlushBuffersFile
__asm__(".intel_syntax noprefix \n\
_NtFlushBuffersFile: \n\
    push 0xE85B3662 \n\
    call _WhisperMain \n\
");


#define ZwApphelpCacheControl NtApphelpCacheControl
__asm__(".intel_syntax noprefix \n\
_NtApphelpCacheControl: \n\
    push 0xBDAD26AB \n\
    call _WhisperMain \n\
");


#define ZwCreateProcessEx NtCreateProcessEx
__asm__(".intel_syntax noprefix \n\
_NtCreateProcessEx: \n\
    push 0x0C924647 \n\
    call _WhisperMain \n\
");


#define ZwCreateThread NtCreateThread
__asm__(".intel_syntax noprefix \n\
_NtCreateThread: \n\
    push 0x10B44209 \n\
    call _WhisperMain \n\
");


#define ZwIsProcessInJob NtIsProcessInJob
__asm__(".intel_syntax noprefix \n\
_NtIsProcessInJob: \n\
    push 0x64C2A691 \n\
    call _WhisperMain \n\
");


#define ZwProtectVirtualMemory NtProtectVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtProtectVirtualMemory: \n\
    push 0x4F954517 \n\
    call _WhisperMain \n\
");


#define ZwQuerySection NtQuerySection
__asm__(".intel_syntax noprefix \n\
_NtQuerySection: \n\
    push 0xC844E4DF \n\
    call _WhisperMain \n\
");


#define ZwResumeThread NtResumeThread
__asm__(".intel_syntax noprefix \n\
_NtResumeThread: \n\
    push 0xB898BA26 \n\
    call _WhisperMain \n\
");


#define ZwTerminateThread NtTerminateThread
__asm__(".intel_syntax noprefix \n\
_NtTerminateThread: \n\
    push 0x4C8E022F \n\
    call _WhisperMain \n\
");


#define ZwReadRequestData NtReadRequestData
__asm__(".intel_syntax noprefix \n\
_NtReadRequestData: \n\
    push 0xC3BDF0EF \n\
    call _WhisperMain \n\
");


#define ZwCreateFile NtCreateFile
__asm__(".intel_syntax noprefix \n\
_NtCreateFile: \n\
    push 0x56E78957 \n\
    call _WhisperMain \n\
");


#define ZwQueryEvent NtQueryEvent
__asm__(".intel_syntax noprefix \n\
_NtQueryEvent: \n\
    push 0x7A4129E6 \n\
    call _WhisperMain \n\
");


#define ZwWriteRequestData NtWriteRequestData
__asm__(".intel_syntax noprefix \n\
_NtWriteRequestData: \n\
    push 0xE4059212 \n\
    call _WhisperMain \n\
");


#define ZwOpenDirectoryObject NtOpenDirectoryObject
__asm__(".intel_syntax noprefix \n\
_NtOpenDirectoryObject: \n\
    push 0x855FB1C0 \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckByTypeAndAuditAlarm NtAccessCheckByTypeAndAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckByTypeAndAuditAlarm: \n\
    push 0xCF40EFCF \n\
    call _WhisperMain \n\
");


#define ZwWaitForMultipleObjects NtWaitForMultipleObjects
__asm__(".intel_syntax noprefix \n\
_NtWaitForMultipleObjects: \n\
    push 0xD52DEDE7 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationObject NtSetInformationObject
__asm__(".intel_syntax noprefix \n\
_NtSetInformationObject: \n\
    push 0x02213A8C \n\
    call _WhisperMain \n\
");


#define ZwCancelIoFile NtCancelIoFile
__asm__(".intel_syntax noprefix \n\
_NtCancelIoFile: \n\
    push 0x9AFB5DC7 \n\
    call _WhisperMain \n\
");


#define ZwTraceEvent NtTraceEvent
__asm__(".intel_syntax noprefix \n\
_NtTraceEvent: \n\
    push 0xCEF22697 \n\
    call _WhisperMain \n\
");


#define ZwPowerInformation NtPowerInformation
__asm__(".intel_syntax noprefix \n\
_NtPowerInformation: \n\
    push 0x30AE11FD \n\
    call _WhisperMain \n\
");


#define ZwSetValueKey NtSetValueKey
__asm__(".intel_syntax noprefix \n\
_NtSetValueKey: \n\
    push 0x09DD2E40 \n\
    call _WhisperMain \n\
");


#define ZwCancelTimer NtCancelTimer
__asm__(".intel_syntax noprefix \n\
_NtCancelTimer: \n\
    push 0xACA6F468 \n\
    call _WhisperMain \n\
");


#define ZwSetTimer NtSetTimer
__asm__(".intel_syntax noprefix \n\
_NtSetTimer: \n\
    push 0x379E1D26 \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckByType NtAccessCheckByType
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckByType: \n\
    push 0x9CC67084 \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckByTypeResultList NtAccessCheckByTypeResultList
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckByTypeResultList: \n\
    push 0x7ED37A5B \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckByTypeResultListAndAuditAlarm NtAccessCheckByTypeResultListAndAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckByTypeResultListAndAuditAlarm: \n\
    push 0xD2D4D540 \n\
    call _WhisperMain \n\
");


#define ZwAccessCheckByTypeResultListAndAuditAlarmByHandle NtAccessCheckByTypeResultListAndAuditAlarmByHandle
__asm__(".intel_syntax noprefix \n\
_NtAccessCheckByTypeResultListAndAuditAlarmByHandle: \n\
    push 0xA99663A0 \n\
    call _WhisperMain \n\
");


#define ZwAcquireProcessActivityReference NtAcquireProcessActivityReference
__asm__(".intel_syntax noprefix \n\
_NtAcquireProcessActivityReference: \n\
    push 0x3AE3533E \n\
    call _WhisperMain \n\
");


#define ZwAddAtomEx NtAddAtomEx
__asm__(".intel_syntax noprefix \n\
_NtAddAtomEx: \n\
    push 0xFD15DDAE \n\
    call _WhisperMain \n\
");


#define ZwAddBootEntry NtAddBootEntry
__asm__(".intel_syntax noprefix \n\
_NtAddBootEntry: \n\
    push 0x01903128 \n\
    call _WhisperMain \n\
");


#define ZwAddDriverEntry NtAddDriverEntry
__asm__(".intel_syntax noprefix \n\
_NtAddDriverEntry: \n\
    push 0x19F76978 \n\
    call _WhisperMain \n\
");


#define ZwAdjustGroupsToken NtAdjustGroupsToken
__asm__(".intel_syntax noprefix \n\
_NtAdjustGroupsToken: \n\
    push 0x25917530 \n\
    call _WhisperMain \n\
");


#define ZwAdjustTokenClaimsAndDeviceGroups NtAdjustTokenClaimsAndDeviceGroups
__asm__(".intel_syntax noprefix \n\
_NtAdjustTokenClaimsAndDeviceGroups: \n\
    push 0xFA66FCF4 \n\
    call _WhisperMain \n\
");


#define ZwAlertResumeThread NtAlertResumeThread
__asm__(".intel_syntax noprefix \n\
_NtAlertResumeThread: \n\
    push 0x309A3E33 \n\
    call _WhisperMain \n\
");


#define ZwAlertThread NtAlertThread
__asm__(".intel_syntax noprefix \n\
_NtAlertThread: \n\
    push 0x284312D5 \n\
    call _WhisperMain \n\
");


#define ZwAlertThreadByThreadId NtAlertThreadByThreadId
__asm__(".intel_syntax noprefix \n\
_NtAlertThreadByThreadId: \n\
    push 0xA4B8E61E \n\
    call _WhisperMain \n\
");


#define ZwAllocateLocallyUniqueId NtAllocateLocallyUniqueId
__asm__(".intel_syntax noprefix \n\
_NtAllocateLocallyUniqueId: \n\
    push 0xCC0FCFA8 \n\
    call _WhisperMain \n\
");


#define ZwAllocateReserveObject NtAllocateReserveObject
__asm__(".intel_syntax noprefix \n\
_NtAllocateReserveObject: \n\
    push 0x8E23BEAF \n\
    call _WhisperMain \n\
");


#define ZwAllocateUserPhysicalPages NtAllocateUserPhysicalPages
__asm__(".intel_syntax noprefix \n\
_NtAllocateUserPhysicalPages: \n\
    push 0x2F9D6816 \n\
    call _WhisperMain \n\
");


#define ZwAllocateUuids NtAllocateUuids
__asm__(".intel_syntax noprefix \n\
_NtAllocateUuids: \n\
    push 0x17A4E4DA \n\
    call _WhisperMain \n\
");


#define ZwAllocateVirtualMemoryEx NtAllocateVirtualMemoryEx
__asm__(".intel_syntax noprefix \n\
_NtAllocateVirtualMemoryEx: \n\
    push 0xB880EA6B \n\
    call _WhisperMain \n\
");


#define ZwAlpcAcceptConnectPort NtAlpcAcceptConnectPort
__asm__(".intel_syntax noprefix \n\
_NtAlpcAcceptConnectPort: \n\
    push 0x40B75B38 \n\
    call _WhisperMain \n\
");


#define ZwAlpcCancelMessage NtAlpcCancelMessage
__asm__(".intel_syntax noprefix \n\
_NtAlpcCancelMessage: \n\
    push 0x17B6322C \n\
    call _WhisperMain \n\
");


#define ZwAlpcConnectPort NtAlpcConnectPort
__asm__(".intel_syntax noprefix \n\
_NtAlpcConnectPort: \n\
    push 0x3269C007 \n\
    call _WhisperMain \n\
");


#define ZwAlpcConnectPortEx NtAlpcConnectPortEx
__asm__(".intel_syntax noprefix \n\
_NtAlpcConnectPortEx: \n\
    push 0xE06E3731 \n\
    call _WhisperMain \n\
");


#define ZwAlpcCreatePort NtAlpcCreatePort
__asm__(".intel_syntax noprefix \n\
_NtAlpcCreatePort: \n\
    push 0x58CA7552 \n\
    call _WhisperMain \n\
");


#define ZwAlpcCreatePortSection NtAlpcCreatePortSection
__asm__(".intel_syntax noprefix \n\
_NtAlpcCreatePortSection: \n\
    push 0x0ADA0241 \n\
    call _WhisperMain \n\
");


#define ZwAlpcCreateResourceReserve NtAlpcCreateResourceReserve
__asm__(".intel_syntax noprefix \n\
_NtAlpcCreateResourceReserve: \n\
    push 0x10A10C1B \n\
    call _WhisperMain \n\
");


#define ZwAlpcCreateSectionView NtAlpcCreateSectionView
__asm__(".intel_syntax noprefix \n\
_NtAlpcCreateSectionView: \n\
    push 0x148C7113 \n\
    call _WhisperMain \n\
");


#define ZwAlpcCreateSecurityContext NtAlpcCreateSecurityContext
__asm__(".intel_syntax noprefix \n\
_NtAlpcCreateSecurityContext: \n\
    push 0x08B21F3A \n\
    call _WhisperMain \n\
");


#define ZwAlpcDeletePortSection NtAlpcDeletePortSection
__asm__(".intel_syntax noprefix \n\
_NtAlpcDeletePortSection: \n\
    push 0xE157C602 \n\
    call _WhisperMain \n\
");


#define ZwAlpcDeleteResourceReserve NtAlpcDeleteResourceReserve
__asm__(".intel_syntax noprefix \n\
_NtAlpcDeleteResourceReserve: \n\
    push 0x28A8D4F3 \n\
    call _WhisperMain \n\
");


#define ZwAlpcDeleteSectionView NtAlpcDeleteSectionView
__asm__(".intel_syntax noprefix \n\
_NtAlpcDeleteSectionView: \n\
    push 0x86B7571D \n\
    call _WhisperMain \n\
");


#define ZwAlpcDeleteSecurityContext NtAlpcDeleteSecurityContext
__asm__(".intel_syntax noprefix \n\
_NtAlpcDeleteSecurityContext: \n\
    push 0xEE960206 \n\
    call _WhisperMain \n\
");


#define ZwAlpcDisconnectPort NtAlpcDisconnectPort
__asm__(".intel_syntax noprefix \n\
_NtAlpcDisconnectPort: \n\
    push 0xA6F2A060 \n\
    call _WhisperMain \n\
");


#define ZwAlpcImpersonateClientContainerOfPort NtAlpcImpersonateClientContainerOfPort
__asm__(".intel_syntax noprefix \n\
_NtAlpcImpersonateClientContainerOfPort: \n\
    push 0x20B3C728 \n\
    call _WhisperMain \n\
");


#define ZwAlpcImpersonateClientOfPort NtAlpcImpersonateClientOfPort
__asm__(".intel_syntax noprefix \n\
_NtAlpcImpersonateClientOfPort: \n\
    push 0xD44DC7E2 \n\
    call _WhisperMain \n\
");


#define ZwAlpcOpenSenderProcess NtAlpcOpenSenderProcess
__asm__(".intel_syntax noprefix \n\
_NtAlpcOpenSenderProcess: \n\
    push 0xEFBB2DEB \n\
    call _WhisperMain \n\
");


#define ZwAlpcOpenSenderThread NtAlpcOpenSenderThread
__asm__(".intel_syntax noprefix \n\
_NtAlpcOpenSenderThread: \n\
    push 0xA805BAAB \n\
    call _WhisperMain \n\
");


#define ZwAlpcQueryInformation NtAlpcQueryInformation
__asm__(".intel_syntax noprefix \n\
_NtAlpcQueryInformation: \n\
    push 0x9D44BDCA \n\
    call _WhisperMain \n\
");


#define ZwAlpcQueryInformationMessage NtAlpcQueryInformationMessage
__asm__(".intel_syntax noprefix \n\
_NtAlpcQueryInformationMessage: \n\
    push 0xC751C6EA \n\
    call _WhisperMain \n\
");


#define ZwAlpcRevokeSecurityContext NtAlpcRevokeSecurityContext
__asm__(".intel_syntax noprefix \n\
_NtAlpcRevokeSecurityContext: \n\
    push 0xD742F2D3 \n\
    call _WhisperMain \n\
");


#define ZwAlpcSendWaitReceivePort NtAlpcSendWaitReceivePort
__asm__(".intel_syntax noprefix \n\
_NtAlpcSendWaitReceivePort: \n\
    push 0x22B23B36 \n\
    call _WhisperMain \n\
");


#define ZwAlpcSetInformation NtAlpcSetInformation
__asm__(".intel_syntax noprefix \n\
_NtAlpcSetInformation: \n\
    push 0x00E80279 \n\
    call _WhisperMain \n\
");


#define ZwAreMappedFilesTheSame NtAreMappedFilesTheSame
__asm__(".intel_syntax noprefix \n\
_NtAreMappedFilesTheSame: \n\
    push 0xF7D4DA63 \n\
    call _WhisperMain \n\
");


#define ZwAssignProcessToJobObject NtAssignProcessToJobObject
__asm__(".intel_syntax noprefix \n\
_NtAssignProcessToJobObject: \n\
    push 0x301C1B43 \n\
    call _WhisperMain \n\
");


#define ZwAssociateWaitCompletionPacket NtAssociateWaitCompletionPacket
__asm__(".intel_syntax noprefix \n\
_NtAssociateWaitCompletionPacket: \n\
    push 0x073C3780 \n\
    call _WhisperMain \n\
");


#define ZwCallEnclave NtCallEnclave
__asm__(".intel_syntax noprefix \n\
_NtCallEnclave: \n\
    push 0x22D31278 \n\
    call _WhisperMain \n\
");


#define ZwCancelIoFileEx NtCancelIoFileEx
__asm__(".intel_syntax noprefix \n\
_NtCancelIoFileEx: \n\
    push 0xC73D0B79 \n\
    call _WhisperMain \n\
");


#define ZwCancelSynchronousIoFile NtCancelSynchronousIoFile
__asm__(".intel_syntax noprefix \n\
_NtCancelSynchronousIoFile: \n\
    push 0x26A60A20 \n\
    call _WhisperMain \n\
");


#define ZwCancelTimer2 NtCancelTimer2
__asm__(".intel_syntax noprefix \n\
_NtCancelTimer2: \n\
    push 0xC40A1C84 \n\
    call _WhisperMain \n\
");


#define ZwCancelWaitCompletionPacket NtCancelWaitCompletionPacket
__asm__(".intel_syntax noprefix \n\
_NtCancelWaitCompletionPacket: \n\
    push 0x07833D0C \n\
    call _WhisperMain \n\
");


#define ZwCommitComplete NtCommitComplete
__asm__(".intel_syntax noprefix \n\
_NtCommitComplete: \n\
    push 0xDA2BF4A0 \n\
    call _WhisperMain \n\
");


#define ZwCommitEnlistment NtCommitEnlistment
__asm__(".intel_syntax noprefix \n\
_NtCommitEnlistment: \n\
    push 0x59009E53 \n\
    call _WhisperMain \n\
");


#define ZwCommitRegistryTransaction NtCommitRegistryTransaction
__asm__(".intel_syntax noprefix \n\
_NtCommitRegistryTransaction: \n\
    push 0x4E810C51 \n\
    call _WhisperMain \n\
");


#define ZwCommitTransaction NtCommitTransaction
__asm__(".intel_syntax noprefix \n\
_NtCommitTransaction: \n\
    push 0x3852F60F \n\
    call _WhisperMain \n\
");


#define ZwCompactKeys NtCompactKeys
__asm__(".intel_syntax noprefix \n\
_NtCompactKeys: \n\
    push 0x43B77820 \n\
    call _WhisperMain \n\
");


#define ZwCompareObjects NtCompareObjects
__asm__(".intel_syntax noprefix \n\
_NtCompareObjects: \n\
    push 0x9226A562 \n\
    call _WhisperMain \n\
");


#define ZwCompareSigningLevels NtCompareSigningLevels
__asm__(".intel_syntax noprefix \n\
_NtCompareSigningLevels: \n\
    push 0x70EA917E \n\
    call _WhisperMain \n\
");


#define ZwCompareTokens NtCompareTokens
__asm__(".intel_syntax noprefix \n\
_NtCompareTokens: \n\
    push 0x79D57755 \n\
    call _WhisperMain \n\
");


#define ZwCompleteConnectPort NtCompleteConnectPort
__asm__(".intel_syntax noprefix \n\
_NtCompleteConnectPort: \n\
    push 0x20B63D38 \n\
    call _WhisperMain \n\
");


#define ZwCompressKey NtCompressKey
__asm__(".intel_syntax noprefix \n\
_NtCompressKey: \n\
    push 0xABD1AA4E \n\
    call _WhisperMain \n\
");


#define ZwConnectPort NtConnectPort
__asm__(".intel_syntax noprefix \n\
_NtConnectPort: \n\
    push 0x7EA87B3A \n\
    call _WhisperMain \n\
");


#define ZwConvertBetweenAuxiliaryCounterAndPerformanceCounter NtConvertBetweenAuxiliaryCounterAndPerformanceCounter
__asm__(".intel_syntax noprefix \n\
_NtConvertBetweenAuxiliaryCounterAndPerformanceCounter: \n\
    push 0x7FCC111D \n\
    call _WhisperMain \n\
");


#define ZwCreateDebugObject NtCreateDebugObject
__asm__(".intel_syntax noprefix \n\
_NtCreateDebugObject: \n\
    push 0x70584915 \n\
    call _WhisperMain \n\
");


#define ZwCreateDirectoryObject NtCreateDirectoryObject
__asm__(".intel_syntax noprefix \n\
_NtCreateDirectoryObject: \n\
    push 0xBB91A91F \n\
    call _WhisperMain \n\
");


#define ZwCreateDirectoryObjectEx NtCreateDirectoryObjectEx
__asm__(".intel_syntax noprefix \n\
_NtCreateDirectoryObjectEx: \n\
    push 0xAC89F658 \n\
    call _WhisperMain \n\
");


#define ZwCreateEnclave NtCreateEnclave
__asm__(".intel_syntax noprefix \n\
_NtCreateEnclave: \n\
    push 0xEC551C48 \n\
    call _WhisperMain \n\
");


#define ZwCreateEnlistment NtCreateEnlistment
__asm__(".intel_syntax noprefix \n\
_NtCreateEnlistment: \n\
    push 0x25982E1F \n\
    call _WhisperMain \n\
");


#define ZwCreateEventPair NtCreateEventPair
__asm__(".intel_syntax noprefix \n\
_NtCreateEventPair: \n\
    push 0x1696320B \n\
    call _WhisperMain \n\
");


#define ZwCreateIRTimer NtCreateIRTimer
__asm__(".intel_syntax noprefix \n\
_NtCreateIRTimer: \n\
    push 0xCD9BFD38 \n\
    call _WhisperMain \n\
");


#define ZwCreateIoCompletion NtCreateIoCompletion
__asm__(".intel_syntax noprefix \n\
_NtCreateIoCompletion: \n\
    push 0xC6B02420 \n\
    call _WhisperMain \n\
");


#define ZwCreateJobObject NtCreateJobObject
__asm__(".intel_syntax noprefix \n\
_NtCreateJobObject: \n\
    push 0x3C9D04D1 \n\
    call _WhisperMain \n\
");


#define ZwCreateJobSet NtCreateJobSet
__asm__(".intel_syntax noprefix \n\
_NtCreateJobSet: \n\
    push 0x20AE760D \n\
    call _WhisperMain \n\
");


#define ZwCreateKeyTransacted NtCreateKeyTransacted
__asm__(".intel_syntax noprefix \n\
_NtCreateKeyTransacted: \n\
    push 0x121EF303 \n\
    call _WhisperMain \n\
");


#define ZwCreateKeyedEvent NtCreateKeyedEvent
__asm__(".intel_syntax noprefix \n\
_NtCreateKeyedEvent: \n\
    push 0xC1AB2FB6 \n\
    call _WhisperMain \n\
");


#define ZwCreateLowBoxToken NtCreateLowBoxToken
__asm__(".intel_syntax noprefix \n\
_NtCreateLowBoxToken: \n\
    push 0x4F946DC4 \n\
    call _WhisperMain \n\
");


#define ZwCreateMailslotFile NtCreateMailslotFile
__asm__(".intel_syntax noprefix \n\
_NtCreateMailslotFile: \n\
    push 0x243DCA3E \n\
    call _WhisperMain \n\
");


#define ZwCreateMutant NtCreateMutant
__asm__(".intel_syntax noprefix \n\
_NtCreateMutant: \n\
    push 0xDDB3BE64 \n\
    call _WhisperMain \n\
");


#define ZwCreateNamedPipeFile NtCreateNamedPipeFile
__asm__(".intel_syntax noprefix \n\
_NtCreateNamedPipeFile: \n\
    push 0x2ABD122A \n\
    call _WhisperMain \n\
");


#define ZwCreatePagingFile NtCreatePagingFile
__asm__(".intel_syntax noprefix \n\
_NtCreatePagingFile: \n\
    push 0x5CCB5E52 \n\
    call _WhisperMain \n\
");


#define ZwCreatePartition NtCreatePartition
__asm__(".intel_syntax noprefix \n\
_NtCreatePartition: \n\
    push 0x15A0694A \n\
    call _WhisperMain \n\
");


#define ZwCreatePort NtCreatePort
__asm__(".intel_syntax noprefix \n\
_NtCreatePort: \n\
    push 0x02881B06 \n\
    call _WhisperMain \n\
");


#define ZwCreatePrivateNamespace NtCreatePrivateNamespace
__asm__(".intel_syntax noprefix \n\
_NtCreatePrivateNamespace: \n\
    push 0x9DBE43FF \n\
    call _WhisperMain \n\
");


#define ZwCreateProcess NtCreateProcess
__asm__(".intel_syntax noprefix \n\
_NtCreateProcess: \n\
    push 0x29B92F28 \n\
    call _WhisperMain \n\
");


#define ZwCreateProfile NtCreateProfile
__asm__(".intel_syntax noprefix \n\
_NtCreateProfile: \n\
    push 0x26BE292C \n\
    call _WhisperMain \n\
");


#define ZwCreateProfileEx NtCreateProfileEx
__asm__(".intel_syntax noprefix \n\
_NtCreateProfileEx: \n\
    push 0x0D934B4E \n\
    call _WhisperMain \n\
");


#define ZwCreateRegistryTransaction NtCreateRegistryTransaction
__asm__(".intel_syntax noprefix \n\
_NtCreateRegistryTransaction: \n\
    push 0xCF54CBC6 \n\
    call _WhisperMain \n\
");


#define ZwCreateResourceManager NtCreateResourceManager
__asm__(".intel_syntax noprefix \n\
_NtCreateResourceManager: \n\
    push 0x183CC170 \n\
    call _WhisperMain \n\
");


#define ZwCreateSemaphore NtCreateSemaphore
__asm__(".intel_syntax noprefix \n\
_NtCreateSemaphore: \n\
    push 0x085A7AB2 \n\
    call _WhisperMain \n\
");


#define ZwCreateSymbolicLinkObject NtCreateSymbolicLinkObject
__asm__(".intel_syntax noprefix \n\
_NtCreateSymbolicLinkObject: \n\
    push 0xF2D8DC65 \n\
    call _WhisperMain \n\
");


#define ZwCreateThreadEx NtCreateThreadEx
__asm__(".intel_syntax noprefix \n\
_NtCreateThreadEx: \n\
    push 0x44BC86C6 \n\
    call _WhisperMain \n\
");


#define ZwCreateTimer NtCreateTimer
__asm__(".intel_syntax noprefix \n\
_NtCreateTimer: \n\
    push 0x0350DD10 \n\
    call _WhisperMain \n\
");


#define ZwCreateTimer2 NtCreateTimer2
__asm__(".intel_syntax noprefix \n\
_NtCreateTimer2: \n\
    push 0x1353BA0D \n\
    call _WhisperMain \n\
");


#define ZwCreateToken NtCreateToken
__asm__(".intel_syntax noprefix \n\
_NtCreateToken: \n\
    push 0xC75AF5FA \n\
    call _WhisperMain \n\
");


#define ZwCreateTokenEx NtCreateTokenEx
__asm__(".intel_syntax noprefix \n\
_NtCreateTokenEx: \n\
    push 0x3AA0F7E5 \n\
    call _WhisperMain \n\
");


#define ZwCreateTransaction NtCreateTransaction
__asm__(".intel_syntax noprefix \n\
_NtCreateTransaction: \n\
    push 0x46CD4267 \n\
    call _WhisperMain \n\
");


#define ZwCreateTransactionManager NtCreateTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtCreateTransactionManager: \n\
    push 0x172507A4 \n\
    call _WhisperMain \n\
");


#define ZwCreateUserProcess NtCreateUserProcess
__asm__(".intel_syntax noprefix \n\
_NtCreateUserProcess: \n\
    push 0x398A3A14 \n\
    call _WhisperMain \n\
");


#define ZwCreateWaitCompletionPacket NtCreateWaitCompletionPacket
__asm__(".intel_syntax noprefix \n\
_NtCreateWaitCompletionPacket: \n\
    push 0xA99DD171 \n\
    call _WhisperMain \n\
");


#define ZwCreateWaitablePort NtCreateWaitablePort
__asm__(".intel_syntax noprefix \n\
_NtCreateWaitablePort: \n\
    push 0xE673E1E0 \n\
    call _WhisperMain \n\
");


#define ZwCreateWnfStateName NtCreateWnfStateName
__asm__(".intel_syntax noprefix \n\
_NtCreateWnfStateName: \n\
    push 0x148A2D1F \n\
    call _WhisperMain \n\
");


#define ZwCreateWorkerFactory NtCreateWorkerFactory
__asm__(".intel_syntax noprefix \n\
_NtCreateWorkerFactory: \n\
    push 0xBEAED64F \n\
    call _WhisperMain \n\
");


#define ZwDebugActiveProcess NtDebugActiveProcess
__asm__(".intel_syntax noprefix \n\
_NtDebugActiveProcess: \n\
    push 0x7E3097AC \n\
    call _WhisperMain \n\
");


#define ZwDebugContinue NtDebugContinue
__asm__(".intel_syntax noprefix \n\
_NtDebugContinue: \n\
    push 0x30244728 \n\
    call _WhisperMain \n\
");


#define ZwDeleteAtom NtDeleteAtom
__asm__(".intel_syntax noprefix \n\
_NtDeleteAtom: \n\
    push 0x54C15756 \n\
    call _WhisperMain \n\
");


#define ZwDeleteBootEntry NtDeleteBootEntry
__asm__(".intel_syntax noprefix \n\
_NtDeleteBootEntry: \n\
    push 0x09950306 \n\
    call _WhisperMain \n\
");


#define ZwDeleteDriverEntry NtDeleteDriverEntry
__asm__(".intel_syntax noprefix \n\
_NtDeleteDriverEntry: \n\
    push 0xCB97FF2A \n\
    call _WhisperMain \n\
");


#define ZwDeleteFile NtDeleteFile
__asm__(".intel_syntax noprefix \n\
_NtDeleteFile: \n\
    push 0x14B25392 \n\
    call _WhisperMain \n\
");


#define ZwDeleteKey NtDeleteKey
__asm__(".intel_syntax noprefix \n\
_NtDeleteKey: \n\
    push 0x69D34C78 \n\
    call _WhisperMain \n\
");


#define ZwDeleteObjectAuditAlarm NtDeleteObjectAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtDeleteObjectAuditAlarm: \n\
    push 0x7AA47C30 \n\
    call _WhisperMain \n\
");


#define ZwDeletePrivateNamespace NtDeletePrivateNamespace
__asm__(".intel_syntax noprefix \n\
_NtDeletePrivateNamespace: \n\
    push 0x6ACC6F55 \n\
    call _WhisperMain \n\
");


#define ZwDeleteValueKey NtDeleteValueKey
__asm__(".intel_syntax noprefix \n\
_NtDeleteValueKey: \n\
    push 0x2A9F0905 \n\
    call _WhisperMain \n\
");


#define ZwDeleteWnfStateData NtDeleteWnfStateData
__asm__(".intel_syntax noprefix \n\
_NtDeleteWnfStateData: \n\
    push 0x02C292F0 \n\
    call _WhisperMain \n\
");


#define ZwDeleteWnfStateName NtDeleteWnfStateName
__asm__(".intel_syntax noprefix \n\
_NtDeleteWnfStateName: \n\
    push 0x76B8FD9B \n\
    call _WhisperMain \n\
");


#define ZwDisableLastKnownGood NtDisableLastKnownGood
__asm__(".intel_syntax noprefix \n\
_NtDisableLastKnownGood: \n\
    push 0x7BAA4570 \n\
    call _WhisperMain \n\
");


#define ZwDisplayString NtDisplayString
__asm__(".intel_syntax noprefix \n\
_NtDisplayString: \n\
    push 0xFEA3D422 \n\
    call _WhisperMain \n\
");


#define ZwDrawText NtDrawText
__asm__(".intel_syntax noprefix \n\
_NtDrawText: \n\
    push 0x12AB093C \n\
    call _WhisperMain \n\
");


#define ZwEnableLastKnownGood NtEnableLastKnownGood
__asm__(".intel_syntax noprefix \n\
_NtEnableLastKnownGood: \n\
    push 0xE47B9E7D \n\
    call _WhisperMain \n\
");


#define ZwEnumerateBootEntries NtEnumerateBootEntries
__asm__(".intel_syntax noprefix \n\
_NtEnumerateBootEntries: \n\
    push 0x18CD1B51 \n\
    call _WhisperMain \n\
");


#define ZwEnumerateDriverEntries NtEnumerateDriverEntries
__asm__(".intel_syntax noprefix \n\
_NtEnumerateDriverEntries: \n\
    push 0xE8DC14B4 \n\
    call _WhisperMain \n\
");


#define ZwEnumerateSystemEnvironmentValuesEx NtEnumerateSystemEnvironmentValuesEx
__asm__(".intel_syntax noprefix \n\
_NtEnumerateSystemEnvironmentValuesEx: \n\
    push 0x1D90CDC8 \n\
    call _WhisperMain \n\
");


#define ZwEnumerateTransactionObject NtEnumerateTransactionObject
__asm__(".intel_syntax noprefix \n\
_NtEnumerateTransactionObject: \n\
    push 0x1935E84B \n\
    call _WhisperMain \n\
");


#define ZwExtendSection NtExtendSection
__asm__(".intel_syntax noprefix \n\
_NtExtendSection: \n\
    push 0x3368ECC1 \n\
    call _WhisperMain \n\
");


#define ZwFilterBootOption NtFilterBootOption
__asm__(".intel_syntax noprefix \n\
_NtFilterBootOption: \n\
    push 0x0CA6CEF6 \n\
    call _WhisperMain \n\
");


#define ZwFilterToken NtFilterToken
__asm__(".intel_syntax noprefix \n\
_NtFilterToken: \n\
    push 0x6420B86E \n\
    call _WhisperMain \n\
");


#define ZwFilterTokenEx NtFilterTokenEx
__asm__(".intel_syntax noprefix \n\
_NtFilterTokenEx: \n\
    push 0xA64FA2F0 \n\
    call _WhisperMain \n\
");


#define ZwFlushBuffersFileEx NtFlushBuffersFileEx
__asm__(".intel_syntax noprefix \n\
_NtFlushBuffersFileEx: \n\
    push 0xAA399A81 \n\
    call _WhisperMain \n\
");


#define ZwFlushInstallUILanguage NtFlushInstallUILanguage
__asm__(".intel_syntax noprefix \n\
_NtFlushInstallUILanguage: \n\
    push 0xBB895C88 \n\
    call _WhisperMain \n\
");


#define ZwFlushInstructionCache NtFlushInstructionCache
__asm__(".intel_syntax noprefix \n\
_NtFlushInstructionCache: \n\
    push 0x8B588FF9 \n\
    call _WhisperMain \n\
");


#define ZwFlushKey NtFlushKey
__asm__(".intel_syntax noprefix \n\
_NtFlushKey: \n\
    push 0x1C1F79E3 \n\
    call _WhisperMain \n\
");


#define ZwFlushProcessWriteBuffers NtFlushProcessWriteBuffers
__asm__(".intel_syntax noprefix \n\
_NtFlushProcessWriteBuffers: \n\
    push 0x00BF0C2E \n\
    call _WhisperMain \n\
");


#define ZwFlushVirtualMemory NtFlushVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtFlushVirtualMemory: \n\
    push 0xC9D12CBE \n\
    call _WhisperMain \n\
");


#define ZwFlushWriteBuffer NtFlushWriteBuffer
__asm__(".intel_syntax noprefix \n\
_NtFlushWriteBuffer: \n\
    push 0x831AAD8B \n\
    call _WhisperMain \n\
");


#define ZwFreeUserPhysicalPages NtFreeUserPhysicalPages
__asm__(".intel_syntax noprefix \n\
_NtFreeUserPhysicalPages: \n\
    push 0x81BCB61C \n\
    call _WhisperMain \n\
");


#define ZwFreezeRegistry NtFreezeRegistry
__asm__(".intel_syntax noprefix \n\
_NtFreezeRegistry: \n\
    push 0x008B0607 \n\
    call _WhisperMain \n\
");


#define ZwFreezeTransactions NtFreezeTransactions
__asm__(".intel_syntax noprefix \n\
_NtFreezeTransactions: \n\
    push 0x4F9D3777 \n\
    call _WhisperMain \n\
");


#define ZwGetCachedSigningLevel NtGetCachedSigningLevel
__asm__(".intel_syntax noprefix \n\
_NtGetCachedSigningLevel: \n\
    push 0xB67AF0C0 \n\
    call _WhisperMain \n\
");


#define ZwGetCompleteWnfStateSubscription NtGetCompleteWnfStateSubscription
__asm__(".intel_syntax noprefix \n\
_NtGetCompleteWnfStateSubscription: \n\
    push 0x3CB13C23 \n\
    call _WhisperMain \n\
");


#define ZwGetContextThread NtGetContextThread
__asm__(".intel_syntax noprefix \n\
_NtGetContextThread: \n\
    push 0xF4C8FE5F \n\
    call _WhisperMain \n\
");


#define ZwGetCurrentProcessorNumber NtGetCurrentProcessorNumber
__asm__(".intel_syntax noprefix \n\
_NtGetCurrentProcessorNumber: \n\
    push 0xD7B2C512 \n\
    call _WhisperMain \n\
");


#define ZwGetCurrentProcessorNumberEx NtGetCurrentProcessorNumberEx
__asm__(".intel_syntax noprefix \n\
_NtGetCurrentProcessorNumberEx: \n\
    push 0x10AFC3F5 \n\
    call _WhisperMain \n\
");


#define ZwGetDevicePowerState NtGetDevicePowerState
__asm__(".intel_syntax noprefix \n\
_NtGetDevicePowerState: \n\
    push 0x36B61836 \n\
    call _WhisperMain \n\
");


#define ZwGetMUIRegistryInfo NtGetMUIRegistryInfo
__asm__(".intel_syntax noprefix \n\
_NtGetMUIRegistryInfo: \n\
    push 0x6A10444F \n\
    call _WhisperMain \n\
");


#define ZwGetNextProcess NtGetNextProcess
__asm__(".intel_syntax noprefix \n\
_NtGetNextProcess: \n\
    push 0x015FE333 \n\
    call _WhisperMain \n\
");


#define ZwGetNextThread NtGetNextThread
__asm__(".intel_syntax noprefix \n\
_NtGetNextThread: \n\
    push 0x306C32D5 \n\
    call _WhisperMain \n\
");


#define ZwGetNlsSectionPtr NtGetNlsSectionPtr
__asm__(".intel_syntax noprefix \n\
_NtGetNlsSectionPtr: \n\
    push 0x3E16219F \n\
    call _WhisperMain \n\
");


#define ZwGetNotificationResourceManager NtGetNotificationResourceManager
__asm__(".intel_syntax noprefix \n\
_NtGetNotificationResourceManager: \n\
    push 0x0F9F6B42 \n\
    call _WhisperMain \n\
");


#define ZwGetWriteWatch NtGetWriteWatch
__asm__(".intel_syntax noprefix \n\
_NtGetWriteWatch: \n\
    push 0xAD6FD7FD \n\
    call _WhisperMain \n\
");


#define ZwImpersonateAnonymousToken NtImpersonateAnonymousToken
__asm__(".intel_syntax noprefix \n\
_NtImpersonateAnonymousToken: \n\
    push 0x3016E42C \n\
    call _WhisperMain \n\
");


#define ZwImpersonateThread NtImpersonateThread
__asm__(".intel_syntax noprefix \n\
_NtImpersonateThread: \n\
    push 0x328E1037 \n\
    call _WhisperMain \n\
");


#define ZwInitializeEnclave NtInitializeEnclave
__asm__(".intel_syntax noprefix \n\
_NtInitializeEnclave: \n\
    push 0xF0AEDA22 \n\
    call _WhisperMain \n\
");


#define ZwInitializeNlsFiles NtInitializeNlsFiles
__asm__(".intel_syntax noprefix \n\
_NtInitializeNlsFiles: \n\
    push 0x1317DD54 \n\
    call _WhisperMain \n\
");


#define ZwInitializeRegistry NtInitializeRegistry
__asm__(".intel_syntax noprefix \n\
_NtInitializeRegistry: \n\
    push 0x2C8C342B \n\
    call _WhisperMain \n\
");


#define ZwInitiatePowerAction NtInitiatePowerAction
__asm__(".intel_syntax noprefix \n\
_NtInitiatePowerAction: \n\
    push 0x0EA16475 \n\
    call _WhisperMain \n\
");


#define ZwIsSystemResumeAutomatic NtIsSystemResumeAutomatic
__asm__(".intel_syntax noprefix \n\
_NtIsSystemResumeAutomatic: \n\
    push 0x86887393 \n\
    call _WhisperMain \n\
");


#define ZwIsUILanguageComitted NtIsUILanguageComitted
__asm__(".intel_syntax noprefix \n\
_NtIsUILanguageComitted: \n\
    push 0x63861293 \n\
    call _WhisperMain \n\
");


#define ZwListenPort NtListenPort
__asm__(".intel_syntax noprefix \n\
_NtListenPort: \n\
    push 0xA4AEA130 \n\
    call _WhisperMain \n\
");


#define ZwLoadDriver NtLoadDriver
__asm__(".intel_syntax noprefix \n\
_NtLoadDriver: \n\
    push 0x5CD7764C \n\
    call _WhisperMain \n\
");


#define ZwLoadEnclaveData NtLoadEnclaveData
__asm__(".intel_syntax noprefix \n\
_NtLoadEnclaveData: \n\
    push 0xF303C9D9 \n\
    call _WhisperMain \n\
");


#define ZwLoadHotPatch NtLoadHotPatch
__asm__(".intel_syntax noprefix \n\
_NtLoadHotPatch: \n\
    push 0x9EAF9630 \n\
    call _WhisperMain \n\
");


#define ZwLoadKey NtLoadKey
__asm__(".intel_syntax noprefix \n\
_NtLoadKey: \n\
    push 0x5BE25E61 \n\
    call _WhisperMain \n\
");


#define ZwLoadKey2 NtLoadKey2
__asm__(".intel_syntax noprefix \n\
_NtLoadKey2: \n\
    push 0x3AB9CE3F \n\
    call _WhisperMain \n\
");


#define ZwLoadKeyEx NtLoadKeyEx
__asm__(".intel_syntax noprefix \n\
_NtLoadKeyEx: \n\
    push 0x0584FD84 \n\
    call _WhisperMain \n\
");


#define ZwLockFile NtLockFile
__asm__(".intel_syntax noprefix \n\
_NtLockFile: \n\
    push 0xE038E8AA \n\
    call _WhisperMain \n\
");


#define ZwLockProductActivationKeys NtLockProductActivationKeys
__asm__(".intel_syntax noprefix \n\
_NtLockProductActivationKeys: \n\
    push 0xE742ECD4 \n\
    call _WhisperMain \n\
");


#define ZwLockRegistryKey NtLockRegistryKey
__asm__(".intel_syntax noprefix \n\
_NtLockRegistryKey: \n\
    push 0x6DCB5C4C \n\
    call _WhisperMain \n\
");


#define ZwLockVirtualMemory NtLockVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtLockVirtualMemory: \n\
    push 0x31B4D4DB \n\
    call _WhisperMain \n\
");


#define ZwMakePermanentObject NtMakePermanentObject
__asm__(".intel_syntax noprefix \n\
_NtMakePermanentObject: \n\
    push 0x12017ADC \n\
    call _WhisperMain \n\
");


#define ZwMakeTemporaryObject NtMakeTemporaryObject
__asm__(".intel_syntax noprefix \n\
_NtMakeTemporaryObject: \n\
    push 0x06DD7E31 \n\
    call _WhisperMain \n\
");


#define ZwManagePartition NtManagePartition
__asm__(".intel_syntax noprefix \n\
_NtManagePartition: \n\
    push 0x868D8118 \n\
    call _WhisperMain \n\
");


#define ZwMapCMFModule NtMapCMFModule
__asm__(".intel_syntax noprefix \n\
_NtMapCMFModule: \n\
    push 0x68265372 \n\
    call _WhisperMain \n\
");


#define ZwMapUserPhysicalPages NtMapUserPhysicalPages
__asm__(".intel_syntax noprefix \n\
_NtMapUserPhysicalPages: \n\
    push 0x8DB5F64E \n\
    call _WhisperMain \n\
");


#define ZwMapViewOfSectionEx NtMapViewOfSectionEx
__asm__(".intel_syntax noprefix \n\
_NtMapViewOfSectionEx: \n\
    push 0x60D329E2 \n\
    call _WhisperMain \n\
");


#define ZwModifyBootEntry NtModifyBootEntry
__asm__(".intel_syntax noprefix \n\
_NtModifyBootEntry: \n\
    push 0x09803938 \n\
    call _WhisperMain \n\
");


#define ZwModifyDriverEntry NtModifyDriverEntry
__asm__(".intel_syntax noprefix \n\
_NtModifyDriverEntry: \n\
    push 0x09983950 \n\
    call _WhisperMain \n\
");


#define ZwNotifyChangeDirectoryFile NtNotifyChangeDirectoryFile
__asm__(".intel_syntax noprefix \n\
_NtNotifyChangeDirectoryFile: \n\
    push 0xBC3BAC80 \n\
    call _WhisperMain \n\
");


#define ZwNotifyChangeDirectoryFileEx NtNotifyChangeDirectoryFileEx
__asm__(".intel_syntax noprefix \n\
_NtNotifyChangeDirectoryFileEx: \n\
    push 0x80BBC407 \n\
    call _WhisperMain \n\
");


#define ZwNotifyChangeKey NtNotifyChangeKey
__asm__(".intel_syntax noprefix \n\
_NtNotifyChangeKey: \n\
    push 0x859A6385 \n\
    call _WhisperMain \n\
");


#define ZwNotifyChangeMultipleKeys NtNotifyChangeMultipleKeys
__asm__(".intel_syntax noprefix \n\
_NtNotifyChangeMultipleKeys: \n\
    push 0x8794009F \n\
    call _WhisperMain \n\
");


#define ZwNotifyChangeSession NtNotifyChangeSession
__asm__(".intel_syntax noprefix \n\
_NtNotifyChangeSession: \n\
    push 0x01D750F4 \n\
    call _WhisperMain \n\
");


#define ZwOpenEnlistment NtOpenEnlistment
__asm__(".intel_syntax noprefix \n\
_NtOpenEnlistment: \n\
    push 0x49CB7C4D \n\
    call _WhisperMain \n\
");


#define ZwOpenEventPair NtOpenEventPair
__asm__(".intel_syntax noprefix \n\
_NtOpenEventPair: \n\
    push 0xC292C607 \n\
    call _WhisperMain \n\
");


#define ZwOpenIoCompletion NtOpenIoCompletion
__asm__(".intel_syntax noprefix \n\
_NtOpenIoCompletion: \n\
    push 0x148235D1 \n\
    call _WhisperMain \n\
");


#define ZwOpenJobObject NtOpenJobObject
__asm__(".intel_syntax noprefix \n\
_NtOpenJobObject: \n\
    push 0x82A050FD \n\
    call _WhisperMain \n\
");


#define ZwOpenKeyEx NtOpenKeyEx
__asm__(".intel_syntax noprefix \n\
_NtOpenKeyEx: \n\
    push 0x765A9025 \n\
    call _WhisperMain \n\
");


#define ZwOpenKeyTransacted NtOpenKeyTransacted
__asm__(".intel_syntax noprefix \n\
_NtOpenKeyTransacted: \n\
    push 0xDCBCEE62 \n\
    call _WhisperMain \n\
");


#define ZwOpenKeyTransactedEx NtOpenKeyTransactedEx
__asm__(".intel_syntax noprefix \n\
_NtOpenKeyTransactedEx: \n\
    push 0x26DFE061 \n\
    call _WhisperMain \n\
");


#define ZwOpenKeyedEvent NtOpenKeyedEvent
__asm__(".intel_syntax noprefix \n\
_NtOpenKeyedEvent: \n\
    push 0xC88A2AFD \n\
    call _WhisperMain \n\
");


#define ZwOpenMutant NtOpenMutant
__asm__(".intel_syntax noprefix \n\
_NtOpenMutant: \n\
    push 0x72E27B7E \n\
    call _WhisperMain \n\
");


#define ZwOpenObjectAuditAlarm NtOpenObjectAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtOpenObjectAuditAlarm: \n\
    push 0x0A85261A \n\
    call _WhisperMain \n\
");


#define ZwOpenPartition NtOpenPartition
__asm__(".intel_syntax noprefix \n\
_NtOpenPartition: \n\
    push 0xB4AA53BA \n\
    call _WhisperMain \n\
");


#define ZwOpenPrivateNamespace NtOpenPrivateNamespace
__asm__(".intel_syntax noprefix \n\
_NtOpenPrivateNamespace: \n\
    push 0x1EAE213C \n\
    call _WhisperMain \n\
");


#define ZwOpenProcessToken NtOpenProcessToken
__asm__(".intel_syntax noprefix \n\
_NtOpenProcessToken: \n\
    push 0xE5219BE2 \n\
    call _WhisperMain \n\
");


#define ZwOpenRegistryTransaction NtOpenRegistryTransaction
__asm__(".intel_syntax noprefix \n\
_NtOpenRegistryTransaction: \n\
    push 0x1E40D914 \n\
    call _WhisperMain \n\
");


#define ZwOpenResourceManager NtOpenResourceManager
__asm__(".intel_syntax noprefix \n\
_NtOpenResourceManager: \n\
    push 0x259D313C \n\
    call _WhisperMain \n\
");


#define ZwOpenSemaphore NtOpenSemaphore
__asm__(".intel_syntax noprefix \n\
_NtOpenSemaphore: \n\
    push 0x4E9A9322 \n\
    call _WhisperMain \n\
");


#define ZwOpenSession NtOpenSession
__asm__(".intel_syntax noprefix \n\
_NtOpenSession: \n\
    push 0xEBCD17AE \n\
    call _WhisperMain \n\
");


#define ZwOpenSymbolicLinkObject NtOpenSymbolicLinkObject
__asm__(".intel_syntax noprefix \n\
_NtOpenSymbolicLinkObject: \n\
    push 0x0FA1372C \n\
    call _WhisperMain \n\
");


#define ZwOpenThread NtOpenThread
__asm__(".intel_syntax noprefix \n\
_NtOpenThread: \n\
    push 0x02315609 \n\
    call _WhisperMain \n\
");


#define ZwOpenTimer NtOpenTimer
__asm__(".intel_syntax noprefix \n\
_NtOpenTimer: \n\
    push 0x6A52E243 \n\
    call _WhisperMain \n\
");


#define ZwOpenTransaction NtOpenTransaction
__asm__(".intel_syntax noprefix \n\
_NtOpenTransaction: \n\
    push 0xE8C19E25 \n\
    call _WhisperMain \n\
");


#define ZwOpenTransactionManager NtOpenTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtOpenTransactionManager: \n\
    push 0x3DA6D7BA \n\
    call _WhisperMain \n\
");


#define ZwPlugPlayControl NtPlugPlayControl
__asm__(".intel_syntax noprefix \n\
_NtPlugPlayControl: \n\
    push 0x4F184BF3 \n\
    call _WhisperMain \n\
");


#define ZwPrePrepareComplete NtPrePrepareComplete
__asm__(".intel_syntax noprefix \n\
_NtPrePrepareComplete: \n\
    push 0x2ED3C45C \n\
    call _WhisperMain \n\
");


#define ZwPrePrepareEnlistment NtPrePrepareEnlistment
__asm__(".intel_syntax noprefix \n\
_NtPrePrepareEnlistment: \n\
    push 0xD9BEC63D \n\
    call _WhisperMain \n\
");


#define ZwPrepareComplete NtPrepareComplete
__asm__(".intel_syntax noprefix \n\
_NtPrepareComplete: \n\
    push 0x089003FE \n\
    call _WhisperMain \n\
");


#define ZwPrepareEnlistment NtPrepareEnlistment
__asm__(".intel_syntax noprefix \n\
_NtPrepareEnlistment: \n\
    push 0xB629CDDE \n\
    call _WhisperMain \n\
");


#define ZwPrivilegeCheck NtPrivilegeCheck
__asm__(".intel_syntax noprefix \n\
_NtPrivilegeCheck: \n\
    push 0x0AA6F9F8 \n\
    call _WhisperMain \n\
");


#define ZwPrivilegeObjectAuditAlarm NtPrivilegeObjectAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtPrivilegeObjectAuditAlarm: \n\
    push 0x10AEEAC2 \n\
    call _WhisperMain \n\
");


#define ZwPrivilegedServiceAuditAlarm NtPrivilegedServiceAuditAlarm
__asm__(".intel_syntax noprefix \n\
_NtPrivilegedServiceAuditAlarm: \n\
    push 0x905F1D46 \n\
    call _WhisperMain \n\
");


#define ZwPropagationComplete NtPropagationComplete
__asm__(".intel_syntax noprefix \n\
_NtPropagationComplete: \n\
    push 0x1CB9FEF6 \n\
    call _WhisperMain \n\
");


#define ZwPropagationFailed NtPropagationFailed
__asm__(".intel_syntax noprefix \n\
_NtPropagationFailed: \n\
    push 0x9E997DC7 \n\
    call _WhisperMain \n\
");


#define ZwPulseEvent NtPulseEvent
__asm__(".intel_syntax noprefix \n\
_NtPulseEvent: \n\
    push 0xF64AC7EC \n\
    call _WhisperMain \n\
");


#define ZwQueryAuxiliaryCounterFrequency NtQueryAuxiliaryCounterFrequency
__asm__(".intel_syntax noprefix \n\
_NtQueryAuxiliaryCounterFrequency: \n\
    push 0x3BB11617 \n\
    call _WhisperMain \n\
");


#define ZwQueryBootEntryOrder NtQueryBootEntryOrder
__asm__(".intel_syntax noprefix \n\
_NtQueryBootEntryOrder: \n\
    push 0x87AE138D \n\
    call _WhisperMain \n\
");


#define ZwQueryBootOptions NtQueryBootOptions
__asm__(".intel_syntax noprefix \n\
_NtQueryBootOptions: \n\
    push 0xC5A93FC1 \n\
    call _WhisperMain \n\
");


#define ZwQueryDebugFilterState NtQueryDebugFilterState
__asm__(".intel_syntax noprefix \n\
_NtQueryDebugFilterState: \n\
    push 0xF6B518F4 \n\
    call _WhisperMain \n\
");


#define ZwQueryDirectoryFileEx NtQueryDirectoryFileEx
__asm__(".intel_syntax noprefix \n\
_NtQueryDirectoryFileEx: \n\
    push 0x2C37108C \n\
    call _WhisperMain \n\
");


#define ZwQueryDirectoryObject NtQueryDirectoryObject
__asm__(".intel_syntax noprefix \n\
_NtQueryDirectoryObject: \n\
    push 0x163D38A6 \n\
    call _WhisperMain \n\
");


#define ZwQueryDriverEntryOrder NtQueryDriverEntryOrder
__asm__(".intel_syntax noprefix \n\
_NtQueryDriverEntryOrder: \n\
    push 0xB3869513 \n\
    call _WhisperMain \n\
");


#define ZwQueryEaFile NtQueryEaFile
__asm__(".intel_syntax noprefix \n\
_NtQueryEaFile: \n\
    push 0x6432B598 \n\
    call _WhisperMain \n\
");


#define ZwQueryFullAttributesFile NtQueryFullAttributesFile
__asm__(".intel_syntax noprefix \n\
_NtQueryFullAttributesFile: \n\
    push 0x1C7DC8CE \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationAtom NtQueryInformationAtom
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationAtom: \n\
    push 0xA938CD31 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationByName NtQueryInformationByName
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationByName: \n\
    push 0xF42B87FD \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationEnlistment NtQueryInformationEnlistment
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationEnlistment: \n\
    push 0xD448F7DE \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationJobObject NtQueryInformationJobObject
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationJobObject: \n\
    push 0x72508F50 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationPort NtQueryInformationPort
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationPort: \n\
    push 0xE579FCD7 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationResourceManager NtQueryInformationResourceManager
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationResourceManager: \n\
    push 0xE7577177 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationTransaction NtQueryInformationTransaction
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationTransaction: \n\
    push 0x02172C8F \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationTransactionManager NtQueryInformationTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationTransactionManager: \n\
    push 0xC5992AE5 \n\
    call _WhisperMain \n\
");


#define ZwQueryInformationWorkerFactory NtQueryInformationWorkerFactory
__asm__(".intel_syntax noprefix \n\
_NtQueryInformationWorkerFactory: \n\
    push 0xFC95CA39 \n\
    call _WhisperMain \n\
");


#define ZwQueryInstallUILanguage NtQueryInstallUILanguage
__asm__(".intel_syntax noprefix \n\
_NtQueryInstallUILanguage: \n\
    push 0x1342D01A \n\
    call _WhisperMain \n\
");


#define ZwQueryIntervalProfile NtQueryIntervalProfile
__asm__(".intel_syntax noprefix \n\
_NtQueryIntervalProfile: \n\
    push 0x28A07664 \n\
    call _WhisperMain \n\
");


#define ZwQueryIoCompletion NtQueryIoCompletion
__asm__(".intel_syntax noprefix \n\
_NtQueryIoCompletion: \n\
    push 0x9F36A3B4 \n\
    call _WhisperMain \n\
");


#define ZwQueryLicenseValue NtQueryLicenseValue
__asm__(".intel_syntax noprefix \n\
_NtQueryLicenseValue: \n\
    push 0xB421DA2A \n\
    call _WhisperMain \n\
");


#define ZwQueryMultipleValueKey NtQueryMultipleValueKey
__asm__(".intel_syntax noprefix \n\
_NtQueryMultipleValueKey: \n\
    push 0x4195622C \n\
    call _WhisperMain \n\
");


#define ZwQueryMutant NtQueryMutant
__asm__(".intel_syntax noprefix \n\
_NtQueryMutant: \n\
    push 0xF453CDE6 \n\
    call _WhisperMain \n\
");


#define ZwQueryOpenSubKeys NtQueryOpenSubKeys
__asm__(".intel_syntax noprefix \n\
_NtQueryOpenSubKeys: \n\
    push 0x8AD0A572 \n\
    call _WhisperMain \n\
");


#define ZwQueryOpenSubKeysEx NtQueryOpenSubKeysEx
__asm__(".intel_syntax noprefix \n\
_NtQueryOpenSubKeysEx: \n\
    push 0xAFA3F576 \n\
    call _WhisperMain \n\
");


#define ZwQueryPortInformationProcess NtQueryPortInformationProcess
__asm__(".intel_syntax noprefix \n\
_NtQueryPortInformationProcess: \n\
    push 0x41D4444C \n\
    call _WhisperMain \n\
");


#define ZwQueryQuotaInformationFile NtQueryQuotaInformationFile
__asm__(".intel_syntax noprefix \n\
_NtQueryQuotaInformationFile: \n\
    push 0xBAB944BA \n\
    call _WhisperMain \n\
");


#define ZwQuerySecurityAttributesToken NtQuerySecurityAttributesToken
__asm__(".intel_syntax noprefix \n\
_NtQuerySecurityAttributesToken: \n\
    push 0x32153A8F \n\
    call _WhisperMain \n\
");


#define ZwQuerySecurityObject NtQuerySecurityObject
__asm__(".intel_syntax noprefix \n\
_NtQuerySecurityObject: \n\
    push 0x36AB5EB7 \n\
    call _WhisperMain \n\
");


#define ZwQuerySecurityPolicy NtQuerySecurityPolicy
__asm__(".intel_syntax noprefix \n\
_NtQuerySecurityPolicy: \n\
    push 0x3C8B013F \n\
    call _WhisperMain \n\
");


#define ZwQuerySemaphore NtQuerySemaphore
__asm__(".intel_syntax noprefix \n\
_NtQuerySemaphore: \n\
    push 0x43560DF0 \n\
    call _WhisperMain \n\
");


#define ZwQuerySymbolicLinkObject NtQuerySymbolicLinkObject
__asm__(".intel_syntax noprefix \n\
_NtQuerySymbolicLinkObject: \n\
    push 0x1435FC29 \n\
    call _WhisperMain \n\
");


#define ZwQuerySystemEnvironmentValue NtQuerySystemEnvironmentValue
__asm__(".intel_syntax noprefix \n\
_NtQuerySystemEnvironmentValue: \n\
    push 0xFC20F3C0 \n\
    call _WhisperMain \n\
");


#define ZwQuerySystemEnvironmentValueEx NtQuerySystemEnvironmentValueEx
__asm__(".intel_syntax noprefix \n\
_NtQuerySystemEnvironmentValueEx: \n\
    push 0xFFE0FB5C \n\
    call _WhisperMain \n\
");


#define ZwQuerySystemInformationEx NtQuerySystemInformationEx
__asm__(".intel_syntax noprefix \n\
_NtQuerySystemInformationEx: \n\
    push 0x969554AE \n\
    call _WhisperMain \n\
");


#define ZwQueryTimerResolution NtQueryTimerResolution
__asm__(".intel_syntax noprefix \n\
_NtQueryTimerResolution: \n\
    push 0x48D26801 \n\
    call _WhisperMain \n\
");


#define ZwQueryWnfStateData NtQueryWnfStateData
__asm__(".intel_syntax noprefix \n\
_NtQueryWnfStateData: \n\
    push 0x62FB700A \n\
    call _WhisperMain \n\
");


#define ZwQueryWnfStateNameInformation NtQueryWnfStateNameInformation
__asm__(".intel_syntax noprefix \n\
_NtQueryWnfStateNameInformation: \n\
    push 0xDE44DED7 \n\
    call _WhisperMain \n\
");


#define ZwQueueApcThreadEx NtQueueApcThreadEx
__asm__(".intel_syntax noprefix \n\
_NtQueueApcThreadEx: \n\
    push 0x2A3E6884 \n\
    call _WhisperMain \n\
");


#define ZwRaiseException NtRaiseException
__asm__(".intel_syntax noprefix \n\
_NtRaiseException: \n\
    push 0xC149205A \n\
    call _WhisperMain \n\
");


#define ZwRaiseHardError NtRaiseHardError
__asm__(".intel_syntax noprefix \n\
_NtRaiseHardError: \n\
    push 0x07982B3B \n\
    call _WhisperMain \n\
");


#define ZwReadOnlyEnlistment NtReadOnlyEnlistment
__asm__(".intel_syntax noprefix \n\
_NtReadOnlyEnlistment: \n\
    push 0x0FA90E3B \n\
    call _WhisperMain \n\
");


#define ZwRecoverEnlistment NtRecoverEnlistment
__asm__(".intel_syntax noprefix \n\
_NtRecoverEnlistment: \n\
    push 0x9B359EA3 \n\
    call _WhisperMain \n\
");


#define ZwRecoverResourceManager NtRecoverResourceManager
__asm__(".intel_syntax noprefix \n\
_NtRecoverResourceManager: \n\
    push 0x6833B099 \n\
    call _WhisperMain \n\
");


#define ZwRecoverTransactionManager NtRecoverTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtRecoverTransactionManager: \n\
    push 0x3FA81530 \n\
    call _WhisperMain \n\
");


#define ZwRegisterProtocolAddressInformation NtRegisterProtocolAddressInformation
__asm__(".intel_syntax noprefix \n\
_NtRegisterProtocolAddressInformation: \n\
    push 0x180F7E1F \n\
    call _WhisperMain \n\
");


#define ZwRegisterThreadTerminatePort NtRegisterThreadTerminatePort
__asm__(".intel_syntax noprefix \n\
_NtRegisterThreadTerminatePort: \n\
    push 0x20B2C6E0 \n\
    call _WhisperMain \n\
");


#define ZwReleaseKeyedEvent NtReleaseKeyedEvent
__asm__(".intel_syntax noprefix \n\
_NtReleaseKeyedEvent: \n\
    push 0xCE4EDBCC \n\
    call _WhisperMain \n\
");


#define ZwReleaseWorkerFactoryWorker NtReleaseWorkerFactoryWorker
__asm__(".intel_syntax noprefix \n\
_NtReleaseWorkerFactoryWorker: \n\
    push 0xF86DD6B5 \n\
    call _WhisperMain \n\
");


#define ZwRemoveIoCompletionEx NtRemoveIoCompletionEx
__asm__(".intel_syntax noprefix \n\
_NtRemoveIoCompletionEx: \n\
    push 0x8416B2A8 \n\
    call _WhisperMain \n\
");


#define ZwRemoveProcessDebug NtRemoveProcessDebug
__asm__(".intel_syntax noprefix \n\
_NtRemoveProcessDebug: \n\
    push 0xAA3A6912 \n\
    call _WhisperMain \n\
");


#define ZwRenameKey NtRenameKey
__asm__(".intel_syntax noprefix \n\
_NtRenameKey: \n\
    push 0x3AF26529 \n\
    call _WhisperMain \n\
");


#define ZwRenameTransactionManager NtRenameTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtRenameTransactionManager: \n\
    push 0xC79EDC37 \n\
    call _WhisperMain \n\
");


#define ZwReplaceKey NtReplaceKey
__asm__(".intel_syntax noprefix \n\
_NtReplaceKey: \n\
    push 0x8AD7A178 \n\
    call _WhisperMain \n\
");


#define ZwReplacePartitionUnit NtReplacePartitionUnit
__asm__(".intel_syntax noprefix \n\
_NtReplacePartitionUnit: \n\
    push 0x26332AA8 \n\
    call _WhisperMain \n\
");


#define ZwReplyWaitReplyPort NtReplyWaitReplyPort
__asm__(".intel_syntax noprefix \n\
_NtReplyWaitReplyPort: \n\
    push 0xA0358FAE \n\
    call _WhisperMain \n\
");


#define ZwRequestPort NtRequestPort
__asm__(".intel_syntax noprefix \n\
_NtRequestPort: \n\
    push 0xE97EF6F5 \n\
    call _WhisperMain \n\
");


#define ZwResetEvent NtResetEvent
__asm__(".intel_syntax noprefix \n\
_NtResetEvent: \n\
    push 0xCF127F37 \n\
    call _WhisperMain \n\
");


#define ZwResetWriteWatch NtResetWriteWatch
__asm__(".intel_syntax noprefix \n\
_NtResetWriteWatch: \n\
    push 0xC2B1C912 \n\
    call _WhisperMain \n\
");


#define ZwRestoreKey NtRestoreKey
__asm__(".intel_syntax noprefix \n\
_NtRestoreKey: \n\
    push 0x96A2F748 \n\
    call _WhisperMain \n\
");


#define ZwResumeProcess NtResumeProcess
__asm__(".intel_syntax noprefix \n\
_NtResumeProcess: \n\
    push 0x722C69A1 \n\
    call _WhisperMain \n\
");


#define ZwRevertContainerImpersonation NtRevertContainerImpersonation
__asm__(".intel_syntax noprefix \n\
_NtRevertContainerImpersonation: \n\
    push 0x452E49BD \n\
    call _WhisperMain \n\
");


#define ZwRollbackComplete NtRollbackComplete
__asm__(".intel_syntax noprefix \n\
_NtRollbackComplete: \n\
    push 0x273ABE04 \n\
    call _WhisperMain \n\
");


#define ZwRollbackEnlistment NtRollbackEnlistment
__asm__(".intel_syntax noprefix \n\
_NtRollbackEnlistment: \n\
    push 0x7E421BDA \n\
    call _WhisperMain \n\
");


#define ZwRollbackRegistryTransaction NtRollbackRegistryTransaction
__asm__(".intel_syntax noprefix \n\
_NtRollbackRegistryTransaction: \n\
    push 0x0CFE1673 \n\
    call _WhisperMain \n\
");


#define ZwRollbackTransaction NtRollbackTransaction
__asm__(".intel_syntax noprefix \n\
_NtRollbackTransaction: \n\
    push 0x920A969B \n\
    call _WhisperMain \n\
");


#define ZwRollforwardTransactionManager NtRollforwardTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtRollforwardTransactionManager: \n\
    push 0x160644C7 \n\
    call _WhisperMain \n\
");


#define ZwSaveKey NtSaveKey
__asm__(".intel_syntax noprefix \n\
_NtSaveKey: \n\
    push 0x1682C8D5 \n\
    call _WhisperMain \n\
");


#define ZwSaveKeyEx NtSaveKeyEx
__asm__(".intel_syntax noprefix \n\
_NtSaveKeyEx: \n\
    push 0xC457E3E8 \n\
    call _WhisperMain \n\
");


#define ZwSaveMergedKeys NtSaveMergedKeys
__asm__(".intel_syntax noprefix \n\
_NtSaveMergedKeys: \n\
    push 0x67FC6274 \n\
    call _WhisperMain \n\
");


#define ZwSecureConnectPort NtSecureConnectPort
__asm__(".intel_syntax noprefix \n\
_NtSecureConnectPort: \n\
    push 0x608E592C \n\
    call _WhisperMain \n\
");


#define ZwSerializeBoot NtSerializeBoot
__asm__(".intel_syntax noprefix \n\
_NtSerializeBoot: \n\
    push 0x72E24C61 \n\
    call _WhisperMain \n\
");


#define ZwSetBootEntryOrder NtSetBootEntryOrder
__asm__(".intel_syntax noprefix \n\
_NtSetBootEntryOrder: \n\
    push 0x33B61D2B \n\
    call _WhisperMain \n\
");


#define ZwSetBootOptions NtSetBootOptions
__asm__(".intel_syntax noprefix \n\
_NtSetBootOptions: \n\
    push 0x5387591B \n\
    call _WhisperMain \n\
");


#define ZwSetCachedSigningLevel NtSetCachedSigningLevel
__asm__(".intel_syntax noprefix \n\
_NtSetCachedSigningLevel: \n\
    push 0x2ABAA598 \n\
    call _WhisperMain \n\
");


#define ZwSetCachedSigningLevel2 NtSetCachedSigningLevel2
__asm__(".intel_syntax noprefix \n\
_NtSetCachedSigningLevel2: \n\
    push 0xB29040B5 \n\
    call _WhisperMain \n\
");


#define ZwSetContextThread NtSetContextThread
__asm__(".intel_syntax noprefix \n\
_NtSetContextThread: \n\
    push 0x3CBCE60A \n\
    call _WhisperMain \n\
");


#define ZwSetDebugFilterState NtSetDebugFilterState
__asm__(".intel_syntax noprefix \n\
_NtSetDebugFilterState: \n\
    push 0x3290DBDE \n\
    call _WhisperMain \n\
");


#define ZwSetDefaultHardErrorPort NtSetDefaultHardErrorPort
__asm__(".intel_syntax noprefix \n\
_NtSetDefaultHardErrorPort: \n\
    push 0x257724E9 \n\
    call _WhisperMain \n\
");


#define ZwSetDefaultLocale NtSetDefaultLocale
__asm__(".intel_syntax noprefix \n\
_NtSetDefaultLocale: \n\
    push 0x8D2C8599 \n\
    call _WhisperMain \n\
");


#define ZwSetDefaultUILanguage NtSetDefaultUILanguage
__asm__(".intel_syntax noprefix \n\
_NtSetDefaultUILanguage: \n\
    push 0x8B35AB6E \n\
    call _WhisperMain \n\
");


#define ZwSetDriverEntryOrder NtSetDriverEntryOrder
__asm__(".intel_syntax noprefix \n\
_NtSetDriverEntryOrder: \n\
    push 0x95AEE742 \n\
    call _WhisperMain \n\
");


#define ZwSetEaFile NtSetEaFile
__asm__(".intel_syntax noprefix \n\
_NtSetEaFile: \n\
    push 0xE138E9DD \n\
    call _WhisperMain \n\
");


#define ZwSetHighEventPair NtSetHighEventPair
__asm__(".intel_syntax noprefix \n\
_NtSetHighEventPair: \n\
    push 0x60D47A71 \n\
    call _WhisperMain \n\
");


#define ZwSetHighWaitLowEventPair NtSetHighWaitLowEventPair
__asm__(".intel_syntax noprefix \n\
_NtSetHighWaitLowEventPair: \n\
    push 0x90B19827 \n\
    call _WhisperMain \n\
");


#define ZwSetIRTimer NtSetIRTimer
__asm__(".intel_syntax noprefix \n\
_NtSetIRTimer: \n\
    push 0x8FA8F140 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationDebugObject NtSetInformationDebugObject
__asm__(".intel_syntax noprefix \n\
_NtSetInformationDebugObject: \n\
    push 0x071D79EF \n\
    call _WhisperMain \n\
");


#define ZwSetInformationEnlistment NtSetInformationEnlistment
__asm__(".intel_syntax noprefix \n\
_NtSetInformationEnlistment: \n\
    push 0x0E56E804 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationJobObject NtSetInformationJobObject
__asm__(".intel_syntax noprefix \n\
_NtSetInformationJobObject: \n\
    push 0x73569D24 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationKey NtSetInformationKey
__asm__(".intel_syntax noprefix \n\
_NtSetInformationKey: \n\
    push 0x020837B5 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationResourceManager NtSetInformationResourceManager
__asm__(".intel_syntax noprefix \n\
_NtSetInformationResourceManager: \n\
    push 0xFD9309EA \n\
    call _WhisperMain \n\
");


#define ZwSetInformationSymbolicLink NtSetInformationSymbolicLink
__asm__(".intel_syntax noprefix \n\
_NtSetInformationSymbolicLink: \n\
    push 0xAE3BA6AE \n\
    call _WhisperMain \n\
");


#define ZwSetInformationToken NtSetInformationToken
__asm__(".intel_syntax noprefix \n\
_NtSetInformationToken: \n\
    push 0xAF9FF534 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationTransaction NtSetInformationTransaction
__asm__(".intel_syntax noprefix \n\
_NtSetInformationTransaction: \n\
    push 0x108A361B \n\
    call _WhisperMain \n\
");


#define ZwSetInformationTransactionManager NtSetInformationTransactionManager
__asm__(".intel_syntax noprefix \n\
_NtSetInformationTransactionManager: \n\
    push 0x725FEC74 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationVirtualMemory NtSetInformationVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtSetInformationVirtualMemory: \n\
    push 0x19901313 \n\
    call _WhisperMain \n\
");


#define ZwSetInformationWorkerFactory NtSetInformationWorkerFactory
__asm__(".intel_syntax noprefix \n\
_NtSetInformationWorkerFactory: \n\
    push 0x0A8E1816 \n\
    call _WhisperMain \n\
");


#define ZwSetIntervalProfile NtSetIntervalProfile
__asm__(".intel_syntax noprefix \n\
_NtSetIntervalProfile: \n\
    push 0x3499AE98 \n\
    call _WhisperMain \n\
");


#define ZwSetIoCompletion NtSetIoCompletion
__asm__(".intel_syntax noprefix \n\
_NtSetIoCompletion: \n\
    push 0x9681921B \n\
    call _WhisperMain \n\
");


#define ZwSetIoCompletionEx NtSetIoCompletionEx
__asm__(".intel_syntax noprefix \n\
_NtSetIoCompletionEx: \n\
    push 0x989A24BE \n\
    call _WhisperMain \n\
");


#define ZwSetLdtEntries NtSetLdtEntries
__asm__(".intel_syntax noprefix \n\
_NtSetLdtEntries: \n\
    push 0xB91DBA86 \n\
    call _WhisperMain \n\
");


#define ZwSetLowEventPair NtSetLowEventPair
__asm__(".intel_syntax noprefix \n\
_NtSetLowEventPair: \n\
    push 0x10B7C4F1 \n\
    call _WhisperMain \n\
");


#define ZwSetLowWaitHighEventPair NtSetLowWaitHighEventPair
__asm__(".intel_syntax noprefix \n\
_NtSetLowWaitHighEventPair: \n\
    push 0xE4D1D40C \n\
    call _WhisperMain \n\
");


#define ZwSetQuotaInformationFile NtSetQuotaInformationFile
__asm__(".intel_syntax noprefix \n\
_NtSetQuotaInformationFile: \n\
    push 0x68FEA148 \n\
    call _WhisperMain \n\
");


#define ZwSetSecurityObject NtSetSecurityObject
__asm__(".intel_syntax noprefix \n\
_NtSetSecurityObject: \n\
    push 0x1A2464D9 \n\
    call _WhisperMain \n\
");


#define ZwSetSystemEnvironmentValue NtSetSystemEnvironmentValue
__asm__(".intel_syntax noprefix \n\
_NtSetSystemEnvironmentValue: \n\
    push 0xC256ED92 \n\
    call _WhisperMain \n\
");


#define ZwSetSystemEnvironmentValueEx NtSetSystemEnvironmentValueEx
__asm__(".intel_syntax noprefix \n\
_NtSetSystemEnvironmentValueEx: \n\
    push 0x2FC4F2A1 \n\
    call _WhisperMain \n\
");


#define ZwSetSystemInformation NtSetSystemInformation
__asm__(".intel_syntax noprefix \n\
_NtSetSystemInformation: \n\
    push 0x9C069A9F \n\
    call _WhisperMain \n\
");


#define ZwSetSystemPowerState NtSetSystemPowerState
__asm__(".intel_syntax noprefix \n\
_NtSetSystemPowerState: \n\
    push 0x1F3D8800 \n\
    call _WhisperMain \n\
");


#define ZwSetSystemTime NtSetSystemTime
__asm__(".intel_syntax noprefix \n\
_NtSetSystemTime: \n\
    push 0x94B3C98B \n\
    call _WhisperMain \n\
");


#define ZwSetThreadExecutionState NtSetThreadExecutionState
__asm__(".intel_syntax noprefix \n\
_NtSetThreadExecutionState: \n\
    push 0x00BA2834 \n\
    call _WhisperMain \n\
");


#define ZwSetTimer2 NtSetTimer2
__asm__(".intel_syntax noprefix \n\
_NtSetTimer2: \n\
    push 0x11A97007 \n\
    call _WhisperMain \n\
");


#define ZwSetTimerEx NtSetTimerEx
__asm__(".intel_syntax noprefix \n\
_NtSetTimerEx: \n\
    push 0x30B7726C \n\
    call _WhisperMain \n\
");


#define ZwSetTimerResolution NtSetTimerResolution
__asm__(".intel_syntax noprefix \n\
_NtSetTimerResolution: \n\
    push 0xD649F6D7 \n\
    call _WhisperMain \n\
");


#define ZwSetUuidSeed NtSetUuidSeed
__asm__(".intel_syntax noprefix \n\
_NtSetUuidSeed: \n\
    push 0x158DD430 \n\
    call _WhisperMain \n\
");


#define ZwSetVolumeInformationFile NtSetVolumeInformationFile
__asm__(".intel_syntax noprefix \n\
_NtSetVolumeInformationFile: \n\
    push 0xD8CB47F8 \n\
    call _WhisperMain \n\
");


#define ZwSetWnfProcessNotificationEvent NtSetWnfProcessNotificationEvent
__asm__(".intel_syntax noprefix \n\
_NtSetWnfProcessNotificationEvent: \n\
    push 0x3E941334 \n\
    call _WhisperMain \n\
");


#define ZwShutdownSystem NtShutdownSystem
__asm__(".intel_syntax noprefix \n\
_NtShutdownSystem: \n\
    push 0x068CFEC7 \n\
    call _WhisperMain \n\
");


#define ZwShutdownWorkerFactory NtShutdownWorkerFactory
__asm__(".intel_syntax noprefix \n\
_NtShutdownWorkerFactory: \n\
    push 0x0898362C \n\
    call _WhisperMain \n\
");


#define ZwSignalAndWaitForSingleObject NtSignalAndWaitForSingleObject
__asm__(".intel_syntax noprefix \n\
_NtSignalAndWaitForSingleObject: \n\
    push 0x00BE0E03 \n\
    call _WhisperMain \n\
");


#define ZwSinglePhaseReject NtSinglePhaseReject
__asm__(".intel_syntax noprefix \n\
_NtSinglePhaseReject: \n\
    push 0x1AA13E39 \n\
    call _WhisperMain \n\
");


#define ZwStartProfile NtStartProfile
__asm__(".intel_syntax noprefix \n\
_NtStartProfile: \n\
    push 0x289C722C \n\
    call _WhisperMain \n\
");


#define ZwStopProfile NtStopProfile
__asm__(".intel_syntax noprefix \n\
_NtStopProfile: \n\
    push 0xC88938DF \n\
    call _WhisperMain \n\
");


#define ZwSubscribeWnfStateChange NtSubscribeWnfStateChange
__asm__(".intel_syntax noprefix \n\
_NtSubscribeWnfStateChange: \n\
    push 0x22A16304 \n\
    call _WhisperMain \n\
");


#define ZwSuspendProcess NtSuspendProcess
__asm__(".intel_syntax noprefix \n\
_NtSuspendProcess: \n\
    push 0x519C7000 \n\
    call _WhisperMain \n\
");


#define ZwSuspendThread NtSuspendThread
__asm__(".intel_syntax noprefix \n\
_NtSuspendThread: \n\
    push 0x3A1F24BD \n\
    call _WhisperMain \n\
");


#define ZwSystemDebugControl NtSystemDebugControl
__asm__(".intel_syntax noprefix \n\
_NtSystemDebugControl: \n\
    push 0xC09EC476 \n\
    call _WhisperMain \n\
");


#define ZwTerminateEnclave NtTerminateEnclave
__asm__(".intel_syntax noprefix \n\
_NtTerminateEnclave: \n\
    push 0xEE33C6FE \n\
    call _WhisperMain \n\
");


#define ZwTerminateJobObject NtTerminateJobObject
__asm__(".intel_syntax noprefix \n\
_NtTerminateJobObject: \n\
    push 0xBAB8B224 \n\
    call _WhisperMain \n\
");


#define ZwTestAlert NtTestAlert
__asm__(".intel_syntax noprefix \n\
_NtTestAlert: \n\
    push 0x4ED13358 \n\
    call _WhisperMain \n\
");


#define ZwThawRegistry NtThawRegistry
__asm__(".intel_syntax noprefix \n\
_NtThawRegistry: \n\
    push 0x06EF4E21 \n\
    call _WhisperMain \n\
");


#define ZwThawTransactions NtThawTransactions
__asm__(".intel_syntax noprefix \n\
_NtThawTransactions: \n\
    push 0x0796193D \n\
    call _WhisperMain \n\
");


#define ZwTraceControl NtTraceControl
__asm__(".intel_syntax noprefix \n\
_NtTraceControl: \n\
    push 0xDF8A2BDD \n\
    call _WhisperMain \n\
");


#define ZwTranslateFilePath NtTranslateFilePath
__asm__(".intel_syntax noprefix \n\
_NtTranslateFilePath: \n\
    push 0xFA3081FC \n\
    call _WhisperMain \n\
");


#define ZwUmsThreadYield NtUmsThreadYield
__asm__(".intel_syntax noprefix \n\
_NtUmsThreadYield: \n\
    push 0xF85A28EE \n\
    call _WhisperMain \n\
");


#define ZwUnloadDriver NtUnloadDriver
__asm__(".intel_syntax noprefix \n\
_NtUnloadDriver: \n\
    push 0xD69F05C1 \n\
    call _WhisperMain \n\
");


#define ZwUnloadKey NtUnloadKey
__asm__(".intel_syntax noprefix \n\
_NtUnloadKey: \n\
    push 0xEA3E8DCD \n\
    call _WhisperMain \n\
");


#define ZwUnloadKey2 NtUnloadKey2
__asm__(".intel_syntax noprefix \n\
_NtUnloadKey2: \n\
    push 0x27D4615C \n\
    call _WhisperMain \n\
");


#define ZwUnloadKeyEx NtUnloadKeyEx
__asm__(".intel_syntax noprefix \n\
_NtUnloadKeyEx: \n\
    push 0x67F32B36 \n\
    call _WhisperMain \n\
");


#define ZwUnlockFile NtUnlockFile
__asm__(".intel_syntax noprefix \n\
_NtUnlockFile: \n\
    push 0x903DC0F6 \n\
    call _WhisperMain \n\
");


#define ZwUnlockVirtualMemory NtUnlockVirtualMemory
__asm__(".intel_syntax noprefix \n\
_NtUnlockVirtualMemory: \n\
    push 0x98118E80 \n\
    call _WhisperMain \n\
");


#define ZwUnmapViewOfSectionEx NtUnmapViewOfSectionEx
__asm__(".intel_syntax noprefix \n\
_NtUnmapViewOfSectionEx: \n\
    push 0xF29131EB \n\
    call _WhisperMain \n\
");


#define ZwUnsubscribeWnfStateChange NtUnsubscribeWnfStateChange
__asm__(".intel_syntax noprefix \n\
_NtUnsubscribeWnfStateChange: \n\
    push 0x50CE5756 \n\
    call _WhisperMain \n\
");


#define ZwUpdateWnfStateData NtUpdateWnfStateData
__asm__(".intel_syntax noprefix \n\
_NtUpdateWnfStateData: \n\
    push 0xDEDCEA46 \n\
    call _WhisperMain \n\
");


#define ZwVdmControl NtVdmControl
__asm__(".intel_syntax noprefix \n\
_NtVdmControl: \n\
    push 0xBD9039A7 \n\
    call _WhisperMain \n\
");


#define ZwWaitForAlertByThreadId NtWaitForAlertByThreadId
__asm__(".intel_syntax noprefix \n\
_NtWaitForAlertByThreadId: \n\
    push 0x143F7CCA \n\
    call _WhisperMain \n\
");


#define ZwWaitForDebugEvent NtWaitForDebugEvent
__asm__(".intel_syntax noprefix \n\
_NtWaitForDebugEvent: \n\
    push 0x90B06FDA \n\
    call _WhisperMain \n\
");


#define ZwWaitForKeyedEvent NtWaitForKeyedEvent
__asm__(".intel_syntax noprefix \n\
_NtWaitForKeyedEvent: \n\
    push 0xD08A3618 \n\
    call _WhisperMain \n\
");


#define ZwWaitForWorkViaWorkerFactory NtWaitForWorkViaWorkerFactory
__asm__(".intel_syntax noprefix \n\
_NtWaitForWorkViaWorkerFactory: \n\
    push 0xC89DE634 \n\
    call _WhisperMain \n\
");


#define ZwWaitHighEventPair NtWaitHighEventPair
__asm__(".intel_syntax noprefix \n\
_NtWaitHighEventPair: \n\
    push 0xA31DBFB0 \n\
    call _WhisperMain \n\
");


#define ZwWaitLowEventPair NtWaitLowEventPair
__asm__(".intel_syntax noprefix \n\
_NtWaitLowEventPair: \n\
    push 0x50B3B4E5 \n\
    call _WhisperMain \n\
");


#define ZwAcquireCMFViewOwnership NtAcquireCMFViewOwnership
__asm__(".intel_syntax noprefix \n\
_NtAcquireCMFViewOwnership: \n\
    push 0xFA6D1A7A \n\
    call _WhisperMain \n\
");


#define ZwCancelDeviceWakeupRequest NtCancelDeviceWakeupRequest
__asm__(".intel_syntax noprefix \n\
_NtCancelDeviceWakeupRequest: \n\
    push 0x33EDFBB0 \n\
    call _WhisperMain \n\
");


#define ZwClearAllSavepointsTransaction NtClearAllSavepointsTransaction
__asm__(".intel_syntax noprefix \n\
_NtClearAllSavepointsTransaction: \n\
    push 0x0294280D \n\
    call _WhisperMain \n\
");


#define ZwClearSavepointTransaction NtClearSavepointTransaction
__asm__(".intel_syntax noprefix \n\
_NtClearSavepointTransaction: \n\
    push 0x1288301D \n\
    call _WhisperMain \n\
");


#define ZwRollbackSavepointTransaction NtRollbackSavepointTransaction
__asm__(".intel_syntax noprefix \n\
_NtRollbackSavepointTransaction: \n\
    push 0xCB28EFBA \n\
    call _WhisperMain \n\
");


#define ZwSavepointTransaction NtSavepointTransaction
__asm__(".intel_syntax noprefix \n\
_NtSavepointTransaction: \n\
    push 0x009A27CB \n\
    call _WhisperMain \n\
");


#define ZwSavepointComplete NtSavepointComplete
__asm__(".intel_syntax noprefix \n\
_NtSavepointComplete: \n\
    push 0x2AB2163C \n\
    call _WhisperMain \n\
");


#define ZwCreateSectionEx NtCreateSectionEx
__asm__(".intel_syntax noprefix \n\
_NtCreateSectionEx: \n\
    push 0xF8993BC3 \n\
    call _WhisperMain \n\
");


#define ZwCreateCrossVmEvent NtCreateCrossVmEvent
__asm__(".intel_syntax noprefix \n\
_NtCreateCrossVmEvent: \n\
    push 0x92CDBB10 \n\
    call _WhisperMain \n\
");


#define ZwGetPlugPlayEvent NtGetPlugPlayEvent
__asm__(".intel_syntax noprefix \n\
_NtGetPlugPlayEvent: \n\
    push 0x08858F96 \n\
    call _WhisperMain \n\
");


#define ZwListTransactions NtListTransactions
__asm__(".intel_syntax noprefix \n\
_NtListTransactions: \n\
    push 0x0D982B33 \n\
    call _WhisperMain \n\
");


#define ZwMarshallTransaction NtMarshallTransaction
__asm__(".intel_syntax noprefix \n\
_NtMarshallTransaction: \n\
    push 0x2A6FF427 \n\
    call _WhisperMain \n\
");


#define ZwPullTransaction NtPullTransaction
__asm__(".intel_syntax noprefix \n\
_NtPullTransaction: \n\
    push 0x898FA91D \n\
    call _WhisperMain \n\
");


#define ZwReleaseCMFViewOwnership NtReleaseCMFViewOwnership
__asm__(".intel_syntax noprefix \n\
_NtReleaseCMFViewOwnership: \n\
    push 0x0D95254D \n\
    call _WhisperMain \n\
");


#define ZwWaitForWnfNotifications NtWaitForWnfNotifications
__asm__(".intel_syntax noprefix \n\
_NtWaitForWnfNotifications: \n\
    push 0x0D97290D \n\
    call _WhisperMain \n\
");


#define ZwStartTm NtStartTm
__asm__(".intel_syntax noprefix \n\
_NtStartTm: \n\
    push 0x21F27B5C \n\
    call _WhisperMain \n\
");


#define ZwSetInformationProcess NtSetInformationProcess
__asm__(".intel_syntax noprefix \n\
_NtSetInformationProcess: \n\
    push 0x922881A5 \n\
    call _WhisperMain \n\
");


#define ZwRequestDeviceWakeup NtRequestDeviceWakeup
__asm__(".intel_syntax noprefix \n\
_NtRequestDeviceWakeup: \n\
    push 0x03AF3904 \n\
    call _WhisperMain \n\
");


#define ZwRequestWakeupLatency NtRequestWakeupLatency
__asm__(".intel_syntax noprefix \n\
_NtRequestWakeupLatency: \n\
    push 0x3285536C \n\
    call _WhisperMain \n\
");


#define ZwQuerySystemTime NtQuerySystemTime
__asm__(".intel_syntax noprefix \n\
_NtQuerySystemTime: \n\
    push 0x7EB95963 \n\
    call _WhisperMain \n\
");


#define ZwManageHotPatch NtManageHotPatch
__asm__(".intel_syntax noprefix \n\
_NtManageHotPatch: \n\
    push 0x1321D914 \n\
    call _WhisperMain \n\
");


#define ZwContinueEx NtContinueEx
__asm__(".intel_syntax noprefix \n\
_NtContinueEx: \n\
    push 0xF7CEB332 \n\
    call _WhisperMain \n\
");


