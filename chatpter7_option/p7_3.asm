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

	mov cx,8
s:
	mov ax,ds:[si]
	mov ds:[si+16],ax
	add si,2
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start