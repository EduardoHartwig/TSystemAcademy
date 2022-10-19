package Entidades;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import Enum.Opcao;
import Enum.OpcaoB;

import javax.swing.*;


public class Main {


    public static void main(String[] args) {
        Menu();

    }


    public static void Menu() {
        DaoMarca dao = new DaoMarca();
        DaoProduto daoProduto = new DaoProduto();
        dao.cadastrar("teste", "12345678901234", new Marca("teste", "12345678901234", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))));
        daoProduto.cadastrar(new Camiseta("longline", new BigDecimal(50), new Marca("teste", "12345678901234", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))),"Azul", "GG"), new Marca("teste", "12345678901234", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))),"longline");
        int entrada = -2;
        int crud = -2;
        int index;
        do {

            Object[] options = Opcao.values();
            entrada = JOptionPane.showOptionDialog(null, "Escolha qual opção deseja visualizar.", "Menu",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE,
                    null, options, options[0]);


            switch (entrada) {

                case 0:
                    do {
                        Object[] optionsB = OpcaoB.values();
                        crud = JOptionPane.showOptionDialog(null, "Escolha qual opção deseja visualizar.", "Crud",
                                JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE,
                                null, optionsB, optionsB[0]);

                        //crud Marca
                        switch (crud) {
                            case -1:
                                entrada = -1;
                                break;
                            case 0:
                                //Cadastrar Marcas
                                String entradaDescricao = JOptionPane.showInputDialog("Informe a Descrição:" +
                                        "\n*Descrição Necessita ter no Minímo 4 Caracteres." +
                                        "\n*Não podendo usar caracteres especiais.");
                                if (entradaDescricao == null) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    continue;
                                }

                                if (!validarDescricao(entradaDescricao)) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    break;
                                } else {
                                    String entradaCnpj = JOptionPane.showInputDialog("Informe o Cnpj: " +
                                            "\n*Utilizando 14 Digitos." +
                                            "\n*Não podendo usar caracteres especiais.");

                                    if (entradaCnpj == null) {
                                        JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                        continue;
                                    }

                                    if (!validarCnpj(entradaCnpj)) {
                                        JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                        break;
                                    } else {
                                        if (dao.cadastrar(entradaDescricao, entradaCnpj, new Marca(entradaDescricao, entradaCnpj, LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))))) {
                                            JOptionPane.showMessageDialog(null, "Marca cadastrada com sucesso.", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
                                        }else {
                                            JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                        }
                                    }
                                }
                                break;
                            case 1:
                                //Exibir Marcas
                                if (dao.exibirDescricaoMarcas() == null) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    continue;
                                } else {

                                    index = selecionarMarca(dao.exibirDescricaoMarcas().toArray());

                                    JOptionPane.showMessageDialog(null, "Descrição: " + dao.exibirMarca(index).getDescricao() +
                                            "\nCnpj: " + dao.exibirMarca(index).getCnpj() +
                                            "\nData de Cadastro: " + dao.exibirMarca(index).getDataCadastro(), "Marca", JOptionPane.INFORMATION_MESSAGE);
                                }
                                break;
                            case 2:
                                //Pesquisa Marca
                                System.out.println("pesquisar");

                                String termo = JOptionPane.showInputDialog("Informe a Descricão da Marca: " +
                                        "\n*Descrição Necessita ter no Minímo 4 Caracteres." +
                                        "\n*Não podendo usar caracteres especiais.");
                                if (termo == null) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    continue;
                                }
                                if (!validarDescricao(termo)) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    break;
                                } else {
                                    JOptionPane.showMessageDialog(null, "Descrição: " + dao.pesquisarTermo(termo).getDescricao() +
                                            "\nCnpj: " + dao.pesquisarTermo(termo).getCnpj() +
                                            "\nData de Cadastro: " + dao.pesquisarTermo(termo).getDataCadastro(), "Marca", JOptionPane.INFORMATION_MESSAGE);
                                }
                                break;
                            case 3:
                                //Alterar Marca

                                if (dao.exibirDescricaoMarcas() == null) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    continue;
                                } else {
                                    index = selecionarMarca(dao.exibirDescricaoMarcas().toArray());


                                    entradaDescricao = JOptionPane.showInputDialog("Informe a Descrição:" +
                                            "\n*Descrição Necessita ter no Minímo 4 Caracteres." +
                                            "\n*Não podendo usar caracteres especiais.");
                                    if (entradaDescricao == null) {
                                        JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                        continue;
                                    }

                                    if (!validarDescricao(entradaDescricao)) {
                                        JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                        break;
                                    } else {
                                        String entradaCnpj = JOptionPane.showInputDialog("Informe o Cnpj: " +
                                                "\n*Utilizando 14 Digitos." +
                                                "\n*Não podendo usar caracteres especiais.");

                                        if (entradaCnpj == null) {
                                            JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                            continue;
                                        }

                                        if (!validarCnpj(entradaCnpj)) {
                                            JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                            break;
                                        } else {
                                            if (dao.alterar(index, entradaDescricao, entradaCnpj, new Marca(entradaDescricao, entradaCnpj, LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))))) {
                                                JOptionPane.showMessageDialog(null, "Marca alterada com sucesso.", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
                                            }
                                        }
                                    }
                                }
                                break;
                            case 4:
                                //Excluir Marca
                                if (dao.exibirDescricaoMarcas() == null) {
                                    JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    continue;
                                } else {
                                    index = selecionarMarca(dao.exibirDescricaoMarcas().toArray());
                                    if(dao.removerMarca(index)){
                                        JOptionPane.showMessageDialog(null, "Marca Excluida com sucesso.", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
                                    }else{
                                        JOptionPane.showMessageDialog(null, "Operação Cancelada.", "Atenção", JOptionPane.WARNING_MESSAGE);
                                    }
                                }

                                break;
                            case 5:
                                //Retornar
                                crud = -1;
                                break;
                        }
                    } while (crud != -1);
                    break;

                    //Produto
                case 1:
                    do {
                        Object[] optionsB = OpcaoB.values();
                        crud = JOptionPane.showOptionDialog(null, "Escolha qual opção deseja visualizar.", "Crud",
                                JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE,
                                null, optionsB, optionsB[0]);

                        switch (crud) {
                            case 0:
                                //Cadastar Produto


                                break;
                            case 1:
                                //Exibir Produto


                                break;
                            case 2:
                                //Pesquisar Produto


                                break;
                            case 3:
                                //Alterar Produto


                                break;
                            case 4:
                                //Excluir Produto


                                break;
                            case 5:
                                //Retornar
                                crud = -1;
                                break;
                        }
                    } while (crud != -1);
                    break;
            }
        } while (entrada != -1);
    }

    public static boolean validarDescricao(String descricao) {
        if (descricao.equals("")) {
            JOptionPane.showMessageDialog(null, "Nenhuma Descrição foi informada", "ERRO", 0);
            return false;
        } else if (descricao.length() < 3 || verificarSeContemCaracteresEspeciais(descricao)) {
            JOptionPane.showMessageDialog(null, "Descrição Necessita ter no Minímo 4 Caracteres" +
                    "\nNão podendo usar caracteres especiais.", "ERRO", 0);
            return false;
        }
        return true;
    }

    public static boolean verificarSeContemCaracteresEspeciais(String descricao) {
        Pattern pattern = Pattern.compile("\\p{Punct}");
        Matcher matcher = pattern.matcher(descricao);
        while (matcher.find()) {
            return true;
        }
        return false;
    }

    public static boolean validarCnpj(String cnpj) {
        if (cnpj.equals("")) {
            JOptionPane.showMessageDialog(null, "Nenhum CNPJ foi informado", "ERRO", 0);
            return false;
        } else if (!isCnpj(cnpj)) {
            JOptionPane.showMessageDialog(null, "CNPJ Inválido" +
                    "\n Quantidade de Caracteres: 14" +
                    "\nNão podendo usar caracteres especiais.", "ERRO", 0);
            return false;
        }
        return true;
    }

    public static boolean isCnpj(String cnpj) {
        Pattern pattern = Pattern.compile("\\D");
        Matcher matcher = pattern.matcher(cnpj);
        if (cnpj.length() != 14) {
            return false;
        } else {
            while (matcher.find()) {
                return false;
            }
        }
        return true;
    }

    public static int selecionarMarca(Object[] lista) {

        Object marcaSelecionada = JOptionPane.showInputDialog(null,
                "Escolha uma Marca", "Opçao",
                JOptionPane.INFORMATION_MESSAGE, null,
                lista, lista[0]);
        int index = Character.getNumericValue(marcaSelecionada.toString().charAt(0));
        return index;
    }
}
