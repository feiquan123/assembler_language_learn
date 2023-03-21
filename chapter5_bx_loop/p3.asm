assume cs:code
code segment
	mov ax,0ffffh
	mov ds,ax
	mov bx,6	; 设置 ds:bx 指向 ffff:6

	mov al,[bx]
	mov ah,0	; 设置 (al) = ((ds*16)+(bx)), (ah) = 0
	mov dx,0	; 累加寄存器清0
	
	mov cx,123	; 循环3次
s: 	add dx,ax
	loop s		; 累加计算 (ax) * 3

	mov ax,4c00h
	int 21h
code ends
end