-- Main сlass: General Tech  recfTv7Lxz0AQSOR2
--Описание задания.
 --1 уровень сложности: В рамках БД "песочница: интернет-магазин" напишите след/запросы:
-- #1  Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT() as Suppliers_is_not_from_UK_und_not_from_China FROM Suppliers
where Country not in("UK","China")


-- #2 Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
COUNT(*) AS total_products,
 MAX(Price) AS max_price,
  MIN(Price) AS min_price,
    AVG(Price) AS avg_price
FROM Products
 where CategoryID in (3,5)

-- #3 Вывести общую сумму проданных товаров
SELECT 
SUM(Products.Price * OrderDetails.Quantity) AS total_order_cost
FROM [OrderDetails]
join Products
using (ProductID)

-- #4 Вывести ко-во стран, которые поставляют напитки
SELECT DISTINCT 	COUNT(*) AS Suppliers_Country
FROM [Products] 
join Suppliers using (SupplierID) 
join Categories using (CategoryID)
where CategoryName = "Beverages"

-- #5 Вывести сумму, на которую было отправлено товаров клиентам в USA
SELECT SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM [Products] 
join OrderDetails using (ProductID) 
join Suppliers using (SupplierID)
where Country = "USA"




