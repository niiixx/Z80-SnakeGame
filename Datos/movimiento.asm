;--------------------------------------------------------------------------------------------
; Funcion Teclas - Lee todas las teclas y si hay alguna pulsada realiza el movimiento pertinente
;--------------------------------------------------------------------------------------------

lectura_teclas:

  push bc
  push de

lectura_salir: ;(espacio)
  
  ld bc, $7FFE
  in a,(c)
  bit 0, a                 ; Testeamos el bit 0
  JP Z, fin         ; Si esta a 0 (pulsado) salir.

lectura_w:

  ld bc, $FBFE
  in a,(c)
  bit 1, a                 ; Testeamos el bit 1
  JR Z, correr_pos_arriba          ; Si esta a 0 (pulsado) salir.

lectura_s:

  ld bc, $FDFE
  in a,(c)
  bit 1, a             ; Testeamos el bit 1
  JR Z, correr_pos_abajo          ; Si esta a 0 (pulsado) salir.

lectura_a:

  ld bc, $FDFE
  in a,(c)
  bit 0, a                 ; Testeamos el bit 0
  JR Z, correr_pos_izq          ; Si esta a 0 (pulsado) salir.

lectura_d:

  ld bc, $FDFE
  in a,(c)
  bit 2, a            ; Testeamos el bit 2
  JR Z, correr_pos_derec          ; Si esta a 0 (pulsado) salir.
  
  pop de
  pop bc

  ret

;--------------------------------------------------------------------------------------------
; Funcion Posición - Realiza el movimiento mandado por las teclas. Este movimiento entra en 
;                    bucle si no se llama a ninguna tecla. Sumar y restar posiciones se hace de forma
;                    "relativa", es decir, en un registro guardamos el movimiento que luego se hará
;--------------------------------------------------------------------------------------------
   
correr_pos_arriba:
  pop de
  pop bc

  LD DE, -32
  ret
; ---------------------------------------------------------
correr_pos_abajo:
  pop de
  pop bc

  LD DE, 32
  ret
; ---------------------------------------------------------
correr_pos_izq:

  pop de
  pop bc

  LD DE, -1
  ret
; ---------------------------------------------------------
correr_pos_derec:

  pop de
  pop bc

  LD DE, 1
  ret