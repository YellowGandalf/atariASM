;Czwarty program V.4.1
; dodaje większe liczby z których wynik jest dwucyfrowy lub większy
; działa poprawnie dla dowolnych liczb 0–99 (np. pobieranych z klawiatury)

	           org $2000

        ; Wyświetl napis "Wynik: "
        lda #55        ; 'W'
        sta $9C4A      ; 40010
        lda #57        ; 'y'
        sta $9C4B
        lda #46        ; 'n'
        sta $9C4C
        lda #41        ; 'i'
        sta $9C4D
        lda #43        ; 'k'
        sta $9C4E
        lda #26        ; ':'
        sta $9C4F
        lda #0         ; spacja
        sta $9C50

        ; === Wczytaj pierwszą cyfrę z klawiatury ===
GetKey1:
        lda $D20F      ; sprawdź znak z klawiatury
        cmp #255
        beq GetKey1    ; jeśli nic nie wciśnięto, czekaj
        sec
        sbc #16        ; zamiana z ATASCII na cyfrę (np. '3' = 19 → 3)
        sta liczba1

WaitRelease1:
        lda $D20F
        cmp #255
        bne WaitRelease1

        ; === Wczytaj drugą cyfrę z klawiatury ===
GetKey2:
        lda $D20F
        cmp #255
        beq GetKey2
        sec
        sbc #16
        sta liczba2

WaitRelease2:
        lda $D20F
        cmp #255
        bne WaitRelease2

        ; === Dodawanie ===
        clc
        lda liczba1
        adc liczba2    ; wynik = liczba1 + liczba2
        sta suma

        ; === Rozbij na dziesiątki i jedności ===
        lda suma
        ldy #0         ; Y = dziesiątki
Loop10:
        cmp #10
        bcc GotDigits ; jeśli A< 10 -> przejdz dalej (bcc - branch if carry clear)
        sec
        sbc #10
        iny
        bne Loop10
GotDigits:
        sty dzies
        sta jedn

        ; === Wyświetl wynik na ekranie ===
        lda dzies
        clc
        adc #16        ; zamiana na ATASCII
        sta $9C51      ; 40017

        lda jedn
        clc
        adc #16
        sta $9C52      ; 40018

        jmp $A000      ; Powrót do BASIC
        

; === Zmienne pomocnicze ===
liczba1: .byte 0
liczba2: .byte 0
suma:    .byte 0
dzies:   .byte 0
jedn:    .byte 0
