:- module('Main_RUT_ANGEL_BENAVIDES_ARAYA', [
    jugador/8,
    propiedad/9,
    carta/5,
    tableroConstruir/5,
    tablero/5,
    juego/9,
    tableroAgregarPropiedades/3,
    juegoAgregarJugador/3,
    juegoObtenerJugadorActual/2,
    myRandom/2,
    getDadoRandom/3,
    lanzarTodosLosDados/3,
    juegoLanzarDados/4,
    juegoMoverJugador/4,
    jugadorComprarPropiedad/4,
    juegoCalcularRentaPropiedad/3,
    juegoCalcularRentaJugador/3,
    calcularRentasJugador/5,
    juegoConstruirCasa/3,
    juegoConstruirHotel/3,
    jugadorPagarRenta/5,
    propiedadHipotecar/2,
    jugadorEstaEnBancarrota/1
]).

:-use_module('TDACarta_RUT_ANGEL_BENAVIDES_ARAYA').
:-use_module('TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA').
:-use_module('TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA').
:-use_module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA').
:-use_module('TDATablero_RUT_ANGEL_BENAVIDES_ARAYA').


%=========RF02==========
% PREDICADO: jugador
% MP: jugador/8
% MS: No tiene
% DESCRIPCIÓN: Predicado constructor que permite crear un jugador
% DOM: ID (int) X Nombre (string) X Dinero (int) X Propiedades (list id's) X PosActual (int) X
%       estaEnCarcel (bool) X totalCartasSalirCarcel (int) X jugador (TDA player) 
% REC: jugador (TDA player) 
% ESTRATEGIA: No aplica 
jugador(ID, Nombre, Dinero, Propiedades, PosActual, EstaEnCarcel, TotalCartasSalirCarcel,
        [ID, Nombre, Dinero, Propiedades, PosActual, EstaEnCarcel, TotalCartasSalirCarcel]).


%=========RF03==========
% PREDICADO: propiedad
% MP: propiedad/9
% MS: No tiene
% DESCRIPCIÓN: Predicado constructor que permite crear una propiedad
% DOM: ID (int) X Nombre (string) X Precio (int) X Renta (int) X dueño (id_jugador/null)
%      Casas (int) X EsHotel (boolean) X estaHipotecada (boolean) X propiedad (property)
% REC: propiedad (property)
% ESTRATEGIA: No aplica 
propiedad(ID, Nombre, Precio, Renta, Dueno, Casas, EsHotel, EstaHipotecada,
          [ID, Nombre, Precio, Renta, Dueno, Casas, EsHotel, EstaHipotecada]).


%=========RF04==========
% PREDICADO: carta
% MP: carta/5
% MS: No tiene
% DESCRIPCIÓN: Predicado constructor que permite crear una carta
% DOM: ID (int) X Tipo (string) X Descripcion (string) X Accion (predicado) X Carta (card)
% REC: carta (card)
% ESTRATEGIA: No aplica 
carta(ID, Tipo, Descripcion, Accion, [ID, Tipo, Descripcion, Accion]).


%=========AUXILIARES PARA RF05==========
% PREDICADO: tableroConstruir
% MP: tableroConstruir/5
% MS: append/3, append/3, append/3
% DESCRIPCIÓN: Predicado auxiliar que construye un tablero juntando las listas
% DOM: Propiedades (list) X CartasSuerte (list) X CartasComunidad (list) X CasillasEspeciales (list) X Tablero (board)
% REC: Tablero (board)
% ESTRATEGIA: Declarativa
tableroConstruir(Propiedades, CartasSuerte, CartasComunidad, CasillasEspeciales, Tablero) :-
    append(PropsIn, PropsNuevas, PropsOut).


%=========RF05==========
% PREDICADO: tablero
% MP: tablero/6
% MS: No tiene
% DESCRIPCIÓN: Predicado constructor que permite crear un tablero
% DOM: Propiedades (lista) X CartasSuerte (lista) X CartasComunidad (lista) X
%      CasillasEspeciales (lista) X Tablero (board)
% REC: Tablero (board)
% ESTRATEGIA: No aplica 
tablero(Props, Suerte, Comunidad, Especiales, [Props, Suerte, Comunidad, Especiales]).

%=========RF06==========
% PREDICADO: juego
% MP: juego/9
% MS: No tiene
% DESCRIPCIÓN: Predicado constructor que permite crear un juego
% DOM: Jugadores (lista) X Tablero (tablero) X DineroBanco (int) X NumeroDados (int) X
%  TurnoActual (int) X TasaImpuesto (int) X MaximoCasas (int) X MaximoHoteles (int) X juego(game)
% REC: juego(game)
% ESTRATEGIA: No aplica 
juego(Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles,
    [Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles]).


%=========RF07==========
% PREDICADO: tableroAgregarPropiedades
% MP: tableroAgregarPropiedades/3
% MS: append/3, append/2
% DESCRIPCIÓN: Predicado que permite agregar una o más propiedades a un tablero existente.
% A diferencia del constructor inicial que mantiene las listas de propiedades, cartas y especiales separadas,
% este predicado retorna el tablero como una única lista con todas las casillas en orden.
% DOM: TableroIN (board = [Propiedades, Suerte, Comunidad, Especiales]) X PropiedadesConPos (list) X TableroOUT (list)
% REC: TableroOUT (list) — Lista de casillas en el tablero, con cada casilla del formato [Elemento, Posición]
% ESTRATEGIA: Declarativa
tableroAgregarPropiedades([PropsIn, Suerte, Comunidad, Especiales], PropsNuevas, TableroPlanoFinal) :-
    append(PropsIn, PropsNuevas, PropsActualizadas),
    append([PropsActualizadas, Suerte, Comunidad, Especiales], TableroPlanoFinal).



%=========RF08==========
% PREDICADO: juegoAgregarJugador
% MP: juegoAgregarJugador/3
% MS: jugadorGetDinero/2, jugadorSetDinero/3
% DESCRIPCIÓN: Predicado que agrega un jugador a la partida y
% le asigna el capital inicial, disminuyendo el dinero del banco
% el jugador es agregado al inicio de la lista de jugadores y se actualiza el banco
% DOM: juegoIN(game) X jugador(player) X juegoOUT(game)
% REC: juegoOUT(game)
% ESTRATEGIA: Declarativa y uso de if (->)
juegoAgregarJugador(
    [Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles],
    Jugador,
    [[JugadorFinal | Jugadores], Tablero, BancoFinal, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles]
) :-
    jugadorGetDinero(Jugador, DineroActual),
    (
        DineroActual < 1500 ->
            Diferencia is 1500 - DineroActual,
            DineroBanco >= Diferencia,
            BancoFinal is DineroBanco - Diferencia,
            jugadorSetDinero(Jugador, 1500, JugadorFinal)
        ;
            BancoFinal = DineroBanco,
            JugadorFinal = Jugador
    ).


%=========RF09==========
% PREDICADO: juegoObtenerJugadorActual
% MP: juegoObtenerJugadorActual/2
% MS: juegoGetCantidadJugadores/2 
% DESCRIPCIÓN: Predicado que obtiene el jugador cuyo turno está en curso
% DOM: juego(game) X jugador(player)
% REC: jugador(player)
% ESTRATEGIA: Declarativa, uso de nth0 para indices
juegoObtenerJugadorActual(
    [Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles],
    JugadorActual
) :-
    juegoGetCantidadJugadores(
        [Jugadores, Tablero, DineroBanco, NumeroDados, TurnoActual, TasaImpuesto, MaximoCasas, MaximoHoteles],
        Cantidad),
    Index is (TurnoActual - 1) mod Cantidad,
    nth0(Index, Jugadores, JugadorActual).


%=========AUXILIARES PARA RF10==========
% PREDICADO: myRandom
% MP: myRandom/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que implementa un generador de números pseudoaleatorios basado en una semilla
% DOM: Xn (int) X Xn1 (int)
% REC: Xn1 (int)
% ESTRATEGIA: Declarativa
myRandom(Xn, Xn1):-
  Xn1 is (((1103515245 * Xn) + 12345) mod 2147483648).


% PREDICADO: getDadoRandom
% MP: getDadoRandom/3
% MS: myRandom/2
% DESCRIPCIÓN: Predicado que simula el lanzamiento de un dado, generando un número entre 1 y 6 a partir de una semilla
% DOM: Seed (int) X NuevaSeed (int) X R (int)
% REC: NuevaSeed (int), R (int)
% ESTRATEGIA: Declarativa
getDadoRandom( Seed, NvaSeed, R):-
    myRandom( Seed, NvaSeed),
    R is 1 + (NvaSeed mod 6).


% PREDICADO: lanzarTodosLosDados
% MP: lanzarTodosLosDados/3
% MS: getDadoRandom/3
% DESCRIPCIÓN: Predicado que simula el lanzamiento de múltiples dados,
%              generando una nueva semilla y un valor de dado por cada semilla entregada.
% DOM: ListaSeeds (list int) X ListaNuevasSeeds (list int) X ListaValores (list int)
% REC: ListaNuevasSeeds (list int), ListaValores (list int)
% ESTRATEGIA: Recursiva
lanzarTodosLosDados([], [], []).
lanzarTodosLosDados([Seed | RestoSeeds], [NuevaSeed | RestoNuevas], [Valor | RestoValores]) :-
    getDadoRandom(Seed, NuevaSeed, Valor),
    lanzarTodosLosDados(RestoSeeds, RestoNuevas, RestoValores).


%=========RF10==========
% PREDICADO: juegoLanzarDados
% MP: juegoLanzarDados/4
% MS: juegoGetNumeroDados/2, length/2, lanzarTodosLosDados/3
% DESCRIPCIÓN: Predicado que simula el lanzamiento de todos los dados
%              configurados en el juego, usando una lista de semillas,
%              Devuelve las nuevas semillas y los resultados de los dados.
% DOM: Juego (game) X SeedDados (list int) X NuevoSeedDados (list int) X ResultadoDados (list int)
% REC: NuevoSeedDados (list int), ResultadoDados (list int)
% ESTRATEGIA: Declarativa
juegoLanzarDados(Juego, SeedDados, NuevoSeedDados, ResultadoDados) :-
    juegoGetNumeroDados(Juego, CantidadDados),
    length(SeedDados, CantidadDados),
    lanzarTodosLosDados(SeedDados, NuevoSeedDados, ResultadoDados).


%=========RF11==========
% PREDICADO: juegoMoverJugador
% MP: juegoMoverJugador/4
% MS: juegoGetJugadores/2, buscarJugadorPorID/3, jugadorGetPosicion/2, 
%     sumarDados/2, juegoGetTablero/2, largoTablero/2, 
%     jugadorSetPosicion/3, reemplazarJugador/3, juegoSetJugadores/3
% DESCRIPCIÓN: Predicado para mover al jugador en el tablero.
% DOM: JuegoIn (game) X IDJugador (int) X ValoresDados (list int) X JuegoOut (game)
% REC: JuegoOut (game)
% ESTRATEGIA: Declarativa con funciones auxiliares
juegoMoverJugador(JuegoIn, IDJugador, ValoresDados, JuegoOut) :-
    juegoGetJugadores(JuegoIn, Jugadores),
    buscarJugadorPorID(Jugadores, IDJugador, Jugador),
    jugadorGetPosicion(Jugador, PosActual),
    sumarDados(ValoresDados, Suma),
    juegoGetTablero(JuegoIn, Tablero),
    largoTablero(Tablero, Largo),
    NuevaPos is ((PosActual + Suma - 1) mod Largo) + 1,
    jugadorSetPosicion(Jugador, NuevaPos, JugadorActualizado),
    reemplazarJugador(Jugadores, JugadorActualizado, JugadoresActualizados),
    juegoSetJugadores(JuegoIn, JugadoresActualizados, JuegoOut).


%=========RF12==========
% PREDICADO: jugadorComprarPropiedad
% MP: jugadorComprarPropiedad/4
% MS: jugadorGetDinero/2, propiedadGetPrecio/2, jugadorSetDinero/3, jugadorGetID/2,
%     propiedadSetDueno/3, jugadorGetPropiedades/2, propiedadGetID/2, append/3, jugadorSetPropiedades/3
% DESCRIPCIÓN: Predicado que permite a un jugador comprar una propiedad si tiene suficiente dinero.
%              Descuenta el precio de la propiedad, asigna el jugador como dueño, y actualiza su lista de propiedades.
% DOM: JugadorIn (player) X PropiedadIn (property) X PropiedadOut (property) X JugadorOut (player)
% REC: PropiedadOut (property), JugadorOut (player)
% ESTRATEGIA: Declarativa con control de flujo condicional
jugadorComprarPropiedad(JugadorIn, PropiedadIn, PropiedadOut, JugadorOut) :-
    jugadorGetDinero(JugadorIn, Dinero),
    propiedadGetPrecio(PropiedadIn, Precio),
    Dinero >= Precio,
    NuevoDinero is Dinero - Precio,
    jugadorSetDinero(JugadorIn, NuevoDinero, JugadorConDineroActualizado),
    jugadorGetID(JugadorIn, IDJugador),
    propiedadSetDueno(PropiedadIn, IDJugador, PropiedadOut),
    jugadorGetPropiedades(JugadorIn, ListaProps),
    propiedadGetID(PropiedadIn, IDPropiedad),
    append(ListaProps, [IDPropiedad], NuevasProps),
    jugadorSetPropiedades(JugadorConDineroActualizado, NuevasProps, JugadorOut).


%=========RF13==========
% PREDICADO: juegoCalcularRentaPropiedad
% MP: juegoCalcularRentaPropiedad/3
% MS: propiedadGetHipotecada/2, propiedadGetPrecio/2, propiedadGetEsHotel/2, 
%     propiedadGetCasas/2, juegoGetMaxCasas/2, is/2, floor/1
% DESCRIPCIÓN: Predicado que calcula la renta a pagar por una propiedad según su estado. 
%              Si está hipotecada, la renta es 0. Si tiene hotel, se calcula un aumento
%              proporcional al precio base y al máximo de casas permitido Si tiene casas,
%              la renta aumenta un 20% por cada casa. En cualquier otro caso, la renta es igual al precio base.
% DOM: Juego (game) X Propiedad (property) X RentaFinal (int)
% REC: RentaFinal (int)
% ESTRATEGIA: Declarativa con cláusulas condicionales y corte
juegoCalcularRentaPropiedad(_, Propiedad, 0) :-
    propiedadGetHipotecada(Propiedad, true), !.

juegoCalcularRentaPropiedad(Juego, Propiedad, RentaFinal) :-
    propiedadGetPrecio(Propiedad, Base),
    propiedadGetEsHotel(Propiedad, true),
    juegoGetMaxCasas(Juego, MaxCasas),
    Aumento is 0.2 * Base * MaxCasas,
    Total is Base + Aumento,
    RentaFinal is floor(Total * 2), !.

juegoCalcularRentaPropiedad(_, Propiedad, RentaFinal) :-
    propiedadGetPrecio(Propiedad, Base),
    propiedadGetCasas(Propiedad, Casas),
    Casas > 0,
    Aumento is 0.2 * Base * Casas,
    Total is Base + Aumento,
    RentaFinal is floor(Total), !.
    
juegoCalcularRentaPropiedad(_, Propiedad, RentaFinal) :-
    propiedadGetPrecio(Propiedad, RentaFinal).


%=========RF14==========
% PREDICADO: juegoCalcularRentaJugador
% MP: juegoCalcularRentaJugador/3
% MS: juegoGetTablero/2, jugadorGetPropiedades/2, calcularRentasJugador/5
% DESCRIPCIÓN: Predicado que calcula la renta total que genera un jugador
%              según las propiedades que posee y las reglas de renta del juego
% DOM: Juego (game) X Jugador (player) X MontoRentaTotal (int)
% REC: MontoRentaTotal (int)
% ESTRATEGIA: Declarativa con llamada a predicado acumulador
juegoCalcularRentaJugador(Juego, Jugador, MontoRentaTotal) :-
    juegoGetTablero(Juego, Tablero),
    jugadorGetPropiedades(Jugador, ListaIDs),
    calcularRentasJugador(Juego, ListaIDs, Tablero, 0, MontoRentaTotal), !.


% PREDICADO: calcularRentasJugador
% MP: calcularRentasJugador/5
% MS: buscarElementoPorID/3, juegoCalcularRentaPropiedad/3
% DESCRIPCIÓN: Predicado acumulador que calcula recursivamente
%              la suma de renta total generada por una lista de propiedades.
% DOM: Juego (game) X ListaIDs (list int) X Tablero (list) X Acumulado (int) X Total (int)
% REC: Total (int)
% ESTRATEGIA: Recursiva con acumulador
calcularRentasJugador(_, [], _, Acumulado, Acumulado).

calcularRentasJugador(Juego, [ID | Resto], Tablero, Acumulado, Total) :-
    buscarElementoPorID(ID, Tablero, Propiedad),
    juegoCalcularRentaPropiedad(Juego, Propiedad, Renta),
    NuevoAcum is Acumulado + Renta,
    calcularRentasJugador(Juego, Resto, Tablero, NuevoAcum, Total).


%=========RF15==========
% PREDICADO: juegoConstruirCasa
% MP: juegoConstruirCasa/3
% MS: juegoGetTablero/2, juegoGetMaxCasas/2, propiedadGetID/2, buscarElementoPorID/3,
%     propiedadGetCasas/2, propiedadSetCasas/3, reemplazarElementoPorID/4, juegoSetTablero/3
% DESCRIPCIÓN: Predicado que permite construir una casa en una propiedad
%              si no se ha alcanzado el máximo permitido por el juego. Si el máximo
%              ya fue alcanzado, el estado del juego no cambia.
% DOM: JuegoIn (game) X Propiedad (property) X JuegoOut (game)
% REC: JuegoOut (game)
% ESTRATEGIA: Declarativa con condicional
juegoConstruirCasa(JuegoIn, Propiedad, JuegoOut) :-
    juegoGetTablero(JuegoIn, Tablero),
    juegoGetMaxCasas(JuegoIn, MaxCasas),
    propiedadGetID(Propiedad, ID),
    buscarElementoPorID(ID, Tablero, PropEnJuego),
    propiedadGetCasas(PropEnJuego, CasasActuales),
    (
        CasasActuales >= MaxCasas ->
            JuegoOut = JuegoIn
        ;
        NuevasCasas is CasasActuales + 1,
        propiedadSetCasas(PropEnJuego, NuevasCasas, PropiedadActualizada),
        reemplazarElementoPorID(ID, PropiedadActualizada, Tablero, TableroNuevo),
        juegoSetTablero(JuegoIn, TableroNuevo, JuegoOut)
    ), !.


%=========RF16==========
% PREDICADO: juegoConstruirHotel
% MP: juegoConstruirHotel/3
% MS: juegoGetTablero/2, juegoGetMaxCasas/2, propiedadGetID/2, buscarElementoPorID/3,
%     propiedadGetCasas/2, propiedadSetCasas/3, propiedadSetEsHotel/3, 
%     reemplazarElementoPorID/4, juegoSetTablero/3
% DESCRIPCIÓN: Predicado que permite construir un hotel en una propiedad si tiene
%              el número máximo de casas. Al construir el hotel, se eliminan las casas 
%              y se marca el estado de hotel en la propiedad. Si no cumple la condición, el juego no cambia
% DOM: JuegoIn (game) X Propiedad (property) X JuegoOut (game)
% REC: JuegoOut (game)
% ESTRATEGIA: Declarativa con condicional
juegoConstruirHotel(JuegoIn, Propiedad, JuegoOut) :-
    juegoGetTablero(JuegoIn, Tablero),
    juegoGetMaxCasas(JuegoIn, MaxCasas),
    propiedadGetID(Propiedad, ID),
    buscarElementoPorID(ID, Tablero, PropEnJuego),
    propiedadGetCasas(PropEnJuego, CasasActuales),
    (
        CasasActuales =:= MaxCasas ->
            propiedadSetCasas(PropEnJuego, 0, PropSinCasas),
            propiedadSetEsHotel(PropSinCasas, true, PropiedadActualizada),
            reemplazarElementoPorID(ID, PropiedadActualizada, Tablero, TableroNuevo),
            juegoSetTablero(JuegoIn, TableroNuevo, JuegoOut)
        ;
            JuegoOut = JuegoIn
    ), !.


%=========RF17==========
% PREDICADO: jugadorPagarRenta
% MP: jugadorPagarRenta/5
% MS: jugadorGetDinero/2, is/2, jugadorSetDinero/3
% DESCRIPCIÓN: Predicado que transfiere un monto de dinero desde un jugador pagador
%              a un jugador receptor. No valida si el pagador tiene dinero suficiente,
%              por lo que puede quedar con saldo negativo
% DOM: JugadorPagador (player) X JugadorReceptor (player) X Monto (int) X JugadorPagadorOUT (player) X JugadorReceptorOUT (player)
% REC: JugadorPagadorOUT (player), JugadorReceptorOUT (player)
% ESTRATEGIA: Declarativa
jugadorPagarRenta(JugadorPagador, JugadorReceptor, Monto, JugadorPagadorOUT, JugadorReceptorOUT) :-
    jugadorGetDinero(JugadorPagador, DineroPagador),
    jugadorGetDinero(JugadorReceptor, DineroReceptor),
    DineroPagadorActualizado is DineroPagador - Monto,
    DineroReceptorActualizado is DineroReceptor + Monto,
    jugadorSetDinero(JugadorPagador, DineroPagadorActualizado, JugadorPagadorOUT),
    jugadorSetDinero(JugadorReceptor, DineroReceptorActualizado, JugadorReceptorOUT), !.


%=========RF18==========
% PREDICADO: propiedadHipotecar
% MP: propiedadHipotecar/2
% MS: propiedadSetHipotecada/3
% DESCRIPCIÓN: Predicado que permite marcar una propiedad como hipotecada. No realiza validaciones adicionales
% DOM: PropiedadIn (property) X PropiedadOut (property)
% REC: PropiedadOut (property)
% ESTRATEGIA: Declarativa
propiedadHipotecar(PropiedadIn, PropiedadOut) :-
    propiedadSetHipotecada(PropiedadIn, true, PropiedadOut), !.



%=========RF19==========
% PREDICADO:
% MP:
% MS:
% DESCRIPCIÓN:
% DOM:
% REC:
% ESTRATEGIA:


%=========RF20==========
% PREDICADO: jugadorEstaEnBancarrota
% MP: jugadorEstaEnBancarrota/1
% MS: jugadorGetDinero/2
% DESCRIPCIÓN: Predicado que verifica si un jugador se encuentra en bancarrota,
%              es decir, si su dinero es menor o igual a cero.
% DOM: Jugador (player)
% REC: true/false (bool)
% ESTRATEGIA: Declarativa
jugadorEstaEnBancarrota(Jugador) :-
    jugadorGetDinero(Jugador, Dinero),
    Dinero =< 0.


%=========RF21==========
% PREDICADO:
% MP:
% MS:
% DESCRIPCIÓN:
% DOM:
% REC:
% ESTRATEGIA:
