package org.benavidesangel.lab3;

/**
 * Clase que representa un mazo de cartas de comunidad en el juego.
 * Hereda de Mazo_AngelBenavides_RUT.
 */
public class MazoSuerte_AngelBenavides_RUT extends Mazo_AngelBenavides_RUT {

    public MazoSuerte_AngelBenavides_RUT() {
        inicializarCartas();
        barajar();
    }

    /**
     * Método que inicializa las cartas de suerte.
     * Cada carta tiene un efecto específico que se aplica al jugador y al juego.
     */
    @Override
    public void inicializarCartas(){

        cartas.add(new CartaSuerte_AngelBenavides_RUT(0,"recibir", "Recibes $50 del banco"){
            //recibe 50 del banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.recibir(50);
                juego.agregarDinero(-50);
            }
        });
        cartas.add(new CartaSuerte_AngelBenavides_RUT(1,"recibir", "Recibes $100 del banco"){
            //recibe 100 del banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.recibir(100);
                juego.agregarDinero(-100);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(2,"recibir", "Recibes $150 del banco"){
            //recibe 150 del banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.recibir(150);
                juego.agregarDinero(-150);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(3,"recibir", "Recibes $200 del banco"){
            //recibe 200 del banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.recibir(200);
                juego.agregarDinero(-200);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(4,"pagar", "Pagas $50 al banco"){
            //paga 50 al banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.pagar(50);
                juego.agregarDinero(-50);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(5,"pagar", "Pagas $100 al banco"){
            //paga 100 al banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.pagar(100);
                juego.agregarDinero(-100);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(6,"pagar", "Pagas $150 al banco"){
            //paga 150 al banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.pagar(150);
                juego.agregarDinero(-150);
            }
        });

        cartas.add(new CartaSuerte_AngelBenavides_RUT(7,"pagar", "Pagas $200 al banco"){
            //paga 200 al banco
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                jugador.pagar(200);
                juego.agregarDinero(-200);
            }
        });

        // avanza 3
        cartas.add(new CartaSuerte_AngelBenavides_RUT(8,"mover", "Avanzas 3 posiciones"){
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                juego.moverJugador(3);
                System.out.println(jugador.getNombre() + " avanza 3 posiciones.");
            }
        });

        // retrocede 2
        cartas.add(new CartaSuerte_AngelBenavides_RUT(9,"mover", "Retrocedes 2 posiciones"){
            @Override
            public void aplicarEfecto(Jugador_AngelBenavides_RUT jugador, Juego_AngelBenavides_RUT juego){
                juego.moverJugador(-2);
                System.out.println(jugador.getNombre() + " retrocede 2 posiciones.");
            }
        });


    }
}
