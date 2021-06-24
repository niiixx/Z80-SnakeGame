;--------------------------------------------------------------------------------------------
; Funcion Pausa - El registro B y DE delimitan la duración de la pausa
;--------------------------------------------------------------------------------------------

pausa:  
    push af             ; Salva registros utilizados en la pila
    push de

    LD B,1 ; pausa
paus0:  ld de, 10000            ; Inicializa DE a 10000 para ciclar hasta 0 en el bucle interno
paus1:  dec de                  ; Decrementa DE. En la primera vuelta, DE valdrá 9999
    ld a,d                      ; Para comprobar si DE es 0000, D tiene que ser 0...
    or e                        ; ... y E también
    jr nz, paus1                ; Si no lo es, sigue el bucle inteno
    djnz paus0                  ; B=B-1 y cicla a bucle externo hasta que B sea 0

    pop de                      ; Recupera registros utilizados desde la pila
    pop af

    ret                         ; Retorna al punto de llamada
