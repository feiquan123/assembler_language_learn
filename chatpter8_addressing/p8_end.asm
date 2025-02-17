; 寻址方式在结构化数据访问中的应用
; 计算平均收入

assume cs:codeseg, ds:dataseg, ss: stackseg

dataseg segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	; 以上是表示 21 年的 21 个字符串

	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	; 以上是表示 21 年公司总收入的 21 个 dword 型数据

	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
	; 以上是表示 21 年公司雇员人数的 21 个 word 型数据
dataseg ends

stackseg segment
	db 16 dup(0)
stackseg ends

tableseg segment
	db 21 dup('year summ ne ?? ')
tableseg ends

codeseg segment

start:
	mov ax,dataseg
	mov ds,ax
	mov ax,tableseg
	mov ss,ax

	
	mov bx,0 ; 设置 年份\收入; 步长 4 字节
	mov si,168 ; 设置 雇佣人数; 步长 2 字节
	mov bp,0
	mov cx,21
s:
	; 设置年份
	mov ax,ds:[bx]
	mov ss:[bp],ax
	mov ax,ds:[bx+2]
	mov ss:[bp+2],ax
	mov byte ptr ss:[bp+4],' '

	; 设置雇佣人数
	mov ax,ds:[si]
	mov ss:[bp+10],ax
	mov byte ptr ss:[bp+12],' '

	; 设置收入
	mov ax,ds:[bx+84]
	mov ss:[bp+5],ax
	mov dx,ds:[bx+84+2]
	mov ss:[bp+7],dx
	mov byte ptr ss:[bp+9],' '

	; 设置人均收入
	div word ptr ds:[si]
	mov ss:[bp+13],ax
	mov byte ptr ss:[bp+15],' '

	add bx,4
	add si,2
	add bp,10h
	loop s

	mov ax,4c00h
	int 21h
codeseg ends
end start