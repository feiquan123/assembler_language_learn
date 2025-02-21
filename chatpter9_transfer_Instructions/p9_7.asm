; 查找 data 段中第一个值为 0 的字节，找到后将它的偏移地址存入 dx 寄存器中
assume cs:code,ds:data
data segment
    db 521 dup (1)
data ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov bx,0

s:
    mov cl,[bx]
    mov ch,0
    jcxz ok
    inc bx
    jmp short s

ok:
    mov dx,bx
    mov ax,4c00h
    int 21h
code ends
end start