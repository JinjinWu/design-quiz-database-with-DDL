

set search_path to quizschema;
drop table if exists q5 cascade;

/* For each question on quiz Pr1-220310, report the number of students in the grade 8 class in room 120 with
Mr Higgins who got the question right, the number who got it wrong, and the number who did not answer it.
*/

create table q5 (qid INT, num_students_right INT, num_students_wrong INT, num_students_na INT);

drop view if exists students cascade;
--get every student in gr 8 in room 120 with mr higgins
create view students as select sid
                        from class, inclass
                        where inclass.cid = class.cid and room = 120 and grade = 8 and teacher = 'Mr Higgins'; 

create view quiz_questions as select qc.qid
			      from quiz_content qc, question q
			      where zid = 'Pr1-220310' and qc.qid = q.qid;

--get the students who got the question right
create view corrects as select count(distinct qr.sid) as num_students_right, qr.qid
		     from question_response qr, question q, students s, answerMC mc, answerTF tf, answerNUM n
		     where qr.sid = s.sid and qr.qid = q.qid and qr.zid = 'Pr1-220310' and
			((mc.qid = q.qid and response_MC NOTNULL and response_MC = mc.answer and mc.correct = true) or 
			 (tf.qid = q.qid and response_TF NOTNULL and response_TF = tf.answer) or 
			 (n.qid = q.qid and response_NUM NOTNULL and response_NUM = n.answer and n.correct = true))
		    group by qr.qid;

create view incorrects as select count(distinct qr.sid) as num_students_wrong, qr.qid
                     from question_response qr, question q, students s, answerMC mc, answerTF tf, answerNUM n
                     where qr.sid = s.sid and qr.qid = q.qid and qr.zid = 'Pr1-220310' and
                        ((mc.qid = q.qid and response_MC NOTNULL and response_MC = mc.answer and mc.correct = false) or 
                         (tf.qid = q.qid and response_TF NOTNULL and response_TF <> tf.answer) or 
                         (n.qid = q.qid and response_NUM NOTNULL and response_NUM <> n.answer and n.correct = true))
                    group by qr.qid;

create view none_answered as select count(distinct qr.sid) as num_students_na, qr.qid
			    from question_response qr, question q, students s, answerMC mc, answerTF tf, answerNUM n
                     where qr.sid = s.sid and qr.qid = q.qid and qr.zid = 'Pr1-220310' and
                        response_MC ISNULL and response_TF ISNULL and response_NUM ISNULL
                    group by qr.qid;


insert into q5 select qq.qid, num_students_right, num_students_wrong, num_students_na
		from corrects c, incorrects i, none_answered na, quiz_questions qq
		where qq.qid = c.qid and qq.qid = i.qid and qq.qid = na.qid;

select * from q5;


