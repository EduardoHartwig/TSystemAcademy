package Entidades;

import java.security.PublicKey;
import java.util.List;

public interface ICrudProduto {

    public boolean cadastrar(Produto produto, Marca marca, String descricao);

    public Camiseta pesquisarTermoCamiseta(String termo);

    public Calca pesquisarTermoCalca(String termo);

    public Acessorio pesquisarTermoAcessorio(String termo);

    public List<String> exibirDescricaoProdutos(String tipoProduto, Camiseta camiseta, Calca calca, Acessorio acessorio);

    public Camiseta exibirCamiseta(int index);

    public Calca exibirCalca(int index);

    public Acessorio exibirAcessorio(int index);

    public boolean alterarProduto(String tipoProduto, int index, String descricao, Marca marca, Camiseta camiseta, Calca calca, Acessorio acessorio);

    public boolean removerMarca(String tipoProduto, int index, Camiseta camiseta, Calca calca, Acessorio acessorio);

}
