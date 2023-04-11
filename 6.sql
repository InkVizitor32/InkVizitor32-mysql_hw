Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру,
с помощью которой можно переместить любого (одного) пользователя
из таблицы users в таблицу users_old.
(использование транзакции с выбором commit или rollback – обязательно).


DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users_old (id, firstname, lastname, email) VALUES 
(1, 'Олег', 'Олегов', 'sgfsdfg@example.org'),
(2, 'Иван', 'Иванов', 'edrfw.wefsd@example.org'),
(3, 'Масксим', 'Масксимов', 'qwe33@example.org'),
(4, 'Марк', 'Марков', 'dfgdfg@example.net'),
(5, 'Федр', 'Федорыч', 'dfdfgd.dfgdfcvb@example.net'),
(6, 'Анна', 'Иванна', 'k;liukilo@example.net'),
(7, 'Ася', 'Брауновна', 'itiol.ui.beahan@example.com'),
(8, 'Лэйла', 'Самсонова', 'ulhft.cvxdfds@example.com'),
(9, 'Мария', 'Оранж', 'xcvdfv@example.org'),
(10, 'Джордж', 'Жоржович', 'edrghtr@example.com');




DROP PROCEDURE IF EXISTS procedure_name;
DELIMITER //
CREATE PROCEDURE move_user(
  IN num1 INT
)
DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname,lastname,email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = num1;
DELETE FROM users 
	WHERE id = num1;
COMMIT;
END //
DELIMITER ;

CALL move_user(2);





-- Создайте хранимую функцию hello(), которая будет возвращать приветствие,
-- в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".


DELIMITER //

CREATE FUNCTION hello()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE current_time TIME;
    DECLARE greeting VARCHAR(50);
    
    SET current_time = CURRENT_TIME();
    
    IF (current_time >= '06:00:00' AND current_time < '12:00:00') THEN
        SET greeting = 'Доброе утро';
    ELSEIF (current_time >= '12:00:00' AND current_time < '18:00:00') THEN
        SET greeting = 'Добрый день';
    ELSEIF (current_time >= '18:00:00' OR current_time < '00:00:00') THEN
        SET greeting = 'Добрый вечер';
    ELSEIF (current_time >= '00:00:00' OR current_time < '06:00:00') THEN
        SET greeting = 'Доброй ночи';    
    END IF;
    
    RETURN greeting;
END //

DELIMITER ;

