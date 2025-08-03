package org.benavidesangel.lab3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/** * Clase principal que contiene el menú del juego Capitalia y permite interactuar con las diferentes funcionalidades del juego.
 * Permite iniciar una partida, probar las reglas funcionales (RF) individualmente y salir del juego.
 */
public class Main {

    //para leer datos desde consola
    public static final Scanner IN = new Scanner(System.in);

    public static void main(String[] args) {

        Juego_AngelBenavides_RUT juego = new Juego_AngelBenavides_RUT();

        int opcion;
        do {
            System.out.println("=== CAPITALIA | Menú Principal ===");
            System.out.println("1. Iniciar Juego");
            System.out.println("2. Probar RF individualmente");
            System.out.println("3. Salir");
            System.out.print("Opción: ");
            opcion = leerEntero();

            switch (opcion) {
                case 1:
                    juego = iniciarJuego();
                    jugarPartida(juego);
                    break;
                case 2:
                    submenuRF(juego);
                    break;
                case 3:
                    System.out.println("adiós.");
                    break;
                default:
                    System.out.println("Opción inválida.");
            }
        } while (opcion != 3);

        IN.close();
    }

    /** Metodo para iniciar un juego.
     * Pide al usuario los parámetros iniciales del juego y crea un objeto Juego_AngelBenavides_RUT.
     * Luego, solicita los nombres de los jugadores y los agrega al juego.
     *
     * @return Un objeto Juego_AngelBenavides_RUT con los parámetros y jugadores inicializados.
     */
    private static Juego_AngelBenavides_RUT iniciarJuego() {
        System.out.println("\n*** Parámetros de la partida ***");
        System.out.print("Dinero del banco: ");
        int banco = leerEntero();

        System.out.print("Tasa de impuesto (%): ");
        int impuesto = leerEntero();

        System.out.print("Máx. casas por propiedad: ");
        int maxCasas = leerEntero();

        //por enunciado, dejé numero de dados en 2 y hotel maximo en 1 (ademas ayuda a usar la clase Hotel)

        Juego_AngelBenavides_RUT juego = new Juego_AngelBenavides_RUT(banco, 2, impuesto, maxCasas, 1);

        //se agregan X jugadores
        System.out.print("¿Cuántos jugadores participarán? ");
        int numJugadores = leerEntero();
        for (int i = 0; i < numJugadores; i++) {
            System.out.print("Nombre del jugador " + (i + 1) + ": ");
            String nombre = IN.nextLine();
            Jugador_AngelBenavides_RUT jugador = new Jugador_AngelBenavides_RUT(i, nombre, 0, new ArrayList<>(), 0, false, 0, true);
            juego.agregarJugador(jugador);
        }

        return juego;
    }


    /**Submenu para probar RF individualmente.
     * @param juego Juego actual, puede ser null si no se ha creado uno.
     */
    private static void submenuRF(Juego_AngelBenavides_RUT juego) {

        int eleccion;
        do {
            System.out.println("--- Probar RF individual ---");
            System.out.println("1. RF 3 – Crear Jugador");
            System.out.println("2. RF 4 – Crear Propiedad");
            System.out.println("3. RF 5 – Crear Hotel");
            System.out.println("4. RF 6 y 7 – Crear Carta Comunidad");
            System.out.println("5. RF 6 y 8 – Crear Carta Suerte");
            System.out.println("6. RF 9 – Crear Tablero");
            System.out.println("7. RF 10 – Crear Juego");
            System.out.println("8. RF 10b – Imprimir Estado del Juego");
            System.out.println("9. RF 11 – Cargar Datos Iniciales");
            System.out.println("10. RF 12 – Agregar Propiedad");
            System.out.println("11. RF 13 – Agregar Jugador");
            System.out.println("12. RF 14 – Obtener Jugador Actual");
            System.out.println("13. RF 15 – Lanzar Dados");
            System.out.println("14. RF 16 – Mover Jugador");
            System.out.println("15. RF 17 – Comprar Propiedad");
            System.out.println("16. RF 18 – Calcular renta Propiedad");
            System.out.println("17. RF 19 – Calcular renta Jugador");
            System.out.println("18. RF 19b – Construir casa");
            System.out.println("19. RF 20 – Construir hotel");
            System.out.println("20. RF 21 – Pagar renta");
            System.out.println("21. RF 22 – Hipotecar Propiedad");
            System.out.println("22. RF 23 – Extraer Carta");
            System.out.println("23. RF 24 – Verificar Bancarrota");
            System.out.println("0. Volver");
            System.out.print("RF a probar: ");
            eleccion = leerEntero();

            switch (eleccion) {
                case 1:
                    demoRF3_crearJugador();
                    break;
                case 2:
                    demoRF4_crearPropiedad();
                    break;
                case 3:
                    demoRF5_crearHotel();
                    break;
                case 4:
                    demoRF6_7_8_crearCarta("Comunidad");
                    break;
                case 5:
                    demoRF6_7_8_crearCarta("Suerte");
                    break;
                case 6:
                    demoRF9_crearTablero();
                    break;
                case 7:
                    demoRF10_crearJuego();
                    break;
                case 8:
                    demoRF10b_ImprimirEstadoJuego(juego);
                    break;
                case 9:
                    demoRF11_CargarDatosIniciales(juego);
                    break;
                case 10:
                    demoRF12_AgregarPropiedad(juego);
                    break;
                case 11:
                    demoRF13_AgregarJugador(juego);
                    break;
                case 12:
                    demoRF14_ObtenerJugadorActual(juego);
                    break;
                case 13:
                    demoRF15_LanzarDados(juego);
                    break;
                case 14:
                    demoRF16_MoverJugador(juego);
                    break;
                case 15:
                    demoRF17_ComprarPropiedad(juego);
                    break;
                case 16:
                    demoRF18_CalcularRentaPropiedad(juego);
                    break;
                case 17:
                    demoRF19_CalcularRentaJugador(juego);
                    break;
                case 18:
                    demoRF19b_ConstruirCasa(juego);
                    break;
                case 19:
                    demoRF20_ConstruirHotel(juego);
                    break;
                case 20:
                    demoRF21_PagarRenta(juego);
                    break;
                case 21:
                    demoRF22_HipotecarPropiedad(juego);
                    break;
                case 22:
                    demoRF23_ExtraerCarta(juego);
                    break;
                case 23:
                    demoRF24_VerificarBancarrota(juego);
                    break;
                case 0:
                    System.out.println("Volviendo al menú principal");
                    break;
                default:
                    System.out.println("RF inválido.");
            }
        } while (eleccion != 0);
    }

    /** Método para probar RF3 – Crear Jugador.
     * Crea un jugador con un ID y nombre ingresados por el usuario.
     * Los otros valores se definen por defecto.
     */
    private static void demoRF3_crearJugador() {
        System.out.println("ID del jugador: ");
        int id = leerEntero();
        System.out.print("Nombre del jugador: ");
        String nombre = IN.nextLine();
        System.out.println("Los otros valores son los definidos por defecto para cada jugador.");
        Jugador_AngelBenavides_RUT jugador = new Jugador_AngelBenavides_RUT(id, nombre, 1500, new ArrayList<>(), 0, false, 0, true);
        System.out.println("Jugador creado: " + jugador);
    }

    /** Método para probar RF4 – Crear Propiedad.
     * Crea una propiedad con un ID y nombre ingresados por el usuario.
     * Los otros valores se definen por defecto.
     */
    private static void demoRF4_crearPropiedad() {
        System.out.println("ID de la propiedad: ");
        int id = leerEntero();
        System.out.print("Nombre de la propiedad: ");
        String nombre = IN.nextLine();
        System.out.println("los otros valores son los definidos por defecto para cada propiedad.");
        Propiedad_AngelBenavides_RUT prop = new Propiedad_AngelBenavides_RUT(id, nombre, 100, 100, null, 0, 0, false);
        System.out.println("Propiedad creada: " + prop);
    }

    /** Método para probar RF5 – Crear Hotel.
     * Crea un hotel con un ID y nombre ingresados por el usuario.
     * Los otros valores se definen por defecto.
     */
    private static void demoRF5_crearHotel() {
        Hotel_AngelBenavides_RUT hotel = new Hotel_AngelBenavides_RUT(1, "TestHotel", 200, 20);
        System.out.println("Prueba RF5 - Hotel creado: " + hotel);
    }

   /** Método para probar RF6, RF7 y RF8 – Crear Carta Comunidad o Suerte.
     * Crea una carta de tipo Comunidad o Suerte según la elección del usuario.
     * El ID y descripción se ingresan por el usuario.
     * El efecto de la carta es un método vacío para esta demostración.
     */
    private static void demoRF6_7_8_crearCarta(String tipo) {
        System.out.println("id de la carta: ");
        int id = leerEntero();

        Carta_AngelBenavides_RUT carta;
        switch (tipo) {
            case "Comunidad":
                carta = new CartaComunidad_AngelBenavides_RUT(id, "Carta comunidad", "Prueba del RF 6 y 7") {
                    @Override
                    public void aplicarEfecto(Jugador_AngelBenavides_RUT j, Juego_AngelBenavides_RUT g) {
                    }
                };
                break;
            case "Suerte":
                carta = new CartaSuerte_AngelBenavides_RUT(id, "Carta suerte", "Prueba del RF 6 y 8") {
                    @Override
                    public void aplicarEfecto(Jugador_AngelBenavides_RUT j, Juego_AngelBenavides_RUT g) {
                    }
                };
                break;
            default:
                System.out.println("Tipo de carta inválido. Solo se permiten 'COM' o 'SUR'.");
                return;
        }
        System.out.println("Carta creada: " + carta);
    }

    /** Método para probar RF9 – Crear Tablero.
     * Crea un tablero inicial con mazos de suerte y comunidad vacíos.
     * Imprime la cantidad de casillas creadas en el tablero.
     */
    private static void demoRF9_crearTablero() {
        // Crea mazos vacíos para la demostración
        MazoSuerte_AngelBenavides_RUT mazoSuerte = new MazoSuerte_AngelBenavides_RUT();
        MazoComunidad_AngelBenavides_RUT mazoComunidad = new MazoComunidad_AngelBenavides_RUT();
        Tablero_AngelBenavides_RUT tablero = Tablero_AngelBenavides_RUT.cargarTableroInicial(mazoSuerte, mazoComunidad);
        System.out.println("Tablero creado con " + tablero.getCasillas().size() + " casillas.");
    }

    /** Método para probar RF10 – Crear Juego.
     * Crea un objeto Juego_AngelBenavides_RUT con valores por defecto.
     * Imprime el objeto juego creado.
     */
    private static void demoRF10_crearJuego() {
        Juego_AngelBenavides_RUT juego = new Juego_AngelBenavides_RUT();
        System.out.println("Juego creado: " + juego);
    }

    /** Método para probar RF10b – Imprimir Estado del Juego.
     * Imprime el estado del juego actual, o crea uno temporal si no se pasa uno.
     * Muestra información del tablero, jugadores y mazos.
     */
    private static void demoRF10b_ImprimirEstadoJuego(Juego_AngelBenavides_RUT juego) {
        // Si no se pasa un juego, crea uno temporal para la demo
        if (juego == null) {
            juego = new Juego_AngelBenavides_RUT();
        }
        juego.imprimirEstado();
    }

    /** Método para probar RF11 – Cargar Datos Iniciales.
     * Carga los datos iniciales del juego y muestra el estado del tablero.
     * Si no hay juego activo o el tablero no está inicializado, muestra un mensaje de error.
     */
    private static void demoRF11_CargarDatosIniciales(Juego_AngelBenavides_RUT juego) {
        if (juego == null || juego.getTablero() == null) {
            System.out.println("No hay juego activo o el tablero no está inicializado.");
            return;
        }
        juego.cargarDatosIniciales();
        System.out.println("Datos iniciales cargados.");
        juego.imprimirEstado();
    }

    /** Método para probar RF12 – Agregar Propiedad.
     * Agrega una propiedad al tablero del juego actual.
     * Pide al usuario el nombre de la propiedad y crea un objeto Propiedad_AngelBenavides_RUT.
     * Imprime la posición donde se agregó la propiedad y el estado del juego.
     */
    private static void demoRF12_AgregarPropiedad(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        int id = juego.getTablero().getCasillas().size(); // id automático
        System.out.print("Nombre de la propiedad: ");
        String nombre = IN.nextLine();
        Propiedad_AngelBenavides_RUT prop = new Propiedad_AngelBenavides_RUT(id, nombre, 100, 100, null, 0, 0, false);
        int pos = juego.getTablero().agregarPropiedad(prop);
        System.out.println("Propiedad agregada en la posición: " + pos + " (id=" + id + ")");
        juego.imprimirEstado();
    }

    /** Método para probar RF13 - Agregar Jugador.
     * Agrega un jugador al juego actual.
     * Pide al usuario el nombre del jugador y crea un objeto Jugador_AngelBenavides_RUT.
     * Imprime el ID del jugador agregado y el estado del juego.
     */
    private static void demoRF13_AgregarJugador(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        int id = juego.getListaJugadores().size(); // id automático
        System.out.print("Nombre del jugador: ");
        String nombre = IN.nextLine();
        Jugador_AngelBenavides_RUT jugador = new Jugador_AngelBenavides_RUT(id, nombre, 0, new ArrayList<>(), 0, false, 0, true);
        juego.agregarJugador(jugador);
        System.out.println("Jugador agregado con id: " + id);
        juego.imprimirEstado();
    }

    /** Método para probar RF14 - Obtener Jugador Actual.
     * Obtiene el jugador actual del juego y lo imprime.
     * Si no hay juego activo o no hay jugadores, muestra un mensaje de error.
     */
    private static void demoRF14_ObtenerJugadorActual(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay jugadores agregados, agrega algunos con RF 13 primero.");
            return;
        }
        Jugador_AngelBenavides_RUT actual = juego.getJugadorActual();
        if (actual != null) {
            System.out.println("Jugador actual: " + actual);
        } else {
            System.out.println("No hay jugador actual.");
        }
    }

    /** Método para probar RF15 - Lanzar Dados.
     * Lanza los dados del juego actual y muestra el resultado.
     * Si no hay juego activo, muestra un mensaje de error.
     */
    private static void demoRF15_LanzarDados(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        int[] resultado = juego.lanzarDados();
        System.out.println("Resultado de lanzar los dados: " + Arrays.toString(resultado));
    }

    /** Método para probar RF16 - Mover Jugador.
     * Mueve al jugador actual una cantidad de posiciones ingresada por el usuario.
     * Si no hay juego activo o no hay jugadores, muestra un mensaje de error.
     * Solo se mueve el jugador del turno actual.
     */
    private static void demoRF16_MoverJugador(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay jugadores agregados, agrega algunos con RF 13 primero.");
            return;
        }
        Jugador_AngelBenavides_RUT actual = juego.getJugadorActual();
        System.out.println("NOTA: Solo se moverá el jugador del turno actual.");
        System.out.println("Si se quiere mover a otro jugador, se debe cambiar el turno primero.");
        System.out.println("Jugador actual: id=" + actual.getId() + " | nombre=" + actual.getNombre() + " | posición=" + actual.posActual);
        System.out.print("Cantidad de posiciones a mover: ");
        int posiciones = leerEntero();
        juego.moverJugador(posiciones);
        System.out.println("Jugador movido.");
        juego.imprimirEstado();
    }

    /** Método para probar RF17 - Comprar Propiedad.
     * Permite al jugador actual comprar una propiedad del tablero.
     * Pide al usuario el ID de la propiedad a comprar y verifica si es válida.
     * Si la compra es exitosa, muestra un mensaje de éxito y el estado del juego.
     */
    private static void demoRF17_ComprarPropiedad(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty() || juego.getTablero().getCasillas().isEmpty()) {
            System.out.println("Debe haber al menos un jugador y una propiedad en el tablero.");
            return;
        }
        Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
        System.out.println("Jugador actual: id=" + jugador.getId() + " | nombre=" + jugador.getNombre());
        System.out.print("ID de la propiedad a comprar: ");
        int idProp = leerEntero();
        Propiedad_AngelBenavides_RUT prop = null;
        for (var c : juego.getTablero().getCasillas()) {
            if (c instanceof Propiedad_AngelBenavides_RUT && c.getId() == idProp) {
                prop = (Propiedad_AngelBenavides_RUT) c;
                break;
            }
        }
        if (prop == null) {
            System.out.println("Propiedad no encontrada.");
            return;
        }
        boolean exito = jugador.comprarPropiedad(prop, juego);
        System.out.println(exito ? "Propiedad comprada exitosamente." : "No se pudo comprar la propiedad.");
        juego.imprimirEstado();
    }

    /** Método para probar RF18 - Calcular Renta de una Propiedad.
     * Permite calcular la renta de una propiedad temporal creada por el usuario.
     * Pide al usuario la renta base/precio, cantidad de casas y si tiene hotel.
     * Calcula y muestra la renta total de la propiedad.
     */
    private static void demoRF18_CalcularRentaPropiedad(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        System.out.println("=== Crear propiedad temporal para calcular renta ===");
        System.out.print("Renta base/precio (es lo mismo) de la propiedad: ");
        int renta = leerEntero();
        System.out.print("Cantidad de casas: ");
        int casas = leerEntero();
        System.out.print("¿Tiene hotel? (s/n): ");
        String respHotel = IN.nextLine().trim();
        boolean tieneHotel = respHotel.equalsIgnoreCase("s");

        Propiedad_AngelBenavides_RUT prop;
        if (tieneHotel) {
            prop = new Hotel_AngelBenavides_RUT(42, "propiedad temporal", renta, renta);
        } else {
            prop = new Propiedad_AngelBenavides_RUT(42, "propiedad temporal", renta, renta, null, casas, 0, false);
        }

        int rentaCalculada = prop.calcularRentaPropiedad(juego.getMaxCasas());
        System.out.println("La renta calculada para esta propiedad es: $" + rentaCalculada);
    }

    /** Método para probar RF19 - Calcular Renta Total de un Jugador.
     * Calcula la renta total de todas las propiedades del jugador actual.
     * Si no hay juego activo o no hay jugadores, muestra un mensaje de error.
     */
    private static void demoRF19_CalcularRentaJugador(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay jugadores.");
            return;
        }
        Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
        int renta = jugador.calcularRentaTotal(juego.getMaxCasas());
        System.out.println("Renta total de " + jugador.getNombre() + ": $" + renta);
    }

    /** Método para probar RF19b - Construir Casa.
     * Permite al jugador actual construir una casa en una de sus propiedades.
     * Pide al usuario el ID de la propiedad y verifica si es válida.
     * Si la construcción es exitosa, muestra un mensaje de éxito y el estado del juego.
     */
    private static void demoRF19b_ConstruirCasa(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay jugadores agregados, agrega algunos con RF 13 primero.");
            return;
        }
        Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
        if (jugador == null) {
            System.out.println("No hay jugador actual.");
            return;
        }
        if (jugador.propiedades.isEmpty()) {
            System.out.println("El jugador actual no tiene propiedades, haz que compre alguna primero con RF17.");
            return;
        }
        System.out.print("ID de la propiedad donde construir casa: ");
        int idProp = leerEntero();
        Propiedad_AngelBenavides_RUT prop = null;
        for (var p : jugador.propiedades) {
            if (p.getId() == idProp) {
                prop = p;
                break;
            }
        }
        if (prop == null) {
            System.out.println("Propiedad no encontrada o no es del jugador actual.");
            return;
        }
        boolean exito = prop.construirCasa(juego.getMaxCasas(), jugador, juego);
        System.out.println(exito ? "Casa construida." : "No se pudo construir la casa.");
        juego.imprimirEstado();
    }

    /** Método para probar RF20 - Construir Hotel.
     * Permite al jugador actual construir un hotel en una de sus propiedades.
     * Pide al usuario el ID de la propiedad y verifica si es válida.
     * Si la construcción es exitosa, muestra un mensaje de éxito y el estado del juego.
     */
    private static void demoRF20_ConstruirHotel(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay jugadores agregados.");
            return;
        }
        Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
        if (jugador == null) {
            System.out.println("No hay jugador actual.");
            return;
        }
        if (jugador.propiedades.isEmpty()) {
            System.out.println("El jugador actual no tiene propiedades.");
            return;
        }
        System.out.print("ID de la propiedad donde construir hotel: ");
        int idProp = leerEntero();
        Propiedad_AngelBenavides_RUT prop = null;
        for (var p : jugador.propiedades) {
            if (p.getId() == idProp) {
                prop = p;
                break;
            }
        }
        if (prop == null) {
            System.out.println("Propiedad no encontrada o no es del jugador actual.");
            return;
        }
        boolean exito = prop.construirHotel(juego.getMaxCasas(), jugador, juego);
        System.out.println(exito ? "Hotel construido." : "No se pudo construir el hotel.");
        juego.imprimirEstado();
    }

    /** Método para probar RF21 - Pagar Renta.
     * Permite a un jugador pagar renta a otro jugador.
     * Pide al usuario los IDs de los jugadores involucrados y el monto de la renta.
     * Si el pago es exitoso, muestra un mensaje de éxito y el estado del juego.
     */
    private static void demoRF21_PagarRenta(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        if (juego.getListaJugadores().size() < 2) {
            System.out.println("Se requieren al menos dos jugadores.");
            return;
        }
        System.out.print("ID del jugador que paga: ");
        int idOrigen = leerEntero();
        System.out.print("ID del jugador que recibe: ");
        int idDestino = leerEntero();
        System.out.print("Monto de la renta: ");
        int monto = leerEntero();

        Jugador_AngelBenavides_RUT origen = null, destino = null;
        for (var j : juego.getListaJugadores()) {
            if (j.getId() == idOrigen) origen = j;
            if (j.getId() == idDestino) destino = j;
        }
        if (origen == null || destino == null) {
            System.out.println("Jugador no encontrado.");
            return;
        }
        boolean pagado = juego.pagarRenta(origen, destino, monto);
        System.out.println(pagado ? "Renta pagada completamente." : "No se pudo cubrir el monto completo.");
        juego.imprimirEstado();
    }

    /** Método para probar RF22 - Hipotecar Propiedad.
     * Permite al jugador actual hipotecar una de sus propiedades.
     * Pide al usuario el ID de la propiedad a hipotecar y verifica si es válida.
     * Si la hipoteca es exitosa, muestra un mensaje de éxito y el estado del juego.
     */
    private static void demoRF22_HipotecarPropiedad(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
        if (jugador == null || jugador.propiedades.isEmpty()) {
            System.out.println("El jugador actual no tiene propiedades.");
            return;
        }
        System.out.print("ID de la propiedad a hipotecar: ");
        int idProp = leerEntero();
        Propiedad_AngelBenavides_RUT prop = null;
        for (var p : jugador.propiedades) {
            if (p.getId() == idProp) {
                prop = p;
                break;
            }
        }
        if (prop == null) {
            System.out.println("Propiedad no encontrada o no es del jugador actual.");
            return;
        }
        int recibido = prop.hipotecar();
        if (recibido > 0) {
            jugador.recibir(recibido);
            System.out.println("Propiedad hipotecada. Recibido: $" + recibido);
        } else {
            System.out.println("No se pudo hipotecar (ya está hipotecada).");
        }
        juego.imprimirEstado();
    }

    /** Método para probar RF23 - Extraer Carta de Suerte o Comunidad.
     * Permite al jugador actual extraer una carta de suerte o comunidad.
     * Pide al usuario el tipo de mazo y verifica si está vacío.
     * Si la extracción es exitosa, muestra la carta extraída.
     */
    private static void demoRF23_ExtraerCarta(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        System.out.print("¿De qué mazo extraer? (suerte/comunidad): ");
        String tipo = IN.nextLine().trim().toLowerCase();
        if (tipo.equals("suerte")) {
            if (juego.getMazoSuerte().size() == 0) {
                System.out.println("El mazo de Suerte está vacío.");
                return;
            }
            Carta_AngelBenavides_RUT carta = juego.getMazoSuerte().sacarCarta();
            System.out.println("Carta extraída: " + carta);
        } else if (tipo.equals("comunidad")) {
            if (juego.getMazoComunidad().size() == 0) {
                System.out.println("El mazo de Comunidad está vacío.");
                return;
            }
            Carta_AngelBenavides_RUT carta = juego.getMazoComunidad().sacarCarta();
            System.out.println("Carta extraída: " + carta);
        } else {
            System.out.println("Tipo de mazo inválido.");
        }
    }

    /** Método para probar RF24 - Verificar Bancarrota.
     * Verifica si el juego ha terminado por bancarrota global (todos sin plata menos uno).
     * Si no hay juego activo, muestra un mensaje de error.
     */
    private static void demoRF24_VerificarBancarrota(Juego_AngelBenavides_RUT juego) {
        if (juego == null) {
            System.out.println("No hay juego activo.");
            return;
        }
        boolean terminado = juego.verificarBancarrotaGlobal();
        System.out.println(terminado ? "El juego ha terminado por bancarrota global." : "Aún hay más de un jugador activo.");
    }


    public static void jugarPartida(Juego_AngelBenavides_RUT juego) {
        if (juego == null || juego.getListaJugadores().isEmpty()) {
            System.out.println("No hay juego o jugadores para iniciar la partida.");
            return;
        }

        while (!juego.verificarBancarrotaGlobal()) {
            Jugador_AngelBenavides_RUT jugador = juego.getJugadorActual();
            if (!jugador.isActivo()) {
                juego.turnoActual = (juego.turnoActual + 1) % juego.getListaJugadores().size();
                continue;
            }

            System.out.println("--- Turno de " + jugador.getNombre() + " ---");
            System.out.println("Posición actual: " + jugador.posActual);

            // Lanzar dados y mover
            int[] dados = juego.lanzarDados();
            int avance = juego.sumarDados(dados);
            System.out.println("Dados: " + Arrays.toString(dados) + ": Avanza " + avance + " posiciones.");
            juego.moverJugador(avance);

            // Ejecutar acción de la casilla
            Casilla_AngelBenavides_RUT casilla = juego.getTablero().getCasillas().get(jugador.posActual);
            casilla.accion(jugador, juego);

            // Acciones extra: construir casas/hotel si es dueño
            if (casilla instanceof Propiedad_AngelBenavides_RUT) {
                Propiedad_AngelBenavides_RUT prop = (Propiedad_AngelBenavides_RUT) casilla;
                if (prop.getDuenio() == jugador) {
                    System.out.print("¿Construir casa (c), hotel (h) o nada (n)? ");
                    String op = IN.nextLine().trim().toLowerCase();
                    if (op.equals("c")) {
                        boolean exito = prop.construirCasa(juego.getMaxCasas(), jugador, juego);
                        if (exito) {
                            System.out.println("Casa construida.");
                        } else {
                            System.out.println("No se pudo construir la casa.");
                        }
                    } else if (op.equals("h")) {
                        boolean exito = prop.construirHotel(juego.getMaxCasas(), jugador, juego);
                        if (exito) {
                            System.out.println("Hotel construido.");
                        } else {
                            System.out.println("No se pudo construir el hotel.");
                        }
                    }
                }
            }

            // Mostrar estado del juego
            juego.imprimirEstado();

            // Verificar bancarrota
            if (juego.verificarBancarrotaGlobal()) break;

            // Siguiente turno
            juego.turnoActual = (juego.turnoActual + 1) % juego.getListaJugadores().size();
        }

        System.out.println("¡El juego ha terminado!");
    }

    //método para leer enteros con scanner
    private static int leerEntero() {
        return Integer.parseInt(Main.IN.nextLine().trim());
    }
}
