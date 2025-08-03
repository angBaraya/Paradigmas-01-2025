#lang racket

(provide (all-defined-out))

;DESC: Función que  suma o resta un valor a la n-ésima posición
;DOM: lst(lista)Xn(int)XnuevaValor(int)
;REC: lista
;TIPO DE RECURSION: Natural
(define (actualizar-n lst n nuevoValor)
  (cond[(null? lst) lst]
       [(= 0 n)(cons nuevoValor (cdr lst))]
       [else (cons (car lst) (actualizar-n (cdr lst) (- n 1) nuevoValor))]))


;DESC: Reemplaza el valor n-ésimo con un nuevo valor.
;DOM: lst(lista)Xn(int)XnuevoValor(dependiente del valor a reemplazar)
;REC: Lista
;RECURSION: Natural
(define (reemplazar-n lst n nuevoValor)
  (cond[(null? lst) lst]
       [(= n 0) (cons nuevoValor (cdr lst))]
       [else (cons (car lst) (reemplazar-n (cdr lst) (- n 1) nuevoValor))]))


;DESC: Obtiene el contenido de la n-ésima posición de una lista
;DOM: lst(lista)Xn(int)
;REC: dato(depende de la lista)
;RECURSION: Natural
(define (get-n lst n)
  (cond[(null? lst) (error "get-n no funciona en listas vacias")]
       [(= n 0) (car lst)]
       [else (get-n (cdr lst) (- n 1))]))


;DESC: Agregar un elemnto en la n-ésima posicion en una lista
;DOM: lst(lista) X n(int) X e(depende del tipo a agregar)
;REC: lst(lista)
;RECRUSION: Natural
(define (agregar-en-n lst n e)
  (cond[(= n 0) (cons e lst)]
       [else (cons (car lst) (agregar-en-n (cdr lst) (- n 1) e))]))
