

/*
1. constrints which weren't enforced: 
    - Room can have two classes in it.
    - Room can never have more than one teacher
    - multiple choice always have at least two options
2. constraints that could've been enforced:
    - Multiple choice always have at least two options: solution could be somehow keep an instance of a single
           MC question in a table and have pointers to choices, and number of those pointers have to be >= 2.
*/

DROP SCHEMA IF EXISTS quizschema CASCADE;
CREATE SCHEMA quizschema;
SET SEARCH_PATH to quizschema;

CREATE TABLE student(
    sid BIGINT primary key,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);

CREATE TABLE class(
    cid INT primary key,
    room INT NOT NULL,
    grade INT NOT NULL,
    teacher VARCHAR(50) NOT NULL
);

CREATE TABLE inclass(
    sid BIGINT REFERENCES student(sid),
    cid INT REFERENCES class(cid),
    PRIMARY KEY(sid, cid)
);

CREATE TYPE q_type AS ENUM(
    'TF', 'MC', 'NUM');

CREATE TABLE question(
--
    qid INT primary key,
    question_text TEXT,
    type q_type
);


CREATE TABLE answerMC(
    aid INT primary key,
    qid INT REFERENCES question(qid),
    answer TEXT,
    correct BOOLEAN NOT NULL,
    hint TEXT
);


CREATE TABLE answerTF(
    aid INT primary key,
    qid INT REFERENCES question(qid),
    answer BOOLEAN
);

CREATE TABLE answerNUM(
    aid INT primary key,
    qid INT REFERENCES question(qid),
    answer INT,
    lower INT,
    upper INT,
    correct BOOLEAN NOT NULL,
    hint TEXT
);

CREATE TABLE quiz(
    zid VARCHAR(50) primary key,
    title VARCHAR(100) NOT NULL,
    duedate TIMESTAMP NOT NULL,
    cid INT REFERENCES class(cid),
    hint BOOLEAN NOT NULL
);

CREATE TABLE quiz_content(
    zid VARCHAR(50) REFERENCES quiz(zid),
    qid INT REFERENCES question(qid),
    weight INT DEFAULT 0,
    PRIMARY KEY(zid, qid)
);

CREATE TABLE quiz_response(
    sid BIGINT REFERENCES student(sid),
    zid VARCHAR(50) REFERENCES quiz(zid),
    PRIMARY KEY(sid, zid)
);

CREATE TABLE question_response(
    sid BIGINT REFERENCES student(sid),
    zid VARCHAR(50) REFERENCES quiz(zid),
    qid INT REFERENCES question(qid),
    response_MC TEXT,
    response_TF BOOLEAN,
    response_NUM INT,
    PRIMARY KEY(sid, zid, qid)
);


