#lang racket

(require "main_RUT_ANGEL_BENAVIDES.rkt")
(require "TDATablero_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDACarta_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAMazo_RUT_ANGEL_BENAVIDES_ARAYA.rkt")

; 1. Creación de jugadores
;; Dominio TDA Jugador = id X nombre X dinero X propiedades X posicionActual X estaEnCarcel X totalCartasSalirEnCarcel (esto mide la cantidad actual de cartas salir cárcel que tiene el jugador, se comienza con 0)
;; Recorrido TDA Jugador = jugador
(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))

; 2. Creación de propiedades para el juego
; Dominio TDA Propiedad = id X nombre X precio X renta X dueño X casas X esHotel X estaHipotecada
;; Recorrido TDA Propiedad = propiedad
(define prop1 (propiedad 1 "Paseo Mediterráneo" 600 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 600 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 900 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 900 14 #f 0 #f #f))

; 3. Creación de cartas de suerte y arca comunal
; TDA Carta = id X tipo X descripcion X accion
(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))

(define mazoSuerte
  (mazo "suerte" chance1 chance2 chance3))

(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel)) ;; Esto cuenta como carta salidaCárcel y si el jugador obtiene esta tarjeta aumenta el contador de totalCartasSalirEnCarcel de su TDA.

(define mazoComunidad
  (mazo "comunidad" community1 community2 community3))


; 4. Creación del tablero
; Dominio TDA Tablero = propiedades X cartasSuerte X cartasComunidad X casillasEspeciales (fn X posición)
; Recorrido = tablero
;; Las funciones de las casillas especiales usted los puede definir en este mismo archivo o en algún TDA correspondiente y acá sólo importarlo.  
(define tablero-vacio 
  (tablero '() ;; propiedades 
           (list chance1 chance2 chance3) ;; cartas suerte 
           (list community1 community2 community3) ;; cartas comunidad
           (list 
              (cons 'salida 0)
              (cons 'carcel 2)  
              (cons 'carcel 5) 
              (cons 'suerte 7)
              (cons 'suerte 12)
              (cons 'comunidad 10))))
;; casillas especiales (salida, carcel, suerte, comunidad)
;; posicion 0: salida
;; posicion 2,5: carta carcel (fn carcel)
;; posicion 7, 12: carta suerte (cuando caiga acá debe ejecutar el requerimiento de obtener carta suerte)
;; posicion 10: carta comunidad

; Lista de propiedades con sus posiciones
;; (cons propiedad posicion)
(define lista-propiedades 
  (list (cons prop1 1) (cons prop2 3) (cons prop3 6)
        (cons prop4 8) (cons prop5 9) (cons prop6 11)
        (cons prop7 13) (cons prop8 14)))

; Tablero con propiedades
;; Función tablero-agregar-propiedad
;; Recorrido: tablero
(define tablero-completo (tablero-agregar-propiedad tablero-vacio lista-propiedades))

; 5. Creación del juego
; Dominio TDA Juego = jugadores X tablero X dineroBanco X numeroDados X turnoActual (id jugador actual) X tasaImpuesto X maxCasas X maxHoteles
;; Anteriormente se tenia un último valor de "estadoJuego" donde se ejemplificaba con "en preparación". Sin embargo esto no tenía utilidad para el presente laboratorio por lo que se eliminó. Si usted lo implementa no hay problema pero tenga presente que no se utilizará en nada para este enunciado.
(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))

; 6. Agregar jugadores al juego
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))

;7. Agregar al juego los mazos Suerte y Comunidad
(define g3 (juego-set-mazoSuerte g2 mazoSuerte))
(define g4 (juego-set-mazoComunidad g3 mazoComunidad))
g4




; 7. Jugar (inicio de simulación)
(display "===== CAPITALIA =====\n\n")

;; Ambos jugadores comienzan en posición 0
; Turno 1: Carlos
(display "TURNO 1: Carlos\n")

;(define g5 (juego-jugar-turno g4 (juego-lanzar-dados 3 4) #t #f #f #f))

;(define TEST(set-hoteles prop1 g2 2))
;;TEST

#|
;BLOQUE PARA ACTUALIZARA MAXHOTELES, MAXCASAS, HOTELES
(define casilla (juego-get-propiedad-por-pos g2 2))
(define actualizada (set-maximoHoteles casilla g2))
actualizada
(define actualizada2 (set-maximoCasas actualizada g2))
actualizada2
(define actualizada3 (set-hoteles actualizada2 g2 3))
actualizada3


(define g3 (juego-reemplazar-prop g2 actualizada3))
g3
(define prop2a (second (juego-get-propiedad-por-pos g3 2)))

;Prueba de la funcion calcular renta
(propiedad-calcular-renta prop2a)
prop2
prop2a
|#






