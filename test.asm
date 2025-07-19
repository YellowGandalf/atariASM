; Nasz pierwszy program

		    org $2000 		;miejsce w RAM
            	          		
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
		       
			
			

		