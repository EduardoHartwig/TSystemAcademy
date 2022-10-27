function InserirId(lista) {
    if (lista.length != 0) {
        return lista.length;
    } else {
        return 0;
    }
}

var idCliente = 0;
var nome = '';
var cpf = '';
var endereco = '';

var clientes = [];
if (localStorage.getItem('clientes')) {
    clientes = JSON.parse(localStorage.getItem('clientes'))
}

function CadastrarCliente() {
    if (validaDadosCliente()) {
        var obj = {
            idCliente: idCliente,
            nome: nome,
            cpf: cpf,
            endereco: endereco
        }
        console.log(obj)
        clientes.push(obj)
        //gravar no storage
        localStorage.setItem('clientes', JSON.stringify(clientes))
        alert('Cadastro Efetuado com Sucesso')
    }
}


function validaDadosCliente() {
    var cIdCliente = InserirId(clientes);
    var cNome = document.getElementById('nome')
    var cCpf = document.getElementById('cpf')
    var vEndereco = document.getElementById('endereco')

    if (cNome.value == '') {
        alert('O Nome deve ser informado')
        cNome.focus()
        return false
    }

    idCliente = cIdCliente;
    nome = cNome.value;
    cpf = cCpf.value;
    endereco = vEndereco.value;

    return true;
}



/*function apagarRegistros() {
    //localStorage.removeItem(localStorage.key(0))
    for (let i = 0; i < localStorage.length; i++) {
        localStorage.removeItem(localStorage.key(i))
    }
}*/

var idVendedor = 0;
var nomeV = '';
var cracha = '';

var vendedores = [];
if (localStorage.getItem('vendedores')) {
    vendedores = JSON.parse(localStorage.getItem('vendedores'))
}

function CadastrarVendedor() {
    if (validaDadosVendedor()) {
        var obj = {
            idVendedor: idVendedor,
            nomeV: nomeV,
            cracha: cracha
        }
        console.log(obj)
        vendedores.push(obj)
        //gravar no storage
        localStorage.setItem('vendedores', JSON.stringify(vendedores))
        alert('Cadastro Efetuado com Sucesso')
    }
}

function validaDadosVendedor() {
    var cIdVendedor = InserirId(vendedores);
    var cNomeV = document.getElementById('nome').value
    var cCracha = document.getElementById('cracha').value


    if (cNomeV.value == '') {
        alert('O Nome deve ser informado')
        cNome.focus()
        return false
    }

    idVendedor = cIdVendedor;
    nomeV = cNomeV;
    cracha = cCracha;


    return true;
}


var idProduto = 0;
var categoria = '';
var descricao = '';
var marca = '';
var preco = 0.0;
var estoque = 0;
var url = '';

var produtos = [];
if (localStorage.getItem('produtos')) {
    produtos = JSON.parse(localStorage.getItem('produtos'))
}

function CadastrarProduto() {
    if (validaDadosProduto()) {
        var obj = {
            idProduto: idProduto,
            categoria: categoria,
            descricao: descricao,
            marca: marca,
            preco: preco,
            estoque: estoque,
            url: url
        }
        console.log(obj)
        produtos.push(obj)
        //gravar no storage
        localStorage.setItem('produtos', JSON.stringify(produtos))
        alert('Cadastro Efetuado com Sucesso')
    }
}


function validaDadosProduto() {
    var cIdProduto = InserirId(produtos);
    var cCategoria = document.getElementById('categoria')
    var cDescricao = document.getElementById('descricao')
    var cMarca = document.getElementById('marca')
    var cPreco = document.getElementById('preco')
    var cEstoque = document.getElementById('estoque')
    var cUrl = document.getElementById('url')

    if (cDescricao.value == '') {
        alert('O Nome deve ser informado')
        cDescricao.focus()
        return false
    }


    idProduto = cIdProduto;
    categoria = cCategoria.value;
    descricao = cDescricao.value;
    marca = cMarca.value;
    preco = cPreco.value;
    estoque = cEstoque.value;
    url = cUrl.value;

    return true;
}


var eletronicos = [];
if (localStorage.getItem('eletronicos')) {
    eletronicos = JSON.parse(localStorage.getItem('eletronicos'))
}

function cadastrarEletronicos() {
    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].categoria == "Eletrônicos") {
            eletronicos.push(produtos[i]);
            alert('Cadastro Efetuado com Sucesso')
            localStorage.setItem('eletronicos', JSON.stringify(eletronicos))
        }
    }
}


var vestuario = [];
if (localStorage.getItem('vestuario')) {
    vestuario = JSON.parse(localStorage.getItem('vestuario'))
}

function cadastrarVestuario() {
    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].categoria == "Vestuários") {
            vestuario.push(produtos[i]);
            alert('Cadastro Efetuado com Sucesso')
            localStorage.setItem('vestuario', JSON.stringify(vestuario))
        }
    }
}


var games = [];
if (localStorage.getItem('games')) {
    games = JSON.parse(localStorage.getItem('games'))
}

function cadastrarGames() {
    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].categoria == "Midias Digitais") {
            games.push(produtos[i]);
            alert('Cadastro Efetuado com Sucesso')
            localStorage.setItem('games', JSON.stringify(games))
        }
    }
}







var used = [];
var produtosHome = [];
let rnd;
if (localStorage.getItem('produtosHome')) {
    produtosHome = JSON.parse(localStorage.getItem('produtosHome'))
}

function ProdutosPaginaInicial() {



    for (let i = 0; i < produtosHome.length; i++) {
        rnd = Math.floor(Math.random() * 30).toFixed();
        random = Number(rnd);

        if (!used.includes(random)) {
            produtosHome.push(eletronicos[random])
            used.push(random);
            alert('Cadastro Efetuado com Sucesso')
            localStorage.setItem('produtosHome', JSON.stringify(produtosHome))
        }
    }
}