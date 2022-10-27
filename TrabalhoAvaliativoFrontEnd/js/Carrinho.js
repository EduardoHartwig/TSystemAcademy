
var produtos = [];
var quantidadeEstoque = 0;
var valorTotal = 0;

var carrinho = [];


function adicionarCarrinho(idProduto) {
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) ?? [];

    const produtosList = JSON.parse(localStorage.getItem("produtos")) ?? [];

    const produtoFiltrado = produtosList.find((produto) => produto.idProduto === idProduto);
    console.log(produtoFiltrado);

    const itemCarrinho = carrinho.find((item) => item.produto.idProduto === idProduto);
    if (!itemCarrinho) {
        carrinho.push({ produto: produtoFiltrado, quantidade: 1 });
    } else {
        itemCarrinho.quantidade++;
    }
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
}



function ConsultarCarrinho() {
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) ?? [];
    var txt = ''
    for (let i = 0; i < carrinho.length; i++) {

        txt += `<tr>
                <td>${carrinho[i].produto.categoria}</td>
                <td>${carrinho[i].produto.descricao}</td>
                <td>${carrinho[i].produto.preco}</td>
                <td>${carrinho[i].quantidade}</td>
                <td><img src="${carrinho[i].produto.url}" height="50px" width="50px"></td>
            </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
    calcularTotal();
}

function calcularTotal(){
    let total = 0;
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) ?? [];
    carrinho.forEach((item) => {
      total += item.produto.preco * item.quantidade;
    })
    document.getElementById('total').innerHtml = `<span>Total: ${total}</span>`
}