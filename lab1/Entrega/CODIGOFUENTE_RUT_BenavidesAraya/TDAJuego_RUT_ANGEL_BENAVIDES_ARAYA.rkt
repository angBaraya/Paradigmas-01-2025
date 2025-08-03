#lang racket

(require racket/lazy-require)
(provide (all-defined-out))
(require "funcionesAux_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDATablero_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "main_RUT_ANGEL_BENAVIDES.rkt")


;____________SELECTORES____________;

;DESC: Función que obtiene los jugadores
;DOM: game (juego)
;REC: jugadores (lista)
;RECURSION: No aplica
(define (juego-get-jugadores game)
  (first game))


;DESC: Función que obtiene el tablero
;DOM: game (juego)
;REC: tablero (tablero)
;RECURSION: No aplica
(define (juego-get-tablero game)
  (second game))


;DESC: Función que el dinero del banco
;DOM: game (juego)
;REC: dineroBanco (int)
;RECURSION: No aplica
(define (juego-get-dineroBanco game)
  (third game))


;DESC: Función que obtiene la cantidad de dados en la partida
;DOM: game (juego)
;REC: numeroDados (int)
;RECURSION: No aplica
(define (juego-get-numeroDados game)
  (fourth game))


;DESC: Función que obtiene el identificador del jugador que tiene el turno actual.
;DOM: game (juego)
;REC: turnoActual (int)
;RECURSION: No aplica
(define (juego-get-turnoActual game)
  (fifth game))

;DESC: Función que obtiene la tasaImpuesto (% a pagar al pasar por la salida) actual.
;DOM: game (juego)
;REC: tasaImpuesto (int)
;RECURSION: No aplica
(define (juego-get-tasaImpuesto game)
  (sixth game))


;DESC: Función que obtiene el máximo de casas (global)
;DOM: game (juego)
;REC: maximoCasas (int)
;RECURSION: No aplica
(define (juego-get-maximoCasas game)
  (seventh game))


;DESC: Función que obtiene el máximo de hoteles (global)
;DOM: game (juego)
;REC: maximoHoteles(lista)
;RECURSION: No aplica
(define (juego-get-maximoHoteles game)
  (list-ref game 7))


;DESC: Función que obtiene el mazo suerte (representacion: TDA Mazo)
;DOM: game (juego)
;REC: mazoSuerte(mazo)
;RECURSION: No aplica
(define (juego-get-mazoSuerte game)
  (list-ref game 8))


;DESC: Función que obtiene el mazo comunidad (representacion: TDA Mazo)
;DOM: game (juego)
;REC: mazoComunidad(mazo)
;RECURSION: No aplica
(define (juego-get-mazoComunidad game)
  (list-ref game 9))

(define (juego-get-cantidad-jugadores game)
  (length(first game)))
  

;DESC: Función que retorna la casilla del tablero que contiene una propiedad cuyo id coincide con el entregado.
;DOM: game (juego) X idPropiedad (int)
;REC: casilla (list) de la forma (posición (propiedad))
;TIPO RECURSION: No aplica (declarativa)
(define (juego-get-propiedad-por-id game idPropiedad)
  (define tablero (second game))
  (first (filter (lambda (casilla)
                   (and (pair? (second casilla))               ; es una propiedad (no carcel/suerte)
                        (= (first (second casilla)) idPropiedad))) ; idPropiedad coincide
                 tablero)))


;____________MODIFICADORES____________;

;DESC: Reemplaza en el tablero del juego la casilla que contiene la propiedad actualizada  
;DOM: game (juego) X propConPosActualizada (lista de la forma (pos (listaPropiedad))  
;REC: juego actualizado (juego)  
;RECURSION: No aplica
(define (juego-reemplazar-prop game propConPosActualizada)
  (apply juego
         (cons
          ;jugadores intactos
          (first game)
          ;tablero con la casilla reemplazada
          (cons
           (map (lambda (casilla)
                  (if (= (first casilla)
                         (first propConPosActualizada))
                      propConPosActualizada
                      casilla))
                (juego-get-tablero game))
           ;resto de campos del juego sin tocar
           (list (juego-get-dineroBanco game)
                 (juego-get-numeroDados game)
                 (juego-get-turnoActual game)
                 (juego-get-tasaImpuesto game)
                 (juego-get-maximoCasas game)
                 (juego-get-maximoHoteles game)
                 (juego-get-mazoSuerte game)
                 (juego-get-mazoComunidad game))))))

;DESC: Función para actualizar una propiedad en el tablero del juego
;DOM: game (juego) X posProp (int) X newProp (propiedad)
;REC: juego actualizado (juego)
;RECURSION: No aplica
(define (juego-set-propiedad game posProp newProp)
  ;; extraigo el tablero
  (define tablero (second game))
  ;; construyo un tablero nuevo donde en posProp va newProp
  (define nuevo-tablero
    (map (lambda (casilla)
           (if (= (first casilla) posProp)
               (list posProp newProp)
               casilla))
         tablero))
  ;juego con el tablero sustuido
  (reemplazar-n game 1 nuevo-tablero))



;DESC: Función que actualiza un jugador concreto en la lista de jugadores del juego.
;DOM: playerList (lista de jugadores) X modifiedPlayer (jugador)
;REC: lista de jugadores en que, si el id de un jugador coincide con el de modifiedPlayer, 
;     se reemplaza por modifiedPlayer; el resto permanece igual (list)
;RECURSION: No aplica
(define (juego-actualizar-jugadores playerList modifiedPlayer)
  (define (actualizar-lista lst lstAct)
    (map (lambda (x)
         (if (equal? (first x)
                     (first lstAct))
             lstAct
             x))
    lst))
  (actualizar-lista playerList modifiedPlayer))
  

;DESC: Función que mueve a un jugador y actualiza su estado dentro del juego (utiliza el RF11 para hacer el movimiento)
;DOM: player (jugador) X diceValues (lista de valores de dados) X game (juego)
;REC: newGame(juego)
;RECURSION: No aplica
(define (juego-mover player diceValues game)
  (define playerAfterMove(jugador-mover player diceValues game))
  (define playerList(juego-get-jugadores game))
  (define newGame (juego (juego-actualizar-jugadores playerList playerAfterMove)
                         (juego-get-tablero game)
                         (juego-get-dineroBanco game)
                         (juego-get-numeroDados game)
                         (juego-get-turnoActual game)
                         (juego-get-tasaImpuesto game)
                         (juego-get-maximoCasas game)
                         (juego-get-maximoHoteles game)
                         (juego-get-mazoSuerte game)
                         (juego-get-mazoComunidad game)))
  newGame)


;DESC: Función que actualiza el valor de mazoSuerte en el juego
;DOM: game(juego) X deck (mazo)
;REC: newGame(juego)
;RECURSION: Natural (llamada a reemplazar-n)
(define (juego-set-mazoSuerte game deck)
  (reemplazar-n game 8 deck))


;DESC: Función que actualiza el valor de mazoComunidad en el juego
;DOM: game(juego) X deck (mazo)
;REC: newGame(juego)
;RECURSION: Natural (llamada a reemplazar-n)
(define (juego-set-mazoComunidad game deck)
  (reemplazar-n game 9 deck))


;DESC: FUncion que actualiza un jugador en un juego
;DOM: game(juego) X newJugador(jugador)
;REC: newGame (juego)
(define (juego-set-jugador game newJugador)
  (juego
    ;; 1) lista de jugadores con newJugador en lugar del viejo
    (map (lambda (p)
           (if (= (car p) (car newJugador))
               newJugador
               p))
         (car game))
    ;; 2) los otros 7 campos del juego, sin tocar
    (juego-get-tablero game)
    (juego-get-dineroBanco game)
    (juego-get-numeroDados game)
    (juego-get-turnoActual game)
    (juego-get-tasaImpuesto game)
    (juego-get-maximoCasas game)
    (juego-get-maximoHoteles game)
    (juego-get-mazoSuerte game)
    (juego-get-mazoComunidad game))) ; maximoHoteles



;___________OTROS____________;


;DESC: Función que suma los valores de dados guardados en una lista
;DOM: dados(lista)
;REC: suma(int)
;RECURSION: No aplica
(define (juego-sumar-dados dados)
  (apply + dados))
