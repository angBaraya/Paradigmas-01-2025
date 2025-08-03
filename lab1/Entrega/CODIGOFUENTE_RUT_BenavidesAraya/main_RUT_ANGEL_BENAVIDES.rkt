#lang racket

(provide (all-defined-out))
(require racket/lazy-require)
(require "funcionesAux_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(lazy-require
 ["TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
  (init-jugador-dinero jugador-get-posicionActual jugador-get-dinero jugador-get-id
                       jugador-get-nombre jugador-get-propiedades jugador-get-estaEnCarcel
                       jugador-get-totalCartasSalirCarcel jugador-get-contadorConsecutivos
                       jugador-esta-en-carcel? jugador-set-totalCartasSalirCarcel
                       jugador-set-estaEnCarcel jugador-tiene-suficiente-dinero?
                       jugador-set-dinero)])
(lazy-require
 ["TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
  (juego-get-turnoActual juego-get-cantidad-jugadores juego-get-jugadores
                         juego-get-maximoCasas juego-mover juego-get-maximoHoteles
                         juego-get-mazoSuerte juego-get-mazoComunidad
                         juego-get-tasaImpuesto juego-set-jugador juego-set-propiedad)])
(lazy-require
 ["TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
  (propiedad-get-precio propiedad-get-dueño propiedad-set-dueño propiedad-get-casas
                        propiedad-get-id propiedad-get-nombre
                        propiedad-get-renta propiedad-get-esHotel propiedad-get-estaHipotecada
                        propiedad-get-hoteles propiedad-get-maxCasas propiedad-get-maxHoteles)])
(lazy-require
 ["TDAMazo_RUT_ANGEL_BENAVIDES_ARAYA.rkt"
  (mazo-cartas mazo-cantidad-cartas)])


;__________RF02__________
;DESC: Función que permite crear un jugador.
;DOM: id (int) X nombre (string) X dinero (int) X propiedades (list id's) X
;posicioActual (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int)
;REC: jugador (jugador)
;TIPO RECURSION: No aplica 
(define (jugador id nombre dinero propiedades
                 posicionActual estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades posicionActual estaEnCarcel totalCartasSalirCarcel 0))
                                                                            ; contadorConsecutivos

;__________RF03__________
;DESC: Función que permite crear una propiedad en el juego.
;DOM: id (int) X nombre (string) X precio (int) X renta (int) X
;dueño (jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean) X hoteles (int)
;REC: propiedad (propiedad)
;TIPO RECURSION: No aplica 
(define (propiedad id nombre precio renta dueño casas esHotel estaHipotecada)
                                       
  (list id nombre precio renta dueño casas esHotel estaHipotecada 0 0 0))
                                                         ;hoteles maxCasas maxHoteles

;__________RF04__________
;DESC: Función que permite crear una carta en el juego.
;DOM: id (int) X tipo (string) X descripcion (string) X accion (funcion)
;REC: carta (carta)
;TIPO RECURSION: No aplica 
(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))


;__________RF05__________
;DESC: Función que permite crear un tablero de CAPITALIA.
;DOM: propiedades (lista) X cartas-suerte (lista) X cartas-comunidad (lista) X casillas-especiales (lista)
;REC: tablero (tablero)
;TIPO RECURSION: No aplica
(define (tablero propiedades cartas-suerte cartas-comunidad casillas-especiales)
  (list propiedades cartas-suerte cartas-comunidad casillas-especiales))
;NOTA: Primeramente se dejara como una lista de listas, el manejo de las posiciones
;      se realizara en la función para agregar n propiedades (se asume que esta función siempre
;      se ocupara en los scripts/ejecución del código).


;__________RF06__________
;DESC: Función que crea una partida de CAPITALIA.
;DOM: jugadores (lista) X tablero (tablero) X dineroBanco (int) X
;numeroDados (int) X turnoActual (int) X tasaImpuesto (int) X
;maximoCasas (int) X maximoHoteles (int) X estadoJuego (string)
;REC: juego(juego)
;TIPO RECURSION: No aplica
(define (juego jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto
               maximoCasas maximoHoteles)
  (list jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto
               maximoCasas maximoHoteles '() '()))
                                      ;mazoSuerte ;mazoComunidad

;__________RF07__________
;DESC: Función para agregar propiedades al tablero. Permite agregar n propiedades.
;DOM: tablero (tablero) X propiedades con posición (lista de pares (propiedad . posicion))
;REC: tablero (tablero)
;TIPO RECURSION: No aplica (declarativo)
(define (tablero-agregar-propiedad tabl lista-propiedades)
  ;calculamos el tamaño total del tablero
  (define largo
    (+ (length (first tabl))
       (length (second tabl))
       (length (third tabl))
       (length (fourth tabl))
       (length lista-propiedades)))

  ;generamos la lista de posiciones [0 1 2 ... largo-1]
  (define listaPos
    (build-list largo (lambda (x) x)))

  ;invertimos el orden de las propiedades con posición fija y nuevas
  (define (invertir-orden lst)
    (map (lambda (p) (list (cdr p) (car p))) lst))

  (define propEspecialesInv
    (invertir-orden (fourth tabl)))
  (define propNuevasInv
    (invertir-orden lista-propiedades))

  ;cartas de suerte y comunidad, aplanadas
  (define cartas
    (append (second tabl) (third tabl)))

  ;posiciones ya ocupadas y libres
  (define posicionesOcupadas
    (map car (append propEspecialesInv propNuevasInv)))
  (define posicionesLibres
    (filter (lambda (p) (not (member p posicionesOcupadas)))
            listaPos))

  ;emparejamos cada carta a una posición libre e invertimos orden
  (define propCartasInv
    (invertir-orden (map cons cartas posicionesLibres)))

  ;todas las propiedades con posición
  (define todas-las-propiedades
    (append propEspecialesInv propNuevasInv propCartasInv))

  ;construimos el tablero final con map, filter y apply
  (map (lambda (pos)
         (if (null? (filter (lambda (p)
                              (= pos (car p)))
                            todas-las-propiedades))
             pos
             (cons pos
                   (apply append
                          (map cdr
                               (filter (lambda (p)
                                         (= pos (car p)))
                                       todas-las-propiedades))))))
       listaPos))


;__________RF08__________
;DESC:Función para agregar un jugador a la partida y asignar capital inicial
;DOM: juego (juego) X jugador(jugador)
;REC: No aplica
(define (juego-agregar-jugador juego jugador)
  (reemplazar-n juego 0 (append (car juego) (list (init-jugador-dinero jugador)))))


;__________RF09__________
;DESC: Función para obtener el jugador cuyo turno se encuentra en curso (jugador actual)
;DOM: game(juego)
;REC: jugador(jugador)
;RECURSION: No aplica (declarativo)
(define (juego-obtener-jugador-actual juego)
  (list-ref
   (juego-get-jugadores juego)
   (if (zero? (juego-get-turnoActual juego))
       0
       (modulo
        (- (juego-get-turnoActual juego) 1)
        (juego-get-cantidad-jugadores juego)))))



;FUNCIONES DADAS EN ENUNCIADO PARA RF10

;DESC: Función generadora para obtener un número pseudoaleatorio.
;DOM: Xn (num)
;REC: num_Pseudoaleatorio (num)
;RECURSION: No aplica
(define (myRandom Xn)
  (modulo (+ (* 1103515245 Xn) 12345) 2147483648))


;DESC: Función para obtener un valor aleatorio de un dado (1 a 6) a partir de una semilla
;DOM: seed (number)
;REC: number (entero entre 1 y 6)
;RECURSION: No aplica
(define (getDadoRandom seed)                    
  (+ 1 (modulo (myRandom seed) 6)))


;__________RF10__________
;DESC: Función para simular el lanzamiento de 2 dados.
;DOM: seed-dado1 (number) X seed-dado2 (number) 
;REC: lista (valordado1 valordado2)
;RECURSION: No aplica
(define (juego-lanzar-dados seed-dado1 seed-dado2)
  (list (getDadoRandom seed-dado1) (getDadoRandom seed-dado2)))


;__________RF11__________
;DESC: Función para mover al jugador en el tablero y cobrar impuesto si pasa por “salida”
;DOM: jugador (jugador) X valoresDados (lista) X juego (juego)
;REC: jugador actualizado (jugador)
;RECURSION: No aplica (fuerza bruta)
(define (jugador-mover jugador valoresDados juego)
  (define largo-tablero
    (length (cadr juego)))
  (define pasos-sumados
    (apply + valoresDados))
  (define pos-actual
    (jugador-get-posicionActual jugador))
  (define pos-final
    (modulo (+ pos-actual pasos-sumados)
            largo-tablero))
  (define tasa-impuesto
    (juego-get-tasaImpuesto juego))
  ;; cálculo nuevo dinero: si cruzó “salida”, le cobro impuesto
  (define dinero-actualizado
    (cond
      [(>= (+ pos-actual pasos-sumados) largo-tablero)
       (- (jugador-get-dinero jugador)
          (* (jugador-calcular-renta jugador juego) (quotient tasa-impuesto 100)))]
      [else
       (jugador-get-dinero jugador)]))
  (define newJugador
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          dinero-actualizado
          (jugador-get-propiedades jugador)
          pos-final
          (jugador-get-estaEnCarcel jugador)
          (jugador-get-totalCartasSalirCarcel jugador)
          (jugador-get-contadorConsecutivos jugador)))
  newJugador)




;__________RF12__________
;DESC: Función que permite crear comprar una propiedad.
;DOM: jugador (jugador) X propiedad (propiedad)
;REC: jugador
;RECURSION: No aplica
(define (jugador-comprar-propiedad player propiedad)
  (define dineroJugador (jugador-get-dinero player))
  (define precioPropiedad (propiedad-get-precio propiedad))
  (define estadoPropiedad (propiedad-get-dueño propiedad))

  (cond[(and (equal? estadoPropiedad #f) (>= (- dineroJugador precioPropiedad) 0))
        (define jugadorActualizado (jugador (jugador-get-id player)
                                            (jugador-get-nombre player)
                                            (- (jugador-get-dinero player) precioPropiedad)
                                            (cons (propiedad-get-id propiedad) (jugador-get-propiedades player))
                                            (jugador-get-posicionActual player)
                                            (jugador-get-estaEnCarcel player)
                                            (jugador-get-totalCartasSalirCarcel player)
                                            ))
        jugadorActualizado]
       [else player]))
;Nota: esta función se debe llamar junto a la funcion set-dueño para colocar que el dueño de la propiedad es el jugador que lo compro


;__________RF13__________
;DESC: Función para calcular la renta de todas las propiedades de un jugador
;DOM: player(jugador) X game(juego)
;REC: montoRenta (int)
;RECURSION: No aplica
(define (jugador-calcular-renta player game)
  (apply +
         (cons 0
               (map (lambda (pid)
                      (propiedad-calcular-renta
                        (second
                         (first
                          (filter (lambda (casilla)
                                    (and (pair?    (second casilla)) ; es propiedad
                                         (= (first  (second casilla))
                                            pid)))       ; mismo ID
                                  (second game))))))
                    (list-ref player 3)))))


  
;__________RF14__________
;DESC: Función para calcular la renta de una propiedad.
;      de las reglas del enunciado, se calcula la rentaBase como: "Por cada casa construida se aumenta 20% el valor de la propiedad."
;      Luego, se realizo una adaptación a la regla del enunciado para extenderlo hasta 4 hoteles:
;      1 Hotel   -> 2 * rentaBase
;      2 Hoteles -> 3 * rentaBase
;      3 Hoteles -> 4 * rentaBase
;      4 Hoteles -> 5 * rentaBase
;      notar que bajo esta implementación al tener 2 hoteles y 3 casas se cobra lo mismo que con 2 hoteles y 0 casas (intended).
;DOM: propiedad (propiedad)
;REC: montoRenta (num)
;RECURSION: No aplica
(define (propiedad-calcular-renta prop)
  (define casas (propiedad-get-casas prop))
  (define casasMax (propiedad-get-maxCasas prop))
  (define hotel? (propiedad-get-esHotel prop))
  (define hoteles (propiedad-get-hoteles prop))
  (define rentaBase(propiedad-get-precio prop))

  (cond [(equal? hotel? #t)
         (cond [(= hoteles 1) (exact-truncate (* 2 (* rentaBase (expt 1.2 casasMax))))]
               [(= hoteles 2) (exact-truncate (* 3 (* rentaBase (expt 1.2 casasMax))))]
               [(= hoteles 3) (exact-truncate (* 4 (* rentaBase (expt 1.2 casasMax))))]
               [(= hoteles 4) (exact-truncate (* 5 (* rentaBase (expt 1.2 casasMax))))])]
        (else (exact-truncate(* rentaBase (expt 1.2 casas))))))

;__________RF15__________
;DESC: Función que permite construir una casa en una propiedad
;DOM: prop(propiedad) X game(juego)
;REC: propiedad
;RECURSION: No aplica
(define (propiedad-construir-casa prop game)
  (define maxCasas (juego-get-maximoCasas game))
  (define casasActual (propiedad-get-casas prop))
  ;Falta implementar la manera en que se le reste dinero al jugador al comprar la casa en otra funcion (el precio de la casa es el mismo que el precio de la propiedad)
  (cond[(>= maxCasas (+ casasActual 1))
        (define propActual(propiedad (propiedad-get-id prop)
                                     (propiedad-get-nombre prop)
                                     (propiedad-get-precio prop)
                                     (propiedad-get-renta prop)
                                     (propiedad-get-dueño prop)
                                     (+ casasActual 1)
                                     (propiedad-get-esHotel prop)
                                     (propiedad-get-estaHipotecada prop)))
            propActual]
       [else prop]))


;__________RF16__________
;DESC: Función que permite transfomar las casas de una propiedad en hotel.
;DOM: prop (propiedad) X game (juego)
;REC: prop (propiedad)
;RECURSION: No aplica
(define (propiedad-construir-hotel prop game)
  (define casas-actual (propiedad-get-casas           prop))
  (define max-casas    (juego-get-maximoCasas       game))
  (define max-hoteles  (juego-get-maximoHoteles     game))

  (cond
    [(and (>= casas-actual max-casas)
          (<  (propiedad-get-hoteles prop)
              max-hoteles))
     (define propActualizada
       (propiedad
         (propiedad-get-id              prop)
         (propiedad-get-nombre          prop)
         (propiedad-get-precio          prop)
         (propiedad-get-renta           prop)
         (propiedad-get-dueño           prop)
         0                                  ; casas = 0 al construir hotel
         #t                                 ; esHotel = true
         (propiedad-get-estaHipotecada     prop)))
     propActualizada]
    [else
     prop]))


;__________RF17__________
;DESC: Función para que un jugador pague renta a otro.
;DOM: pagador (jugador) X receptor (jugador) X monto (int)
;REC: Lista jugadores actualizados (list)
;RECURSION: No aplica
(define (jugador-pagar-renta pagador receptor monto)
  (define dineroPagador (jugador-get-dinero pagador))
  (define dineroReceptor (jugador-get-dinero receptor))
  (define nuevoPagador (jugador (jugador-get-id pagador)
                                (jugador-get-nombre pagador)
                                (- dineroPagador monto)
                                (jugador-get-propiedades pagador)
                                (jugador-get-posicionActual pagador)
                                (jugador-get-estaEnCarcel pagador)
                                (jugador-get-totalCartasSalirCarcel pagador)))
    (define nuevoReceptor (jugador (jugador-get-id receptor)
                                   (jugador-get-nombre receptor)
                                   (+ dineroReceptor monto)
                                   (jugador-get-propiedades receptor)
                                   (jugador-get-posicionActual receptor)
                                   (jugador-get-estaEnCarcel receptor)
                                   (jugador-get-totalCartasSalirCarcel receptor)))
    (list nuevoPagador nuevoReceptor))
;Pide resolver de manera declarativa, tal vez deba cambiarla.


;__________RF18__________
;DESC: Función para hipotecar una propiedad.
;DOM: prop (propiedad)
;REC: propiedad
;RECURSION: No aplica
(define (propiedad-hipotecar prop)
  (define propActualizada (propiedad (propiedad-get-id prop)
                                     (propiedad-get-nombre prop)
                                     (propiedad-get-precio prop)
                                     (propiedad-get-renta prop)
                                     (propiedad-get-dueño prop)
                                     (propiedad-get-casas prop)
                                     (propiedad-get-esHotel prop)
                                     #t))
  propActualizada)


;__________RF19__________
;DESC: Función para extraer una carta del mazo correspondiente
;DOM: juego(juego) X tipoMazo (string: "suerte" o "comunidad")
;REC: carta (carta)
(define (juego-extraer-carta game tipoMazo)
  (define deck (cond [(string=? tipoMazo "suerte") (juego-get-mazoSuerte game)]
        [else (juego-get-mazoComunidad game)]))
  (define cards (mazo-cartas deck))
  (define cardsQuantity (mazo-cantidad-cartas deck))
  (define index (random cardsQuantity)) ;rango {0..n-1}
  (list-ref cards index))
  

  




;__________RF20__________
;DESC: Función para verificar si un jugador se encuentra en bancarrota (sin dinero).
;DOM: player (jugador)
;REC: boolean (#t si está en bancarrota, #f si no)
;RECURSION: No aplica
(define (jugador-esta-en-bancarrota player)
  (cond[(= 0 (jugador-get-dinero player)) #t]
       [else #f]))



;__________RF21__________

;NOTA: No logre implementar este RF, estaba haciendo el manejo de la carcel, verificar dados repetidos,
;      cartas, hipotecas, impuesto al pasar por la salida, entre otros. Y no alcance a hacerlo, por lo
;      mismo, el script enviado se enfocara en demostrar el funcionamiento de los otros RF, esto se dejo
;      mencionado en el informe.
;
;      Dejo el intento de implementación abajo  para seguir trabajando en ello.

#|

;DESC: Función que ejecuta un turno completo aplicando todas las reglas del juego.
;DOM: game (juego) X valorDados (lista) X accionPropiedad(comprarPropiedad or construirCasa (bool #t o #f)) X
;     construirHotel(bool #t o #f) X pagarMultaSalirCarcel (bool #t o #f) X
;     usarTarjetaSalirCarcel(bool #t o #f)
;REC: game (juego)

(define (juego-jugar-turno game valorDados accionPropiedad construirHotel
                             pagarMultaSalirCarcel usarTarjetaSalirCarcel)
  ;; 1) Muevo al jugador y lo inserto en el juego → game1
  (define jugadorActual
    (juego-obtener-jugador-actual game))
  (define jugadorAfterMove
    (jugador-mover jugadorActual valorDados game))
  (define game1
    (juego-set-jugador game jugadorAfterMove))

  ;Calculo jugadorEstado: sale de la cárcel por tarjeta, multa o se queda (falta implementar salida por dados consecutivos)
  (define jugadorEstado
    (cond
      [(and (jugador-esta-en-carcel? jugadorAfterMove)
            usarTarjetaSalirCarcel
            (> (jugador-get-totalCartasSalirCarcel jugadorAfterMove) 0))
       (jugador-set-totalCartasSalirCarcel
        (jugador-set-estaEnCarcel jugadorAfterMove #f)
        (- (jugador-get-totalCartasSalirCarcel jugadorAfterMove) 1))]
      [(and (jugador-esta-en-carcel? jugadorAfterMove)
            pagarMultaSalirCarcel
            (jugador-tiene-suficiente-dinero? jugadorAfterMove 500))
       (jugador-set-dinero
        (jugador-set-estaEnCarcel jugadorAfterMove #f)
        (- (jugador-get-dinero jugadorAfterMove) 500))]
      [else
       jugadorAfterMove]))

  ;Inserto jugadorEstado en el nuevo estado de juego
  (define game2
    (juego-set-jugador game1 jugadorEstado))

  ;Obtengo la casilla en que quedó para las siguientes reglas (ESTA NO SIRVE PA NADA)
  (define pos-actual
    (jugador-get-posicionActual jugadorEstado))
  (define casilla
  (first
    (filter (lambda(c)
              (and (pair? c)
                   (= (first c) pos-actual)))
            (cadr game2))))


  ;Caso carta
  (define game3
    (cond
      [(and (pair? (second casilla))
            (or (string=? (cadr (second casilla)) "suerte")
                (string=? (cadr (second casilla)) "comunidad")))
       (define tipo-carta (cadr (second casilla)))
       (define carta       (juego-extraer-carta game2 tipo-carta))
       (define accion      (list-ref carta 3))
       (accion game2 jugadorEstado)]
      [else
       game2]))

  ;Caso propiedad
  (define game4
    (cond
      ;Es casilla de propiedad
      [(and (pair? (second casilla))
            (number? (caddr (second casilla))))
       (define pos-prop (jugador-get-posicionActual jugadorEstado))
       (define prop     (second casilla))

       ;Sin dueño
       (cond
         [(equal? (propiedad-get-dueño prop) #f)
          (define game-buy
            (juego-set-jugador
             (juego-set-propiedad
              game3
              pos-prop
              (propiedad-set-dueño
               prop
               (jugador-get-id
                (jugador-comprar-propiedad jugadorEstado prop))))
             (jugador-comprar-propiedad jugadorEstado prop)))
          (if accionPropiedad
              game-buy
              game3)]

         ;De otro jugador
         [(not (equal? (propiedad-get-dueño prop) #f))
          (define owner-id (propiedad-get-dueño prop))
          (define jugadorD
            (first
             (filter (lambda(p)
                       (= (jugador-get-id p) owner-id))
                     (juego-get-jugadores game3))))
          (define renta (propiedad-calcular-renta prop))
          (define game-rent
            (juego-set-jugador
             (juego-set-jugador
              game3
              (second (jugador-pagar-renta jugadorEstado jugadorD renta)))
             (first (jugador-pagar-renta jugadorEstado jugadorD renta))))
          (if (jugador-tiene-suficiente-dinero? jugadorEstado renta)
              game-rent
              (juego-set-jugador game3
                                 (jugador-set-dinero jugadorEstado 0)))]

         ;Propiedad propia
         [else
          (define newProp
            (cond
              [(and construirHotel
                    (>= (propiedad-get-casas prop)
                        (juego-get-maximoCasas game3)))
               (propiedad-construir-hotel prop game3)]
              [(and accionPropiedad
                    (< (propiedad-get-casas prop)
                       (juego-get-maximoCasas game3)))
               (propiedad-construir-casa prop game3)]
              [else
               prop]))
          (juego-set-propiedad game3 pos-prop newProp)])]

      ;; 6.2) No es casilla de propiedad → no cambio
      [else
       game3]))

  ;estado final del juego
  game4)
  
  
|#
  
  
