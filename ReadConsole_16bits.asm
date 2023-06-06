.model small

count = 80
KEYBOARD STRUCT
    maxInput BYTE count         ;// maximo numero de caracteres a leer
    inputCount BYTE ?           ;// numero de caracteres leidos
    buffer BYTE count DUP('$')  ;// buffer de entrada
KEYBOARD ENDS

.stack 100h

.data
mensaje BYTE "Leido del teclado: ", '$'
kybdData KEYBOARD <>

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset kybdData
    mov ah, 0AH
    int 21h

    mov dx, offset mensaje
    mov ah, 9
    int 21h

    mov dx, offset kybdData.buffer
    mov ah, 9
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main