%include"asm_io.asm"
	segment .data 
			msg:db"Entrez des entiers si vous voullez quitter le program tapez 0 : ",0 
			msg_length equ $-msg
			m:db"a",0
			msg1:db"La somme des entiers positifs est egale : ",0
			msg2:db"La somme des entiers négatifs est egale : ",0
	segment .bss
			x:resb 1
	segment .text 
			global main 
				func1 :	
					mov ebx ,1
					mov edx ,0
					mov [x] ,edx
				boucle0 :	mov eax ,msg
						call print_string 
						call print_nl 
						call read_int
						cmp eax ,0
						je boucle1
						push eax 
						inc ebx
						jmp boucle0
						
				boucle1 :	pop ecx 
						dec ebx
						cmp ebx ,0
						je end1
						cmp ecx ,0
						jg posi
						jl nega
						jmp end1
				posi :		add edx ,ecx
						mov esi ,msg 
						add esi ,ecx
						mov byte [esi-1] ,'a'
						jmp boucle1
				nega :		add [x] ,ecx
						jmp boucle1
				end1 :		mov eax ,msg1
						call print_string
						call print_nl
						mov eax ,edx
						call print_int
						call print_nl 
						mov eax ,msg2
						call print_string 
						call print_nl 
						mov eax ,[x]
						call print_int 
						call print_nl
						mov eax ,msg 
						call print_string 
						call print_nl
				RET
				main :
					call func1
		mov ebx ,0
		mov eax ,1
		int 0x80
