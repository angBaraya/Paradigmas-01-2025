:- module('TDACarta_RUT_ANGEL_BENAVIDES_ARAYA', [
    cartaGetID/2,
    cartaGetTipo/2,
    cartaGetDescripcion/2,
    cartaGetAccion/2
]).


%=========CONSTRUCTOR==========
% Parte de los RF, está en el main

%=========SELECTORES==========

% PREDICADO: cartaGetID
% MP: cartaGetID/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el ID de una carta
% DOM: Carta (card) X ID (int)
% REC: ID (int)
% ESTRATEGIA: Declarativa
cartaGetID([ID, _, _, _], ID).


% PREDICADO: cartaGetTipo
% MP: cartaGetTipo/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el tipo de una carta
% DOM: Carta (card) X Tipo (string)
% REC: Tipo (string)
% ESTRATEGIA: Declarativa
cartaGetTipo([_, Tipo, _, _], Tipo).


% PREDICADO: cartaGetDescripcion
% MP: cartaGetDescripcion/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la descripción de una carta
% DOM: Carta (card) X Descripcion (string)
% REC: Descripcion (string)
% ESTRATEGIA: Declarativa
cartaGetDescripcion([_, _, Descripcion, _], Descripcion).


% PREDICADO: cartaGetAccion
% MP: cartaGetAccion/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la acción asociada a una carta
% DOM: Carta (card) X Accion (fn)
% REC: Accion (fn)
% ESTRATEGIA: Declarativa
cartaGetAccion([_, _, _, Accion], Accion).

%=========MODIFICADORES==========
