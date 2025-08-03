package org.benavidesangel.lab3;

/**
 * Clase que representa una carta de comunidad en el juego.
 * Hereda de Carta_AngelBenavides_RUT.
 */
public class CartaComunidad_AngelBenavides_RUT extends Carta_AngelBenavides_RUT {

    /**
     * Constructor de la carta de comunidad.
     *
     * @param id          id de la carta.
     * @param tipo        Tipo de la carta (comunidad).
     * @param descripcion Descripción del efecto de la carta.
     */
    public CartaComunidad_AngelBenavides_RUT(int id, String tipo, String descripcion) {
        super(id, tipo, descripcion);
    }

    /**
     * Método que aplica el efecto de la carta de comunidad.
     *
     * @param jugador Jugador al que se le aplica el efecto.
     * @param juego   Juego en el que se aplica el efecto.
     */
    @Override
    public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego) {
    }

    @Override
    public String toString() {
        return "CartaComunidad_AngelBenavides_RUT{" +
                "id=" + id +
                ", tipo='" + tipo + '\'' +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}
