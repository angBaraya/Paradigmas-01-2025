package org.benavidesangel.lab3;


/**
 * Clase abstracta que representa una carta en el juego.
 * Las cartas pueden ser de tipo "Suerte" o "Comunidad".
 */
public abstract class Carta_AngelBenavides_RUT {
    int id;
    String tipo;
    String descripcion;

    /**
     * Constructor de la clase Carta
     *
     * @param id          Identificador único de la carta.
     * @param tipo        Tipo de la carta (Suerte o Comunidad).
     * @param descripcion Descripción del efecto de la carta.
     */
    public Carta_AngelBenavides_RUT(int id, String tipo, String descripcion) {
        this.id = id;
        this.tipo = tipo;
        this.descripcion = descripcion;
    }

    /**
     * Método para obtener la descripción de la carta.
     * @return String Descripción de la carta.
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Método abstracto que debe ser implementado por las subclases para aplicar el efecto de la carta.
     *
     * @param jugador El jugador al que se le aplica el efecto de la carta.
     * @param juego   El juego en el que se aplica el efecto.
     *
     */
    public abstract void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego);
}
