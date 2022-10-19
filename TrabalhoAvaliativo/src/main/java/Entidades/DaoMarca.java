package Entidades;


import javax.swing.*;
import java.util.ArrayList;
import java.util.List;


public class DaoMarca implements ICrudMarca {
    private List<Marca> marcas = new ArrayList<>();
    private List<Camiseta> camisetas = new ArrayList<>();
    private List<Calca> calcas = new ArrayList<>();
    private List<Acessorio> acessorios = new ArrayList<>();


    @Override
    public boolean cadastrar(String descricao, String cnpj, Marca marca) {
        if (marcas.stream().filter(n -> n.getDescricao().equals(descricao)).count() != 0 || marcas.stream().filter(n -> n.getCnpj().equals(cnpj)).count() != 0) {
            JOptionPane.showMessageDialog(null, "Marca já existente.", "ERRO", 0);
            return false;
        }
        marcas.add(marca);
        return true;
    }

    @Override
    public Marca pesquisarTermo(String termo) {
        if (marcas.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Não há Marcas Registradas", "ERRO", 0);
            return null;
        }
        Marca marca = marcas.stream().filter(n -> n.getDescricao().equals(termo)).toList().get(0);
        return marca;
    }

    @Override
    public List<String> exibirDescricaoMarcas() {
        List<String> descricaoMarcas = new ArrayList<>();
        if (marcas.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Não há Marcas Registradas", "ERRO", 0);
            return null;
        }
        for (Marca a : marcas) {
            int i = 0;
            descricaoMarcas.add(i + " - " + a.getDescricao());
            i++;
        }
        return descricaoMarcas;
    }

    @Override
    public Marca exibirMarca(int index) {
        return marcas.get(index);
    }

    @Override
    public boolean alterar(int index, String descricao, String cnpj, Marca marca) {
        if (marcas.stream().filter(n -> n.getDescricao().equals(descricao)).count() != 0 || marcas.stream().filter(n -> n.getCnpj().equals(cnpj)).count() != 0) {
            JOptionPane.showMessageDialog(null, "Marca já existente.", "ERRO", 0);
            return false;
        }
        marcas.set(index, marca);
        return true;
    }

    @Override
    public boolean removerMarca(int index) {
        /*if (marcas.get(index).getProdutos().isEmpty()) {
            JOptionPane.showMessageDialog(null, "Há produtos Cadastrados, Não é permitido Apagar esta Marca.", "ERRO", 0);
            return false;
        }*/
        int confirmar = -1;
        confirmar = JOptionPane.showConfirmDialog(null, "Realmente deseja excluir ?: ",
                "Excluir Marca!", JOptionPane.YES_NO_OPTION);
        if (confirmar == 1 || confirmar == -1) {
            return false;
        }
        marcas.remove(index);
        return true;
    }

    @Override
    public void removerProduto(String descricao) {

    }
}
