; Nasz pierwszy program

		org $2000 		;miejsce w RAM

		          		;start i petla to etykity

start		PLA
			lda #40   	;zapamietaj liczbe 
			sta 40458  	;zapisz do komorki 

			lda #37 
			sta 40459

			lda #44 
			sta 40460
			sta 40461

			lda #47 
			sta 40462
		       
			
			jmp $a000   ;skok do Atari Basic

			;rts   ;reset
			;jmp $E474       ; powrót do BASIC-a (wejście RESET do BASIC-a)



;petla		jmp petla 	;zapetlenie programu

	;	run start 		;informacja ze ma realizowac program 
						;od start