package org.benavidesangel.lab3;

/**
 * Clase abstracta que representa una casilla en el juego.
 * Cada casilla tiene un identificador único y un nombre.
 * Las subclases deben implementar el método `accion` para definir el comportamiento de la casilla.
 */
public abstract class Casilla_AngelBenavides_RUT {
    int id;
    String nombre;

    /**
     * Constructor de la clase Casilla
     *
     * @param id     Identificador único de la casilla
     * @param nombre Nombre de la casilla
     */
    public Casilla_AngelBenavides_RUT(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    /**
     * Método para obtener el identificador de la casilla.
     *
     * @return int Identificador de la casilla
     */
    public int getId() {
        return id;
    }

    /**
     * Método para obtener el nombre de la casilla.
     *
     * @return String Nombre de la casilla
     */
    public String getNombre() {
        return nombre;
    }

    /**Metodo abstracto accion
     * Este método debe ser implementado por las subclases para definir la acción que se realiza
     * cuando un jugador cae en esta casilla.
     *
     * @param jugador El jugador que ha cayo en la casilla
     * @param juego   El juego en el que se está jugando
     */
    public abstract void accion(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego);

}
