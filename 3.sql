DROP DATABASE IF EXISTS hw3;
CREATE DATABASE hw3;
USE hw3;


CREATE TABLE staff
(
    id INT
    AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	firstname  VARCHAR
    (45) NOT NULL, 
    lasttname  VARCHAR
    (45) NOT NULL,
    post VARCHAR
    (45) NOT NULL,  
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL
);


    INSERT INTO staff
        (firstname, lastname, post, seniority, salary, age)
    VALUES
        ('Вася', 'Петров', 'Начальник', '40', 100000, 60),
        ('Петр', 'Власов', 'Начальник', '8', 70000, 30),
        ('Катя', 'Катина', 'Инженер', '2', 70000, 25),
        ('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
        ('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
        ('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
        ('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
        ('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
        ('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
        ('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
        ('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
        ('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);




ALTER TABLE staff
RENAME COLUMN lasttname TO lastename; --:)


-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
-- возрастания

SELECT * FROM staff
ORDER BY salary;


SELECT * FROM staff
ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (saraly)

SELECT * FROM staff
ORDER BY salary DESC LIMIT 5;



-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, sum(salary) as 'общая сумма'
		FROM staff
		GROUP BY post;
		

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий»
-- в возрасте от 24 до 49 лет включительно.


SELECT post,count(*) as 'количество сотрудников'
FROM staff
WHERE  age BETWEEN 24 AND 49
GROUP BY post
HAVING post = 'Рабочий';



-- Найдите количество специальностей

SELECT  count(DISTINCT post) as ' количество профессий'
	FROM staff


-- Выведите специальности, у которых средний возраст сотрудников меньше 33 лет


SELECT  post
FROM staff
GROUP BY post
HAVING AVG(age) > 33;






 