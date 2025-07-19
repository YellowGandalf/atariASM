			;Drugi program

		    org $2000 		
            	          		
			lda #40   	
			sta 40458  	

			lda #37 
			sta 40459

			lda #44 
			sta 40460
			sta 40461

			lda #47 
			sta 40462

			jmp $a000   ;skok do Atari Basic
		       
			
			

		