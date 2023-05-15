%include"asm_io.asm"
	segment .data 
		msg:db"Entrez un entier et si vous voulez quiter pressez -1 : ",0	

	segment .bss
		x:resb 1
	
	segment .text
		global main
		inverse :
			push ebp
			mov ebp ,esp
		lf :	add ebx ,4
			mov eax ,[ebp+ebx]
			dec ecx
			call print_int
			call print_nl
			cmp ecx ,0
			je lfin
			jmp lf
		lfin :	pop ebp
		RET	
		main :
			mov ebx ,4
			mov ecx ,0
		l0:	mov eax ,msg		
			call print_string 
			call print_nl
			call read_int
			cmp eax ,-1
			je l1
			push eax	
			inc ecx
			mov [x] ,ecx
			jmp l0
		l1 : 	call inverse
			mov eax ,[x]
			mov ebx ,2
			mul ebx
			add esp ,eax
		mov ebx ,0
		mov eax ,1
		int 0x80
