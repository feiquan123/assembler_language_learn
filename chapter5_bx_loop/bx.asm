; 初始内存
; BE 	21000H
; 00 	21001H
assume cs:codeseg

codeseg segment

	mov ax,2000h
	mov ds,ax
	mov bx,1000h
	mov ax,[bx]
	inc bx
	inc bx
	mov [bx],ax
	inc bx
	inc bx
	mov [bx],ax
	inc bx
	mov [bx],al
	inc bx
	mov [bx],al

	mov ax,4c00h
	int 21h

codeseg ends

end