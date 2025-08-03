#lang racket

(require "main_RUT_ANGEL_BENAVIDES.rkt")
(require racket/lazy-require)
(require "TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.rkt")
(require "TDAMazo_RUT_ANGEL_BENAVIDES_ARAYA.rkt")


;__________RF02__________
(display "  RF02: \n")
(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))
(define p3 (jugador 3 "Goku" 1500 '() 0 #f 0))

(display "Jugador 1: ")
p1
(display "Jugador 2: ")
p2
(display "Jugador 3: ")
p3


;__________RF03__________
(display "\n  RF03: \n")
(define prop1 (propiedad 1 "Paseo Mediterráneo" 600 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 600 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 900 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 900 14 #f 0 #f #f))

(display "Propiedad 1: ")
prop1
(display "Propiedad 2: ")
prop2
(display "Propiedad 3: ")
prop3
(display "Propiedad 4: ")
prop4
(display "Propiedad 5: ")
prop5
(display "Propiedad 6: ")
prop6
(display "Propiedad 7: ")
prop7
(display "Propiedad 8: ")
prop8

;__________RF04__________
(display "\n  RF04: \n")
(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))
(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))

(display "Carta 1: ")
chance1
(display "Carta 2: ")
chance2
(display "Carta 3: ")
chance3
(display "Carta 4: ")
community1
(display "Carta 5: ")
community2
(display "Carta 6: ")
community3

;__________RF05__________
(display "\n  RF05: \n")
(display "Mi implementación de esta función lo deja inicialmente como una lista de listas
con el RF07 (agregar n propiedades) se deja mejor estructurado.\n")
(display "Tablero vacio:\n")
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
tablero-vacio

;__________RF07__________
(display "\n  RF07: \n")
(define lista-propiedades 
  (list (cons prop1 1) (cons prop2 3) (cons prop3 6)
        (cons prop4 8) (cons prop5 9) (cons prop6 11)
        (cons prop7 13) (cons prop8 14)))
(display "Tablero completo:\n")
(define tablero-completo (tablero-agregar-propiedad tablero-vacio lista-propiedades))
tablero-completo

;__________RF06__________
(display "\n  RF06: \n")
(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))
(display "Juego:\n")
g0

;__________RF08__________
(display "\n  RF08: \n")
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))
(define g3 (juego-agregar-jugador g2 p3))
(display"Juego con jugadores agregados:\n")
g3

;__________RF09__________
(display "\n  RF09: \n")

(define jugadorActual(juego-obtener-jugador-actual g3))
(display "jugadorActual turno 0 (el jugador que empieza): ")
jugadorActual
(display "Retorna carlos ya que es el primer jugador en la lista de jugadores\n")

(define g100 (juego '() tablero-completo 20000 2 5 10 4 1)) ; definimos una copia de juego, pero con otro valor en TurnoActual (5).
(define g101 (juego-agregar-jugador g100 p1))
(define g102 (juego-agregar-jugador g101 p2))
(define g103 (juego-agregar-jugador g102 p3));
(display "\nTablero con TurnoActual = 5:\n")
g103
(define jugadorActual2(juego-obtener-jugador-actual g103))
(display "jugadorActual turno 5:\n")
(display "C -> A -> G -> C -> A (retorna Ana): ")
jugadorActual2

;__________RF10__________
(display "\n  RF10: \n")
(define lanzarDados(juego-lanzar-dados 1 2))
(display "Dados lanzados con semillas: 1 2\n")
(display "Resultado: ")
lanzarDados
(define lanzarDados2(juego-lanzar-dados 5 0))
(display "Dados lanzados con semillas: 5 0\n")
(display "Resultado: ")
lanzarDados2
(define lanzarDados3(juego-lanzar-dados 3 4))
(display "Dados lanzados con semillas: 3 4\n")
(display "Resultado: ")
lanzarDados3

;;__________RF11__________
(display "\n  RF11: \n")
(display "El tablero tiene 20 posiciones,
se movera al jugador hasta que de una vuelta completa.\n")
(define p3AfterMove(jugador-mover p3 (list 3 4) g3))
(display "Jugador3 tras moverse con dados '(3 4) desde pos 0:")
p3AfterMove
(define p3AfterMove2(jugador-mover p3AfterMove (list 4 4) g3))
(display "Jugador3 tras moverse con dados '(4 4) desde pos 7:")
p3AfterMove2
(define p3AfterMove3(jugador-mover p3AfterMove2 (list 6 0) g3))
(display "Jugador3 tras moverse con dados '(6 0) desde pos 15:")
p3AfterMove3

;__________RF12__________
(display "\n  RF12: \n")
(display "jugador 3 inicialmente: ")
p3AfterMove3
(define jugador3ConPropiedad1(jugador-comprar-propiedad p3AfterMove3 prop2))
(display "jugador 3 tras comprar propiedad 1: ")
jugador3ConPropiedad1
(define jugador3ConPropiedad2(jugador-comprar-propiedad jugador3ConPropiedad1 prop5))
(display "jugador 3 tras comprar propiedad 5: ")
jugador3ConPropiedad2

;__________RF13__________
(display "\n  RF13: \n")
(define calculoRenta(jugador-calcular-renta jugador3ConPropiedad2 g3))
(display "600 (rentaProp2) + 120 (rentaProp5)\n")
(display "Calculo de la renta del jugador 3: ")
calculoRenta

;__________RF14__________
(display "\n  RF14: \n")
(define pomaire (propiedad 10 "Pomaire" 1000 10 #f 0 #f #f))
(display "Propiedad sin casas ni hoteles: ")
pomaire
(define rentaPomaire(propiedad-calcular-renta pomaire))
(display "Renta (0 casas, 0 hoteles, rentaBase = 1000): ")
rentaPomaire
(define villarica (propiedad 11 "Villarica" 1000 10 #f 3 #f #f))
(display "Propiedad con 3 casas, sin hoteles: ")
villarica
(define rentaVillarica(propiedad-calcular-renta villarica))
(display "Renta (3 casas, sin hoteles, rentaBase = 1000): ")
rentaVillarica
(display "\n")
(display "Actualizamos los valores: hoteles, maxCasas, maxHoteles de la propiedad Plaza San Carlos:\n")
(define propAux (juego-get-propiedad-por-id g3 6))
(define propAux2 (set-maximoHoteles propAux g2))
(display "Actualizado maxHoteles: ")
propAux2
(define propAux3 (set-maximoCasas propAux2 g2))
(display "Actualizado maxCasas: ")
propAux3
(define propAux4 (set-hoteles propAux3 g2 1))
(display "Actualizado hoteles (int) y valor de esHotel (bool): ")
propAux4
(display "Queda como: maxCasas = 4, maxHoteles = 1 (estos valores vienen de game), hoteles = 1 (este no, es arbitrario) \n")
(display "Finalmente, calculamos la renta con estos valores. 1 hotel, 0 casas y un máximo global de 4 casas\n")
(define rentaPropAux4(propiedad-calcular-renta (second propAux4)))
(display "Renta (1 hotel, 0 casas, rentaBase = 900): ")
rentaPropAux4
(display "Repetimos el proceso para testear el caso con 3 hoteles:")
(define propAux5 (set-hoteles propAux3 g3 3))
(display "\nActualizado hoteles = 3, esHotel = #t: ")
propAux5
(define rentaPropAux5 (propiedad-calcular-renta (second propAux5)))
(display "\nRenta (3 hoteles, 0 casas, rentaBase = 900): ")
rentaPropAux5
(display "en la documentación de la función esta especificado como se calcula para 2, 3 y 4 hoteles\n")

;__________RF15__________
(display "\n  RF15: \n")
(display "Propiedad 7 originalmente: ")
prop7
(define prop7conCasa(propiedad-construir-casa prop7 g3))
(display "Propiedad 7 con casa: ")
prop7conCasa
(define prop7conCasa2(propiedad-construir-casa prop7conCasa g3))
(display "Propiedad 7 con dos casas: ")
prop7conCasa2

;__________RF16__________
(display "\n  RF16: \n")
(display "como el maxGlobal de casas es 4, al tratar de construir un hotel en prop7 con 2 casas, no pasa nada.\n")
(define prop7hotel1(propiedad-construir-hotel prop7conCasa2 g3))
prop7hotel1
(define prop7conCasa3(propiedad-construir-casa prop7hotel1 g3))
(define prop7conCasa4(propiedad-construir-casa prop7conCasa3 g3))
(display "Ahora con 4 casas, cantidadCasas = maxCasas = 4.\n")
prop7conCasa4 ; '(7 "Avenida St. James" 180 14 #f 4 #f #f 0 0 0)
(define prop7hotel2(propiedad-construir-hotel prop7conCasa4 g3))
prop7hotel2
(display "Igual, no se actualizan los últimos 3 valores porque eso es pega de otra función, no de esta")

;__________RF17__________
(display "\n  RF17: \n")
(display "Simulamos que ana le paga 314 a carlos\n")
(display "Jugador 1: ")
p1
(display "Jugador 2: ")
p2
(define listaJugadores(jugador-pagar-renta p2 p1 314))
(display "Lista de jugadores resultante: ")
listaJugadores

;__________RF18__________
(display "\n  RF18: \n")
(display "Propiedad 2 original: ")
prop2
(define prop2Hipotecada(propiedad-hipotecar prop2))
(display "Propiedad 2 hipotecada: ")
prop2Hipotecada

;__________RF19__________
(display "\n  RF19: \n")
(display "Definimos los mazos:\n")

(define mazoSuerte
  (mazo "suerte" chance1 chance2 chance3))
(display "mazo Suerte: ")
mazoSuerte
(define mazoComunidad
  (mazo "comunidad" community1 community2 community3))
(display "mazo Comunidad: ")
mazoComunidad

(display "Los agregamos a juego ya que para usar RF tenemos de dominio a game:\n")
(define g4 (juego-set-mazoSuerte g3 mazoSuerte))
(define g5 (juego-set-mazoComunidad g4 mazoComunidad))
g5

(display "usamos la funcion del RF19:\n")
(define cartaExtraida1(juego-extraer-carta g5 "suerte"))
(display "carta suerte extraida:")
cartaExtraida1
(define cartaExtraida2(juego-extraer-carta g5 "comunidad"))
(display "carta comunidad extraida:")
cartaExtraida2

;__________RF20__________
(display "\n  RF20: \n")
(define p4 (jugador 4 "Angel" 0 '() 0 #f 0))
(display "Jugador 1: ")
p1
(display "Jugador 4: ")
p4
(display "Verificamos si Carlos esta en bancarrota: ")
(define p1Bancarrota(jugador-esta-en-bancarrota p1))
p1Bancarrota
(display "Verificamos si Angel esta en bancarrota: ")
(define p4Bancarrota(jugador-esta-en-bancarrota p4))
p4Bancarrota

;__________RF21__________
;No logrado.


  




















