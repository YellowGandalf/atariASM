;Trzeci program V.3.1

	        org $2000

        ; Wstaw napis "Wynik: "
        lda #55    ; 'W'
        sta 40010
        lda #57    ; 'y'
        sta 40011
        lda #46    ; 'n'
        sta 40012
        lda #41    ; 'i'
        sta 40013
        lda #43    ; 'k'
        sta 40014
        lda #26    ; ':'
        sta 40015
        lda #0
        sta 40016  ; spacja
        sta 40017

        ; Dodawanie 5 + 7
        lda #5
        clc
        adc #7       ; wynik = 12
        sta wynik

        ; Oblicz dziesiątki
        lda wynik
        ldy #0
Loop10:
        cmp #10
        blt GotTens
        sec
        sbc #10
        iny
        bne Loop10
GotTens:
        sty dzies
        sta jedn

        ; Zamiana na ATASCII: dodaj 16
        lda dzies
        clc
        adc #16
        sta 40016     ; dziesiątki

        lda jedn
        clc
        adc #16
        sta 40017     ; jedności

        jmp $A000

wynik:  .byte 0
dzies:  .byte 0
jedn:   .byte 0


        jmp $a000     ; skok do Atari Basic
