package org.benavidesangel.lab3;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase que representa el tablero del juego.
 * Contiene una lista de casillas que pueden ser propiedades, casillas especiales (suerte, comunidad, cárcel, etc.)
 */
public class Tablero_AngelBenavides_RUT {

    List<Casilla_AngelBenavides_RUT> casillas;

    /**
     * Constructor del tablero.
     *
     * @param casillas Lista de casillas que componen el tablero.
     */
    public Tablero_AngelBenavides_RUT(List<Casilla_AngelBenavides_RUT> casillas) {
        this.casillas = casillas;
    }

    //Getter:
    /**
     * Retorna la lista de casillas del tablero.
     *
     * @return List<Casilla_AngelBenavides_RUT> Lista de casillas del tablero.
     */
    public List<Casilla_AngelBenavides_RUT> getCasillas() {
        return casillas;
    }

    /** Complementario a RF11:
     * Carga el tablero inicial con las casillas predefinidas.
     * Incluye propiedades, casillas de suerte, comunidad y cárcel.
     *
     * @param mazoSuerte Mazo de cartas de suerte
     * @param mazoComunidad Mazo de cartas de comunidad
     * @return Tablero_AngelBenavides_RUT con las casillas iniciales
     */
    public static Tablero_AngelBenavides_RUT cargarTableroInicial(MazoSuerte_AngelBenavides_RUT mazoSuerte, MazoComunidad_AngelBenavides_RUT mazoComunidad){

        List<Casilla_AngelBenavides_RUT> lista = new ArrayList<>();

        lista.add(new CasillaSalida_AngelBenavides_RUT(0, "Salida"));
        lista.add(new Propiedad_AngelBenavides_RUT(1, "Pomaire", 100, 100, null, 0, 0, false));
        lista.add(new Propiedad_AngelBenavides_RUT(2, "Coquimbo", 120, 120, null, 0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(3, "Valparaíso",150,150,null,0,0,false));
        lista.add(new CasillaSuerte_AngelBenavides_RUT(4,"Suerte 1", mazoSuerte));
        lista.add(new CasillaCarcel_AngelBenavides_RUT(5,"Colina 1"));
        lista.add(new Propiedad_AngelBenavides_RUT(6, "Punta Arenas", 50, 50,null, 0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(7, "Chiloé",100,100,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(8,"Puerto Montt", 130,130,null,0,0,false));
        lista.add(new CasillaComunidad_AngelBenavides_RUT(9, "Comunidad 1", mazoComunidad));
        lista.add(new Propiedad_AngelBenavides_RUT(10, "Arica", 20,20,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(11,"Iquique",150,150,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(12, "Chillan", 100,100,null,0,0,false));
        lista.add(new CasillaSuerte_AngelBenavides_RUT(13,"Suerte 2", mazoSuerte));
        lista.add(new Propiedad_AngelBenavides_RUT(14, "Temuco", 200, 200, null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(15, "Isla de Pascua", 250,250,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(16, "Yungay", 50,50,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(17,"La Serena", 120,120,null,0,0,false));
        lista.add(new CasillaComunidad_AngelBenavides_RUT(18,"Comunidad 2", mazoComunidad));
        lista.add(new Propiedad_AngelBenavides_RUT(19,"Pucon",300,300,null,0,0,false));
        lista.add(new Propiedad_AngelBenavides_RUT(20, "Los Angeles", 100,100,null,0,0,false));

        return new Tablero_AngelBenavides_RUT(lista);
    }

    /**
     * RF12 – Agrega una propiedad al final del tablero.
     *
     * @param propiedad objeto ya construido (sin dueño, sin casas, etc.)
     * @return índice (posición) donde quedó insertada
     */
    public int agregarPropiedad(Propiedad_AngelBenavides_RUT propiedad) {
        casillas.add(propiedad);
        return casillas.size() - 1;
    }
}
