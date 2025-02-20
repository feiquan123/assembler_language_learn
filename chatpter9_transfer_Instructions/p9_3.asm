assume cs:codeseg

codeseg segment
start:
	mov ax,0
	mov bx,0
	jmp far ptr s ; 段地址，偏移地址
	db 256 dup (0)
s: 
	add ax,1
	inc ax

	; 转移地址在内存中
	mov ax,offset s0
	mov ds:[0],ax
	jmp word ptr ds:[0]  ; 偏移地址
	db 100 dup (0)

s0:
	; 内存 - 段间转移
	mov ax,0123h
	mov ds:[0],ax	; 偏移地址
	mov word ptr ds:[2],0  ; 段地址 
	jmp dword ptr ds:[0] ; 段地址，偏移地址
	db 256 dup (0)

	mov ax,4c00h
	int 21h
codeseg ends
end start