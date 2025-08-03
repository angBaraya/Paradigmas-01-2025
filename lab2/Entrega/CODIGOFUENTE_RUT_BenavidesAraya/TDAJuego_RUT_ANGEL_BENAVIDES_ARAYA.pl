:- module('TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA', [
    juegoGetJugadores/2,
    juegoGetTablero/2,
    juegoGetDineroBanco/2,
    juegoGetNumeroDados/2,
    juegoGetTurnoActual/2,
    juegoGetTasaImpuesto/2,
    juegoGetMaxCasas/2,
    juegoGetMaxHoteles/2,
    juegoGetCantidadJugadores/2,
    juegoSetJugadores/3,
    juegoSetTablero/3,
    buscarElementoPorID/3,
    reemplazarElementoPorID/4,
    sumarDados/2,
    largoTablero/2,
    buscarJugadorPorID/3,
    reemplazarJugador/3,
    buscarElementoPorID/3,
    reemplazarElementoPorID/4
]).

:- use_module('TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA', [jugadorGetDinero/2, jugadorSetDinero/3, jugador/8, jugadorGetID/2,
    jugadorGetPosicion/2, jugadorSetPosicion/3, jugadorGetPosicion/2, jugadorGetPropiedades/2]).
:- use_module('TDATablero_RUT_ANGEL_BENAVIDES_ARAYA', [tablero/5]).
:- use_module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA', [propiedad/9, propiedadGetPrecio/2, propiedadSetDueno/3, propiedadGetID/2, propiedadGetHipotecada/2,
propiedadGetCasas/2, propiedadGetEsHotel/2, propiedadSetCasas/3, propiedadSetEsHotel/3]).

%=========CONSTRUCTOR==========
% Parte de los RF, está en el main


%=========SELECTORES==========

% PREDICADO: juegoGetJugadores
% MP: juegoGetJugadores/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la lista de jugadores del juego
% DOM: Juego (game) X Jugadores (list)
% REC: Jugadores (list)
% ESTRATEGIA: No aplica
juegoGetJugadores([Jugadores, _, _, _, _, _, _, _], Jugadores).


% PREDICADO: juegoGetTablero
% MP: juegoGetTablero/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el tablero del juego
% DOM: Juego (game) X Tablero (board)
% REC: Tablero (board)
% ESTRATEGIA: No aplica
juegoGetTablero([_, Tablero, _, _, _, _, _, _], Tablero).


% PREDICADO: juegoGetDineroBanco
% MP: juegoGetDineroBanco/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el dinero disponible en el banco
% DOM: Juego (game) X DineroBanco (int)
% REC: DineroBanco (int)
% ESTRATEGIA: No aplica
juegoGetDineroBanco([_, _, DineroBanco, _, _, _, _, _], DineroBanco).


% PREDICADO: juegoGetNumeroDados
% MP: juegoGetNumeroDados/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la cantidad de dados que se utilizan en el juego
% DOM: Juego (game) X NumeroDados (int)
% REC: NumeroDados (int)
% ESTRATEGIA: No aplica
juegoGetNumeroDados([_, _, _, NumeroDados, _, _, _, _], NumeroDados).


% PREDICADO: juegoGetTurnoActual
% MP: juegoGetTurnoActual/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el número de turno actual
% DOM: Juego (game) X TurnoActual (int)
% REC: TurnoActual (int)
% ESTRATEGIA: No aplica
juegoGetTurnoActual([_, _, _, _, TurnoActual, _, _, _], TurnoActual).


% PREDICADO: juegoGetTasaImpuesto
% MP: juegoGetTasaImpuesto/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la tasa de impuesto del juego
% DOM: Juego (game) X TasaImpuesto (float)
% REC: TasaImpuesto (float)
% ESTRATEGIA: No aplica
juegoGetTasaImpuesto([_, _, _, _, _, TasaImpuesto, _, _], TasaImpuesto).


% PREDICADO: juegoGetMaxCasas
% MP: juegoGetMaxCasas/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la cantidad máxima de casas disponibles en el juego
% DOM: Juego (game) X MaximoCasas (int)
% REC: MaximoCasas (int)
% ESTRATEGIA: No aplica
juegoGetMaxCasas([_, _, _, _, _, _, MaximoCasas, _], MaximoCasas).


% PREDICADO: juegoGetMaxHoteles
% MP: juegoGetMaxHoteles/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la cantidad máxima de hoteles disponibles en el juego
% DOM: Juego (game) X MaximoHoteles (int)
% REC: MaximoHoteles (int)
% ESTRATEGIA: No aplica
juegoGetMaxHoteles([_, _, _, _, _, _, _, MaximoHoteles], MaximoHoteles).


% PREDICADO: juegoGetCantidadJugadores
% MP: juegoGetCantidadJugadores/2
% MS: length/2
% DESCRIPCIÓN: Predicado que permite obtener la cantidad total de jugadores en el juego
% DOM: Juego (game) X CantidadJugadores (int)
% REC: CantidadJugadores (int)
% ESTRATEGIA: Declarativa
juegoGetCantidadJugadores([Jugadores, _, _, _, _, _, _, _], Cantidad) :-
    length(Jugadores, Cantidad).


%=========MODIFICADORES==========

% PREDICADO: juegoSetJugadores
% MP: juegoSetJugadores/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar la lista de jugadores de un juego, manteniendo el resto de la configuración
% DOM: JuegoOriginal (game) X NuevosJugadores (list) X NuevoJuego (game)
% REC: NuevoJuego (game)
% ESTRATEGIA: Declarativa
juegoSetJugadores(
    [_, Tablero, DineroBanco, NumeroDados, TurnoActual, 
     TasaImpuesto, MaximoCasas, MaximoHoteles],
    NuevosJugadores,
    [NuevosJugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, 
     TasaImpuesto, MaximoCasas, MaximoHoteles]).


% PREDICADO: juegoSetTablero
% MP: juegoSetTablero/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el tablero del juego, manteniendo el resto de la configuración
% DOM: JuegoOriginal (game) X NuevoTablero (list) X NuevoJuego (game)
% REC: NuevoJuego (game)
% ESTRATEGIA: Declarativa
juegoSetTablero(
    [Jugadores, _, DineroBanco, NumeroDados, TurnoActual, 
     TasaImpuesto, MaximoCasas, MaximoHoteles],
    NuevoTablero,
    [Jugadores, NuevoTablero, DineroBanco, NumeroDados, TurnoActual, 
     TasaImpuesto, MaximoCasas, MaximoHoteles]).








% PREDICADO: sumarDados
% MP: sumarDados/2
% MS: sum_list/2
% DESCRIPCIÓN: Predicado que calcula la suma de una lista de valores (por ejemplo, valores obtenidos al lanzar dados).
% DOM: ValoresDados (list<int>) X Suma (int)
% REC: Suma total de los valores entregados
% ESTRATEGIA: Declarativa
sumarDados(ValoresDados, Suma):-
    sum_list(ValoresDados, Suma).


% PREDICADO: largoTablero
% MP: largoTablero/2
% MS: length/2
% DESCRIPCIÓN: Calcula el número total de casillas del tablero sumando las longitudes de las listas de propiedades, cartas de suerte, cartas de comunidad y especiales.
% DOM: Tablero (list<list>) X Largo (int)
% REC: Número total de casillas
% ESTRATEGIA: Declarativa
largoTablero([Props, Suerte, Comunidad, Especiales], Largo) :-
    length(Props, L1),
    length(Suerte, L2),
    length(Comunidad, L3),
    length(Especiales, L4),
    Largo is L1 + L2 + L3 + L4.


% PREDICADO: buscarJugadorPorID
% MP: buscarJugadorPorID/3
% MS: jugadorGetID/2
% DESCRIPCIÓN: Predicado que permite buscar un jugador dentro de una lista de jugadores, comparando su ID.
% DOM: ListaJugadores (list<jugador>) X ID (int) X JugadorEncontrado (jugador)
% REC: Jugador cuyo ID coincide con el solicitado
% ESTRATEGIA: recursiva
buscarJugadorPorID([Jugador | _], ID, Jugador) :-
    jugadorGetID(Jugador, ID), !.

buscarJugadorPorID([_ | RestoJugadores], ID, JugadorEncontrado) :-
    buscarJugadorPorID(RestoJugadores, ID, JugadorEncontrado).


% PREDICADO: reemplazarJugador
% MP: reemplazarJugador/3
% MS: jugadorGetID/2
% DESCRIPCIÓN: Predicado que reemplaza un jugador de la lista original por una versión actualizada, identificándolos por su ID.
% DOM: ListaJugadoresIN (list<jugador>) X JugadorActualizado (jugador) X ListaJugadoresOUT (list<jugador>)
% REC: Nueva lista con el jugador actualizado
% ESTRATEGIA: recursiva
reemplazarJugador([], _, []).   
reemplazarJugador([Jugador | Resto], JugadorActualizado, [JugadorActualizado | Resto]) :-
    jugadorGetID(Jugador, ID1),
    jugadorGetID(JugadorActualizado, ID2),
    ID1 =:= ID2, !.
reemplazarJugador([Jugador | Resto], JugadorActualizado, [Jugador | NuevaResto]) :-
    reemplazarJugador(Resto, JugadorActualizado, NuevaResto).



% PREDICADO: buscarElementoPorID
% MP: buscarElementoPorID/3
% MS: nth0/3
% DESCRIPCIÓN: Predicado que busca un elemento en una lista de casillas del tablero, comparando su ID (primera posición del elemento).
% DOM: ID (int) X ListaCasillas (list<[[Elemento], Pos]>) X Elemento (list)
% REC: Elemento cuyo ID coincide con el solicitado
% ESTRATEGIA: Declarativa, recursiva
buscarElementoPorID(ID, [[Elemento, _] | _], Elemento) :-
    nth0(0, Elemento, ID), !.

buscarElementoPorID(ID, [_ | Resto], Elemento) :-
    buscarElementoPorID(ID, Resto, Elemento).


% PREDICADO: reemplazarElementoPorID
% MP: reemplazarElementoPorID/4
% MS: nth0/3
% DESCRIPCIÓN: Reemplaza un elemento del tablero por una nueva versión, manteniendo su posición, basado en coincidencia de ID.
% DOM: ID (int) X NuevoElemento (list) X TableroIN (list<[[Elemento], Pos]>) X TableroOUT (list<[[Elemento], Pos]>)
% REC: Tablero con el elemento actualizado
% ESTRATEGIA: Declarativa, recursiva
reemplazarElementoPorID(_, _, [], []).

reemplazarElementoPorID(ID, NuevoElemento, [[Elemento, Pos] | Resto], [[NuevoElemento, Pos] | RestoNuevo]) :-
    nth0(0, Elemento, ID1),
    ID1 =:= ID, !,
    reemplazarElementoPorID(ID, NuevoElemento, Resto, RestoNuevo).

reemplazarElementoPorID(ID, NuevoElemento, [Cabeza | Resto], [Cabeza | RestoNuevo]) :-
    reemplazarElementoPorID(ID, NuevoElemento, Resto, RestoNuevo).

/*
CONSULTA: CONSTRUYE UNA CASA, P1 (ID21), PASA DE 2 A 3

propiedad(21, "Av. Bar HbH", 50000, 2000, 1, 2, false, false, P1),
propiedad(22, "USACH", 50000, 2000, 1, 0, false, false, P2),
propiedad(99, "Salida", 0, 0, -1, 0, false, false, S),
propiedad(100, "Cárcel", 0, 0, -1, 0, false, false, Carcel),
carta(1, "suerte", "Avanza hasta salida", irASalida, C1),
carta(3, "comunidad", "Cambia el impuesto", cambiarImpuesto, C3),
tablero([[P1, 1], [P2, 2]], [[C1, 3]], [[C3, 4]], [[S, 0], [Carcel, 10]], T1),
juego([], T1, 200000, 2, 0, 10, 4, 1, G1),
juegoConstruirCasa(G1, P1, G2),
juegoGetTablero(G2, TableroNuevo),
buscarElementoPorID(21, TableroNuevo, PropActualizada),
propiedadGetCasas(PropActualizada, N).


CONSULTA: NO PUEDE CONSTRUIR, P1 (ID21), PASA DE 2 A 2.

propiedad(21, "Av. Bar HbH", 50000, 2000, 1, 2, false, false, P1),
propiedad(22, "USACH", 50000, 2000, 1, 0, false, false, P2),
propiedad(99, "Salida", 0, 0, -1, 0, false, false, S),
propiedad(100, "Cárcel", 0, 0, -1, 0, false, false, Carcel),
carta(1, "suerte", "Avanza hasta salida", irASalida, C1),
carta(3, "comunidad", "Cambia el impuesto", cambiarImpuesto, C3),
tablero([[P1, 1], [P2, 2]], [[C1, 3]], [[C3, 4]], [[S, 0], [Carcel, 10]], T1),
juego([], T1, 200000, 2, 0, 10, 2, 1, G1),
juegoConstruirCasa(G1, P1, G2),
juegoGetTablero(G2, TableroNuevo),
buscarElementoPorID(21, TableroNuevo, PropActualizada),
propiedadGetCasas(PropActualizada, N).
*/
