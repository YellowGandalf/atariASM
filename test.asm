	;Drugi program V.2.4

	org $2000 ;Początek pustej przestrzeni w pamięci Atari 8 bit

        lda #55
        sta 40010
        lda #57
        sta 40011
        lda #46
        sta 40012
        lda #41
        sta 40013
        lda #43
        sta 40014
        lda #26
        sta 40015

        ; Dodawanie 5 + 3
        lda #5
        clc
        adc #3
        adc #16      ; Zamiana liczby na kod ASCII
        sta 40016    ; Wstawienie cyfry po napisie "Wynik:"

        jmp $a000     ; skok do Atari Basic
