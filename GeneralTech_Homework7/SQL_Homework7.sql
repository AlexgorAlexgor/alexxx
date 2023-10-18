-- Main сlass: General Tech  receLdHvRBICnwILO
--Описание задания. Конспект занятия https://western-appeal-39b.notion.site/GenTech-7-Jul-13-2023-0a402acb73d14fd4884c9a779f129a92?pvs=4 
 -- В рамках БД "песочница: интернет-магазин" напишите след/запросы:

-- #1  Найти мин/стоимость товаров для каждой категории

SELECT Categories.CategoryID,
  Categories.CategoryName ,
  min(Price) as min_price 
FROM [Products] 
join Categories using (CategoryID)
group by CategoryID 

/* 
Result:
CategoryID	CategoryName	min_price
    1	          Beverages	     4.5
    2	          Condiments	    10
    3	          Confections	    9.2
    4	          Dairy Products	2.5
    5	          Grains/Cereals	7
    6	          Meat/Poultry	  7.45
    7	          Produce	        10
    8	          Seafood	        6     */

-- #2 ВВывести ТОП-3 стран по количеству доставленных заказов

SELECT 
  Customers.Country ,
  count(Country) as count_delivered  
FROM [Orders] 
join Customers using (CustomerID)
group by Country
order by count_delivered Desc
limit 3

/* 
Result:
Country	count_delivered
  USA	    29
  Germany	25
  Brazil	19 */

-- #3 Вывести названия категорий, в которых более 10 товаров

SELECT Categories.CategoryName ,
  count(CategoryID) as count_in_category 
FROM [Products]
join Categories using (CategoryID)
group by Products.CategoryID
HAVING count_in_category > 10 

/* 
Result:
 CategoryName	count_in_category
  Beverages	      12
  Condiments    	12
  Confections   	13
  Seafood	        12
 */
-- #4 Очистить тел/номер поставщикам из USA

UPDATE Suppliers
SET Phone = ''
where Country is "USA" 	
/* 
Result:
You have made changes to the database. Rows affected: 4

SELECT * FROM [Suppliers]
where Country is "USA" 	
 */

-- #5 Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT Employees.FirstName ,
  Employees.LastName ,
  count(Orders.OrderID)as count_Employey 
FROM Orders 
join Employees using (EmployeeID)
group by EmployeeID 
HAVING count_Employey <15 
order by count_Employey desc
/* 
Result:
Number of Records: 3
FirstName	LastName	count_Employey
  Robert	King	    14
  Steven	Buchanan	11
  Anne	Dodsworth 	6
  */ 



