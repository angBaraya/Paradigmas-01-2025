:- module('TDATablero_RUT_ANGEL_BENAVIDES_ARAYA', [
    tableroGetPropiedades/2,
    tableroGetCartasSuerte/2,
    tableroGetCartasComunidad/2,
    tableroGetCasillasEspeciales/2,
    tableroGetTodasLasCasillas/2
]).

:- use_module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA', [propiedad/9, propiedadGetID/2]).
:- use_module('TDACarta_RUT_ANGEL_BENAVIDES_ARAYA', [carta/5]).

%:- dynamic layout_tablero/1.

%=========CONSTRUCTOR==========
% Parte de los RF, está en el main

%=========SELECTORES==========

% PREDICADO: tableroGetPropiedades
% MP: tableroGetPropiedades/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la lista de propiedades del tablero
% DOM: Tablero (board) X Propiedades (list)
% REC: Propiedades (list)
% ESTRATEGIA: Declarativa
tableroGetPropiedades([Propiedades, _, _, _], Propiedades).


% PREDICADO: tableroGetCartasSuerte
% MP: tableroGetCartasSuerte/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la lista de cartas de suerte del tablero.
% DOM: Tablero (board) X CartasSuerte (list)
% REC: CartasSuerte (list)
% ESTRATEGIA: Declarativa
tableroGetCartasSuerte([_, CartasSuerte, _, _], CartasSuerte).


% PREDICADO: tableroGetCartasComunidad
% MP: tableroGetCartasComunidad/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la lista de cartas de comunidad del tablero.
% DOM: Tablero (board) X CartasComunidad (list)
% REC: CartasComunidad (list)
% ESTRATEGIA: Declarativa
tableroGetCartasComunidad([_, _, CartasComunidad, _], CartasComunidad).


% PREDICADO: tableroGetCasillasEspeciales
% MP: tableroGetCasillasEspeciales/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la lista de casillas especiales del tablero.
% DOM: Tablero (board) X CasillasEspeciales (list)
% REC: CasillasEspeciales (list)
% ESTRATEGIA: Declarativa
tableroGetCasillasEspeciales([_, _, _, CasillasEspeciales], CasillasEspeciales).


% PREDICADO: tableroGetTodasLasCasillas
% MP: tableroGetTodasLasCasillas/2
% MS: append/2
% DESCRIPCIÓN: Predicado que permite obtener la lista completa de casillas del tablero
% DOM: Tablero (board) X Casillas (list)
% REC: Casillas (list)
% ESTRATEGIA: Declarativa
tableroGetTodasLasCasillas([_, _, _, _, [Props, Suerte, Comunidad, Especiales]], Casillas) :-
    append([Props, Suerte, Comunidad, Especiales], Casillas).

%=========MODIFICADORES==========
