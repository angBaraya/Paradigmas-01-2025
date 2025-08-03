package org.benavidesangel.lab3;

/**
 * Clase que representa una casilla de salida en el juego.
 * Hereda de Casilla_AngelBenavides_RUT.
 */
public class CasillaSalida_AngelBenavides_RUT extends Casilla_AngelBenavides_RUT{

    /**
     * Constructor de la clase CasillaSalida
     * @param id Identificador único de la casilla
     * @param nombre Nombre de la casilla
     */
    public CasillaSalida_AngelBenavides_RUT(int id, String nombre) {
        super(id, nombre);
    }

    /**
     * Método que se ejecuta cuando un jugador cae en la casilla de salida.
     * En este caso, solo imprime un mensaje indicando que el jugador está en la salida.
     * @param jugador El jugador que ha caído en la casilla
     * @param juego El juego en el que se está jugando
     */
    public void accion(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
        System.out.println(jugador.getNombre() + " está en la salida.");
    }
}
