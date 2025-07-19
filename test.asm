			;Drugi program V.2.3

		org $2000

        lda #'W'
        sta $9C40
        lda #'y'
        sta $9C41
        lda #'n'
        sta $9C42
        lda #'i'
        sta $9C43
        lda #'k'
        sta $9C44
        lda #':'
        sta $9C45

        ; Dodawanie 5 + 3
        lda #5
        clc
        adc #3
        adc #'0'      ; Zamiana liczby na kod ASCII
        sta $9C46     ; Wstawienie cyfry po napisie "Wynik:"

        jmp $a000     ; skok do Atari Basic
