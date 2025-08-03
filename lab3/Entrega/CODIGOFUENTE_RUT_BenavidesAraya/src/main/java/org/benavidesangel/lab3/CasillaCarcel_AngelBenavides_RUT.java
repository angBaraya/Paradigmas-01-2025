package org.benavidesangel.lab3;

/**
 * Clase que representa la casilla de cárcel en el juego.
 * Hereda de Casilla_AngelBenavides_RUT.
 */
public class CasillaCarcel_AngelBenavides_RUT extends Casilla_AngelBenavides_RUT{

    /* * Esta casilla representa la cárcel en el juego.
     * Cuando un jugador cae en esta casilla, se le marca como
     * "está en la cárcel" y no puede moverse hasta que salga.
     */
    public CasillaCarcel_AngelBenavides_RUT(int id, String nombre) {
        super(id, nombre);
    }

    /**
     * Método que se ejecuta cuando un jugador cae en la casilla de cárcel.
     * marca que el jugador esta en la cárcel y no puede moverse.
     *
     * @param jugador Jugador que cae en la casilla.
     * @param juego   Juego en el que se aplica el efecto.
     */
    @Override
    public void accion(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
        jugador.setEstaEnCarcel(true);
        System.out.println(jugador.getNombre() + " se fue en cana.");
    }
}
