-- 1. Создайте представление, в которое попадет информация о пользователях
-- (имя, фамилия, город и пол),
-- которые не старше 20 лет.



CREATE VIEW view_new1
AS
    SELECT
        firstname, lastname, hometown, gender
    FROM
        users
        JOIN
        profiles ON users.id = profiles.user_id
    WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) < 20;

SELECT *
from view_new1;



-- 2. Найдите кол-во,  отправленных сообщений каждым пользователем и
-- выведите ранжированный список пользователей,
-- указав имя и фамилию пользователя,количество отправленных сообщений и место в рейтинге
-- (первое место у пользователя с максимальным количеством сообщений).
-- (используйте DENSE_RANK)



CREATE VIEW view_new777
AS
SELECT   DISTINCT CONCAT(firstname, ' ', lastname) as 'name',  
 COUNT(from_user_id) OVER (partition by users.id ) as ff
FROM lesson_4.users
JOIN lesson_4.messages ON users.id = lesson_4.messages.from_user_id
order by ff desc;


select *, 
DENSE_RANK() OVER(ORDER BY ff desc) AS 'DENSE_RANK'
from view_new777;



-- 3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at)
-- и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)

use lesson_4;
select body, created_at, 
lag (created_at) over(ORDER BY created_at) as 'предыдущее сообщение',
TIMESTAMPDIFF(second,(lag (created_at) over(ORDER BY created_at)), created_at) as 'разница в сек.'
from messages;