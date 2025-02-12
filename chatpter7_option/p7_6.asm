; 将 dataseg 中的每个单词的首字母大写
assume cs:codeseg, ds:dataseg

dataseg segment
	db '1. file         '
	db '2. edit         '
	db '3. search       '
	db '4. view         '
	db '5. options      '
	db '6. help         '
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax

	mov cx,6
	mov bx,0
s:
	mov al,ds:[bx+3]
	and al,11011111b
	mov ds:[bx+3],al
	add bx,16
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start