; 计算 2 ^ 3

assume cs:abc

abc segment

	mov AX,2h
	add AX,AX
	add AX,AX

	mov AX,4c00h
	int 21h

abc ends

end