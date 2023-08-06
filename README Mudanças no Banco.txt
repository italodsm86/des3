# README - Mudanças no Banco de Dados do E-commerce

Neste documento, explicaremos as mudanças realizadas no banco de dados do cenário de E-commerce com base no script SQL fornecido.

## Mudanças realizadas

1. Adição da tabela `payment_methods`: 
   - Essa tabela foi adicionada para permitir que um cliente tenha cadastrado mais de uma forma de pagamento. Cada registro na tabela `payment_methods` está associado a um cliente por meio da coluna `idClient`. Cada método de pagamento é representado na coluna `methodName`.

2. Adição de colunas para clientes Pessoa Jurídica (PJ) e Pessoa Física (PF):
   - Foi adicionada a coluna `IsPJ` à tabela `clients` para identificar se um cliente é uma Pessoa Jurídica (1) ou Pessoa Física (0). Essa adição permite que um cliente possa ser registrado como PJ ou PF, mas não pode ter ambas as informações.

3. Adição de colunas para status e código de rastreio na tabela `orders`:
   - Foram adicionadas as colunas `deliveryStatus` e `trackingCode` à tabela `orders`, permitindo que informações relacionadas ao status de entrega e código de rastreio possam ser registradas para cada pedido.

## Queries adicionais

Além das mudanças no modelo do banco de dados, algumas queries foram apresentadas como exemplos de consultas que podem ser realizadas no cenário de E-commerce. As consultas foram organizadas em diferentes categorias, como:

1. Recuperações simples com SELECT Statement: Exemplos de queries para recuperar todos os clientes e produtos.

2. Filtros com WHERE Statement: Consultas com filtros para recuperar informações específicas, como clientes com CPF específico ou produtos de uma determinada categoria.

3. Crie expressões para gerar atributos derivados: Uma consulta que demonstra como criar uma expressão para gerar um atributo derivado, como o nome completo do cliente (concatenação de `Fname` e `Lname`).

4. Defina ordenações dos dados com ORDER BY: Uma consulta que recupera os produtos em ordem alfabética por nome.

5. Condições de filtros aos grupos – HAVING Statement: Uma consulta que recupera clientes que têm mais de 2 pedidos.

6. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados: Exemplos de consultas que envolvem junções entre várias tabelas, permitindo recuperar informações relacionadas a pedidos, clientes, produtos, fornecedores e estoques.

## Perguntas respondidas pelas consultas

Algumas das perguntas que podem ser respondidas pelas consultas são:

1. Quantos pedidos foram feitos por cada cliente?
2. Algum vendedor também é fornecedor?
3. Relação de produtos fornecedores e estoques.
4. Relação de nomes dos fornecedores e nomes dos produtos.

## Considerações finais

Este documento apresentou as mudanças realizadas no banco de dados do cenário de E-commerce, juntamente com exemplos de consultas SQL que podem ser usadas para obter informações específicas dos dados. As consultas e o modelo de banco de dados podem ser adaptados conforme necessário para atender aos requisitos específicos do cenário de E-commerce em questão.
