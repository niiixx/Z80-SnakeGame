;--------------------------------------------------------------------------------------------------
; Funcion Bienvenida - Inicia con una pantalla de bienvenida, la cual pulsando P carga el programa
;--------------------------------------------------------------------------------------------------
bienvenida:
  
  call CLEARSCR       ; Borra la pantalla
  call lectura_teclas
  ld ix, texto        ; Escribe el texto con presentacion de la app SNAKE
  ld bc, $0400
  ld a, $47
  call PRINTAT

  ld ix, texto2        ; Escribe el texto Pulsando tecla P inicia el juego
  ld bc, $0940
  ld a, $43
  call PRINTAT

  ld ix, minombre       ; Escribe el nombre de los estudiantes
  ld bc, $1700
  ld a, $43
  call PRINTAT
  call esperar_tecla
lectura_teclas1:
  push bc
  push de
lectura_empezar: ;(P)
  
  ld bc, $DFFE
  in a,(c)
  bit 0, a                 ; Testeamos el bit 0
  call CLEARSCR
  JR Z, inicio         ; Si esta a 0 (pulsado) salir.
  pop bc
  pop de
  