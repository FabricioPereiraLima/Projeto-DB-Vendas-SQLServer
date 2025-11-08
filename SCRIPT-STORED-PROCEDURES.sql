-- -----------------------------------------------------
-- Stored Procedures (T-SQL) - Projeto Vendas
-- Autor: Fabricio Pereira Lima
-- -----------------------------------------------------

-- Procedure para criar um novo pedido
CREATE PROCEDURE sp_NovoPedido
    @ClienteID INT,
    @StatusPedido VARCHAR(50)
AS
BEGIN
    INSERT INTO Pedidos (ClienteID, StatusPedido)
    VALUES (@ClienteID, @StatusPedido);

    -- Retorna o ID do pedido recém-criado
    SELECT SCOPE_IDENTITY() AS NovoPedidoID;
END
GO

-- Procedure para adicionar um item ao pedido
CREATE PROCEDURE sp_AdicionarItemPedido
    @PedidoID INT,
    @ProdutoID INT,
    @Quantidade INT
AS
BEGIN
    -- Busca o preço atual do produto
    DECLARE @PrecoAtual DECIMAL(10, 2);
    SELECT @PrecoAtual = Preco FROM Produtos WHERE ProdutoID = @ProdutoID;

    -- Insere o item
    INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario)
    VALUES (@PedidoID, @ProdutoID, @Quantidade, @PrecoAtual);

    -- Atualiza o estoque do produto
    UPDATE Produtos
    SET Estoque = Estoque - @Quantidade
    WHERE ProdutoID = @ProdutoID;
END
GO
