; 计算 ffff:0 ~ ffff:b 的单元中的数据和

assume cs:code

code segment
	
	mov ax,0ffffh
	mov ds,ax
	mov bx,0 ; 初始化 ds:bx 指向 ffff:0
	mov dx,0 ; 初始化累加器 dx, (dx) = 0

	mov cx,12 ; 初始化循环计数器 cx, (cx) = 12
s: 	mov al,[bx]
	mov ah,0
	add dx,ax ; 间接向 dx 中加上 ((ds)*16 + (bx)) 单元中的值
	inc bx ; ds:bx 指向下一个单元
	loop s

	mov ax,4c00h
	int 21h

code ends 

end