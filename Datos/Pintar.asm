;--------------------------------------------------------------------------------------------------
; Funcion Pintar_cabeza - Pinta la cabeza de la Serpiente.
;--------------------------------------------------------------------------------------------------

pintar_cabeza:

  LD C,8 ; color
  call comprobar_longitud
  ADD HL, DE
  LD (HL),C ; Pintar
  ret
;--------------------------------------------------------------------------------------------------
; Funcion Comprobar_Longitud - Comprueba la longitud de la cola y si es >1 la pinta.
;--------------------------------------------------------------------------------------------------

comprobar_longitud:
  ld a, (longitud_serpiente)
  cp 0
  jp z, borrar 
  call nz, he_comido
  ret

;--------------------------------------------------------------------------------------------------
; Funcion He_Comido - Comprueba si el ultimo movimiento es comer manzana o no.
;--------------------------------------------------------------------------------------------------

he_comido:
  ld a,ixh
  cp 0
  jp nz, borrar
  call z, seguir_serpiente
  ret

;--------------------------------------------------------------------------------------------------
; Funcion borrar - Borra el ultimo cuadrado de la serpiente.
;--------------------------------------------------------------------------------------------------

borrar:
  ld a, 0
  LD (HL), a ; Borrar 
  ret
