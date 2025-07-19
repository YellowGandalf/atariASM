;Trzeci program V.3.1

	              org $2000

        ; Napis: Wynik:
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
        lda #0     ; spacja
        sta 40016

        ; Dodawanie 5 + 7
        lda #5
        clc
        adc #7      ; wynik = 12

        ; Rozbijanie na dziesiątki i jedności
        sec
        sbc #10     ; sprawdzamy, czy wynik >= 10
        bcc mniej10

        ; Jeśli wynik >= 10, mamy dziesiątkę i jedność
        sta $80     ; zapisz jedności (12 - 10 = 2)
        lda #16+1   ; dziesiątka = '1'
        sta 40017
        lda $80
        clc
        adc #16     ; jedność = '2'
        sta 40018
        jmp koniec

mniej10:
        ; Jeśli wynik < 10
        clc
        adc #10     ; przywróć wynik (bo odejmowaliśmy 10)
        clc
        adc #16     ; zamiana na ATASCII
        sta 40017   ; wypisz jedną cyfrę

koniec:
        jmp $A000   ; powrót do BASIC-a
