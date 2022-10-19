package Entidades;


import java.util.ArrayList;
import java.util.List;

public class Marca {
    private String descricao;
    private String cnpj;
    private String dataCadastro;

    public Marca() {
    }


    public Marca(String descricao, String cnpj, String dataCadastro) {
        this.descricao = descricao;
        this.cnpj = cnpj;
        this.dataCadastro = dataCadastro;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

}
