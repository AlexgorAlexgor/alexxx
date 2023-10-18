-- Main сlass: General Tech
--Описание задания.В рамках БД "песочница"

-- 1. Вывести телефоны всех поставщиков, кроме тех, что из Germany и France.
SELECT * FROM [Suppliers]
where country not in ("Germany", "France")


--2. Для товаров до 10 EUR установить категорию 8 и применить наценку в 20%.
SELECT * , 
round(price*1.2,2) as Price_update_20perc
FROM [Products]
where price <=10 and CategoryID =8


--3.  Удалить поставщиков из USA и Germany.
DELETE 
FROM Suppliers 
WHERE Country in ('USA','Germany')



--4. Добавить два поставщика из Spain с произвольными номерами телефонов.
INSERT INTO Suppliers (Country, Phone)
VALUES ("Spain", "(34)86306418"),
	   ("Spain", "(34)86306418");
       

--5. Вывести все товары до 20 EUR из категорий 3 и 6 по убыванию цены.
SELECT * 
FROM [Products]
where price <= 20 and CategoryID in (3,6)
order by Price DESC


-6. Вывести три самых дорогих товара до 200 EUR.
SELECT * FROM [Products]
where Price <= 200
order by price desc
limit 3

