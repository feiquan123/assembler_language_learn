assume cs:codeseg

codeseg segment
start: 
	mov ax,0
	mov bx,0
	jmp short s
	add ax,1
s: 	inc ax

	jmp near ptr s0
	add bx,1
s0: 	inc bx

	mov ax,4c00h
	int 21h
codeseg ends
end start
