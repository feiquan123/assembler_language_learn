; 内存除法

assume cs:codeseg, ds:dataseg

dataseg segment
	dd 100001
	dw 100
	dw 0
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax

	mov ax, ds:[0]
	mov dx, ds:[2]
	div word ptr ds:[4]
	mov ds:[6], ax

	mov ax,4c00h
	int 21h
codeseg ends

end start