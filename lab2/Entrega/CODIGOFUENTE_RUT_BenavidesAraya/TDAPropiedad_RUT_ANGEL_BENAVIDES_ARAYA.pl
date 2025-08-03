
:- module('TDAPropiedad_RUT_ANGEL_BENAVIDES_ARAYA', [
    propiedadGetID/2,
    propiedadGetNombre/2,
    propiedadGetPrecio/2,
    propiedadGetRenta/2,
    propiedadGetDueno/2,
    propiedadGetCasas/2,
    propiedadGetEsHotel/2,
    propiedadGetHipotecada/2,
    propiedadSetDueno/3,
    propiedadSetCasas/3,
    propiedadSetEsHotel/3,
    propiedadSetHipotecada/3
]).


%=========CONSTRUCTOR==========
% Parte de los RF, está en el main

%=========SELECTORES==========

% PREDICADO: propiedadGetID
% MP: propiedadGetID/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el ID de una propiedad
% DOM: Propiedad (property) X ID (int)
% REC: ID (int)
% ESTRATEGIA: Declarativa
propiedadGetID([ID, _, _, _, _, _, _, _], ID).


% PREDICADO: propiedadGetNombre
% MP: propiedadGetNombre/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el nombre de una propiedad
% DOM: Propiedad (property) X Nombre (string)
% REC: Nombre (string)
% ESTRATEGIA: Declarativa
propiedadGetNombre([_, Nombre, _, _, _, _, _, _], Nombre).


% PREDICADO: propiedadGetPrecio
% MP: propiedadGetPrecio/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el precio de una propiedad
% DOM: Propiedad (property) X Precio (int)
% REC: Precio (int)
% ESTRATEGIA: Declarativa
propiedadGetPrecio([_, _, Precio, _, _, _, _, _], Precio).


% PREDICADO: propiedadGetRenta
% MP: propiedadGetRenta/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la renta base de una propiedad
% DOM: Propiedad (property) X Renta (int)
% REC: Renta (int)
% ESTRATEGIA: Declarativa
propiedadGetRenta([_, _, _, Renta, _, _, _, _], Renta).


% PREDICADO: propiedadGetDueno
% MP: propiedadGetDueno/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el dueño actual de una propiedad
% DOM: Propiedad (property) X Dueno (int)
% REC: Dueno (int)
% ESTRATEGIA: Declarativa
propiedadGetDueno([_, _, _, _, Dueno, _, _, _], Dueno).


% PREDICADO: propiedadGetCasas
% MP: propiedadGetCasas/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener la cantidad de casas construidas en una propiedad
% DOM: Propiedad (property) X Casas (int)
% REC: Casas (int)
% ESTRATEGIA: Declarativa
propiedadGetCasas([_, _, _, _, _, Casas, _, _], Casas).


% PREDICADO: propiedadGetEsHotel
% MP: propiedadGetEsHotel/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener si la propiedad tiene un hotel construido
% DOM: Propiedad (property) X EsHotel (bool)
% REC: EsHotel (bool)
% ESTRATEGIA: Declarativa
propiedadGetEsHotel([_, _, _, _, _, _, EsHotel, _], EsHotel).


% PREDICADO: propiedadGetHipotecada
% MP: propiedadGetHipotecada/2
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite obtener el estado hipotecario de una propiedad
% DOM: Propiedad (property) X Hipotecada (bool)
% REC: Hipotecada (bool)
% ESTRATEGIA: Declarativa
propiedadGetHipotecada([_, _, _, _, _, _, _, Hipotecada], Hipotecada).

%=========MODIFICADORES==========

% PREDICADO: propiedadSetDueno
% MP: propiedadSetDueno/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el dueño de una propiedad
% DOM: Propiedad (property) X NuevoDueno (int) X NuevaPropiedad (property)
% REC: NuevaPropiedad (int)
% ESTRATEGIA: Declarativa
propiedadSetDueno([ID, Nombre, Precio, Renta, _, Casas, EsHotel, EstaHipotecada],
NuevoDueno,
[ID, Nombre, Precio, Renta, NuevoDueno, Casas, EsHotel, EstaHipotecada]).


% PREDICADO: propiedadSetCasas
% MP: propiedadSetCasas/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar la cantidad de casas construidas en una propiedad
% DOM: Propiedad (property) X NuevasCasas (int) X NuevaPropiedad (property)
% REC: NuevaPropiedad (property)
% ESTRATEGIA: Declarativa
propiedadSetCasas([ID, Nombre, Precio, Renta, Dueno, _, EsHotel, EstaHipotecada], 
NuevasCasas,
[ID, Nombre, Precio, Renta, Dueno, NuevasCasas, EsHotel, EstaHipotecada]).


% PREDICADO: propiedadSetEsHotel
% MP: propiedadSetEsHotel/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el estado de hotel de una propiedad
% DOM: Propiedad (property) X NuevoHotel (bool) X NuevaPropiedad (property)
% REC: NuevaPropiedad (property)
% ESTRATEGIA: Declarativa
propiedadSetEsHotel([ID, Nombre, Precio, Renta, Dueno, Casas, _, EstaHipotecada], 
NuevoHotel,
[ID, Nombre, Precio, Renta, Dueno, Casas, NuevoHotel, EstaHipotecada]).


% PREDICADO: propiedadSetHipotecada
% MP: propiedadSetHipotecada/3
% MS: No aplica
% DESCRIPCIÓN: Predicado que permite modificar el estado hipotecario de una propiedad
% DOM: Propiedad (property) X NuevoEstado (bool) X NuevaPropiedad (property)
% REC: NuevaPropiedad (property)
% ESTRATEGIA: Declarativa
propiedadSetHipotecada([ID, Nombre, Precio, Renta, Dueno, Casas, EsHotel, _],
NuevoEstado,
[ID, Nombre, Precio, Renta, Dueno, Casas, EsHotel, NuevoEstado]).
