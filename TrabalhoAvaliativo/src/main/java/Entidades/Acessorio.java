package Entidades;

import java.math.BigDecimal;

public class Acessorio extends Produto {
    private String tipo;
    private String ligaMetalica;
    private String genero;


    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getLigaMetalica() {
        return ligaMetalica;
    }

    public void setLigaMetalica(String ligaMetalica) {
        this.ligaMetalica = ligaMetalica;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Acessorio(String descricao, BigDecimal preco, Marca marca, String tipo, String ligaMetalica, String genero) {
        super(descricao, preco, marca);
        this.tipo = tipo;
        this.ligaMetalica = ligaMetalica;
        this.genero = genero;
    }
}
