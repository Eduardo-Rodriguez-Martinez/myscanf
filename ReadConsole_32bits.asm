; Este programa se ensambla y liga con el siguiente comando:
; ml ReadConsole_32bits.asm /Fe ReadConsole_32bits.exe /link /SUBSYSTEM:CONSOLE /DEFAULTLIB:"C:\Irvine\Kernel32.lib"
TITLE Lee caracteres de la entrada estandar (ReadConsole.asm)

.386
.MODEL flat, stdcall
.STACK 4096

; //Win32 Console handles
STD_INPUT_HANDLE    EQU -10
STD_OUTPUT_HANDLE   EQU -11

GetStdHandle PROTO,		; //get standard handle
	nStdHandle : DWORD	; //type of console handle

ReadConsoleA PROTO,
	hConsoleInput : DWORD,              ; //input handle
	lpBuffer : PTR BYTE,               	; //pointer to buffer
	nNumberOfBytesToRead : DWORD,    	; //number of chars to read
	lpNumberOfCharsRead : PTR DWORD,  	; //ptr to number of bytes read
	lpReserved : DWORD               	; //(not used)

WriteConsoleA PROTO,					; //write a buffer to the console
	hConsoleOutput : DWORD,				; //output handle
	lpBuffer : PTR BYTE,				; //pointer to buffer
	nNumberOfCharsToWrite : DWORD,		; //size of buffer
	lpNumberOfCharsWritten : PTR DWORD,	; //ptr to number of bytes written
	lpReserved : DWORD					; //(not used)

ExitProcess PROTO,		; //exit program
	dwExitCode : DWORD	; //return code

.data
mensaje     BYTE "Leido del teclado: "
buffer      BYTE 80 DUP(?),0,0
longitud    DWORD 19
stdInHandle DWORD ?
bytesRead   DWORD ?

.code
main PROC
    INVOKE GetStdHandle, STD_INPUT_HANDLE
    mov stdInHandle, eax

    INVOKE ReadConsoleA, stdInHandle, ADDR buffer, 80, ADDR bytesRead, 0

    mov eax, bytesRead
    add longitud, eax

    INVOKE GetStdHandle, STD_OUTPUT_HANDLE
    mov stdInHandle, eax

    INVOKE WriteConsoleA, stdInHandle, ADDR mensaje, longitud, ADDR bytesRead, 0

    INVOKE ExitProcess, 0
main endp
end main