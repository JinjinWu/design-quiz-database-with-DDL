SET search_path TO quizschema;
DROP TABLE IF EXISTS q1 CASCADE;
--Report the full name and student number of all students in the database.
CREATE TABLE q1(fullname varchar(100), student_number bigint);

INSERT INTO q1 select firstname || ' ' || lastname as fullname, sid as student_number
		from student;
select * from q1;
