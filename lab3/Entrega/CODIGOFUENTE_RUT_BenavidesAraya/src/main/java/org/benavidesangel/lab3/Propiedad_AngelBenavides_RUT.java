package org.benavidesangel.lab3;

/**
 * Clase que representa una propiedad en el juego.
 * Hereda de Casilla_AngelBenavides_RUT.
 * Esta clase maneja las propiedades que los jugadores pueden comprar,
 * construir casas y hoteles, hipotecar y deshipotecar.
 */
public class Propiedad_AngelBenavides_RUT extends Casilla_AngelBenavides_RUT {
    int precio;
    int renta;
    Jugador_AngelBenavides_RUT duenio;
    int casas;
    int hoteles;
    boolean estaHipotecada;

    /**
     * Constructor de la clase Propiedad.
     *
     * @param id          Identificador único de la propiedad.
     * @param nombre      Nombre de la propiedad.
     * @param precio      Precio de compra de la propiedad.
     * @param renta       Renta base de la propiedad.
     * @param duenio      Jugador que es dueño de la propiedad (null si no tiene dueño).
     * @param casas       Número de casas construidas en la propiedad.
     * @param hoteles     Número de hoteles construidos en la propiedad.
     * @param estaHipotecada Indica si la propiedad está hipotecada.
     **/
    public Propiedad_AngelBenavides_RUT(int id, String nombre, int precio, int renta, Jugador_AngelBenavides_RUT duenio, int casas, int hoteles, boolean estaHipotecada) {
        super(id, nombre);
        this.precio = precio;
        this.renta = renta;
        this.duenio = duenio;
        this.casas = casas;
        this.hoteles = hoteles;
        this.estaHipotecada = estaHipotecada;
    }

    //Getters:

    /** RF 17: getPrecio
     * Retorna el precio de la propiedad.
     *
     * @return int Precio de la propiedad.
     */
    public int getPrecio() {
        return precio;
    }

    /** isEstaHipotecada
     * Indica si la propiedad está hipotecada.
     *
     * @return boolean true si está hipotecada, false si no.
     */
    public boolean isEstaHipotecada() {
        return estaHipotecada;
    }

    /** getDuenio
     * Retorna el jugador que es dueño de la propiedad.
     * Si no tiene dueño, retorna null.
     *
     * @return Jugador_AngelBenavides_RUT Duenio de la propiedad.
     */
    public Jugador_AngelBenavides_RUT getDuenio() {
        return duenio;
    }

    /**tieneDuenio
     * Indica si la propiedad tiene dueño.
     * Retorna true si tiene dueño, false si no.
     *
     * @return boolean true si tiene dueño, false si no.
     */
    public boolean tieneDuenio(){
        return duenio != null; //true si tiene, false si no
    }

    /** getCasas
     * Retorna el número de casas construidas en la propiedad.
     *
     * @return int Número de casas en la propiedad.
     */
    public int getCasas() {
        return casas;
    }

    /**isHotel
     * Indica si la propiedad tiene un hotel construido.
     * Retorna true si hay un hotel, false si no.
     *
     * @return boolean true si hay un hotel, false si no.
     */
    public boolean isHotel() {
        return hoteles > 0; //tiene hotel
//no tiene hotel
    }

    //Setters:

    /** setDuenio
     * Establece el dueño de la propiedad.
     * Si se establece un dueño, la propiedad ya no está hipotecada.
     *
     * @param duenio Jugador_AngelBenavides_RUT que será el nuevo dueño de la propiedad.
     */
    public void setDuenio(Jugador_AngelBenavides_RUT duenio) {
        this.duenio = duenio;
    }



    /** RF18: calcula la renta de una propiedad según el número de casas y hoteles.
     * Si la propiedad está hipotecada, la renta es 0.
     * Si hay 0 o más casas, se suma un 20% del precio por cada casa.
     * Si hay un hotel (solo puede haber uno por aclaración), la renta se duplica
     * esto se maneja con polimorfismo en la clase Hotel_AngelBenavides_RUT
     *
     * @param maxCasas Número máximo de casas permitidas en la propiedad.
     * @return La renta calculada de la propiedad.
     */
    public int calcularRentaPropiedad(int maxCasas) {
        if (estaHipotecada) return 0;
        int renta = precio + (int) (precio * 0.2 * casas);
        return renta;
    }

    /**RF 19.b (estaba en la descripción de RF 19 la descripción de esta función)
     * Construye una casa en la propiedad.
     * @param maxCasas: Número máximo de casas permitidas en la propiedad.
     * @param comprador: Jugador que intenta construir la casa.
     * @param juego: Juego en el que se realiza la acción.
     *
     * @return true si la casa se construyó exitosamente, false en caso contrario.
     */
    public boolean construirCasa(int maxCasas, Jugador_AngelBenavides_RUT comprador, Juego_AngelBenavides_RUT juego){
        if (!comprador.equals(duenio)) return false;
        if (casas >= maxCasas || hoteles != 0) return false;
        int costo = precio;
        if (!comprador.pagar(costo)) return false;

        casas++;
        juego.agregarDinero(costo);

        return true;
    }

    /** RF20: construirHotel
     * Construye un hotel en la propiedad.
     * Para construir un hotel, primero debe haber construido el máximo de casas permitido
     * el costo de construir un hotel es quitar las casas
     *
     * @param maxCasas: Número máximo de casas permitidas en la propiedad
     * @param jugador: Jugador que intenta construir el hotel
     * @return true si el hotel se construyó exitosamente, false en caso contrario
     */
    public boolean construirHotel(int maxCasas, Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego) {
        if (!jugador.equals(duenio)) return false;
        if (casas < maxCasas || hoteles != 0) return false;

        // Crear el hotel
        Hotel_AngelBenavides_RUT hotel = convertirEnHotel(maxCasas);
        if (hotel == null) return false;

        // Reemplazar en la lista de propiedades del jugador
        jugador.propiedades.remove(this);
        jugador.propiedades.add(hotel);

        // Reemplazar en el tablero
        Tablero_AngelBenavides_RUT tablero = juego.getTablero();
        for (int i = 0; i < tablero.getCasillas().size(); i++) {
            if (tablero.getCasillas().get(i) == this) {
                tablero.getCasillas().set(i, hotel);
                break;
            }
        }

        return true;
    }

    /**RF 22: hipotecar
     * Hipoteca la propiedad, marcándola como hipotecada.
     * El jugador recibe el precio de la propiedad al hipotecarla.
     * Si ya está hipotecada, no se hace nada y se retorna 0.
     *
     * @return El monto recibido por la hipoteca (precio de la propiedad).
     */
    public int hipotecar(){
        if (estaHipotecada) return 0;

        estaHipotecada = true;
        return precio;
    }

   /** deshipotecar
     * Deshipoteca la propiedad, marcándola como no hipotecada.
     * El jugador debe pagar el precio de la propiedad más un interés para deshipotecarla.
     * Si la propiedad no está hipotecada, no se hace nada y se retorna 0.
     *
     * @param interes Porcentaje de interés a pagar al deshipotecar.
     * @return El monto total a pagar para deshipotecar (precio + interés).
     */
    public int deshipotecar(int interes) {
        if (!estaHipotecada) return 0;
        estaHipotecada = false;
        return (int) (precio * (1 + interes / 100.0));
    }

    public Hotel_AngelBenavides_RUT convertirEnHotel(int maxCasas) {
        if (casas == maxCasas && hoteles == 0) {
            return new Hotel_AngelBenavides_RUT(id, nombre, precio, renta);
        }
        return null;
    }

    /**
     * Método que se ejecuta cuando un jugador cae en la propiedad.
     * Dependiendo de si la propiedad tiene dueño, se ofrece la compra o se cobra renta.
     *
     * @param jugador Jugador que cae en la propiedad.
     * @param juego   Juego en el que se aplica el efecto.
     */
    @Override
    public void accion(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego) {

        //si no tiene dueño, se ofrece comprar la propiedad.
        if (duenio == null) {
            System.out.println(jugador.getNombre() + " cayó en: '" + nombre + "' "
                    + "(precio $" + precio + ").");

            String resp;
            do {
                System.out.print("¿Deseas comprarla? (s/n): ");
                resp = Main.IN.nextLine().trim().toLowerCase();
                if (!resp.equals("s") && !resp.equals("n"))
                    System.out.println("Respuesta inválida. Escribe 's' o 'n'.");
            } while (!resp.equals("s") && !resp.equals("n"));

            if (resp.equals("s")) {
                boolean ok = jugador.comprarPropiedad(this, juego);
                System.out.println(ok ? " Propiedad comprada."
                        : "No fue posible comprar (sin plata).");
            } else {
                System.out.println("No se compró la propiedad.");
            }
            return;
        }

        /* 2) DUEÑO = jugador → nada que hacer ------------------------ */
        if (duenio == jugador) {
            System.out.println("Ya eres dueño de '" + nombre + "'.");
            return;
        }

        /* 3) PROPIEDAD AJENA → cobrar renta -------------------------- */
        int renta = calcularRentaPropiedad( juego.getMaxCasas() );
        if (renta == 0) {
            System.out.println("Propiedad hipotecada: renta = $0");
            return;
        }

        System.out.println(jugador.getNombre() + " paga renta $" + renta
                + " a " + duenio.getNombre());
        juego.pagarRenta(jugador, duenio, renta);                // RF 21
    }

    @Override
    public String toString() {
        return "Propiedad_AngelBenavides_RUT{" +
                ", id=" + id +
                ", nombre='" + nombre + '\'' +
                "precio=" + precio +
                ", renta=" + renta +
                ", duenio=" + duenio +
                ", casas=" + casas +
                ", hoteles=" + hoteles +
                ", estaHipotecada=" + estaHipotecada +

                '}';
    }
}
