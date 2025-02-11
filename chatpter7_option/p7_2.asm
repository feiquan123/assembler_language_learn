assume cs:codeseg, ds:dataseg

dataseg segment
	db 'welcome to masm!'
	db '................'
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax
	mov si,0
	mov di,16

	mov cx,8
s:
	mov ax,ds:[si]
	mov ds:[di],ax
	add si,2
	add di,2
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start