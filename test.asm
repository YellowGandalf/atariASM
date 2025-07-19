			;Drugi program V.2.2

		   					; Program w asemblerze MADS dla Atari 8-bit
							; Dodaje 5 + 3 i wyświetla wynik jako "Wynik: 8" od adresu ekranu $9C40

        org $2000          ; Punkt startowy programu

Start:
        clc                ; Wyczyść znacznik przeniesienia
        lda #5             ; Załaduj pierwszą liczbę
        adc #3             ; Dodaj drugą liczbę
        sta wynik          ; Zachowaj wynik

        ldx #0             ; Indeks do pętli zapisu napisu
Loop:
        lda tekst,x        ; Pobierz znak z tablicy tekst
        beq Done           ; Jeśli napotkano 0 (koniec tekstu), zakończ
        sta $9C40,x        ; Zapisz znak do pamięci ekranu (40000)
        inx
        bne Loop

Done:
        lda wynik
        clc
        adc #'0'           ; Zamień cyfrę na kod ASCII
        sta $9C40+7        ; Umieść cyfrę jako ostatni znak ("Wynik: 8")

        rts                ; Zakończ program

tekst:
        .byte "Wynik: ",0  ; Tekst z zakończeniem zerowym

wynik:
        .byte 0            ; Tu będzie wynik dodawania
