#lang racket

(provide (all-defined-out))
(require racket/lazy-require)
(require "funcionesAux_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(lazy-require
 ["TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
  (propiedad-get-precio propiedad-get-dueño propiedad-set-dueño propiedad-get-casas
                        propiedad-get-id propiedad-get-nombre
                        propiedad-get-renta propiedad-get-esHotel propiedad-get-estaHipotecada
                        propiedad-get-hoteles propiedad-get-maxCasas propiedad-get-maxHoteles)])
(require "main_RUT_ANGEL_BENAVIDES.rkt")

;____________SELECTORES____________;

;DESC: Función que obtiene el id de la carta
;DOM: card(carta)
;REC: idCarta(int)
;RECURSION: No aplica
(define (carta-get-id card)
  (first card))


;DESC: Función que obtiene el tipo de la carta
;DOM: card(carta)
;REC: tipo(string "suerte" o "comunidad")
;RECURSION: No aplica
(define (carta-get-tipo card)
  (second card))



;____________OTRO____________;

;CARTAS SUERTE  ; (Hay 6 implementadas)


;DESC: Función que deja la posición del jugador en 0 (salida) en un juego
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPosPlayer (game)
(define (ir-a-salida game player)
  (apply juego
         (cons
          ;se actualiza solo el jugador con el mismo ID
          (map (lambda (p)
                 (if (= (first p) (first player))
                     (jugador (jugador-get-id p)
                              (propiedad-get-nombre p)
                              (jugador-get-dinero p)
                              (jugador-get-propiedades p)
                              0           
                              (jugador-get-estaEnCarcel p)
                              (jugador-get-totalCartasSalirCarcel p)
                              (jugador-get-contadorConsecutivos p))
                     p))
               (juego-get-jugadores game))
          ;resto de tda juego
          (list (juego-get-tablero game)
                (juego-get-dineroBanco game)
                (juego-get-numeroDados game)
                (juego-get-turnoActual game)
                (juego-get-tasaImpuesto game)
                (juego-get-maximoCasas game)
                (juego-get-maximoHoteles game)
                (juego-get-mazoSuerte game)
                (juego-get-mazoComunidad game)))))


;DESC: Función que deja la posición del jugador en carcel
;      siempre será la primera del tablero, o sea, la que
;      este en la posición más 'baja'
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPosPlayer (game)
(define (ir-a-carcel game player)
  (apply juego
         (cons
          ;lista de jugadores, se actualiza solo al que coincide:
          (map (lambda (p)
                 (if (= (first p) (first player))
                     (jugador (jugador-get-id p)
                              (jugador-get-nombre p)
                              (jugador-get-dinero p)
                              (jugador-get-propiedades p)
                              ;posición = la casilla “carcel” (la primera que encuentre) del tablero:
                              (first
                               (first
                                (filter (lambda (c)
                                          (equal? (second c) 'carcel))
                                        (second game))))
                              (jugador-get-estaEnCarcel p)
                              (jugador-get-totalCartasSalirCarcel p)
                              ((jugador-get-contadorConsecutivos p)))
                     ;si no coincide, se devuelve el jugador sin cambios
                     p))
               (juego-get-jugadores game))
          ;resto del TDA juego:
          (list (juego-get-tablero game)
                (juego-get-dineroBanco game)
                (juego-get-numeroDados game)
                (juego-get-turnoActual game)
                (juego-get-tasaImpuesto game)
                (juego-get-maximoCasas game)
                (juego-get-maximoHoteles game)
                (juego-get-mazoSuerte game)
                (juego-get-mazoComunidad game)))))


;DESC: Función que hace que el banco page una cantidad a un jugador en un juego
;DOM: game(juego) X player(jugador) X quantity(int)
;REC: gameActualizadoConValores (game)
(define (banco-paga game player quantity)
  (apply juego
         (cons
          ;se actualiza la lista de jugadores
          (map (lambda (p)
                 (if (= (first p) (first player))
                     ;se reconstruye el jugador con dinero aumentado
                     (jugador (jugador-get-id p)
                              (jugador-get-nombre p)
                              (+ (jugador-get-dinero p) quantity)
                              (jugador-get-propiedades p)
                              (jugador-get-posicionActual p)
                              (jugador-get-estaEnCarcel p)
                              (jugador-get-totalCartasSalirCarcel p)
                              (jugador-get-contadorConsecutivos p))
                     
                     p))
               (juego-get-jugadores game))
          ;Resto del TDA juego, con la resta al dinero del banco
          (list (juego-get-tablero game)
                (- (juego-get-dineroBanco game) quantity)
                (juego-get-numeroDados game)
                (juego-get-turnoActual game)
                (juego-get-tasaImpuesto game)
                (juego-get-maximoCasas game)
                (juego-get-maximoHoteles game)
                (juego-get-mazoSuerte game)
                (juego-get-mazoComunidad game)))))

;DESC: Función que hace que el banco page 100 a un jugador
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPlayerActualizado (game)
(define (banco-paga-100 game player)
  (banco-paga game player 100))


;DESC: Función que hace que el banco page 50 a un jugador
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPlayerActualizado (game)
(define (banco-paga-50 game player)
  (banco-paga game player 50))


;DESC: Función que hace que el banco page 150 a un jugador
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPlayerActualizado (game)
(define (banco-paga-150 game player)
  (banco-paga game player 150))


;DESC: Función que hace que el banco page 200 a un jugador
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConPlayerActualizado (game)
(define (banco-paga-200 game player)
  (banco-paga game player 200))



;CARTAS COMUNIDAD ; (Hay 4 implementados)

;DESC: Función que hace que el jugador pague una cantidad X al banco en un juego
;DOM: game(juego) X player(jugador) X quantity(int)
;REC: gameActualizadoConValores(juego)
;RECURSION: No aplica (declarativo)
(define (pagar-impuesto game player quantity)
  (apply juego
         (cons
          ;se actualiza la lista de jugadores:
          (map (lambda (p)
                 (if (= (first p) (first player))
                     ;se reconstruye el jugador con dinero reducido
                     (jugador (jugador-get-id p)
                              (jugador-get-nombre p)
                              (- (jugador-get-dinero p) quantity)
                              (jugador-get-propiedades p)
                              (jugador-get-posicionActual p)
                              (jugador-get-estaEnCarcel p)
                              (jugador-get-totalCartasSalirCarcel p)
                              (jugador-get-contadorConsecutivos p))
                     p))
               (juego-get-jugadores game))
          ;Resto de TDA juego, con dinero del banco aumentado
          (list (juego-get-tablero game)
                (+ (juego-get-dineroBanco game) quantity)
                (juego-get-numeroDados game)
                (juego-get-turnoActual game)
                (juego-get-tasaImpuesto game)
                (juego-get-maximoCasas game)
                (juego-get-maximoHoteles game)
                (juego-get-mazoSuerte game)
                (juego-get-mazoComunidad game)))))


;DESC: Función que hace que el jugador pague 50 al banco en un juego
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConValores(juego)
;RECURSION: No aplica
(define (pagar-impuesto-50 game player)
  (pagar-impuesto game player 50))


;DESC: Función que hace que el jugador pague 100 al banco en un juego
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConValores(juego)
;RECURSION: No aplica
(define (pagar-impuesto-100 game player)
  (pagar-impuesto game player 100))


;DESC: Función que hace que el jugador pague 150 al banco en un juego
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConValores(juego)
;RECURSION: No aplica
(define (pagar-impuesto-150 game player)
  (pagar-impuesto game player 150))


;DESC: Función que hace que el jugador pague 200 al banco en un juego
;DOM: game(juego) X player(jugador)
;REC: gameActualizadoConValores(juego)
;RECURSION: No aplica
(define (pagar-impuesto-200 game player)
  (pagar-impuesto game player 200))





  
  










        


#|

;DESC: RF4, Función que permite crear una carta en el juego.
;DOM: id (int) X tipo (string) X descripcion (string) X accion (funcion)
;REC: carta (carta)
;TIPO RECURSION: No aplica 
(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))

(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))

(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))
|#
