-- criação do banco de dados para o cenario de E-commerce
create database eCommerce;
use eCommerce;

-- criar tabela cliente
create table clients(
     idClient int auto_increment primary key,
     Fname varchar(15),
     Minit char(3),
     Lname varchar(20),
     CPF char(11) not null,
     Address varchar(255),
     constraint unique_cpf_client unique (CPF)
     

);
desc clients;
alter table clients auto_increment = 1;

-- criar tabela produto

-- size = dimensão do produto
create table product(
     idProduct int auto_increment primary key,
     Pname varchar(30) not null,
     classification_kids bool default false,
     category enum ('Eletrônico' , 'Vestimenta', 'Brinquedos', 'Alimentos' ,'Móveis') not null,
     avaliação float default 0 ,
     size varchar(10)
);
alter table product auto_increment = 1;
-- criar tabela pagamentos(pra ser continuado no desafio : termine de implementar a tabela,
-- e crie a conexão com as tabelas necessarias , alem disso reflita essa modificação no diagrama de esquema relacional.




create table payments(
    idClient int,
    id_payment int,
    typePayment enum('Dinheiro', ' Boleto' , 'Cartão' , 'Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)
    
);
-- criar tabela pedido

create table orders(
     idOrder int auto_increment primary key,
     idOrderClient int,
     orderStatus enum('Cancelado' , 'Confirmado' , 'Em processamento') default 'Em processamento',
     orderDescription varchar(255),
     sendValue float default 10,
     paymentCash bool default false, 
     constraint fk_order_client foreign key(idOrderClient) references clients(idClient)
);
alter table orders auto_increment = 1;
-- criar tabela estoque
 
 create table productStorage(
     idProdStorage int auto_increment primary key,
     storageLocation varchar(255),
     quantify int default 0
);
alter table productStorage auto_increment = 1;
-- criar tabela fornecedor

create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ) 


);
alter table supplier auto_increment = 1;

-- criar tabela vendedor

create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_suller unique(CNPJ),
    constraint unique_cpf_suller unique(CPF) 
);
alter table seller auto_increment = 1;

create table productSeller(
   idPseller int ,
   idProduct int ,
   prodQuantity int default 1,
   primary key(idPseller, idProduct),
   constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
   constraint fk_product_product foreign key(idProduct) references product(idProduct)
);


create table productOrder(
   idPOproduct int ,
   idPOorder int ,
   poQuantity int default 1,
   poStatus enum('Disponivel' , 'Sem estoque') default 'Disponivel',
   primary key(idPOproduct, idPOorder),
   constraint fk_productOrder_seller foreign key(idPOproduct) references product(idProduct),
   constraint fk_productOrder_product foreign key(idPOorder) references orders(idOrder)
);



create table storageLocation(
   idLproduct int ,
   idLstorage int ,
   location varchar(255) not null,
   primary key(idLproduct, idLstorage),
   constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
   constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
   idPsSupplier int ,
   idPsProduct int ,
   quantity int not null,
   primary key(idPsSupplier, idPsProduct),
   constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
   constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);

show tables;

desc seller ;
desc productStorage;
-- Queries 

select * from orders o, productOrder p where o.idOrder = idPOorder; 

select concat(Fname , ' ' , Lname) as Nome_Completo  , count(Pname) as Quantidade_de_Projetos from product as p inner join clients as c 
                       on idClient = idProduct;

select AbstName from seller, supplier where idSeller = idSupplier;

select * from product as p , supplier as s , productStorage as ps where p.idProduct = s.idSupplier and p.idProduct = ps.idProdStorage;
                       
select SocialName , Pname from supplier, product where idProduct = idSupplier;


   
   






























