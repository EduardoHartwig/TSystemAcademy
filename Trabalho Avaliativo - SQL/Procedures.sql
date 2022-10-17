#ENDERECO
/*DELIMITER $$
create procedure pValidaCep(in End_Cep varchar(10), in End_Num int, OUT msg varchar(100))
begin
declare qtde int;
   select count(*) into qtde from Endereco where Cep = End_Cep and Numero = End_Num;
       if qtde > 0 then
          set msg = 'Já existe um Endereço cadastrado com esse Cep e Número';
          end if;
end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pInserirEndereco(IN End_Cep varchar(10), IN End_TLog varchar(45), in End_Log varchar(45), in End_Num int, in End_Comp varchar(45), in End_Bair varchar(45), in End_Mun varchar(45), in End_UF varchar(2), in End_Pais Varchar(45))
 begin
   declare cod int;
   declare msg varchar(100);
   set msg = null;   
   
   call pValidaCep(End_Cep, End_Num, msg);

   if msg is null then     
     select ifnull(max(IdEndereco),0) + 1 into cod from Endereco;
     insert into endereco (IdEndereco, Cep, TipoLogradouro, Logradouro, Numero, Complemento, Bairro, Municipio, UF, Pais)
	 values(cod, End_Cep, End_TLog, End_Log, End_Num, End_Comp, End_Bair, End_Mun, End_UF, End_Pais);
     set msg = 'Endereço inserido com sucesso';     
   end if;    
   select msg;
 end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pAlterarEndereco(IN End_Id varchar(10), in End_Num_Novo int, in End_Comp_Novo varchar(45))
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Endereco where IdEndereco = End_Id;
   if qtde > 0 then    
	   update Endereco set
	   Numero = End_Num_Novo,
	   Complemento = End_Comp_Novo
	   where IdEndereco = End_Id;
       set msg = 'Endereço alterado com sucesso';
    else
      set msg = 'O Endereço informado não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

#Marca

/*DELIMITER $$
create procedure pValidaCnpj(in Mar_Cnpj varchar(14), OUT msg varchar(100))
begin
declare qtde int;
   select count(*) into qtde from Marca where Cnpj = Mar_Cnpj;
       if qtde > 0 then
          set msg = 'Já existe uma Marca cadastrada com esse CNPJ';
          end if;
end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pInserirMarca(IN Mar_Id_End int, IN Mar_Raz varchar(70), in Mar_Cnpj varchar(14), in Mar_DTCad DATE, in Mar_Fant varchar(50), in Mar_IE varchar(45) , in Mar_Email varchar(45), in Mar_Tel varchar(11), in Mar_Cel varchar(11))
 begin
   declare cod int;
   declare msg varchar(100);
   set msg = null;   
   
   call pValidaCnpj(Mar_Cnpj, msg);

   if msg is null then     
     select ifnull(max(idMarca),0) + 1 into cod from marca;
     insert into marca (idMarca, IdEndereco, RazãoSocial, Cnpj, DataCadastro, Nomefantasia, InscricaoEstadual, Email, Telefone, Celular)
	 values(cod, Mar_Id_End, Mar_Raz, Mar_Cnpj,  Mar_DTCad, Mar_Fant, Mar_IE, Mar_Email,  Mar_Tel, Mar_Cel);
     set msg = 'Marca inserida com sucesso';     
   end if;    
   select msg;
 end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pAlterarMarca(IN Mar_Id int, in Mar_Fant_Novo varchar(50), in Mar_Email_Novo varchar(45), in Mar_Tel_Novo varchar(11))
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Marca where IdMarca = Mar_Id;
   if qtde > 0 then    
	   update Marca set
	   NomeFantasia = Mar_Fant_Novo,
	   Email = Mar_Email_Novo,
       Telefone = Mar_Tel_Novo
	   where IdMarca = Mar_Id;
       set msg = 'Marca alterada com sucesso';
    else
      set msg = 'A Marca informada não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

#Produto

/*DELIMITER $$
create procedure pValidaProduto(in Pro_Id_Mar int, IN Pro_Des varchar(80), OUT msg varchar(100))
begin
declare qtde int;
   select count(*) into qtde from Produto where IdMarca = Pro_Id_Mar and Descricao = Pro_Des;
       if qtde > 0 then
          set msg = 'Já existe um Produto cadastrado com essa Marca e descrição';
          end if;
end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pInserirProduto(IN Pro_Id_Mar int, IN Pro_Des varchar(80), in Pro_Pre float, in Pro_DesRed varchar(40), in Pro_Prom BIT(3), in Pro_Saz BIT(3), in Pro_Esp BIT(3), in Pro_PorDesc int,in Pro_Ref varchar(7))
 begin
   declare cod int;
   declare msg varchar(100);
   set msg = null;   
   
   call pValidaProduto(Pro_Id_Mar, Pro_Des, msg);

   if msg is null then     
     select ifnull(max(idProduto),0) + 1 into cod from produto;
     insert into produto (Idproduto, IdMarca, Descricao, Preco, DescricaoReduzida, Promocao, ProdutoSazonal, ProdutoEspecial, PorcentagemDesconto, Referencia)
	 values(cod, Pro_Id_Mar, Pro_Des,  Pro_Pre , Pro_DesRed, Pro_Prom, Pro_Saz, Pro_Esp, Pro_PorDesc, Pro_Ref);
     set msg = 'Produto inserido com sucesso';     
   end if;    
   select msg;
 end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pAlterarProduto(IN Pro_Id int, in Pro_Prom BIT(3), in Pro_Saz BIT(3), in Pro_Esp BIT(3), in Pro_PorDesc int)
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Produto where IdProduto = Pro_Id;
   if qtde > 0 then    
	   update Produto set
	   Preco = Preco - ((Pro_PorDesc/100 ) * Preco),
	   Promocao = Pro_Prom,
       ProdutoSazonal = Pro_Saz,
       ProdutoEspecial = Pro_Esp,
       PorcentagemDesconto = Pro_PorDesc
	   where IdProduto = Pro_Id;
       set msg = 'Produto alterado com sucesso';
    else
      set msg = 'O Produto informado não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

#Camiseta

/*DELIMITER $$
 create procedure pInserirCamiseta(IN Cam_Id_Pro int, IN Cam_Gen varchar(10), in Cam_Tam VARCHAR(5), in Cam_Com int, in Cam_Bus int, in Cam_Cor VARCHAR(45), in Cam_Esti VARCHAR(45), in Cam_Esta varchar(45),in Cam_Com_Mang varchar(45), Cam_Mat VARCHAR(45))
 begin
   declare cod int;
   declare msg varchar(100);
   set msg = null;   
   
   if msg is null then     
     select ifnull(max(idCamiseta),0) + 1 into cod from camiseta;
     insert into camiseta (IdCamiseta, IdProduto, Genero, Tamanho, Comprimento, Busto, Cor, Estilo, Estampa, ComprimentoManga, Material)
	 values(cod, Cam_Id_Pro, Cam_Gen, Cam_Tam, Cam_Com, Cam_Bus, Cam_Cor, Cam_Esti, Cam_Esta, Cam_Com_Mang, Cam_Mat);
     set msg = 'Camiseta inserida com sucesso';     
   end if;    
   select msg;
 end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pAlterarCamiseta(IN Cam_Id int, in Cam_Tam VARCHAR(5), in Cam_Com int, in Cam_Bus int, in Cam_Cor VARCHAR(45), in Cam_Esti VARCHAR(45), in Cam_Esta varchar(45),in Cam_Com_Mang varchar(45), Cam_Mat VARCHAR(45))
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Camiseta where IdCamiseta = Cam_Id;
   if qtde > 0 then    
	   update Camiseta set
	   Tamanho = Cam_Tam,
	   Comprimento = Cam_Com,
       Busto = Cam_Bus,
       Cor = Cam_Cor,
       Estilo = Cam_Esti,
       Estampa = Cam_Esta,
       ComprimentoManga = Cam_Com_Mang,
       Material = Cam_Mat
	   where IdCamiseta = Cam_Id;
       set msg = 'Camiseta alterado com sucesso';
    else
      set msg = 'A Camiseta informada não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pDeletarCamiseta(IN Cam_Id int)
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Camiseta where IdCamiseta = Cam_Id;
   if qtde > 0 then    
	   Delete from Camiseta 
	   where IdCamiseta = Cam_Id;
       set msg = 'Camiseta Excluida com sucesso';
    else
      set msg = 'A Camiseta informada não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

#Estoque

/*DELIMITER $$
create procedure pValidarEstoque(IN Est_Id_Pro int, in Est_Lote VARCHAR(5), OUT msg varchar(100))
begin
declare qtde int;
   select count(*) into qtde from Estoque where IdProduto = Est_Id_Pro and Lote = Est_Lote;
       if qtde > 0 then
          set msg = 'Já existe um Estoque cadastrado com esse Produto e Lote';
          end if;
end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pInserirEstoque(IN Est_Id_End int, IN Est_Id_Pro int, in Est_Gru VARCHAR(15), in Est_Lote VARCHAR(5), in Est_Qtdd_Inic int,in Est_Qtdd_Disp int, in Est_Qtdd_Vend int, in Est_Qtdd_Res int, in Est_Pre_Cus float)
 begin
   declare cod int;
   declare msg varchar(100);
   set msg = null;   
   
   call pValidarEstoque(Est_Id_Pro, Est_Lote, msg);
   
   if msg is null then     
     select ifnull(max(idEstoque),0) + 1 into cod from Estoque;
     insert into Estoque (idEstoque, IdEndereco, IdProduto, Grupo, Lote, QuantidadeInicial, QuantidadeDisponivel, QuantidadeVendida, QuantidadeReservada, PrecoCusto)
	 values(cod, Est_Id_End, Est_Id_Pro, Est_Gru, Est_Lote, Est_Qtdd_Inic, Est_Qtdd_Disp, Est_Qtdd_Vend, Est_Qtdd_Res, Est_Pre_Cus);
     set msg = 'Estoque inserido com sucesso';     
   end if;    
   select msg;
 end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pAlterarEstoque(IN Est_Id int, in Est_Qtdd_Vend int, in Est_Qtdd_Res int)
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Estoque where IdEstoque = Est_Id;
   if qtde > 0 then    
	   update Estoque set
	   QuantidadeDisponivel = (QuantidadeDisponivel - (Est_Qtdd_Vend + Est_Qtdd_Res)),      
	   QuantidadeVendida = (QuantidadeVendida + Est_Qtdd_Vend),
       QuantidadeReservada = (QuantidadeReservada + Est_Qtdd_Res)
	   where IdEstoque = Est_Id;
       set msg = 'Estoque alterado com sucesso';
    else
      set msg = 'O Estoque informado não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/

/*DELIMITER $$
 create procedure pDeletarEstoque(IN Est_Id int)
 begin
 declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from Estoque where IdEstoque = Est_Id;
   if qtde > 0 then    
	   Delete from Estoque 
	   where IdEstoque = Est_Id;
       set msg = 'Estoque Excluido com sucesso';
    else
      set msg = 'O Estoque informado não existe';
    end if;
    select msg;
  end$$
DELIMITER ;*/


