-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,5,2,null),
                         (2,5,1,null),
                         (3,6,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);
                             
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select * from orders;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 
       
-- Recuperar produtos em ordem alfabética por nome:       
SELECT * FROM product ORDER BY Pname;

-- Condições de filtros aos grupos – HAVING Statement:
-- Recuperar clientes que têm mais de 2 pedidos:
SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders 
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient
HAVING COUNT(*) > 2;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:
-- Recuperar todos os pedidos com informações dos clientes:
SELECT o.idOrder, Fname, Lname, orderStatus 
FROM orders o
INNER JOIN clients c ON o.idOrderClient = c.idClient;

-- Recuperar informações dos pedidos com produtos associados:
SELECT o.idOrder, Fname, Lname, Pname, poQuantity, poStatus
FROM orders o
INNER JOIN clients c ON o.idOrderClient = c.idClient
INNER JOIN productOrder p ON p.idPOorder = o.idOrder;

--Para responder às perguntas e realizar consultas usando as cláusulas SQL mencionadas, podemos criar as seguintes queries:

    Recuperações simples com SELECT Statement:

a) Recuperar todos os clientes:

sql

SELECT * FROM clients;

b) Recuperar todos os produtos:

sql

SELECT * FROM product;

    Filtros com WHERE Statement:

a) Recuperar clientes com CPF específico:

sql

SELECT * FROM clients WHERE CPF = '12346789';

b) Recuperar produtos da categoria 'Eletrônico':

sql

SELECT * FROM product WHERE category = 'Eletrônico';

    Crie expressões para gerar atributos derivados:

a) Mostrar o nome completo do cliente (concatenação de Fname e Lname):

sql

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM clients;

    Defina ordenações dos dados com ORDER BY:

a) Recuperar produtos em ordem alfabética por nome:

sql

SELECT * FROM product ORDER BY Pname;

    Condições de filtros aos grupos – HAVING Statement:

a) Recuperar clientes que têm mais de 2 pedidos:

sql

SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders 
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient
HAVING COUNT(*) > 2;

    Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:

a) Recuperar todos os pedidos com informações dos clientes:

sql

SELECT o.idOrder, Fname, Lname, orderStatus 
FROM orders o
INNER JOIN clients c ON o.idOrderClient = c.idClient;

b) Recuperar informações dos pedidos com produtos associados:

sql

SELECT o.idOrder, Fname, Lname, Pname, poQuantity, poStatus
FROM orders o
INNER JOIN clients c ON o.idOrderClient = c.idClient
INNER JOIN productOrder p ON p.idPOorder = o.idOrder;

-- Refinamentos adicionais:
-- Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações:

-- Criar coluna "IsPJ" para identificar se é PJ ou PF (1 para PJ, 0 para PF)
ALTER TABLE clients ADD COLUMN IsPJ TINYINT NOT NULL DEFAULT 0;

-- Atualizar clientes para definir se são PJ ou PF (exemplo)
UPDATE clients SET IsPJ = 1 WHERE idClient IN (1, 3); -- Considerando que os clientes com id 1 e 3 são PJ

-- Pagamento - Pode ter cadastrado mais de uma forma de pagamento:

-- Adicionar tabela payment_methods
CREATE TABLE payment_methods (
    idPaymentMethod INT AUTO_INCREMENT PRIMARY KEY,
    methodName VARCHAR(50) NOT NULL,
    idClient INT NOT NULL,
    FOREIGN KEY (idClient) REFERENCES clients(idClient) ON DELETE CASCADE
);

-- Inserir exemplos de pagamentos para clientes
INSERT INTO payment_methods (methodName, idClient) VALUES
('Boleto', 1),
('Cartão', 1),
('Cartão', 2),
('Dois cartões', 3);

-- Entrega - Possui status e código de rastreio:
-- Adicionar colunas para status e código de rastreio na tabela orders
ALTER TABLE orders ADD COLUMN deliveryStatus VARCHAR(50);
ALTER TABLE orders ADD COLUMN trackingCode VARCHAR(20);

-- Algumas das perguntas que podem ser respondidas pelas consultas:
-- Quantos pedidos foram feitos por cada cliente?

SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders 
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient;

-- Algum vendedor também é fornecedor?
SELECT s.idSeller, s.SocialName AS SellerName, p.idPsProduct, ps.SocialName AS SupplierName
FROM seller s
INNER JOIN productSeller ps ON s.idSeller = ps.idPseller
INNER JOIN productSupplier p ON ps.idPproduct = p.idPsProduct;

-- Relação de produtos fornecedores e estoques:
SELECT p.idProduct, p.Pname AS ProductName, s.SocialName AS SupplierName, ps.quantity AS StockQuantity
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier;

-- Relação de nomes dos fornecedores e nomes dos produtos:
SELECT s.SocialName AS SupplierName, p.Pname AS ProductName
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier;



        