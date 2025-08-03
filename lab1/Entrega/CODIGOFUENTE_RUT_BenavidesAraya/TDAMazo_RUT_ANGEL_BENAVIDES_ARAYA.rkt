#lang racket

(provide (all-defined-out))

;____________CONSTRUCTORES____________;

;DESC: Crea un mazo de cartas de un mismo tipo, con cualquier número de cartas
;DOM: tipo (string)  X  cartas... (cualquier número de valores de tipo carta)
;REC: mazo (lista cuyo car es tipo y "dot operator" es la lista de cartas)
;RECURSION: No aplica
(define (mazo tipo . cartas)
  (list tipo cartas))


;____________SELECTORES____________;

;DESC: Función para obtener el tipo de mazo
;DOM: deck (mazo)
;REC: tipoMazo(string)
;RECURSION: No aplica
(define (mazo-tipo deck)
  (first deck))

;DESC: Función para la lista de cartas de un mazo
;DOM: deck (mazo)
;REC: cards(lista)
;RECURSION: No aplica
(define (mazo-cartas deck)
  (second deck))

;DESC: Función para obtener la cantidad de cartas que tiene un mazo
;DOM: deck (mazo)
;REC: cantidadCartas(int)
;RECURSION: No aplica
(define (mazo-cantidad-cartas deck)
  (length (second deck)))

