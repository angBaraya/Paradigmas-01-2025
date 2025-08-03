#lang racket

(require racket/lazy-require)
(provide (all-defined-out))
(require "funcionesAux_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(lazy-require
  ["TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
   (juego-get-maximoCasas juego juego-get-maximoHoteles juego-get-pos-propiedad)])
(lazy-require
  ["TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
   (jugador-get-id)])
(require "main_RUT_ANGEL_BENAVIDES.rkt")


;____________SELECTORES____________;

;DESC: Función que obtiene el id de una propiedad:
;DOM: prop (propiedad)
;REC: id (num)
;RECURSION: No aplica
(define (propiedad-get-id prop)
  (first prop))


;DESC: Función que obtiene el nombre de una propiedad.
;DOM: prop (propiedad)
;REC: nombre (string)
;RECURSION: No aplica
(define (propiedad-get-nombre prop)
  (second prop))


;DESC: Función que obtiene el precio de una propiedad.
;DOM: prop(propiedad)
;REC: precio(int)
;RECURSION: No aplica
(define (propiedad-get-precio prop)
  (third prop))


;DESC: Función que obtiene la renta de una propiedad.
;DOM: prop (propiedad)
;REC: renta (int)
;RECURSION: No aplica
(define (propiedad-get-renta prop)
  (fourth prop))


;DESC: Función que obtiene el dueño de la propiedad
;DOM: prop(propiedad)
;REC: dueño(string) | NULL (si no tiene dueño)
;RECURSION: No aplica
(define (propiedad-get-dueño prop)
  (fifth prop))


;DESC: Función que obtiene la cantidad de casas en una propiedad.
;DOM: prop(propiedad)
;REC: casas(int)
;RECURSION: No aplica
(define (propiedad-get-casas prop)
  (sixth prop))


;DESC: Función que obtiene el bool de si es Hotel
;DOM: prop(propiedad)
;REC: EsHotel(bool)
;RECURSION: No aplica
(define (propiedad-get-esHotel prop)
  (seventh prop))

;DESC: Función que obtiene el valor de 'estaHipotecada'
;DOM: prop(propiedad)
;REC: estaHipotecada (bool)
;RECURSION: No aplica
(define (propiedad-get-estaHipotecada prop)
  (list-ref prop 7))


;DESC: Función que obtiene la cantidad de hoteles de una propiedad
;DOM: prop(propiedad)
;REC: hoteles (int)
;RECURSION: No aplica
(define (propiedad-get-hoteles prop)
  (list-ref prop 8))


;DESC: Función que obtiene el valor de maxCasas (global)
;DOM: prop(propiedad)
;REC: maxCasas (int)
;RECURSION: No aplica
(define (propiedad-get-maxCasas prop)
  (list-ref prop 9))


;DESC: Función que obtiene el valor de maxHoteles (global)
;DOM: prop(propiedad)
;REC: maxHoteles (int)
;RECURSION: No aplica
(define (propiedad-get-maxHoteles prop)
  (list-ref prop 10))


;____________MODIFICADORES____________;


;DESC: Función que cambia el dueño de una propiedad.
;DOM: prop(propiedad) X idJugador
;REC: propActualizada(propiedad)
;RECURSION: No aplica
(define (propiedad-set-dueño prop player)
  
  (define PropActualizada (propiedad (propiedad-get-id prop)
                                     (propiedad-get-nombre prop)
                                     (propiedad-get-precio prop)
                                     (propiedad-get-renta prop)
                                     (jugador-get-id player)
                                     (propiedad-get-casas prop)
                                     (propiedad-get-esHotel prop)
                                     (propiedad-get-estaHipotecada prop)))
  PropActualizada)


;DESC: Función que actualiza el maximoHoteles en una propiedad con la forma: '(pos (<lista propiedad>))
;DOM: propConPos (lista de la forma '(pos (listaPropiedad))) X game(juego)
;REC: propConMaxHotelesActualizada (lista con la misma estructura)
;RECURSION: No aplica
(define (set-maximoHoteles propConPos game)
  (define maxHoteles (juego-get-maximoHoteles game))
  (list (first propConPos) (reemplazar-n (second propConPos) 10 maxHoteles)))


;DESC: Función que actualiza el maximoCasas en una propiedad con la forma: '(pos (<lista propiedad>))
;DOM: propConPos (lista de la forma '(pos (listaPropiedad))) X game (juego)
;REC: propConMaxCasasActualizada (lista con la misma estructura)
;RECURSION: No aplica
(define (set-maximoCasas propConPos game)
  (define maxCasas (juego-get-maximoCasas game))
  (list (first propConPos) (reemplazar-n (second propConPos) 9 maxCasas)))


;DESC: Función que actualiza la cantidad de hoteles en una propiedad con la forma: '(pos (<lista propiedad>))
;DOM: propConPos (lista de la forma '(pos (listaPropiedad))) X game(juego) X quantity(int)
;REC: propConHotelesActualizada (lista con la misma estructura)
;RECURSION: No aplica
(define (set-hoteles propConPos game quantity)
  (list
    (first propConPos)
    ;primero marco esHotel = #t (índice 6), luego actualizo hoteles (índice 8)
    (reemplazar-n
      (reemplazar-n (second propConPos) 6 #t)
      8 quantity)))


 

;____________OTROS____________;
  

    
  

  



  
