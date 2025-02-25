assume cs:code,ds:data
data segment
    db 250 dup(2)
data ends

code segment

start:
    mov ax,data
    mov ds,ax
    mov bx,0

s:  
    mov cl,[bx]
    mov ch,0
    je ok
    inc bx
    loop s

ok:
    dec bx
    mov dx,bx
    mov ax,4c00h
    int 21h
code ends
end start