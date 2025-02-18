assume cs:codeseg

codeseg segment
start: 
	mov ax,0
	mov bx,0
	jmp short s 	; 标号长度 8 位
	add ax,1
s: 	inc ax

	jmp near ptr s0  ; 标号长度 16 位
	add bx,1
s0: 	inc bx

	mov ax,4c00h
	int 21h
codeseg ends
end start
