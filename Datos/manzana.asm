;--------------------------------------------------------------------------------------------
; Funcion aleatorio - Recibe en A el rango y devuelve un numero entre [0,Rango)
;--------------------------------------------------------------------------------------------

aleatorio:
    push bc
    push hl
    push af
    push de

buscando_aleatorio_columna:
    ld a,31
    ld b,a
    ld a,r              ; Carga el registro R 
    ld l,a    
    and $2F             ; Acude a una dirección de la ROM para coger un dato
    ld h,a 

buscaRND_columna:
    inc hl
    ld a, (hl)
    cp b
    jr nc, buscaRND_columna         ; Busca el siguiente hasta que sea menor que Rango
    
    ld e,a ; GUARDAMOS EL NÚMERO [0,32] en E

buscando_aleatorio_fila:
    ld a,23
    ld b,a
    ld a,r              ; Carga el registro R 
    ld l,a    
    and $2F             ; Acude a una dirección de la ROM para coger un dato
    ld h,a 

buscaRND_fila:
    inc hl
    ld a, (hl) ; GUARDAMOS EL NÚMERO [0,24] en A
    cp b
    jr nc, buscaRND_fila        ; Busca el siguiente hasta que sea menor que Rango
    
    ld d,0 ; LIMPIAMOS D QUE USAREMOS LUEGO PARA SUMAR

    ld bc, 32 ; VUELTAS QUE TIENE QUE DAR PARA A*32 = FILA QUE TOCA
    ld hl, $5800

;--------------------------------------------------------------------------------------------
; Funcion Pintar Manzana - Recibimos en E - la columna y en A - la fila
;                          Para calcular la posición de la manzana, multiplicamos A por 32,
;                          sacando así la fila. Después sumamos la columna y sacamos la posición
;--------------------------------------------------------------------------------------------

calcular_fila:
  
    cp 0 ; Si es 0, la fila es la 1º y por tanto no sumamos
    jr z, pintar_manzana

blc_multiplicar:
    ADD HL,BC ; Añadimos HL + 32 tantas veces como A sea
    dec a
    jr nz, blc_multiplicar

pintar_manzana:
    
    ADD HL, DE ; Sumamos la columna

    LD (HL), 48 ; Pintamos la manzana

    push ix

    ld ix, posicion_manzana

    ld (ix), h ; Guardamos la posición de la manzana
    ld (ix+1), l ; Guardamos la posición de la manzana

    pop ix
    pop de
    pop af
    pop hl
    pop bc
    ret   

;--------------------------------------------------------------------------------------------
; Funcion comprobar manzana - Comprueba si se ha comido manzana, si es así genera una nueva.
;--------------------------------------------------------------------------------------------

comprobar_manzana:
    
    push bc
    push hl
    push af
    push de

    push ix 

    ld ix, posicion_manzana
    ld b, (ix)
    ld c, (ix+1)

    pop ix

    ADD HL, DE
    SUB HL, bc


    jr z, pops_manzana

    pop de
    pop af
    pop hl
    pop bc

    ret

;--------------------------------------------------------------------------------------------------
; Funcion pops_manzana - Significa que ha comido manzana. Genera una nueva manzana y aumenta la cola de la serpiente.
;--------------------------------------------------------------------------------------------------

pops_manzana:

    call aleatorio
    call aumentar_numero_serpiente
    ld ixh, 8

    pop de
    pop af
    pop hl
    pop bc
    ret
