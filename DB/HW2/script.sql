# ALTER TABLE movie_title ADD ROLE varchar(20) not null;
CREATE TABLE people
(
    ID   int          not null auto_increment,
    NAME varchar(200) not null, # может лучше ключом сделать имя?

    PRIMARY KEY (ID)
);


CREATE TABLE movie_people
(
    MOVIE_ID          int          not null,
    PEOPLE_ID         int          not null,
    ROLE              varchar(256) not null,
    NAME_OF_CHARACTER varchar(200),
    PRIMARY KEY (MOVIE_ID, PEOPLE_ID),
    FOREIGN KEY FK_MP_MOVIE (MOVIE_ID)
        REFERENCES movie (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY FK_MP_PEOPLE (PEOPLE_ID)
        REFERENCES people (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS ROLES
(
    ID varchar(256) not null,
    PRIMARY KEY (ID)
);


# Задание 2
# 1. Поиск всех людей участвовавщих в конкретном фильме
# 2. Поиск людей, которые имели Имя персонажа
# 3. Колличество людей, которые одновременно были режиссером и продюссером в определенном фильме
# 4. Выборка людей, участвовавших в одном опредленном фильме


# а) Найти людей, которые одновременно были режиссером и продюссером какого-либо фильма
SELECT p.NAME
FROM people p,
     director d
         INNER JOIN movie m ON d.ID = m.DIRECTOR_ID
         INNER JOIN movie_people mp ON m.ID = mp.MOVIE_ID and mp.ROLE = 'Продюссер'
WHERE d.NAME = p.NAME;

# б) Найти все фильмы, имеющие двойников по названию на русском языке.
SELECT m.ID
FROM movie m
         INNER JOIN movie_title mt ON m.ID = mt.MOVIE_ID
WHERE  mt.TITLE = 'ru' GROUP BY m.ID HAVING COUNT(*) > 1;


