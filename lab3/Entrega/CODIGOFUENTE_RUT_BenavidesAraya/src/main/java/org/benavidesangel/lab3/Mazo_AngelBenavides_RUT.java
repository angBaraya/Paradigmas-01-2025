package org.benavidesangel.lab3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * Clase abstracta que representa un mazo de cartas en el juego.
 * Contiene métodos para barajar, sacar y devolver cartas, así como una lista de cartas y cartas usadas.
 */
public abstract class Mazo_AngelBenavides_RUT {

    /**
     * Clase abstracta que representa un mazo de cartas.
     * Contiene una lista de cartas y métodos para barajar, sacar y devolver cartas.
     */
    public List <Carta_AngelBenavides_RUT> cartas = new ArrayList<>();
    public List <Carta_AngelBenavides_RUT> cartasUsadas = new ArrayList<>();
    public Random rng = new Random();

    /** metodo barajar
     * Baraja las cartas del mazo utilizando un generador de números aleatorios.
     * Utiliza el método shuffle para mezclar las cartas.
     */
    public void barajar(){
        Collections.shuffle(cartas, rng);
    }

    /** RF23: sacarCarta
     * Saca una carta del mazo. Si el mazo está vacío, se rellenan las cartas usadas y se barajan.
     * @return Carta_AngelBenavides_RUT la carta sacada del mazo.
     */
    public Carta_AngelBenavides_RUT sacarCarta(){
        if (cartas.isEmpty()){
            cartas.addAll(cartasUsadas);
            cartasUsadas.clear();
            barajar();
        }

        Carta_AngelBenavides_RUT carta = cartas.remove(0);
        cartasUsadas.add(carta);
        return carta;
    }

    /** devolverCarta
     * Devuelve una carta al mazo de cartas usadas.
     * @param carta Carta_AngelBenavides_RUT la carta a devolver al mazo.
     */
    public void devolverCarta(Carta_AngelBenavides_RUT carta){
        cartasUsadas.add(carta);
    }

    /**
     * Método abstracto que inicializa las cartas del mazo.
     * Debe ser implementado por las subclases para definir las cartas específicas.
     */
    protected abstract void inicializarCartas();

    public int size() {
        return cartas.size();
    }

}
