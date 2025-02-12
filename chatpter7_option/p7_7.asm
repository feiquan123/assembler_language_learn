; 将 dataseg 中的每个单词的全部转字母大写

assume cs:codeseg, ds:dataseg, ss:stackseg

dataseg segment
	db 'ibm             '
	db 'dec	            '
	db 'dos             '
	db 'vax             '
	; dw 0 ; 开辟内存, 用于保存 cx 的值
dataseg ends

stackseg segment
	dw 0,0,0,0,0,0,0,0
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
	; mov dx,cx ; 使用寄存器 dx 保存 cx 的值
	; mov ds:[40h],cx ; 使用内存 ds[bx+40h] 保存 cx 的值
	push cx ; 使用栈保存 cx 的值
	mov si,0
	mov cx,3
	s0:
		mov al,ds:[bx+si]
		and al,11011111b
		mov ds:[bx+si],al
		inc si
		loop s0
	add bx,16
	; mov cx,dx ; 使用寄存器 dx 的值恢复 cx 的值
	; mov cx,ds:[40h]; 使用内存 ds[bx+40h] 恢复 cx 的值
	pop cx ; 使用栈恢复 cx 的值
	loop s

	mov ax,4c00h
	int 21h
codeseg ends

end start