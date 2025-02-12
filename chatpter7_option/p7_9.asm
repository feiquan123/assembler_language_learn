; 将 dataseg 中的每个单词的前4个字母大写

assume cs:codeseg, ds:dataseg, ss:stackseg

dataseg segment
	db '1. display      '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
dataseg ends

stackseg segment
	dw 0,0,0,0,0,0,0,0,0
stackseg ends

codeseg segment

start:
	mov ax,stackseg
	mov ss,ax
	mov sp,16
	mov ax,dataseg
	mov ds,ax

	mov bx,0
	mov cx,4
s:
	push cx
	mov si,0
	mov cx,4
	s1:
		mov al,ds:[bx+3+si]
		and al,11011111b
		mov ds:[bx+3+si],al
		inc si
		loop s1
	add bx,16
	pop cx
	loop s

	mov ax,4c00h
	int 21h

codeseg ends

end start