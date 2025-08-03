package org.benavidesangel.lab3;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/** * Clase que representa el juego.
 * Contiene la lógica del juego, los jugadores, el tablero y los mazos de cartas.
 * Permite agregar jugadores, lanzar dados, mover jugadores y realizar pagos.
 */
public class Juego_AngelBenavides_RUT {
    List<Jugador_AngelBenavides_RUT> listaJugadores = new ArrayList<>();
    Tablero_AngelBenavides_RUT tablero;
    MazoSuerte_AngelBenavides_RUT mazoSuerte;
    MazoComunidad_AngelBenavides_RUT mazoComunidad;
    int dineroBanco;
    int numeroDados;
    int turnoActual;
    int tasaImpuesto;
    int maxCasas;
    int maxHoteles;

    private Random rng = new Random();


    /** Constructor por defecto (RF9)
     * Inicializa el juego con valores por defecto:
     * - Dinero del banco: 20000
     * - Número de dados: 2
     * - Tasa de impuesto: 10%
     * - Máximo de casas por propiedad: 4
     * - Máximo de hoteles por propiedad: 1
     */
    public Juego_AngelBenavides_RUT() {
        cargarDatos(20000, 2, 10, 4, 1);       // valores por defecto
    }

    /** Método para cargar los datos iniciales del juego (RF10)
     * Carga los datos iniciales del juego con valores por defecto.
     * Este método se puede llamar para reiniciar el juego con los mismos valores.
     */
    public void cargarDatosIniciales() {
        cargarDatos(20000, 2, 10, 4, 1); // valores por defecto
    }

    /**
     * Constructor de juego con parámetros (RF10.b)
     *
     * @param dineroBanco   Dinero inicial del banco
     * @param numeroDados   Número de dados (1-4)
     * @param tasaImpuesto  Tasa de impuesto en porcentaje
     * @param maxCasas      Máximo de casas por propiedad
     * @param maxHoteles    Máximo de hoteles por propiedad
     */
    public Juego_AngelBenavides_RUT(int dineroBanco,
                                          int numeroDados,
                                          int tasaImpuesto,
                                          int maxCasas,
                                          int maxHoteles) {
        cargarDatos(dineroBanco, numeroDados, tasaImpuesto, maxCasas, maxHoteles);
    }

    /**
     * Método para cargar los datos del juego (RF11)
     * Inicializa el tablero, mazos y otros atributos del juego.
     *
     * @param dineroBanco   Dinero inicial del banco
     * @param numeroDados   Número de dados (1-4)
     * @param tasaImpuesto  Tasa de impuesto en porcentaje
     * @param maxCasas      Máximo de casas por propiedad
     * @param maxHoteles    Máximo de hoteles por propiedad
     */
    private void cargarDatos(int dineroBanco, int numeroDados, int tasaImpuesto, int maxCasas, int maxHoteles) {

        this.dineroBanco   = dineroBanco;
        this.numeroDados   = Math.max(1, Math.min(4, numeroDados)); // 1-4
        this.turnoActual   = 0;
        this.tasaImpuesto  = tasaImpuesto;
        this.maxCasas      = maxCasas;
        this.maxHoteles    = maxHoteles;
        mazoSuerte    = new MazoSuerte_AngelBenavides_RUT();
        mazoComunidad = new MazoComunidad_AngelBenavides_RUT();
        tablero = Tablero_AngelBenavides_RUT.cargarTableroInicial(mazoSuerte, mazoComunidad);

        System.out.println("Tablero inicial cargado (" +
                tablero.getCasillas().size() + " casillas, " +
                mazoSuerte.size() + " cartas Suerte, " +
                mazoComunidad.size() + " cartas Comunidad).");
    }

    //Getters

    /** Retorna la lista de jugadores del juego
     * @return List<Jugador_AngelBenavides_RUT> Lista de jugadores
     */
    public List<Jugador_AngelBenavides_RUT> getListaJugadores() {
        return listaJugadores;
    }

    /** Retorna el tablero del juego
     * @return Tablero_AngelBenavides_RUT Tablero del juego
     */
    public Tablero_AngelBenavides_RUT getTablero() {
        return tablero;
    }

    /** Retorna el dinero del banco
     * @return int Dinero del banco
     */
    public int getDineroBanco() {
        return dineroBanco;
    }

    /** Retorna el número de dados utilizados en el juego
     * @return int Número de dados
     */
    public int getNumeroDados() {
        return numeroDados;
    }

    /** Retorna el turno actual del juego
     * @return int Turno actual
     */
    public int getTasaImpuesto() {
        return tasaImpuesto;
    }

    /** Retorna la tasa de impuesto del juego
     * @return int Tasa de impuesto
     */
    public int getMaxCasas() {
        return maxCasas;
    }

    /** Retorna el máximo de hoteles permitidos en el juego
     * @return int Máximo de hoteles
     */
    public int getMaxHoteles() {
        return maxHoteles;
    }

    /** Retorna el mazo de cartas de suerte del juego
     * @return MazoSuerte_AngelBenavides_RUT Mazo de cartas de suerte
     */
    public MazoComunidad_AngelBenavides_RUT getMazoComunidad() {
        return mazoComunidad;
    }

    /** Retorna el mazo de cartas de suerte del juego
     * @return MazoSuerte_AngelBenavides_RUT Mazo de cartas de suerte
     */
    public MazoSuerte_AngelBenavides_RUT getMazoSuerte() {
        return mazoSuerte;
    }

    //Setters

    /** Modifica el dinero del banco
     * @param dineroBanco Nuevo dinero del banco
     */
    public void setDineroBanco(int dineroBanco) {
        this.dineroBanco = dineroBanco;
    }

    /** Modifica el dinero del banco
     * Agrega una cantidad al dinero del banco.
     * @param cantidad Cantidad a agregar al banco
     **/
    public void agregarDinero(int cantidad) {
        int nuevoDinero = getDineroBanco() + cantidad;
        setDineroBanco(nuevoDinero);
    }

    /** RF 13: Agregar jugador
     * Agrega un jugador al juego si el banco tiene suficiente dinero.
     * @param jugador Jugador a agregar
     */
    public void agregarJugador(Jugador_AngelBenavides_RUT jugador) {
        int dineroInicial = 1500;

        if (dineroBanco >= dineroInicial) {
            jugador.recibir(dineroInicial);
            dineroBanco -= dineroInicial;
            listaJugadores.add(jugador);
        }
        else{
            System.out.println("El banco no tiene dinero para otro jugador.");
        }
    }

    /** RF 14: Obtener jugador actual
     * Retorna el jugador que tiene el turno actual.
     * Si el jugador no está activo (bancarrota), busca al siguiente jugador activo.
     * @return Jugador_AngelBenavides_RUT El jugador actual
     */
    public Jugador_AngelBenavides_RUT getJugadorActual() {
        int totalJugadores = listaJugadores.size();
        if (totalJugadores == 0) return null;

        //buscamos desde el indice en el cual quedo el turno
        int indiceCandidato = turnoActual % totalJugadores;

        for (int i = 0; i < totalJugadores; i++) {
            Jugador_AngelBenavides_RUT candidato = listaJugadores.get(indiceCandidato);

            //si esta activo lo retornamos directo
            if (candidato.isActivo()) {
                turnoActual = indiceCandidato;
                return candidato;
            }
            //si no esta activo lo seguimos buscando
            indiceCandidato = (indiceCandidato + 1) % totalJugadores;
        }
        //por si acaso, no deberíamos llegar hasta aca
        return null;
    }


    /** RF 15: Lanzar dados
     * Lanza dos dados y retorna sus valores.
     * @return int[] Arreglo con los valores de los dos dados
     */
    public int[] lanzarDados(){
        return rng.ints(2, 1,7).toArray();
    }

    /** Complemetario a RF 15 Suma los valores de dos dados lanzados.
     * @param dados
     * @return int Suma de los valores de los dos dados
     */
    public int sumarDados(int[] dados){
        return dados[0] + dados[1];
    }

    /** RF21: PagarRenta, realiza el pago entre 2 jugadores
     * @param origen: Jugador que paga la renta
     * @param destino: Jugador que recibe la renta
     * @param monto: Monto a pagar
     * @return boolean: Retorna true si el pago se cubre completamente, false si no
     */
    public boolean pagarRenta(Jugador_AngelBenavides_RUT origen, Jugador_AngelBenavides_RUT destino, int monto){
        if (monto <= 0) return true; //monto invalido, para no cortar el flujo, retorna true

        boolean cubierto = origen.pagar(monto);
        destino.recibir(monto); //destino siempre recibe aunque sea parcial
        return cubierto;
    }

    /** RF 24: Verificar si solo un jugador no está en bancarrota
     * @return boolean Retorna true si el jugador está en bancarrota, false si no
     */
    public boolean verificarBancarrotaGlobal(){
        int activos = 0;
        for (int i = 0; i < listaJugadores.size(); i++){
            Jugador_AngelBenavides_RUT jugador = listaJugadores.get(i);
            if (jugador.isActivo()){
                activos++;
            }
        }
        if (activos <= 1){
            System.out.println("JUEGO TERMINADO, TODOS EN BANCARROTA, EXCEPTO 1");
            return true;
        }
        return false;
    }

    /**
     * Mueve al jugador actual una cantidad de posiciones en el tablero.
     * Si el jugador no está activo, no se mueve.
     * @param posiciones Cantidad de posiciones a mover
     */
    public void moverJugador(int posiciones) {
        Jugador_AngelBenavides_RUT actual = getJugadorActual();
        if (actual != null) {
            actual.mover(posiciones, tablero.getCasillas().size());
        }
    }

    /** Imprime el estado actual del juego (RF 12)
     * Muestra información del banco, jugadores, tablero y casillas.
     * Incluye el jugador actual y sus propiedades.
     */
    public void imprimirEstado() {

        StringBuilder sb = new StringBuilder();
        sb.append("\n===== ESTADO ACTUAL DEL JUEGO =====\n")
                .append("Banco: $").append(getDineroBanco())
                .append(" | Dados: ").append(getNumeroDados())
                .append(" | Impuesto: ").append(getTasaImpuesto()).append("%\n")
                .append("Máx. casas: ").append(getMaxCasas())
                .append(" | Máx. hoteles: ").append(getMaxHoteles()).append("\n\n");

        //jugadores
        Jugador_AngelBenavides_RUT jugadorActual = getJugadorActual();
        sb.append(">> Jugadores (").append(getListaJugadores().size()).append(")\n");
        for (Jugador_AngelBenavides_RUT j : getListaJugadores()) {
            sb.append(" • id=").append(j.getId())
                    .append("  nombre=").append(j.getNombre())
                    .append("  $").append(j.getDinero())
                    .append("  pos=").append(j.posActual)
                    .append("  activo=").append(j.isActivo());
            if (jugadorActual != null && j.getId() == jugadorActual.getId()) {
                sb.append("  <-- JUGADOR ACTUAL");
            }
            sb.append('\n');
        }

        //tablero y casillas
        sb.append("\n>> Tablero (").append(getTablero().getCasillas().size())
                .append(" casillas)\n");

        for (Casilla_AngelBenavides_RUT c : getTablero().getCasillas()) {

            sb.append(String.format(" [%02d] %-15s", c.getId(), c.getNombre()));

            if (c instanceof Propiedad_AngelBenavides_RUT) {
                Propiedad_AngelBenavides_RUT p = (Propiedad_AngelBenavides_RUT) c;
                String dueno = (p.getDuenio() == null) ? "sin dueño"
                        : p.getDuenio().getNombre();
                sb.append(" Precio:$").append(p.getPrecio())
                        .append(" | Dueño: ").append(dueno);

                if (p.isHotel()) {
                    sb.append(" | HOTEL");
                } else if (p.getCasas() > 0) {
                    sb.append(" | Casas: ").append(p.getCasas());
                }
            } else if (c instanceof CasillaSuerte_AngelBenavides_RUT) {
                sb.append(" [SUERTE]");
            } else if (c instanceof CasillaComunidad_AngelBenavides_RUT) {
                sb.append(" [COMUNIDAD]");
            } else if (c instanceof CasillaSalida_AngelBenavides_RUT) {
                sb.append(" [SALIDA]");
            } else if (c instanceof CasillaCarcel_AngelBenavides_RUT) {
                sb.append(" [CÁRCEL]");
            }
            sb.append('\n');
        }
        sb.append("====================================\n");

        //imprime el resultado
        System.out.println(sb.toString());
    }



    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("=== Estado del Juego ===\n");
        sb.append("Banco: ").append(dineroBanco).append("\n");
        sb.append("Tasa de impuesto: ").append(tasaImpuesto).append("%\n");
        sb.append("Máx. casas: ").append(maxCasas).append(", Máx. hoteles: ").append(maxHoteles).append("\n");
        sb.append("Jugadores (").append(listaJugadores.size()).append("):\n");
        for (Jugador_AngelBenavides_RUT j : listaJugadores) {
            sb.append("  ").append(j).append("\n");
        }
        sb.append("Tablero: ").append(tablero != null ? tablero.getCasillas().size() : 0).append(" casillas\n");
        if (tablero != null) {
            for (var casilla : tablero.getCasillas()) {
                sb.append("  ").append(casilla).append("\n");
            }
        }
        sb.append("Mazo Suerte: ").append(mazoSuerte != null ? mazoSuerte.size() : 0).append(" cartas\n");
        sb.append("Mazo Comunidad: ").append(mazoComunidad != null ? mazoComunidad.size() : 0).append(" cartas\n");
        return sb.toString();
    }




}
