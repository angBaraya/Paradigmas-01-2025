package org.benavidesangel.lab3;

/**
 * Clase que representa una carta de suerte en el juego.
 * Hereda de Carta_AngelBenavides_RUT.
 */
public class CartaSuerte_AngelBenavides_RUT extends Carta_AngelBenavides_RUT {

    /**
     * Constructor de la carta de suerte.
     *
     * @param id          id de la carta.
     * @param tipo        Tipo de la carta (Suerte).
     * @param descripcion Descripción del efecto de la carta.
     */
    public CartaSuerte_AngelBenavides_RUT(int id, String tipo, String descripcion) {
        super(id, tipo, descripcion);
    }


    /**
     * Método que aplica el efecto de la carta de suerte.
     *
     * @param jugador Jugador al que se le aplica el efecto.
     * @param juego   Juego en el que se aplica el efecto.
     */
    @Override
    public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
        //algo
    }

    @Override
    public String toString() {
        return "CartaSuerte_AngelBenavides_RUT{" +
                "id=" + id +
                ", tipo='" + tipo + '\'' +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}
