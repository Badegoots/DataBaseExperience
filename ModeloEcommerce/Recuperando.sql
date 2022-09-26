SELECT count(*) FROM cliente;

SELECT * FROM cliente c, pedido p WHERE c.idCliente = p.IdPedidoCliente;
