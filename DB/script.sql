CREATE TABLE IF NOT EXISTS language
(
    ID   varchar(2)   not null, # 'ru'
    NAME varchar(200) not null, # 'Russian'
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS movie_title
(
    TITLE       varchar(200) not null,              # 'Name film'
    LANGUAGE_ID varchar(2)   not null, # 'ru'
    MOVIE_ID    int          not null,

    PRIMARY KEY (TITLE),
    FOREIGN KEY FK_MT_MOVIE (MOVIE_ID)
        REFERENCES movie (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY FK_MT_LANGUAGE (LANGUAGE_ID)
        REFERENCES language (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);
INSERT INTO language (ID, NAME)
VALUES ('ru', 'Russian'),
       ('en', 'English'),
       ('de', 'German');

START TRANSACTION ;
INSERT INTO movie_title (MOVIE_ID, LANGUAGE_ID, TITLE)
SELECT ID, 'ru', TITLE FROM movie;

ALTER TABLE movie
    DROP TITLE;
COMMIT;