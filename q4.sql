

set search_path to quizschema;
drop table if exists q4 cascade;

--. For every student in the grade 8 class in room 120 with Mr Higgins, and every question from quiz Pr1-220310
--that they did not answer, report the student ID, the question ID, and the question text.
create table q4(student_id BIGINT, question_id INT, question_text varchar(50));

drop view if exists students cascade;
--get every student in gr 8 in room 120 with mr higgins
create view students as select sid
			from class, inclass
			where inclass.cid = class.cid and room = 120 and grade = 8 and teacher = 'Mr Higgins';

-- get the students that did not answer the question
create view didAnswer as select qr.sid as student_id, qr.qid as question_id, question_text::varchar(50)
			 from question_response qr, question q, students s
			where qr.sid = s.sid and qr.qid = q.qid and zid = 'Pr1-220310' and response_MC ISNULL and response_TF ISNULL and response_NUM ISNULL;

insert into q4 select * from didAnswer;

select * from q4;


