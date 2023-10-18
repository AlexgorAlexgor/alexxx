--Вывести информацию о трех самых дорогих товарах не из China (проекция: названиетовара, ценатоваравusd, названиепоставщика, странапоставщика)

SELECT  
Products.ProductName,
    	Round(Products.Price*.92, 2) AS Price_USD,
    	Suppliers.SupplierName
FROM  Suppliers
Join Products using (SupplierID)
--on Products.SupplierID=Suppliers.SupplierID
Where Country != 'China'
Order by Price_USD Desc
Limit 3

--Вывести страны клиентов и поставщиков (за исключением USA)

select DISTINCT Country 
	from Suppliers  
		where Country != 'USA'
	UNION ALL
select DISTINCT Country
	from    Customers
		where Country != 'USA'

--Вывести названия проданных товаров
SELECT  DISTINCT ProductName
from OrderDetails JOIN Products USING (ProductID)
order by ProductName


--В рамках БД "стриминг-платформа":

--С помощью DDL создайте таблицу "комментарии юзеров к видео"
create database streaming;
CREATE TABLE comments (
	comment_id int,
    content varchar(64),
     stream_id int,
     author_id int,
    created_at timestamp,
   
);
 INSERT INTO comments ( comment_id , content,  stream_id , author_id ,created_at )
VALUES
	 (1, 'lucky video',5, 2, CURRENT_TIMESTAMP),
	(2, 'bad  film',4, 6, CURRENT_TIMESTAMP),	 
   (3, 'ok', 3, 7, CURRENT_TIMESTAMP),
   (4, 'power', 2, 8 , CURRENT_TIMESTAMP),
      (5, 'fanny', 1, 9, CURRENT_TIMESTAMP)

--Вывести три последних комментария, включая имена авторов и названия видео
database streaming;

SELECT comments.content , comments.created_at ,  streams.title , users.username , comments.created_at
from comments
JOIN users on users.user_id=comments.author_id
JOIN streams on streams.stream_id=comments.stream_id
order by comments.created_at 
limit 3