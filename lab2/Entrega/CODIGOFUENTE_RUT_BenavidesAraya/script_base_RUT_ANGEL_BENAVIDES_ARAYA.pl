:- use_module('Main_RUT_ANGEL_BENAVIDES_ARAYA.pl').
:- use_module('TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA.pl').
:- use_module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA.pl').
:- use_module('TDATablero_RUT_ANGEL_BENAVIDES_ARAYA.pl').
:- use_module('TDACarta_RUT_ANGEL_BENAVIDES_ARAYA.pl').
:- use_module('TDAJuego_RUT_ANGEL_BENAVIDES_ARAYA.pl').

rf2to13 :-
    set_prolog_flag(answer_write_options,[max_depth(0)]),

    nl, write("===== [RF 02] se crean los jugadores ====="), nl,
    jugador(1, "jugador1", 1500, [], 0, false, 0, J1),
    jugador(2, "jugador2", 1500, [], 0, false, 0, J2),
    write('J1 = '),write(J1), nl,
    write('J2 = '),write(J2), nl, nl,

    write("===== [RF 03] se crean las propiedades ====="), nl,
    write("===== para marcar que no tiene dueño, se usa un 'null' (se marca con -1) ====="), nl,
    propiedad(21, "Avenida Bar HbH", 1200, 2000, -1, 0, false, false, P1),
    propiedad(22, "Universidad de Santiago", 1100, 2000, -1, 0, false, false, P2),
    propiedad(23, "Estación Central", 1400, 1300, -1, 0, false, false, P3),
    write('P1 = '),write(P1), nl,
    write('P2 = '), write(P2), nl,
    write('P3 = '), write(P3), nl, nl,

    write("===== [RF 04]se construyen 4 cartas  ====="), nl,
    carta( 1, "suerte", "Avance hasta la casilla de salida", irASalida, C1),
    carta( 2, "suerte", "Mover el jugador a la carcel", irACarcel, C2),
    carta( 3, "comunidad", "Cambia el impuesto del juego", cambiarImpuesto, C3),
    carta( 4, "suerte", "Gana 100.000.000", ganarKino, C4),
    write('C1 = '),write(C1), nl,
    write('C2 = '),write(C2), nl,
    write('C3 = '),write(C3), nl,
    write('C4 = '),write(C4), nl, nl,

    write("===== [RF 05] se crea el tablero ====="),
    write("===== cambio con respecto al script base, agrego las cartas directamente al construirlo====="),
    write("===== además, asumire que todas las casillas seran ingresadas con posición, para mantener consistencia con RF07====="),
    write("===== se asume que no entraran propiedades con poisciones repetidas, y no se deja 'ordenado' el tablero ====="), nl,
    write("===== por indices, ya que las posiciones serviran para acceder a cada propiedad====="), nl,
    tablero([], [], [[C1,2], [C2, 4], [C3, 5], [C4, 6]], [], T1), nl,
    write('T1 = '),write(T1), nl, nl,

    write("===== [RF 06] se crea el juego====="), nl,
    juego( [], T1, 200000, 2, 0, 10, 4, 1, G1),
    write('G1 = '),write(G1), nl, nl,

    write("===== [RF 07] se agregan las propiedades al tablero ====="), nl,
    tableroAgregarPropiedades(T1, [[P1, 3], [P2, 8], [P3, 12]], T1_v2),
    write('T1_v2 = '),write(T1_v2), nl, nl,

    write("===== [RF 08] se agregan los jugadores J1 y J2 al juego ====="), nl,
    juegoAgregarJugador( G1, J1, G1_v2),
    juegoAgregarJugador( G1_v2, J2, G1_v3),
    write('G1_v3 = '),write(G1_v3), nl, nl,

    write("===== [RF 09] se obtiene el jugador actual del juego ====="), nl,
    juegoObtenerJugadorActual(G1_v3, JA_v1), % JA_v1 debería ser igual a J1
    write('JA_v1 = '),write(JA_v1), nl, nl,

    write("===== [RF 10] se lanzan los dados ====="), nl, 
    SDado1 = 1, SDado2 = 5,
    write('SDado1 = '),write(SDado1), nl,
    write('SDado2 = '),write(SDado2), nl,
    juegoLanzarDados(G1_v3, [SDado1, SDado2], [SDado1_v2, SDado2_v2], DADOS),
    write('SDado1_v2 = '),write(SDado1_v2), nl,
    write('SDado2_v2 = '),write(SDado2_v2), nl,
    write('DADOS = '),write(DADOS), nl, nl,

    write("===== [RF 11] se mueve el jugador actual ====="), nl,
    jugadorGetID(JA_v1, ID_JA_v1), 
    juegoMoverJugador( G1_v3, ID_JA_v1, DADOS, G1_v4),
    write('G1_v4 = '),write(G1_v4), nl, nl,

    write("===== [RF 12] jugador compra una propiedad ====="), nl,
    jugadorComprarPropiedad(J1, P1, P1_v2, J1_v2),
    jugadorComprarPropiedad(J2, P3, P3_v2, J2_v2),
    write('P1_v2 = '),write(P1_v2), nl,
    write('P3_v2 = '),write(P3_v2), nl,
    write('J1_v2 = '),write(J1_v2), nl, 
    write('J2_v2 = '),write(J2_v2), nl, nl,

    %Actualizo el juego con los nuevos jugadores y propiedades
    %para seguir con el flujo del juego y ejemplificar los siguientes RF
    juegoGetJugadores(G1_v4, JugadoresAnt),
    reemplazarJugador(JugadoresAnt, J1_v2, JugadoresNuevos1),
    reemplazarJugador(JugadoresNuevos1, J2_v2, JugadoresNuevos2),
    juegoSetJugadores(G1_v4, JugadoresNuevos2, G1_v5),

    juegoGetTablero(G1_v5, TableroAnt),
    reemplazarElementoPorID(21, P1_v2, TableroAnt, TableroNvo1),
    reemplazarElementoPorID(23, P3_v2, TableroNvo1, TableroNvo2),
    juegoSetTablero(G1_v5, TableroNvo2, G1_v6),

    write("===== [RF 12b] ejemplo: jugador NO puede comprar la propiedad por falta de dinero ====="), nl,
    jugador(3, "jugador3", 1000, [], 0, false, 0, J3),
    propiedad(24, "Propiedad Carisima", 2000, 500, -1, 0, false, false, P4),
    ( jugadorComprarPropiedad(J3, P4, P4_v2, J3_v2) ->
         write('Compra exitosa'), nl
    ;    write('Compra fallida, jugador y propiedad quedan igual'), nl,
        P4_v2 = P4, J3_v2 = J3
    ),
    write('P4_v2 = '), write(P4_v2), nl,
    write('J3_v2 = '), write(J3_v2), nl, nl,
    
    write("===== [RF 13] se obtiene el monto de renta de una propiedad ====="), nl,
    juegoCalcularRentaPropiedad(G1_v6, P1_v2, MONTO_RENTA_P1),
    juegoCalcularRentaPropiedad(G1_v6, P3_v2, MONTO_RENTA_P3),
    write('MONTO_RENTA_P1 = '), write(MONTO_RENTA_P1), nl,
    write('MONTO_RENTA_P3 = '), write(MONTO_RENTA_P3), nl, nl.


% Debido a errores en la actulización de los jugadores y propiedades en el juego,
% se seguira ejemplificando los siguientes RF con consultas de prueba, en lugar de seguir el flujo del juego.
% Se asume que el juego se ha actualizado correctamente con los jugadores y propiedades modificados.
% Estas consultas de prueba se realizaron en el desarollo del código para verificar el correcto funcionamiento de los RF.
% Se dejan instrucciones para que el usuario pueda probar los RF de forma independiente.
% Estas se realizaran ejecutando predicados de prueba que ejemplifican el uso de los RF.
% tal como el run_script/0, pero sin necesidad de actualizar el juego.


rf14a :-
    write("===== [RF 14] se obtiene el monto de renta total de un jugador ====="), nl,
    write("===== se construyen propiedades de prueba que tienen al jugador como dueño ====="), nl,
    set_prolog_flag(answer_write_options,[max_depth(0)]),
    jugador( 101, "jugadorPrueba1", 1500, [121,122], 0, false, 0, JPrueba1),
    write('Jugador de prueba 1: '), write(JPrueba1), nl,
    propiedad(121, "Av. Bar HbH", 50000, 2000, 101, 0, false, false, PPrueba1),
    propiedad(122, "USACH", 50000, 2000, 101, 0, false, false, PPrueba2),
    write('Propiedad de prueba 1: '), write(PPrueba1), nl,
    write('Propiedad de prueba 2: '), write(PPrueba2), nl,
    tablero([[PPrueba1, 1], [PPrueba2, 2]], [], [], [], TPrueba),
    write('Tablero de prueba: '), write(TPrueba), nl,
    % el tablero se deja como una lista de casillas.
    TPrueba = [Props, Suerte, Comunidad, Especiales],
    append([Props, Suerte, Comunidad, Especiales], TableroPlano),
    juego( [], TableroPlano, 200000, 2, 0, 10, 4, 1, GPrueba),
    write('Juego de prueba: '), write(GPrueba), nl,
    juegoCalcularRentaJugador(GPrueba, JPrueba1, RentaTotal),
    write('RentaTotal de Jugador de pruba 1= '), write(RentaTotal), nl.


rf14b :-
    write("===== [RF 14] Ejemplo alternativo, monto de renta total de un jugador ====="), nl,
    write("===== Se construyen propiedades de prueba que tienen al jugador como dueño ====="), nl,
    set_prolog_flag(answer_write_options,[max_depth(0)]),
    jugador( 9100, "Piccolo", 3000, [8101,8102,8103], 0, false, 0, Piccolo),
    jugador( 9101, "Freezer", 2500, [], 0, false, 0, Freezer),
    write('Jugador Piccolo: '), write(Piccolo), nl,
    write('Jugador Freezer: '), write(Freezer), nl,
    propiedad(8101, "Torre Karin", 120000, 3500, 9100, 1, false, false, TorreKarin),
    propiedad(8102, "KameHouse", 95000, 4200, 9100, 2, false, false, KameHouse),
    propiedad(8103, "Palacio de Kami Sama", 200000, 8000, 9100, 3, false, false, PalacioKami),
    write('Propiedad Torre Karin: '), write(TorreKarin), nl,
    write('Propiedad KameHouse: '), write(KameHouse), nl,
    write('Propiedad Palacio Kami: '), write(PalacioKami), nl,
    tablero([[TorreKarin, 5], [KameHouse, 10], [PalacioKami, 15]], [], [], [], TableroDBZ),
    write('Tablero DBZ: '), write(TableroDBZ), nl,
    TableroDBZ = [PropsDBZ, SuerteDBZ, ComunidadDBZ, EspecialesDBZ],
    append([PropsDBZ, SuerteDBZ, ComunidadDBZ, EspecialesDBZ], TableroPlanoDBZ),
    juego( [], TableroPlanoDBZ, 500000, 2, 0, 10, 4, 1, JuegoDBZ),
    write('Juego DBZ: '), write(JuegoDBZ), nl,
    juegoCalcularRentaJugador(JuegoDBZ, Piccolo, RentaTotalDBZ),
    write('Renta Total Piccolo = '), write(RentaTotalDBZ), nl.


rf15a:-
    write("===== [RF 15] Test: Construir casa en una propiedad ====="), nl,
    propiedad(31, "Casa del Oeste", 60000, 2500, 1, 2, false, false, PropCasa),
    write('Propiedad antes de construir: '), write(PropCasa), nl,
    tablero([[PropCasa, 7]], [], [], [], Tablero),
    Tablero = [Props, Suerte, Comunidad, Especiales],
    append([Props, Suerte, Comunidad, Especiales], TableroPlano),
    % creo un juego con max 4 casas
    juego([], TableroPlano, 200000, 2, 0, 10, 4, 1, Juego),
    % ejecuto la construcción de una casa
    juegoConstruirCasa(Juego, PropCasa, JuegoOut),
    juegoGetTablero(JuegoOut, TableroOut),
    buscarElementoPorID(31, TableroOut, PropActualizada),
    propiedadGetCasas(PropActualizada, CantidadCasas),
    write('Cantidad de casas después de construir: '), write(CantidadCasas), nl,
    write('Propiedad después de construir: '), write(PropActualizada), nl.


rf15b:-
    write("===== [RF 15] Test: Construir casa cuando ya hay máximo de casas ====="), nl,
    % Propiedad ya con 4 casas (máximo)
    propiedad(32, "Casa del Este", 65000, 2600, 1, 4, false, false, PropCasaMax),
    write('Propiedad antes de construir: '), write(PropCasaMax), nl,
    tablero([[PropCasaMax, 8]], [], [], [], TableroMax),
    TableroMax = [PropsMax, SuerteMax, ComunidadMax, EspecialesMax],
    append([PropsMax, SuerteMax, ComunidadMax, EspecialesMax], TableroPlanoMax),
    % creo un juego con max 4 casas
    juego([], TableroPlanoMax, 200000, 2, 0, 10, 4, 1, JuegoMax),
    % intento construir una casa adicional
    juegoConstruirCasa(JuegoMax, PropCasaMax, JuegoOutMax),
    juegoGetTablero(JuegoOutMax, TableroOutMax),
    buscarElementoPorID(32, TableroOutMax, PropActualizadaMax),
    propiedadGetCasas(PropActualizadaMax, CantidadCasasMax),
    write('Cantidad de casas después de intentar construir: '), write(CantidadCasasMax), nl,
    write('Propiedad después de intentar construir: '), write(PropActualizadaMax), nl,
    write('Como la cantidad de casas ya alcanzo el máximo, no hubo cambios.'), nl.


rf16a :-
    write("===== [RF 16] Test: Construir hotel (caso donde puede) ====="), nl,
    propiedad(41, "Puerto Montt", 80000, 3500, 1, 4, false, false, PropHotelPM_a),
    write('Propiedad antes de construir hotel: '), write(PropHotelPM_a), nl,
    propiedad(42, "Osorno", 70000, 3000, 1, 0, false, false, PropHotelOs_a),
    propiedad(99, "Salida", 0, 0, -1, 0, false, false, PropHotelSalida_a),
    propiedad(100, "Cárcel", 0, 0, -1, 0, false, false, PropHotelCarcel_a),
    carta(1, "suerte", "Avanza hasta salida", irASalida, CartaHotelSuerte_a),
    carta(3, "comunidad", "Cambia el impuesto", cambiarImpuesto, CartaHotelComunidad_a),
    tablero([[PropHotelPM_a, 1], [PropHotelOs_a, 2]], [[CartaHotelSuerte_a, 3]], [[CartaHotelComunidad_a, 4]], [[PropHotelSalida_a, 0], [PropHotelCarcel_a, 10]], TableroHotelA_a),
    TableroHotelA_a = [PropsHotelA_a, SuerteHotelA_a, ComunidadHotelA_a, EspecialesHotelA_a],
    append([PropsHotelA_a, SuerteHotelA_a, ComunidadHotelA_a, EspecialesHotelA_a], TableroPlanoHotelA_a),
    juego([], TableroPlanoHotelA_a, 200000, 2, 0, 10, 4, 1, JuegoHotelA_a),
    write('Juego antes de construir hotel: '), write(JuegoHotelA_a), nl,
    juegoConstruirHotel(JuegoHotelA_a, PropHotelPM_a, JuegoHotelAOut_a),
    juegoGetTablero(JuegoHotelAOut_a, TableroHotelAOut_a),
    ( TableroHotelAOut_a = [PropsHOutA_a, SuerteHOutA_a, ComunidadHOutA_a, EspecialesHOutA_a] ->
        append([PropsHOutA_a, SuerteHOutA_a, ComunidadHOutA_a, EspecialesHOutA_a], TableroPlanoHotelAOut_a)
    ;   TableroPlanoHotelAOut_a = TableroHotelAOut_a
    ),
    buscarElementoPorID(41, TableroPlanoHotelAOut_a, PropHotelActualizada_a),
    propiedadGetCasas(PropHotelActualizada_a, CantCasasHotel_a),
    propiedadGetEsHotel(PropHotelActualizada_a, EsHotelHotel_a),
    write('Propiedad después de construir hotel: '), write(PropHotelActualizada_a), nl,
    write('Cantidad de casas después de construir hotel: '), write(CantCasasHotel_a), nl,
    write('¿Es hotel?: '), write(EsHotelHotel_a), nl.


rf16b :-
    write("===== [RF 16] Test: Construir hotel (caso donde NO puede) ====="), nl,
    propiedad(41, "Puerto Montt", 80000, 3500, 1, 3, false, false, PropHotelPM_b),
    write('Propiedad antes de intentar construir hotel: '), write(PropHotelPM_b), nl,
    propiedad(42, "Osorno", 70000, 3000, 1, 0, false, false, PropHotelOs_b),
    propiedad(99, "Salida", 0, 0, -1, 0, false, false, PropHotelSalida_b),
    propiedad(100, "Cárcel", 0, 0, -1, 0, false, false, PropHotelCarcel_b),
    carta(1, "suerte", "Avanza hasta salida", irASalida, CartaHotelSuerte_b),
    carta(3, "comunidad", "Cambia el impuesto", cambiarImpuesto, CartaHotelComunidad_b),
    tablero([[PropHotelPM_b, 1], [PropHotelOs_b, 2]], [[CartaHotelSuerte_b, 3]], [[CartaHotelComunidad_b, 4]], [[PropHotelSalida_b, 0], [PropHotelCarcel_b, 10]], TableroHotelB_b),
    TableroHotelB_b = [PropsHotelB_b, SuerteHotelB_b, ComunidadHotelB_b, EspecialesHotelB_b],
    append([PropsHotelB_b, SuerteHotelB_b, ComunidadHotelB_b, EspecialesHotelB_b], TableroPlanoHotelB_b),
    juego([], TableroPlanoHotelB_b, 200000, 2, 0, 10, 4, 1, JuegoHotelB_b),
    juegoConstruirHotel(JuegoHotelB_b, PropHotelPM_b, JuegoHotelBOut_b),
    juegoGetTablero(JuegoHotelBOut_b, TableroHotelBOut_b),
    ( TableroHotelBOut_b = [PropsHOutB_b, SuerteHOutB_b, ComunidadHOutB_b, EspecialesHOutB_b] ->
        append([PropsHOutB_b, SuerteHOutB_b, ComunidadHOutB_b, EspecialesHOutB_b], TableroPlanoHotelBOut_b)
    ;   TableroPlanoHotelBOut_b = TableroHotelBOut_b
    ),
    buscarElementoPorID(41, TableroPlanoHotelBOut_b, PropHotelActualizada_b),
    propiedadGetCasas(PropHotelActualizada_b, CantCasasHotel_b),
    propiedadGetEsHotel(PropHotelActualizada_b, EsHotelHotel_b),
    write('Propiedad después de intentar construir hotel: '), write(PropHotelActualizada_b), nl,
    write('Como la propiedad ya tiene 4 casas, no se puede construir un hotel.'), nl,
    write('Cantidad de casas después de intentar construir hotel: '), write(CantCasasHotel_b), nl,
    write('¿Es hotel?: '), write(EsHotelHotel_b), nl.


rf17a :-
    write("===== [RF 17] Test: Pagar renta (caso estándar) ====="), nl,
    jugador(1, "Santiago", 1500, [], 0, false, 0, JugadorPagadorA),
    jugador(2, "Valparaíso", 1500, [], 0, false, 0, JugadorReceptorA),
    write('Jugador pagador: '), write(JugadorPagadorA), nl,
    write('Jugador receptor: '), write(JugadorReceptorA), nl,
    MontoA = 300,
    write('Monto a pagar: '), write(MontoA), nl,
    jugadorPagarRenta(JugadorPagadorA, JugadorReceptorA, MontoA, JugadorPagadorAOut, JugadorReceptorAOut),
    jugadorGetDinero(JugadorPagadorAOut, DineroPagadorA),
    jugadorGetDinero(JugadorReceptorAOut, DineroReceptorA),
    write('Jugador pagador después de pagar: '), write(JugadorPagadorAOut), nl,
    write('Jugador receptor después de recibir: '), write(JugadorReceptorAOut), nl.


rf17b :-
    write("===== [RF 17] Test: Pagar renta (caso dinero negativo) ====="), nl,
    jugador(3, "Concepción", 1500, [], 0, false, 0, JugadorPagadorB),
    write('Jugador pagador: '), write(JugadorPagadorB), nl,
    jugador(4, "La Serena", 1500, [], 0, false, 0, JugadorReceptorB),
    write('Jugador receptor: '), write(JugadorReceptorB), nl,
    MontoB = 2000,
    write('Monto a pagar: '), write(MontoB), nl,
    jugadorPagarRenta(JugadorPagadorB, JugadorReceptorB, MontoB, JugadorPagadorBOut, JugadorReceptorBOut),
    jugadorGetDinero(JugadorPagadorBOut, DineroPagadorB),
    jugadorGetDinero(JugadorReceptorBOut, DineroReceptorB),
    write('Jugador pagador después de pagar: '), write(JugadorPagadorBOut), nl,
    write('Jugador receptor después de recibir: '), write(JugadorReceptorBOut), nl.


rf18a :-
    write("===== [RF 18] Test: Hipotecar propiedad (caso normal) ====="), nl,
    propiedad(51, "Temuco", 70000, 2200, 2, 1, false, false, PropiedadTemuco),
    write('Propiedad antes de hipotecar: '), write(PropiedadTemuco), nl,
    propiedadHipotecar(PropiedadTemuco, PropiedadTemucoHipotecada),
    propiedadGetHipotecada(PropiedadTemucoHipotecada, EstadoHipoteca),
    write('Propiedad después de hipotecar: '), write(PropiedadTemucoHipotecada), nl,
    write('¿Está hipotecada?: '), write(EstadoHipoteca), nl.


rf18b :-
    write("===== [RF 18] Test: Hipotecar propiedad (ya hipotecada) ====="), nl,
    propiedad(52, "Iquique", 65000, 2100, 2, 0, true, false, PropiedadIquique),
    write('Propiedad antes de hipotecar: '), write(PropiedadIquique), nl,
    propiedadHipotecar(PropiedadIquique, PropiedadIquiqueHipotecada),
    propiedadGetHipotecada(PropiedadIquiqueHipotecada, EstadoHipoteca2),
    write('Propiedad después de hipotecar: '), write(PropiedadIquiqueHipotecada), nl,
    write('¿Está hipotecada?: '), write(EstadoHipoteca2), nl.


rf20a :-
    write("===== [RF 20] Test: Jugador NO está en bancarrota ====="), nl,
    jugador(61, "Puerto Varas", 1000, [], 0, false, 0, JugadorNoBancarrota),
    write('Jugador antes de verificar bancarrota: '), write(JugadorNoBancarrota), nl,
    ( jugadorEstaEnBancarrota(JugadorNoBancarrota) ->
        write('¿Está en bancarrota?: true'), nl
    ;   write('¿Está en bancarrota?: false'), nl
    ).


rf20b :-
    write("===== [RF 20] Test: Jugador SÍ está en bancarrota ====="), nl,
    jugador(62, "Chillán", 0, [], 0, false, 0, JugadorBancarrota),
    write('Jugador antes de verificar bancarrota: '), write(JugadorBancarrota), nl,
    ( jugadorEstaEnBancarrota(JugadorBancarrota) ->
        write('¿Está en bancarrota?: true'), nl
    ;   write('¿Está en bancarrota?: false'), nl
    ).
