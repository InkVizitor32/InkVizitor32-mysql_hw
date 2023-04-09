-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS format_seconds;
DELIMITER //


CREATE FUNCTION format_seconds(seconds INT, format_str VARCHAR(50))
RETURNS VARCHAR(50) READS SQL DATA
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE formatted_str VARCHAR(50);
    
    SET days = FLOOR(seconds / (60*60*24));
    SET seconds = seconds - (days * 60*60*24);
    SET hours = FLOOR(seconds / (60*60));
    SET seconds = seconds - (hours * 60*60);
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds - (minutes * 60);
    
    SET formatted_str = REPLACE(format_str, '%d', CAST(days AS CHAR));
    SET formatted_str = REPLACE(formatted_str, '%h', CAST(hours AS CHAR));
    SET formatted_str = REPLACE(formatted_str, '%m', CAST(minutes AS CHAR));
    SET formatted_str = REPLACE(formatted_str, '%s', CAST(secs AS CHAR));
    
    RETURN formatted_str;
END//
DELIMITER ;

SELECT format_seconds(123456, '%d days %h hours %m minutes %s seconds');




-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10



SELECT number FROM (SELECT 1 AS number UNION SELECT 2 UNION SELECT 3 
UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 
UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS numbers
WHERE number % 2 = 0;