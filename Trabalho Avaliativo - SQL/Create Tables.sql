/*CREATE TABLE Endereco(
  IdEndereco INT NOT NULL,
  Cep VARCHAR(10) NOT NULL,
  TipoLogradouro VARCHAR(45) NOT NULL,
  Logradouro VARCHAR(45) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(45) NULL,
  Bairro VARCHAR(45) NOT NULL,
  Municipio VARCHAR(45) NOT NULL,
  UF VARCHAR(2) NOT NULL,
  Pais VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdEndereco)
  );
  
CREATE TABLE Marca (
  idMarca INT NOT NULL,
  IdEndereco INT NOT NULL,
  RazãoSocial VARCHAR(70) NOT NULL,
  Cnpj VARCHAR(14) NOT NULL,
  DataCadastro DATE NOT NULL,
  NomeFantasia VARCHAR(50) NULL,
  InscricaoEstadual VARCHAR(45) NULL,
  Email VARCHAR(45) NOT NULL,
  Telefone VARCHAR(11) NOT NULL,
  Celular VARCHAR(11) NULL,
  PRIMARY KEY (idMarca),
  UNIQUE INDEX cnpj_UNIQUE (Cnpj ASC) VISIBLE,
  UNIQUE INDEX RazãoSocial_UNIQUE (RazãoSocial ASC) VISIBLE,
  INDEX fk_Marca_Endereco1_idx (IdEndereco ASC) VISIBLE,
  CONSTRAINT fk_Marca_Endereco1
    FOREIGN KEY (IdEndereco) REFERENCES Endereco (IdEndereco)
);

CREATE TABLE Produto (
  IdProduto INT NOT NULL,
  IdMarca INT NOT NULL,
  Descricao VARCHAR(80) NOT NULL,
  Preco FLOAT NOT NULL,
  DescricaoReduzida VARCHAR(40) NULL,
  Promocao BIT(3) NOT NULL,
  ProdutoSazonal BIT(3) NOT NULL,
  Referencia VARCHAR(7) NULL,
  ProdutoEspecial BIT(3) NOT NULL,
  PorcentagemDesconto INT NULL,
  PRIMARY KEY (IdProduto),
  INDEX fk_Produto_Marca_idx (IdMarca ASC) VISIBLE,
  CONSTRAINT fk_Produto_Marca
    FOREIGN KEY (IdMarca) REFERENCES Marca (idMarca)
);

CREATE TABLE Estoque (
  idEstoque INT NOT NULL,
  IdEndereco INT NOT NULL,
  IdProduto INT NOT NULL,
  Grupo VARCHAR(15) NOT NULL,
  Lote VARCHAR(5) NOT NULL,
  QuantidadeInicial INT NOT NULL,
  QuantidadeDisponivel INT NOT NULL,
  QuantidadeVendida INT NOT NULL,
  QuantidadeReservada INT NOT NULL,
  PrecoCusto FLOAT NOT NULL,
  PRIMARY KEY (idEstoque),
    INDEX fk_Estoque_Endereco_idx (IdEndereco ASC) VISIBLE,
  CONSTRAINT fk_Estoque_Endereco
    FOREIGN KEY (IdEndereco) REFERENCES Endereco (IdEndereco),
    INDEX fk_Estoque_Produto_idx (IdProduto ASC) VISIBLE,
  CONSTRAINT fk_Estoque_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

CREATE TABLE Acessorio (
  IdAcessorio INT NOT NULL,
  IdProduto INT NOT NULL,
  Genero VARCHAR(10) NOT NULL,
  Tipo VARCHAR(60) NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  Estilo VARCHAR(45) NOT NULL,
  Estampa VARCHAR(45) NULL,
  Material VARCHAR(45) NOT NULL,
  Detalhes VARCHAR(45) NULL,
  LigaMetálica VARCHAR(45) NULL,
  PRIMARY KEY (IdAcessorio),
  INDEX fk_Acessorio_Produto_idx (IdProduto ASC) VISIBLE,
  CONSTRAINT fk_Acessorio_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

CREATE TABLE Calca (
  IdCalca INT NOT NULL,
  IdProduto INT NOT NULL,
  Genero VARCHAR(10) NOT NULL,
  Tamanho VARCHAR(5) NOT NULL,
  Comprimento INT NOT NULL,
  TamanhoCintura INT NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  Estilo VARCHAR(45) NOT NULL,
  Estampa VARCHAR(45) NOT NULL,
  Material VARCHAR(45) NOT NULL,
  PossuiBolso BIT(3) NOT NULL,
  PRIMARY KEY (IdCalca),
  INDEX fk_Calca_Produto_idx (IdProduto ASC) VISIBLE,
  CONSTRAINT fk_Calca_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

CREATE TABLE Camiseta (
  IdCamiseta INT NOT NULL,
  IdProduto INT NOT NULL,
  Genero VARCHAR(10) NOT NULL,
  Tamanho VARCHAR(5) NOT NULL,
  Comprimento INT NOT NULL,
  Busto INT NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  Estilo VARCHAR(45) NOT NULL,
  Estampa VARCHAR(45) NOT NULL,
  ComprimentoManga VARCHAR(45) NOT NULL,
  Material VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCamiseta),
  INDEX fk_Camiseta_Produto_idx (IdProduto ASC) VISIBLE,
  CONSTRAINT fk_Camiseta_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

CREATE TABLE Casaco (
  IdCasaco INT NOT NULL,
  IdProduto INT NOT NULL,
  Genero VARCHAR(10) NOT NULL,
  Tamanho VARCHAR(5) NOT NULL,
  Comprimento INT NOT NULL,
  Busto INT NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  Estilo VARCHAR(45) NOT NULL,
  Estampa VARCHAR(45) NOT NULL,
  ComprimentoManga VARCHAR(45) NOT NULL,
  Material VARCHAR(45) NOT NULL,
  PossuiCapuz BIT(3) NOT NULL,
  PossuiBolso BIT(3) NOT NULL,
  AberturaCentral VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCasaco),
  INDEX fk_Casaco_Produto_idx (IdProduto ASC) VISIBLE,
  CONSTRAINT fk_Casaco_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

CREATE TABLE Cliente (
	IdCliente INT NOT NULL, 
    IdEndereco INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Cpf VARCHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL,
    Telefone VARCHAR(11) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataCadastro DATE NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    ClienteVip BIT(3) NOT NULL,
    PRIMARY KEY (IdCliente),
	INDEX fk_Cliente_Endereco_idx (IdEndereco ASC) VISIBLE,
	CONSTRAINT fk_Cliente_Endereco
    FOREIGN KEY (IdEndereco) REFERENCES Endereco (IdEndereco)
);

Create TABLE Venda(
	IdVenda INT NOT NULL,
    IdCliente INT NOT NULL,
    DataVenda DATE NOT NULL,
    ValorTotalVenda FLOAT NOT NULL,
    StatusVenda BIT(3) NOT NULL,
    PRIMARY KEY (IdVenda),
	INDEX fk_Venda_Cliente_idx (IdCliente ASC) VISIBLE,
	CONSTRAINT fk_Venda_Cliente
    FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE ItensVenda(
	IdVenda INT NOT NULL, 
    IdProduto INT NOT NULL,
    Quantidade INT NOT NULL,   
    INDEX fk_ItensVenda_Venda_idx (IdVenda ASC) VISIBLE,
	CONSTRAINT fk_ItensVenda_IdVenda
    FOREIGN KEY (IdVenda) REFERENCES Venda (IdVenda),
	CONSTRAINT fk_ItensVenda_Produto
    FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);*/
