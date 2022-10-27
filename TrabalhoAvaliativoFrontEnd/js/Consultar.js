
function ConsultarCliente() {
    var clientes = []
    if (localStorage.getItem('clientes') != null) {
        clientes = JSON.parse(localStorage.getItem('clientes'))
    }

    var txt = ''
    for (let i = 0; i < clientes.length; i++) {
        txt += `<tr>
                <td>${clientes[i].idCliente}</td>
                <td>${clientes[i].nome}</td>
                <td>${clientes[i].cpf}</td>
                <td>${clientes[i].endereco}</td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}



function ConsultarVendedor() {
    var vendedores = []
    if (localStorage.getItem('vendedores') != null) {
        vendedores = JSON.parse(localStorage.getItem('vendedores'))
    }

    var txt = ''
    for (let i = 0; i < vendedores.length; i++) {
        txt += `<tr>
                <td>${vendedores[i].idVendedor}</td>
                <td>${vendedores[i].nomeV}</td>
                <td>${vendedores[i].cracha}</td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}



function ConsultarProduto() {
    var produtos = []
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    var txt = ''
    for (let i = 0; i < produtos.length; i++) {
        txt += `<tr onclick="adicionarCarrinho(${produtos[i]})">
                <th scope="row">${produtos[i].idProduto}</th>
                <td>${produtos[i].categoria}</td>
                <td>${produtos[i].descricao}</td>
                <td>${produtos[i].marca}</td>
                <td>${produtos[i].preco}</td>
                <td>${produtos[i].estoque}</td>
                <td><img src="${produtos[i].url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}


function adicionarCarrinho(produto){
    console.log(produto)

}



function ExibirEletronicos(){
    var eletronicos = [];
    if (localStorage.getItem('eletronicos') != null) {
        eletronicos = JSON.parse(localStorage.getItem('eletronicos'))
    }

    var txt = ''
    for (let i = 0; i < eletronicos.length; i++) {
        txt += `<tr>
                <th scope="row">${eletronicos[i].idProduto}</th>
                <td>${eletronicos[i].categoria}</td>
                <td>${eletronicos[i].descricao}</td>
                <td>${eletronicos[i].marca}</td>
                <td>${eletronicos[i].preco}</td>
                <td>${eletronicos[i].estoque}</td>
                <td><img src="${eletronicos[i].url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function ExibirVestuario(){
    var vestuario = [];
    if (localStorage.getItem('vestuario') != null) {
        vestuario = JSON.parse(localStorage.getItem('vestuario'))
    }

    var txt = ''
    for (let i = 0; i < vestuario.length; i++) {
        txt += `<tr>
                <th scope="row">${vestuario[i].idProduto}</th>
                <td>${vestuario[i].categoria}</td>
                <td>${vestuario[i].descricao}</td>
                <td>${vestuario[i].marca}</td>
                <td>${vestuario[i].preco}</td>
                <td>${vestuario[i].estoque}</td>
                <td><img src="${vestuario[i].url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function ExibirGames(){
    var games = [];
    if (localStorage.getItem('games') != null) {
        games = JSON.parse(localStorage.getItem('games'))
    }

    var txt = ''
    for (let i = 0; i < games.length; i++) {
        txt += `<tr>
                <th scope="row">${games[i].idProduto}</th>
                <td>${games[i].categoria}</td>
                <td>${games[i].descricao}</td>
                <td>${games[i].marca}</td>
                <td>${games[i].preco}</td>
                <td>${games[i].estoque}</td>
                <td><img src="${games[i].url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}


function ExibirProdutosHome(){
    var produtosHome = [];
    if (localStorage.getItem('produtosHome') != null) {
        produtosHome = JSON.parse(localStorage.getItem('produtosHome'))
    }

    var txt = ''
    for (let i = 0; i < produtosHome.length; i++) {
        txt += `<tr>
                <th scope="row">${produtosHome[i].idProduto}</th>
                <td>${produtosHome[i].categoria}</td>
                <td>${produtosHome[i].descricao}</td>
                <td>${produtosHome[i].marca}</td>
                <td>${produtosHome[i].preco}</td>
                <td>${produtosHome[i].estoque}</td>
                <td><img src="${produtosHome[i].url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;


}