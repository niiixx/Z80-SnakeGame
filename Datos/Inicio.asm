;--------------------------------------------------------------------------------------------
; Funcion Cargar programa - Inicia el programa
;--------------------------------------------------------------------------------------------

cargar_programa:
  LD HL, $5970          ; INICIO DE PROGRAMA
  LD DE,0               ; MOVIMIENTO 
  LD C,8 ; color
  LD (HL),C ; Pintar la primera cabeza

pinta_borde:
  LD A,4              ; BORDE COLOR
  OUT ($FE),A           ; BORDE PINTAR
  ret

;--------------------------------------------------------------------------------------------
; Funcion Esperar Tecla - Espera una tecla para iniciar programa
;--------------------------------------------------------------------------------------------

esperar_tecla:
  XOR A                        ; A = 0
  IN A, (254)
  OR 224
  INC A
  JR Z, esperar_tecla
  ret
