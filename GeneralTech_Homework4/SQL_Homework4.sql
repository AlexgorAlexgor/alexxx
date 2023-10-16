/* Main сlass: General Tech

Описание задания.

 1 уровень сложности: В рамках БД streaming написать след/запросы: */


-- --Наполнить произвольными данными таблицы streams, reactions, donations
-- Создание таблиц / БД streaming
create database streaming;
CREATE TABLE users (
		user_id int,
    created_at timestamp,
    username varchar(32),
    country varchar(32),
    is_blocked bool
);

CREATE TABLE streams (
		stream_id int,
    created_at timestamp,
    author_id int,
    title varchar(128),
    is_completed bool
);

CREATE TABLE reactions (
		reaction_id int,
    created_at timestamp,
    author_id int,
    stream_id int,
    `value` int
);

CREATE TABLE donations (
		donation_id int,
    created_at timestamp,
		amount decimal(7, 2),
    donator_id int,
    stream_id int
);

INSERT INTO users (user_id, created_at, username, country, is_blocked)
VALUES
	 (1, CURRENT_TIMESTAMP, NULL, 'USA', false),
	 (2, CURRENT_TIMESTAMP, NULL, 'USA', false),
	 (3, CURRENT_TIMESTAMP, NULL, 'Germany', false),
   (4, CURRENT_TIMESTAMP, NULL, 'Germany', false),
   (5, CURRENT_TIMESTAMP, NULL, 'China', false);

   INSERT INTO streams (stream_id , created_at , author_id , title , is_completed)
VALUES
	 (1, CURRENT_TIMESTAMP, 1, 'in USA', true),
	 (2, CURRENT_TIMESTAMP, 2, 'with USA', true),
	 (3, CURRENT_TIMESTAMP, 3, 'ohne Germany', true),
   (4, CURRENT_TIMESTAMP, 4, 'per Germany', true),
   (5, CURRENT_TIMESTAMP, 5, 'or China', true);

    INSERT INTO reactions ( reaction_id , created_at , author_id , stream_id ,`value` )
VALUES
	 (1, CURRENT_TIMESTAMP, 5, 2, 3),
	 (2, CURRENT_TIMESTAMP, 6, 3, 4),
	 (3, CURRENT_TIMESTAMP, 7, 5, 5),
   (4, CURRENT_TIMESTAMP, 8, 4, 1),
   (5, CURRENT_TIMESTAMP, 9, 1, 2);
   
 INSERT INTO donations ( donation_id , created_at , amount, donator_id , stream_id )
VALUES
	 (1, CURRENT_TIMESTAMP, 65.43, 6, 3),
	 (2, CURRENT_TIMESTAMP, 36.25, 5, 4),
	 (3, CURRENT_TIMESTAMP, 79.12, 4, 5),
   (4, CURRENT_TIMESTAMP, 18.39, 7, 1),
   (5, CURRENT_TIMESTAMP, 9.90, 1, 2);

--Вывести информацию по стримам (проекция: имя_автора, название_стрима)
SELECT title, username 
from users as U
JOIN steams as S on U.user_id=S.author_id

-- Вывести список пожертвований в порядке убывания размера (проекция: размерпожертвования, имядонатара, название_стрима)


SELECT D.amount , U.username , S.title 
FROM donations as D
left JOIN users as U on U.user_id=D.donator_id
left JOIN steams as S on U.user_id=S.author_id
order by D.amount DESC