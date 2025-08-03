package org.benavidesangel.lab3;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase que representa un jugador en el juego.
 * Contiene información sobre el jugador, sus propiedades, dinero, posición actual y estado en el juego.
 */
public class Jugador_AngelBenavides_RUT {
    int id;
    String nombre;
    int dinero;
    List<Propiedad_AngelBenavides_RUT> propiedades = new ArrayList<>();
    int posActual;
    boolean estaEnCarcel;
    int totalCartasSalirCarcel;
    boolean activo;

    /**
     * Constructor del jugador.
     *
     * @param id                Identificador único del jugador.
     * @param nombre            Nombre del jugador.
     * @param dinero            Dinero inicial del jugador.
     * @param propiedades       Lista de propiedades del jugador.
     * @param posActual         Posición actual del jugador en el tablero.
     * @param estaEnCarcel      Indica si el jugador está en la cárcel.
     * @param totalCartasSalirCarcel Número total de cartas para salir de la cárcel.
     * @param activo            Indica si el jugador está activo en el juego.
     **/
    public Jugador_AngelBenavides_RUT(int id, String nombre, int dinero, List<Propiedad_AngelBenavides_RUT> propiedades, int posActual, boolean estaEnCarcel, int totalCartasSalirCarcel, boolean activo) {
        this.id = id;
        this.nombre = nombre;
        this.dinero = dinero;
        this.propiedades = propiedades;
        this.posActual = posActual;
        this.estaEnCarcel = estaEnCarcel;
        this.totalCartasSalirCarcel = totalCartasSalirCarcel;
        this.activo = activo;
    }

    //Getters:

    /**getId
     * Retorna el identificador único del jugador.
     *
     * @return int Identificador del jugador.
     */
    public int getId() {
        return id;
    }

    /**getNombre
     * Retorna el nombre del jugador.
     *
     * @return String Nombre del jugador.
     */
    public String getNombre() {
        return nombre;
    }

    /**getDinero
     * Retorna la cantidad de dinero que tiene el jugador.
     *
     * @return int Cantidad de dinero del jugador.
     */
    public int getDinero() {
        return dinero;
    }

    /**getTotalCartasSalirCarcel
     * Retorna el total de cartas que tiene el jugador para salir de la cárcel.
     *
     * @return int Total de cartas para salir de la cárcel.
     */
    public int getTotalCartasSalirCarcel() {
        return totalCartasSalirCarcel;
    }

    /**isActivo
     * Indica si el jugador está activo en el juego.
     *
     * @return boolean true si el jugador está activo, false si no lo está.
     */
    public boolean isActivo() {
        return activo;
    }

    //Setters:

    /**setActivo
     * Establece el estado activo del jugador.
     *
     * @param posActual: Posición actual del jugador en el tablero.
     */
    public void setPosActual(int posActual) {
        this.posActual = posActual;
    }

    /**setActivo
     * Establece el estado activo del jugador.
     *
     * @param estaEnCarcel: boolean que indica si el jugador está en la cárcel.
     */
    public void setEstaEnCarcel(boolean estaEnCarcel) {
        this.estaEnCarcel = estaEnCarcel;
    }

    /**setTotalCartasSalirCarcel
     * Establece el total de cartas que tiene el jugador para salir de la cárcel.
     *
     * @param totalCartasSalirCarcel: Total de cartas para salir de la cárcel.
     */
    public void setTotalCartasSalirCarcel(int totalCartasSalirCarcel) {
        this.totalCartasSalirCarcel = totalCartasSalirCarcel;
    }

    /** * Aumenta el total de cartas para salir de la cárcel del jugador.
     *
     * @param cantidad: Cantidad a aumentar.
     */
    public void aumentarTotalCartasSalirCarcel(int cantidad){
        int cantidadActual = getTotalCartasSalirCarcel();
        setTotalCartasSalirCarcel(cantidadActual + cantidad);
    }

    /** Metodo para pagar una cantidad de dinero.
     * Si la cantidad es menor o igual a 0, retorna true (no corta flujo).
     * Si el jugador tiene suficiente dinero, paga la cantidad y retorna true.
     * Si no tiene suficiente dinero, paga lo que tiene y retorna false.
     *
     * @param cantidad Cantidad a pagar.
     * @return true si se pagó todo, false si no se cubrió el monto (para que el banco cubra el resto).
     */
    public boolean pagar(int cantidad) {

        if (cantidad <= 0) return true; //para no cortar flujo, una cantidad "invalida" retorna true

        if (dinero >= cantidad) {
            dinero -= cantidad;
            return true; //pago todo
        }

        // si no alcanza, paga lo que tiene y djamos en 0 su dinero
        dinero = 0;
        return false; //no cubrio el monto completo
    }


    /** Método para recibir una cantidad de dinero.
     * Aumenta el dinero del jugador en la cantidad especificada.
     *
     * @param cantidad: Cantidad de dinero a recibir.
     */
    public void recibir(int cantidad){
        dinero += cantidad;
    }

    /** RF16: Mover jugador
     * Mueve al jugador una cantidad específica de casillas en el tablero.
     * Si la cantidad es negativa, se mueve hacia atrás (para efectos de cartas).
     * Si la nueva posición es mayor que el tamaño del tablero, se ajusta usando el módulo.
     *
     * @param cantidadAMover: Cantidad de casillas a mover (puede ser negativa).
     * @param tamanioTablero: Tamaño total del tablero.
     */
    public void mover(int cantidadAMover, int tamanioTablero){

        int nuevaPos = (posActual + cantidadAMover) % tamanioTablero;
        //movimientos negativos para efectos de cartas
        if (nuevaPos < 0) {
            nuevaPos += tamanioTablero;
        }

        posActual = nuevaPos;
    }

    /** RF 17: Método para comprar una propedad
     * Permite al jugador comprar una propiedad si no tiene dueño y tiene suficiente dinero.
     * si la compra es exitosa, se descuenta el precio de la propiedad del dinero del jugador,
     * se asigna el jugador como dueño de la propiedad y se agrega a su lista de propiedades.
     *
     * @param propiedad: Propiedad a comprar.
     * @param juego: Juego en el que se realiza la compra (para actualizar el dinero del banco).
     * @return true si la compra fue exitosa, false si no se pudo realizar.
     */
    public boolean comprarPropiedad(Propiedad_AngelBenavides_RUT propiedad, Juego_AngelBenavides_RUT juego){

        if (propiedad.tieneDuenio() || dinero < propiedad.getPrecio()){
            return false;
        }

        dinero -= propiedad.getPrecio();
        propiedad.setDuenio(this);
        propiedades.add(propiedad);
        juego.agregarDinero(propiedad.getPrecio());
        return true;
    }

    /** RF 19: calcular renta total
     * Calcula la renta total de todas las propiedades del jugador.
     * usando el método calcularRentaPropiedad (RF18) de cada propiedad.
     *
     * @param maxCasas: Número máximo de casas permitidas en una propiedad.
     * @return La suma total de las rentas de todas las propiedades del jugador.
     */
    public int calcularRentaTotal(int maxCasas){
        int total = 0;

        for (int i = 0; i < propiedades.size(); i++){
            Propiedad_AngelBenavides_RUT prop = propiedades.get(i);
            total += prop.calcularRentaPropiedad(maxCasas); //Usamos a RF18
        }
        return total;
    }

    /** complemento a RF24: verificar bancarrota individual
     * Verifica si el jugador está en bancarrota individual.
     * Un jugador se considera en bancarrota si no tiene dinero y está activo.
     * si es asi, se marca al jugador como inactivo y retorna true.
     *
     * @return true si el jugador está en bancarrota, false en caso contrario.
     */
    public boolean verificarBancarrotaIndividual(){
        if (activo && dinero == 0){
            activo = false;
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "Jugador_AngelBenavides_RUT{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", dinero=" + dinero +
                ", propiedades=" + propiedades +
                ", posActual=" + posActual +
                ", estaEnCarcel=" + estaEnCarcel +
                ", totalCartasSalirCarcel=" + totalCartasSalirCarcel +
                ", activo=" + activo +
                '}';
    }
}
