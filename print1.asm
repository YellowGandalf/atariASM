        org $2000

; --- Inicjalizacja: ustaw tryb ekranowy (GRAPHICS 0) ---
        lda #0
        sta $02F4       ; zmienna GRAPHICS MODE (ATARI OS)
        jsr $FF62       ; wykonaj SETVBV + GRAPHICS

; --- Dodawanie ---
        clc
        lda #8
        adc #6
        sta RESULT      ; zapisujemy wynik = 14

; --- Konwersja liczby na tekst i wypisanie ---
        lda RESULT
        jsr $BDCD       ; konwertuj bajt (0–255) na tekst do bufora $D4–$DC

; --- Wyświetlanie tekstu ---
        ldy #0
PrintLoop:
        lda $D4,y
        beq Done
        jsr $FDED       ; PUTCHAR – wypisz znak
        iny
        bne PrintLoop
Done:
        jmp *

; --- Dane ---
RESULT  .ds 1
