:- module('TDAJugador_RUT_ANGEL_BENAVIDES_ARAYA', [
    jugadorGetID/2,
    jugadorGetNombre/2,
    jugadorGetDinero/2,
    jugadorGetPropiedades/2,
    jugadorGetPosicion/2,
    jugadorGetCarcel/2,
    jugadorGetCartasSalirCarcel/2,
    jugadorSetDinero/3,
    jugadorSetPosicion/3,
    jugadorSetCarcel/3,
    jugadorSetPropiedades/3,
    jugadorSetCartasSalirCarcel/3
]).

:- use_module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA', [propiedad/9, propiedadGetPrecio/2, propiedadSetDueno/3, propiedadGetID/2]).

%=========CONSTRUCTOR==========
% Parte de los RF, está en el main


%=========SELECTORES==========

% PREDICADO: jugadorGetID
% MP: jugadorGetID/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el ID de un jugador
% DOM: Jugador (player) X ID (int)
% REC: ID (int)
% ESTRATEGIA: No aplica
jugadorGetID([ID,_,_,_,_,_,_], ID).


% PREDICADO: jugadorGetNombre
% MP: jugadorGetNombre/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el nombre de un jugador
% DOM: Jugador (player) X Nombre (string)
% REC: Nombre (string)
% ESTRATEGIA: No aplica
jugadorGetNombre([_, Nombre, _, _, _, _, _], Nombre).


% PREDICADO: jugadorGetDinero
% MP: jugadorGetDinero/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el dinero de un jugador
% DOM: Jugador (player) X Dinero (int)
% REC: Dinero (int)
% ESTRATEGIA: No aplica
jugadorGetDinero([_, _, Dinero, _, _, _, _], Dinero).


% PREDICADO: jugadorGetPropiedades
% MP: jugadorGetPropiedades/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener las propiedades de un jugador
% DOM: Jugador (player) X Propiedades (list id's)
% REC: Propiedades (list id's)
% ESTRATEGIA: No aplica
jugadorGetPropiedades([_, _, _, Propiedades, _, _, _], Propiedades).

% PREDICADO: jugadorGetPosicion
% MP: jugadorGetPosicion/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la posición de un jugador
% DOM: Jugador (player) X Posicion (int)
% REC: Posicion (int)
% ESTRATEGIA: No aplica
jugadorGetPosicion([_, _, _, _, PosActual, _, _], PosActual).

% PREDICADO: jugadorGetCarcel
% MP: jugadorGetCarcel/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener si un jugador está en la cárcel
% DOM: Jugador (player) X EstaEnCarcel (bool)
% REC: EstaEnCarcel (bool)
% ESTRATEGIA: No aplica
jugadorGetCarcel([_, _, _, _, _, EstaEnCarcel, _], EstaEnCarcel).

% PREDICADO: jugadorGetCartasSalirCarcel
% MP: jugadorGetCartasSalirCarcel/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la cantidad de cartas "Salir de la cárcel" que posee un jugador
% DOM: Jugador (player) X TotalCartasSalirCarcel (int)
% REC: TotalCartasSalirCarcel (int)
% ESTRATEGIA: No aplica
jugadorGetCartasSalirCarcel([_, _, _, _, _, _, TotalCartasSalirCarcel], TotalCartasSalirCarcel).


%=========MODIFICADORES==========


% PREDICADO: jugadorSetDinero
% MP: jugadorSetDinero/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el dinero de un jugador
% DOM: jugador (player) X NuevoDinero (int) X NuevoJugador (player)
% REC: NuevoJugador (player)
% ESTRATEGIA: No aplica
jugadorSetDinero([ID, Nombre, _, Propiedades, PosActual, EstaEnCarcel, TotalCartasSalirCarcel],
NuevoDinero, [ID, Nombre, NuevoDinero, Propiedades, PosActual, EstaEnCarcel, TotalCartasSalirCarcel]).


% PREDICADO: jugadorSetPosicion
% MP: jugadorSetPosicion/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar la posición de un jugador
% DOM: jugador (player) X NuevaPosicion (int) X NuevoJugador (player)
% REC: NuevoJugador (player)
% ESTRATEGIA: No aplica
jugadorSetPosicion([ID, Nombre, Dinero, Propiedades, _, EstaEnCarcel, TotalCartasSalirCarcel], 
NuevaPos, [ID, Nombre, Dinero, Propiedades, NuevaPos, EstaEnCarcel, TotalCartasSalirCarcel]).


% PREDICADO: jugadorSetCarcel
% MP: jugadorSetCarcel/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el estado de cárcel de un jugador
% DOM: jugador (player) X EstadoCarcel (bool) X NuevoJugador (player)
% REC: NuevoJugador (player)
% ESTRATEGIA: No aplica
jugadorSetCarcel([ID, Nombre, Dinero, Propiedades, PosActual, _, TotalCartasSalirCarcel], 
EstadoCarcel, [ID, Nombre, Dinero, Propiedades, PosActual, EstadoCarcel, TotalCartasSalirCarcel]).


% PREDICADO: jugadorSetPropiedades
% MP: jugadorSetPropiedades/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar las propiedades de un jugador.
% DOM: jugador (player) X NuevasPropiedades (list) X NuevoJugador (player)
% REC: NuevoJugador (player)
% ESTRATEGIA: No aplica
jugadorSetPropiedades([ID, Nombre, Dinero, _, PosActual, EstaEnCarcel, TotalCartasSalirCarcel], 
NuevasPropiedades, [ID, Nombre, Dinero, NuevasPropiedades, PosActual, EstaEnCarcel, TotalCartasSalirCarcel]).


% PREDICADO: jugadorSetCartasSalirCarcel
% MP: jugadorSetCartasSalirCarcel/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar la cantidad de cartas "Salir de la cárcel" que posee un jugador.
% DOM: jugador (player) X NuevasCartas (int) X NuevoJugador (player)
% REC: NuevoJugador (player)
% ESTRATEGIA: No aplica
jugadorSetCartasSalirCarcel([ID, Nombre, Dinero, Propiedades, PosActual, EstaEnCarcel, _], 
NuevasCartas, [ID, Nombre, Dinero, Propiedades, PosActual, EstaEnCarcel, NuevasCartas]).
