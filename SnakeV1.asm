  OUTPUT "SnakeV1.bin"    ; Archivo BIN para ejecutar en el ES.PECTRUM


  ORG $8000         ; Posicion inicial de la direccion de memoria.
  di                ; Deshabilitar interrupciones
  ld sp,0           ; Posicionar la pila al final de la memoria

  include "Datos/bienvenida.asm"

;--------------------------------------------------------------------------------------------------------------------------;
; Funcion inicio y main - La funcion inicio carga los valores iniciales de todo el programa y la funcion main es el bucle  ;
;                         principal del programa.                                                                          ;
;--------------------------------------------------------------------------------------------------------------------------;

inicio:

  call aleatorio
  call cargar_programa
  call esperar_tecla

main: 
  
  call pintar_cabeza
  call pausa
  call lectura_teclas
  ld ixh, 0
  call comprobar_manzana
  call comprobar_borde
  jp main

;--------------------------------------------------------------------------------------------------------------------------;
; Include - Llamadas a los distintos archivos que contienen las funciones.                                                 ;
;--------------------------------------------------------------------------------------------------------------------------;

  include "Datos/Pintar.asm"
  include "Datos/Inicio.asm"
  include "Datos/pausa.asm"
  include "Datos/manzana.asm"
  include "Datos/serpiente.asm"
  include "Datos/movimiento.asm"
  include "Datos/bordes.asm"
  include "Datos/fin.asm"
  include "Datos/Arrays.asm"
  include "Datos/print_text.asm"