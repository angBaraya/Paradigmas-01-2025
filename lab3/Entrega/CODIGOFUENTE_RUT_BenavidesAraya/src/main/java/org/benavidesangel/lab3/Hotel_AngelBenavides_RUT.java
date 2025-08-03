package org.benavidesangel.lab3;

/**
 * Clase que representa un hotel en el juego.
 * Hereda de Propiedad_AngelBenavides_RUT.
 */
public class Hotel_AngelBenavides_RUT extends Propiedad_AngelBenavides_RUT{

    /**
     * Constructor de la clase Hotel
     * @param id Identificador único del hotel
     * @param nombre Nombre del hotel
     * @param precio Precio de compra del hotel
     * @param rentaBase Renta base del hotel
     * @return Hotel_AngelBenavides_RUT
     */
    public Hotel_AngelBenavides_RUT(int id, String nombre,
                                          int precio, int rentaBase) {
        // casas = 0, hoteles = 1, sin dueño ni hipoteca
        super(id, nombre, precio, rentaBase, null,
                0, 1, false);
    }

    /** Metodo que sobreescribe el metodo de la clase Propiedad
     * calcular la renta de la propiedad.
     * @param maxCasas Número máximo de casas permitidas en la propiedad.
     * @return int Renta calculada de la propiedad.
     */
    @Override
    public int calcularRentaPropiedad(int maxCasas) {
        if (isEstaHipotecada()) return 0;
        int rentaConMaxCasas = getPrecio() + (int)(getPrecio() * 0.20 * maxCasas);
        return rentaConMaxCasas * 2;
    }

}
