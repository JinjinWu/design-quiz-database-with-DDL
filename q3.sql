

set search_path to quizschema;
drop table if exists q3 cascade;
--Compute the total grade on quiz Pr1-220310 for every student in the grade 8 class in room 120 with
--Mr Higgins. Report the student number, last name, and total grade.
create table q3(student_number BIGINT, last_name varchar(50), total_grade INT);

drop view if exists students cascade;
drop view if exists students_quiz cascade;
--students in mr higgins grade 8 room 120 class who took Pr1-220310
create view students as select sid
                        from class, inclass
                        where inclass.cid = class.cid and room = 120 and grade = 8 and teacher = 'Mr Higgins'; 

create view students_quiz as select qr.sid
			from quiz_response qr, students, quiz
			where qr.sid = students.sid and qr.zid = 'Pr1-220310' and qr.zid = quiz.zid;
--mc mark
create view correctMc as select s.sid, count(qr.qid) as correct, q.qid
			from students_quiz s, question_response qr, question q, answerMC mc
			where s.sid = qr.sid and qr.qid = q.qid and
				(mc.qid = qr.qid and response_MC = mc.answer and mc.correct = true)
			group by s.sid, q.qid;

--tf mark
create view correcttf as select s.sid, count(qr.qid) as correct, q.qid
                        from students_quiz s, question_response qr, question q, answerTF tf
                        where s.sid = qr.sid and qr.qid = q.qid and (tf.qid = qr.qid and response_TF = tf.answer)
                        group by s.sid, q.qid;

--numeric mark
create view correctNUM as select s.sid, count(qr.qid) as correct, q.qid
                        from students_quiz s, question_response qr, question q, answerNUM n
                        where s.sid = qr.sid and qr.qid = q.qid and
                                (n.qid = qr.qid and response_NUM = n.answer and n.correct = true)
                        group by s.sid, q.qid;
--total mark
create view totalmark as 
                        select a.sid, sum(mark) as total_mark
                        from ((select c.sid, count(c.qid) * qc.weight as mark
                                        from correctMC c, quiz_content qc
                                        where c.qid = qc.qid 
                                        group by c.sid, c.qid, qc.weight) UNION
			      (select c.sid, count(c.qid) * qc.weight as mark
			      from correcttf c, quiz_content qc
                                        where c.qid = qc.qid  
                                        group by c.sid, c.qid, qc.weight) UNION
				(select c.sid, count(c.qid) * qc.weight as mark
                                        from correctNUM c, quiz_content qc
                                        where c.qid = qc.qid  
                                        group by c.sid, c.qid, qc.weight))  as a
                        group by a.sid;

insert into q3 select tm.sid as student_number, s.lastname as last_name, total_mark as total_grade 
		from totalmark tm, student s
		where tm.sid = s.sid;

select * from q3;
