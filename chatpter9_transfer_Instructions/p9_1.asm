; 将 s 处的指令复制到 s0 处
assume cs:codeseg

codeseg segment
start:
s: 	
	mov ax,bx
	mov si, offset s
	mov di, offset s0
	mov ax, cs:[si]
	mov cs:[di], ax
s0:
	nop  ; nop 的机器码占一个自己
	nop
	
	mov ax,4c00h
	int 21h
codeseg ends
end start