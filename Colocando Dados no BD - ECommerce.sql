use ecommerce;

show tables;

-- idClient,Fname, Minit, Lname, CPF , Address

insert into clients (Fname, Minit, Lname, CPF , Address)
            values('Maria','M','Silva',123456789,' Rua Silva de prata 29, Carangola - Cidade das flores'),
                  ('Matheus','O','Pimentel',987654321,' Rua Alemeda 289, Centro - Cidade das flores'),
                  ('Ricardo','F','Silva',45678913,' Rua Alemeda vinha 1009, Centro - Cidade das flores'),
                  ('Julia','S','França',789123456,' Rua Lareijras 861, Centro - Cidade das flores'),
                  ('Roberta','G','Assis',98745631,' Avenida Koller 19, Centro - Cidade das flores'),
                  ('Isabela','M','Cruz',654789123,' Rua Alemeda das Flores 28, Centro - Cidade das flores');
                  
-- idProduct , Pname , classification_kids, category, avaliação , size

insert into product(Pname , classification_kids, category, avaliação , size)
        values ('Fone de ouvido',false,'Eletrônico','4',null),
               ('Barbie Elsa',true,'Brinquedos','3',null),
               ('Body Carters',true,'Vestimenta','5',null),
               ('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
               ('Sofa retrátil',false,'Móveis','3','3x57x80'),
               ('Farinha de Arroz',false,'Alimentos','2',null),
               ('Fire Stick Amazon',false,'Eletrônico','3',null);
               
               
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
                                (1, null, 'compra via aplicativo',null,1),
                                (2, null, 'compra via aplicativo' , 50,0),
                                (3,'Confirmado', null, null, 1),
                                (4, null , 'compra via web site', 150,0);
               
-- idPOproduct , idPOorder , poQuantify, poStatus

insert into productOrder(idPOproduct , idPOorder , poQuantity, poStatus)
			values(1,1,2,null),
                  (2,1,1,null),
				  (3,2,1,null);
                  
				
insert into productStorage (storageLocation, quantify) values
                           ('Rio de Janeiro', 1000),
                           ('Rio de Janeiro', 500),
                           ('São Paulo', 10),
                           ('São Paulo', 100),
                           ('São Paulo', 10),
                           ('Brasilia', 60);
                           
insert into storageLocation(idLproduct, idLstorage, location) values
                       (1,2,'RJ'),
                       (2,6,'GO');
                       
                       
insert into supplier (SocialName, CNPJ, contact) values
              ('Almeida e filhos', 123456789123456, '21985474'),
              ('Eletrônicos Silva',854519649143457, '21985484'),
              ('Eletrônicos Valma' , 934567893934695, '21975474');
              
select * from supplier;
              
insert into productSupplier (idPsSupplier, IdPsProduct, quantity) values
           (1,1,500),
           (1,2,300),
           (2,4,633),
           (3,3,5),
           (2,5,10);
           
select * from productSupplier;
           
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
                ('Teen eletronies', null, 123456789456321, null, 'Rio de Janeiro', 1198657489 ),
                ('Botique Durgas' ,null, null, 123456783, 'Rio de Janeiro' , 219567895),
				('Kids World' , null, 456780123636485 , null, 'São Paulo' , 1198657481);
                
select * from seller;

insert into productSeller (idPseller, idProduct, prodQuantity) values
                             (3,5,60),
                             (2,2,10);
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           