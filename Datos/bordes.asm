;--------------------------------------------------------------------------------------------
; Funcion comprobar_borde - Comprueba si la serpiente toca borde - ERROR FIN DEL JUEGO 
;--------------------------------------------------------------------------------------------  

comprobar_borde:

comprobar_borde_arriba:
  push bc
  push hl
  push af

  ld bc, $5800

  ADD HL, DE
  SUB HL, bc
  jp c, fin

  pop af
  pop hl
  pop bc

comprobar_borde_abajo:

  push bc
  push hl
  push af

  ld bc, $5B00

  ADD HL, DE
  SUB HL, bc
  jp nc, fin

  pop af
  pop hl
  pop bc

comprobar_borde_izq:

  push bc
  push af
  push de

  ld a,e
  cp -1
  ld d,24
  ld bc, $581F

  call z, comprobar_pos_borde_izq

  pop de
  pop af
  pop bc

comprobar_borde_der:

  push bc
  push af
  push de

  ld a,e
  cp 1
  ld d,24
  ld bc, $5800

  call z, comprobar_pos_borde_der

  pop de
  pop af
  pop bc

  ret

comprobar_pos_borde_der:

  push hl

  inc hl
  SUB HL, bc

  jp z, fin

  ld hl, bc
  ld bc, 32
  add hl, bc

  ld bc, hl

  pop hl

  dec d
  jp nz, comprobar_pos_borde_der

  ret

comprobar_pos_borde_izq:

  push hl

  DEC HL
  SUB HL, bc

  jp z, fin

  ld hl, bc
  ld bc, 32
  add hl, bc

  ld bc, hl

  pop hl

  dec d
  jp nz, comprobar_pos_borde_izq

  ret