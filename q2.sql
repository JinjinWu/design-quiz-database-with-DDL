SET SEARCH_PATH to quizschema;
DROP TABLE IF EXISTS q2 CASCADE;
/*For all questions in the database, report the question ID, question text, and the number of hints associated
with it. For True-False questions, report NULL as the number of hints (since True-False questions cannot have
hints).*/
create table q2(question_id integer, question_text varchar(50), number_hints INT);

--get the number of hints from every question
create view mcNumHints as select question.qid as question_id, question_text::varchar(50), count(hint) as number_hints
			  from question JOIN answerMC ON (question.qid = answerMC.qid)
			  group by question.qid, question_text;

create view numHints as select question.qid as question_id, question_text::varchar(50), count(hint) as number_hints
			from question JOIN answerNUM ON (question.qid = answerNUM.qid)
			group by question.qid, question_text;

create view tfHints as select question.qid as question_id, question_text::varchar(50), cast(null as INT) as number_hints
			from question join answerTF ON (question.qid = answerTF.qid)
			group by question.qid, question_text;

/*create view hints as select q.qid, question_text, count(hint) as number_hints
		    from question q, answerMC mc, answerNUM num, answerTF tf
		    where q.qid = mc.qid or q.qid = num.qid or q.qid = answertf.qid
		    group by q.qid, question_text;
*/
INSERT INTO q2 (select * from mcNumHints) UNION ALL (select * from numHints) UNION ALL 
		(select question_id, substring(question_text, 1, 50), number_hints from tfHints);
--INSERT INTO q2 select * from hints;
select * from q2;
