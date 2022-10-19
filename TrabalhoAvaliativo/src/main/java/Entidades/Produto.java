package Entidades;

import java.math.BigDecimal;

public abstract class Produto {
    String descricao;
    BigDecimal preco;
    Marca marca;

    public Produto() {
    }

    public Produto(String descricao, BigDecimal preco, Marca marca) {
        this.descricao = descricao;
        this.preco = preco;
        this.marca = marca;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public Marca getMarca() {
        return marca;
    }
}
