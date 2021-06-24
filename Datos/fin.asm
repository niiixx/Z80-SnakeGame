;--------------------------------------------------------------------------------------------
; Funcion fin - Pinta el color del borde de rojo y bloquea todo.
;-------------------------------------------------------------------------------------------- 
fin:  
  LD A,2                ; BORDE COLOR
  OUT ($FE),A           ; BORDE PINTAR
  jp fin