assume cs:codeseg, ds:dataseg

dataseg segment
	db 'BaSic'
	db 'MinIX'
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax

	mov bx,0
	mov cx,5

s:
	mov al,ds:[bx+0]
	and al,11011111b  ; 转换大写, 相差32, 由下标为第5位的二进制数决定
	mov ds:[bx+0],al

	mov al,ds:[bx+5]
	or al,00100000b ; 转换小写, 相差32, 由下标为第5位的二进制数决定
	mov ds:[bx+5],al

	inc bx
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start