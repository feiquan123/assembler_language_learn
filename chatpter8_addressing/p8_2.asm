; 寻址方式的综合应用

assume cs:codeseg, ds:dataseg

dataseg segment
	db 60h dup(0) ; 占位
	db 'DEC' ; 公司名称
	db 'Ken Olsen' ; 总裁姓名
	dw 137  ; 排名, 更新为 38
	dw 40   ; 收入, 新增 70
	db 'PDP' ; 著名产品; 更新为 'VAX'
dataseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax
	mov bx,60h

	mov word ptr [bx].0ch,38
	add word ptr [bx].0eh,70
	
	mov si,0
	mov byte ptr [bx].10h.[si],'V'
	inc si
	mov byte ptr [bx].10h.[si],'A'
	inc si
	mov byte ptr [bx].10h.[si],'X'

	mov ax,4c00h
	int 21h
codeseg ends

end start