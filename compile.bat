@ECHO OFF

cl .\garts.cpp /nologo /Ox /MT /W0 /GS- /DNDEBUG /EHsc /link User32.lib ntdll.lib /SUBSYSTEM:WINDOWS /OUT:garts.exe /MACHINE:x64


IF "%1"=="-e" (
    garts.exe
    Sleep 2
    del garts.exe
)

