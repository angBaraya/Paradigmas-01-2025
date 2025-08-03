package org.benavidesangel.lab3;

/**
 * Clase que representa una casilla de suerte en el juego.
 * Hereda de Casilla_AngelBenavides_RUT.
 */
public class CasillaSuerte_AngelBenavides_RUT extends Casilla_AngelBenavides_RUT{

    private MazoSuerte_AngelBenavides_RUT mazo;

    /**
     * Constructor de la clase CasillaSuerte
     * @param id Identificador único de la casilla
     * @param nombre Nombre de la casilla
     * @param mazo Mazo de cartas de suerte asociado a esta casilla
     */
    public CasillaSuerte_AngelBenavides_RUT(int id, String nombre, MazoSuerte_AngelBenavides_RUT mazo) {
        super(id, nombre);
        this.mazo = mazo;
    }

    /**
     * Método que se ejecuta cuando un jugador cae en esta casilla.
     * sca una carta del mazo de suerte y aplica el efecto.
     * @param jugador El jugador que ha caído en la casilla
     * @param juego El juego en el que se está jugando
     */
    @Override
    public void accion(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego) {
        Carta_AngelBenavides_RUT carta = mazo.sacarCarta();
        if (carta != null) {
            System.out.println("----- SUERTE ----- " + carta.getDescripcion());
            carta.aplicarEfecto(jugador, juego);
        }
    }
}
