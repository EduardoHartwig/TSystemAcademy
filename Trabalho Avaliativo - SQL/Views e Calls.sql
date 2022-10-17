/*CREATE VIEW DadosMarca as
select ma.RazãoSocial, ma.Cnpj, ma.DataCadastro, ma.NomeFantasia, ma.InscricaoEstadual, ma.Email, ma.Telefone, ma.Celular,
en.Cep, en.TipoLogradouro, en.Logradouro, en.Numero, en.Complemento, en.Bairro, en.Municipio, en.UF, en.Pais
from marca ma
inner join endereco en 
on en.IdEndereco = ma.IdEndereco*/

/*Create View ExibirDadosCliente as
select cl.Nome, cl.Cpf, cl.DataNascimento, cl.Telefone, cl.Genero, en.TipoLogradouro, en.Logradouro, en.Numero
from Cliente cl
inner join Endereco en
on en.IdEndereco = cl.IdEndereco*/

/*CREATE VIEW ExibirDadosProdutoParaVenda as
select cm.IdCamiseta, pr.DescricaoReduzida, cm.Genero, cm.Tamanho, cm.Cor, pr.Preco, es.QuantidadeDisponivel, es.QuantidadeVendida , ma.NomeFantasia, ma.Email, ma.Telefone, en.TipoLogradouro, en.Logradouro, en.Numero
from estoque es
inner join produto pr
on pr.IdProduto = pr.IdProduto
inner join camiseta cm
on cm.IdProduto = pr.IdProduto
inner join marca ma 
on ma.idMarca = pr.IdMarca
inner join endereco en
on en.IdEndereco = ma.IdEndereco*/

/*create view ExibirEstoqueTotal as
select pr.IdProduto, pr.DescricaoReduzida, es.PrecoCusto, ma.NomeFantasia, es.Grupo, es.Lote, es.QuantidadeDisponivel, es.QuantidadeReservada, es.QuantidadeVendida
from estoque es
inner join produto pr
on pr.IdProduto = es.IdProduto
inner join marca ma
on ma.idMarca = pr.IdMarca*/

/*create view ExibirEstoqueCamiseta as
select pr.IdProduto, pr.DescricaoReduzida, es.PrecoCusto, ma.NomeFantasia, es.Grupo, es.Lote, es.QuantidadeDisponivel, es.QuantidadeReservada, es.QuantidadeVendida
from estoque es
inner join produto pr
on pr.IdProduto = es.IdProduto
inner join marca ma
on ma.idMarca = pr.IdMarca
where es.Grupo = 'Camiseta';*/

/*create view ExibirEstoqueCalca as
select pr.IdProduto, pr.DescricaoReduzida, es.PrecoCusto, ma.NomeFantasia, es.Grupo, es.Lote, es.QuantidadeDisponivel, es.QuantidadeReservada, es.QuantidadeVendida
from estoque es
inner join produto pr
on pr.IdProduto = es.IdProduto
inner join marca ma
on ma.idMarca = pr.IdMarca
where es.Grupo = 'Calca';*/

/*create view ExibirEstoqueCasaco as
select pr.IdProduto, pr.DescricaoReduzida, es.PrecoCusto, ma.NomeFantasia, es.Grupo, es.Lote, es.QuantidadeDisponivel, es.QuantidadeReservada, es.QuantidadeVendida
from estoque es
inner join produto pr
on pr.IdProduto = es.IdProduto
inner join marca ma
on ma.idMarca = pr.IdMarca
where es.Grupo = 'Casaco';*/

/*create view ExibirEstoqueAcessorio as
select pr.IdProduto, pr.DescricaoReduzida, es.PrecoCusto, ma.NomeFantasia, es.Grupo, es.Lote, es.QuantidadeDisponivel, es.QuantidadeReservada, es.QuantidadeVendida
from estoque es
inner join produto pr
on pr.IdProduto = es.IdProduto
inner join marca ma
on ma.idMarca = pr.IdMarca
where es.Grupo = 'Acessorio';*/


#2 tabelas
#select * from DadosMarca
#select * from ExibirDadosCliente

#3 tabelas
/*select * from ExibirEstoqueTotal
Select * from ExibirEstoqueCamiseta
Select * from ExibirEstoqueCalca
Select * from ExibirEstoqueCasaco
Select * from ExibirEstoqueAcessorio*/

#5 tabelas
#select * from ExibirDadosProdutoParaVenda


#Inserir
#call pInserirEndereco('88317574', 'Rua', 'Lidia Souza de Paula', 235, 'Casa A', 'Espinheiros', 'Itajai', 'SC', 'Brasil');
#call pInserirMarca(2, 'testando666', '12345678901666', current_date, 'teste666', '123456666', 'testand666o@teste.com.br', '4732566644', '47997666284');
#call pInserirProduto(1, 'Homens Regata Sólido', 41.90, 'Regata', 0, 1, 0, 0 , '000001');
#call pInserirCamiseta(0, 'Masculino', 'M', 69, 90, 'Preto', 'Casual', 'Simples', 'Sem Mangas', 'Tecido');
#call pInserirEstoque(3, 0, 'Camiseta', '00002', 2000, 1000, 250, 250, 22.60);

#Alterar
#call pAlterarEndereco(3, 666, 'Casa B');
#call pAlterarMarca(1, 'fantasia', 'fantasia@gmail.com', '12345678901')
#call pAlterarProduto(1, 1, 1, 0, 30);
#call pAlterarCamiseta(1, 'G', 85, 107, 'Branco', 'Street', 'Malhada', 'Sem Mangas', 'Tecido');
#call pAlterarEstoque(1, 400, 300);

#Deletar
#call pDeletarCamiseta(0);
#call pDeletarEstoque(1);


