; 将 dataseg 中的每个单词的全部转字母大写

assume cs:codeseg, ds:dataseg

dataseg segment
	db 'ibm             '
	db 'dec	            '
	db 'dos             '
	db 'vax             '
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax

	mov bx,0
	mov cx,4
s:
	mov dx,cx
	mov si,0
	mov cx,3
	s0:
		mov al,ds:[bx+si]
		and al,11011111b
		mov ds:[bx+si],al
		inc si
		loop s0
	add bx,16
	mov cx,dx
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start