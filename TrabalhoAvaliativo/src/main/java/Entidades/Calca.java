package Entidades;

import java.math.BigDecimal;

public class Calca extends Produto implements Roupa {

    private String cor;
    private String tamanho;

    @Override
    public String getCor() {
        return cor;
    }

    @Override
    public String getTamanho() {
        return tamanho;
    }

    public Calca(String descricao, BigDecimal preco, Marca marca, String cor, String tamanho) {
        super(descricao, preco, marca);
        this.cor = cor;
        this.tamanho = tamanho;
    }
}
