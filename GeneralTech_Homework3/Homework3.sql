--Main сlass: General Tech  rec2wn2rBHkR70W5O
--Описание задания.1 уровень сложности: В рамках БД "онлайн-магазин" напишите след/запросы:

--#1  Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT 
ProductName, Price , ROUND(price*1.06 ,2) as Price_USD
FROM OrderDetails
JOIN Products ON Products.ProductID=OrderDetails.ProductID
order by price DESC
limit 1

--#2  Вывести два самых дорогих товара из категории Beverages из USA
SELECT Products.ProductID,	Products.ProductName,	Products.SupplierID,	Products.CategoryID,		Products.Price, 
Suppliers.Country, 
Categories.CategoryName
FROM Products 
join Suppliers on Suppliers.SupplierID=Products.SupplierID
join Categories on Categories.CategoryID=Products.CategoryID
where CategoryName="Beverages" and country= "USA"
order by price DESC
limit 2

--#3  Вывести заказы, добавив поле доставлено (или нет), учитывая, что доставлены только 10248 и 10249
SELECT *,
CASE 
  WHEN OrderID IN (10248, 10249) THEN 'Да'
           ELSE 'Нет'
       END AS Delivered
from Orders
      

--#4  Вывести список стран, которые поставляют морепродукты
select DISTINCT	Suppliers.SupplierID, Suppliers.Country,
Categories.CategoryID,	Categories.CategoryName,	Categories.Description
from Categories
join Products on Categories.CategoryID=Products.CategoryID
join Suppliers on Products.SupplierID=Suppliers.SupplierID
where CategoryName ="Seafood"
order by country

--#5  Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = ''
WHERE Country <> 'China'