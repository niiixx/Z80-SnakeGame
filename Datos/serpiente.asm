;--------------------------------------------------------------------------------------------
; Funcion aumentar_numero_serpiente - Lo primero que hace es aumentar el numero de la longitud de la serpiente.
;                     Despues guarda la posicion donde se generará la nueva cola.
;                     
;--------------------------------------------------------------------------------------------   

aumentar_numero_serpiente:
    ld hl, longitud_serpiente
    ld a, (hl)
    add 1
    ld (hl), a
    ld de, (hl)
    

    ld iy, posicion_serpiente
      
blc_correr_serpiente:
    inc iy
    dec de
    ld a,d
    or e
    jr nz, blc_correr_serpiente

    ld (ix), bc
    ret
;--------------------------------------------------------------------------------------------------
; Funcion seguir_serpiente - Es la función que hace que la cola siga a la cabeza.
;--------------------------------------------------------------------------------------------------
seguir_serpiente:
    
    push bc
    push hl
    push af
    push de
    push ix

    ld bc, (longitud_serpiente)
    ld ix, posicion_serpiente
    inc ix 
    inc ix

blc_correr_serpiente2:
    
    ld d, (ix)
    ld e, (ix+1)

    ld (ix), h
    ld (ix+1), l

    ld hl, de

    inc ix
    inc ix
    dec bc
    ld a,b
    or c
    jr nz, blc_correr_serpiente2

    ld (hl), 0

    pop ix
    pop de
    pop af
    pop hl
    pop bc

    ret
