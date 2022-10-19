package Entidades;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

public class DaoProduto implements ICrudProduto {
    private List<Camiseta> camisetas = new ArrayList<>();
    private List<Calca> calcas = new ArrayList<>();
    private List<Acessorio> acessorios = new ArrayList<>();
    private List<Marca> marcas = new ArrayList<>();

    @Override
    public boolean cadastrar(Produto produto, Marca marca, String descricao) {
        if(produto instanceof Camiseta){
            if(camisetas.stream().filter(n -> n.getMarca().getDescricao().equals(marca.getDescricao())).count() != 0 && camisetas.stream().filter(n -> n.getDescricao().equals(descricao)).count() != 0){
                JOptionPane.showMessageDialog(null, "Produto já existente.", "ERRO", 0);
                return false;
            }
            camisetas.add((Camiseta) produto);
            return true;

        } else if (produto instanceof Calca) {
            if(calcas.stream().filter(n -> n.getMarca().getDescricao().equals(marca.getDescricao())).count() != 0 && calcas.stream().filter(n -> n.getDescricao().equals(descricao)).count() != 0){
                JOptionPane.showMessageDialog(null, "Produto já existente.", "ERRO", 0);
                return false;
            }
            calcas.add((Calca) produto);
            return true;

        } else if (produto instanceof Acessorio) {
            if(acessorios.stream().filter(n -> n.getMarca().getDescricao().equals(marca.getDescricao())).count() != 0 && acessorios.stream().filter(n -> n.getDescricao().equals(descricao)).count() != 0){
                JOptionPane.showMessageDialog(null, "Produto já existente.", "ERRO", 0);
                return false;
            }
            acessorios.add((Acessorio) produto);
            return true;

        }
        return false;
    }

    @Override
    public Camiseta pesquisarTermoCamiseta(String termo) {
        return null;
    }

    @Override
    public Calca pesquisarTermoCalca(String termo) {
        return null;
    }

    @Override
    public Acessorio pesquisarTermoAcessorio(String termo) {
        return null;
    }

    @Override
    public List<String> exibirDescricaoProdutos(String tipoProduto, Camiseta camiseta, Calca calca, Acessorio acessorio) {
        return null;
    }

    @Override
    public Camiseta exibirCamiseta(int index) {
        return null;
    }

    @Override
    public Calca exibirCalca(int index) {
        return null;
    }

    @Override
    public Acessorio exibirAcessorio(int index) {
        return null;
    }

    @Override
    public boolean alterarProduto(String tipoProduto, int index, String descricao, Marca marca, Camiseta camiseta, Calca calca, Acessorio acessorio) {
        return false;
    }

    @Override
    public boolean removerMarca(String tipoProduto, int index, Camiseta camiseta, Calca calca, Acessorio acessorio) {
        return false;
    }
}
