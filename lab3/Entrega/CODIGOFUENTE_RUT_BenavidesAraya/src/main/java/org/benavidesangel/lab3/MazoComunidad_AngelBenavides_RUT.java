package org.benavidesangel.lab3;

/**
 * Clase que representa un mazo de cartas de comunidad en el juego.
 * Hereda de Mazo_AngelBenavides_RUT.
 */
public class MazoComunidad_AngelBenavides_RUT extends Mazo_AngelBenavides_RUT {

    public MazoComunidad_AngelBenavides_RUT() {
        inicializarCartas();
        barajar();
    }

    /**
     * Inicializa las cartas del mazo de comunidad.
     * Cada carta tiene un efecto específico que se aplica al jugador y al juego.
     */
    @Override
    protected void inicializarCartas() {

        // devvuelve impuestos y recibe 100 del banco
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                0, "recibir", "Recibes $100 de la Tesorería por devolución de impuestos") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.recibir(100);
                g.agregarDinero(-100);
            }
        });

        //paga 50 al banco por gastos médicos
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                1, "pagar", "Pagas $50 al banco por gastos médicos") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.pagar(50);
                g.agregarDinero(50);
            }
        });

        // avanzar a la salida y le pagan 200
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                2, "mover","Avanza a Salida, Cobra $200") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.setPosActual(0);
                j.recibir(200);
                g.agregarDinero(-200);
            }
        });

        // Get out of jail free card
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                3, "carcel", "Recibes una carta de 'Sal de la cárcel gratis'") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.aumentarTotalCartasSalirCarcel(1);
            }
        });

        // 2 Get out of jail free card
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                4, "carcel", "Recibes dos cartas de 'Sal de la cárcel gratis'") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.aumentarTotalCartasSalirCarcel(2);
            }
        });

        // paga 50 por reparación de propiedades
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                5, "pagar", "Pagas $50 por reparación de propiedades") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT g) {
                j.pagar(50);
                g.agregarDinero(50);
            }
        });

        //recibe 100 por un premio
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                6, "recibir", "Recibes $100 por un premio") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT g) {
                j.recibir(25);
                g.agregarDinero(-25);
            }
        });

        // paga 200 de multa
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                7, "pagar", "Pagas $200 de multa") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT g) {
                j.pagar(200);
                g.agregarDinero(200);
            }
        });

        //va a la cárcel
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                8, "mover","Vas a la carcel") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.setPosActual(5); //la carcel es posición 5 siempre
            }
        });

        //va a pucon, puros cuicos
        cartas.add(new CartaComunidad_AngelBenavides_RUT(
                9, "mover","Vas a pucón de vacaciones") {
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT j,
                                      Juego_AngelBenavides_RUT   g) {
                j.setPosActual(19); //pucon es posición 19 al inicar tablero.
            }
        });
    }
}
