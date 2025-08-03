#lang racket

(provide (all-defined-out))
(require "funcionesAux_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDATablero_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "main_RUT_ANGEL_BENAVIDES.rkt")


;___________SELECTORES____________;


;DESC: Función que obtiene el id de un jugador
;DOM: player(jugador)
;REC: id (num)
;RECURSION: No aplica
(define (jugador-get-id player)
  (first player))


;DESC: Función que obtiene el nombre de un jugador.
;DOM: player (jugador)
;REC: nombre (string)
;RECURSION: No aplica
(define (jugador-get-nombre player)
  (second player))


;DESC: Función que obtiene el dinero actual del jugador
;DOM: player(jugador)
;REC: dinero(int)
;RECURSION: No aplica
(define (jugador-get-dinero player)
  (third player))


;DESC: Función que obtiene las propiedades del jugador
;DOM: player (jugador)
;REC: propiedades (lista)
;RECURSION: No aplica
(define (jugador-get-propiedades player)
  (fourth player))


;DESC: Función que obtiene la posicion actual del jugador (indice en la lista)
;DOM: jugador(jugador)
;REC: pos(num)
;RECURSION: No aplica
(define (jugador-get-posicionActual player)
  (fifth player))


;DESC: Función que obtiene el valor de 'estaEnCarcel'
;DOM: player(jugador)
;REC: estaEnCarcel (bool)
;RECURSION: No aplica
(define (jugador-get-estaEnCarcel player)
  (sixth player))


;DESC: Función que obtiene el total de cartas para salir de la carcel que tiene el jugador
;DOM: playuer(jugador)
;REC: totalCartasSalirCarcel (int)
;RECURSION: No aplica
(define (jugador-get-totalCartasSalirCarcel player)
  (seventh player))

;DESC: Función que obtiene el número de tiradas iguales consecutivas que lleva el jugador
;DOM: player(jugador)
;REC: contadorConsecutivos (int)
;RECURSION: No aplica
(define (jugador-get-contadorConsecutivos player)
  (list-ref player 7))



;____________MODIFICADORES____________;


;DESC: Funcion que inicializa el dinero del jugador con 1500
;DOM: jugador
;REC: jugador
;RECURSION: Natural (llamado actualizar-n)
(define (init-jugador-dinero jugador)
  (actualizar-n jugador 2 1500))

;DESC: Devuelve un nuevo jugador con estaEnCarcel modificado
;DOM: jugador X bool
;REC: jugador
(define (jugador-set-estaEnCarcel jugador nuevoValor)
  (reemplazar-n jugador 5 nuevoValor))

;DESC: Funcion que suma (o resta si nuevoValor es negativo) al valor totalCartasSalirCarcel
;DOM: jugador(jugador) X nuevoValor(int)
;REC: jugadorActualizado(jugador)
(define (jugador-set-totalCartasSalirCarcel jugador nuevoValor)
  (reemplazar-n jugador 6 (+ nuevoValor (jugador-get-totalCartasSalirCarcel jugador))))

;DESC: Funcion que actualiza el dinero de un jugador
;DOM: jugador(jugador) X nuevoValor(int)
;REC: jugadorActualizado(jugador)
(define (jugador-set-dinero jugador nuevoValor)
  (reemplazar-n jugador 2 nuevoValor))


  


;____________OTROS____________;

;DESC: Indica si el jugador está actualmente preso
;DOM: jugador (jugador)
;REC: boolean
;RECURSION: No aplica
(define (jugador-esta-en-carcel? jugador)
  (jugador-get-estaEnCarcel jugador))  ; devuelve #t o #f directamente


;DESC: Funcion que indica si un jugador esta en la carcel a partir de game.
;DOM: jugador (jugador) X game (juego)
;REC: en-carcel?(bool)
;RECURSION: No aplica
(define (jugador-en-carcel? jugador game)
  (define pos     (jugador-get-posicionActual jugador))
  (define casilla ; busco la casilla que coincide
    (first
     (filter (lambda (c) (= (first c) pos))
             (cadr game))))
  (and casilla
       (equal? (second casilla) 'carcel)))

;DESC: Función verificadora para determinar si un jugador puede pagar cierto monto
;DOM: player(jugador) X monto(int)
;REC: tiene-suficiente-dinero? (bool)
(define (jugador-tiene-suficiente-dinero? player monto)
  (define dineroJugador (jugador-get-dinero player))
  (define restaDinero (- dineroJugador monto))
  (cond [(>= restaDinero 0) #t]
        [else #f]))





    
  



  


    
  



  
   
