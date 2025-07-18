 org $2000

        clc
        lda #8
        adc #6         ; 8 + 6 = 14
        sta RESULT     ; zapisz wynik

; teraz przekonwertuj wynik (14) do tekstu i wypisz
        ldx RESULT     ; X = wynik

        lda #'0'
        sta MSG        ; przygotuj bufor ASCII

        lda #' '
        sta MSG+1

        lda #' '
        sta MSG+2

        ldx RESULT
        jsr PRINT_DEC  ; wypisz liczbę jako tekst

        jmp *

; --- procedura wyświetlania liczby dziesiętnej (do 255) ---
PRINT_DEC
        ldy #0
        lda RESULT
        jsr $BDCD      ; ROM: konwersja bajtu na tekst (do bufora $D4-$DC)
        ldy #0
.PLOOP  lda $D4,y
        beq .END
        jsr $FDED      ; ROM: PUTCHAR
        iny
        bne .PLOOP
.END    rts

RESULT  .ds 1
MSG     .ds 3
