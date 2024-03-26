# ALTER TABLE movie_title ADD ROLE varchar(20) not null;
CREATE TABLE people
(
    ID int not null auto_increment,
    NAME varchar(200) not null , # может лучше ключом сделать имя?

    PRIMARY KEY (ID)
);


CREATE TABLE movie_people
(
    MOVIE_ID int not null,
    PEOPLE_ID int not null,
    ROLE varchar(256) not null,
    NAME_OF_CHARACTER varchar(200),
    PRIMARY KEY (MOVIE_ID, PEOPLE_ID),
    FOREIGN KEY FK_MP_MOVIE (MOVIE_ID)
        REFERENCES movie(ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY FK_MP_PEOPLE (PEOPLE_ID)
        REFERENCES people(ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS ROLES
(
    ID varchar(256) not null,
    PRIMARY KEY (ID)
);