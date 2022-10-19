package Entidades;

import java.util.List;

public interface ICrudMarca {
    public boolean cadastrar(String descricao, String cnpj, Marca marca);

    public Marca pesquisarTermo(String termo);

    public List<String> exibirDescricaoMarcas();

    public Marca exibirMarca(int index);
    public boolean alterar(int index, String descricao, String cnpj, Marca marca);

    public boolean removerMarca(int index);

    public void removerProduto(String descricao);

}
