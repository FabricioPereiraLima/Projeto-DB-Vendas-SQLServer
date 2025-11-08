-- -----------------------------------------------------
-- Projeto: Banco de Dados de Vendas (SQL Server)
-- Autor: Fabricio Pereira Lima
-- Projeto Integrador - Gran Faculdade
-- -----------------------------------------------------

-- Criando a tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20)
);

-- Criando a tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY IDENTITY(1,1),
    NomeProduto VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT DEFAULT 0
);

-- Criando a tabela de Pedidos (Vendas)
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT NOT NULL,
    DataPedido DATETIME DEFAULT GETDATE(),
    StatusPedido VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Criando a tabela de Itens do Pedido (relacionamento N:M)
CREATE TABLE ItensPedido (
    ItemPedidoID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT NOT NULL,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);
