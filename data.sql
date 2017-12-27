

INSERT INTO student VALUES
(2222222222, 'Maisie', 'Williams'),
(0998801234, 'Lena', 'Headey'),
(0010784522, 'Peter', 'Dinklage'),
(0997733991, 'Emilia', 'Clarke'),
(5555555555, 'Kit', 'Harrington'),
(1111111111, 'Sophie', 'Turner');

INSERT INTO class VALUES
(1, 366, 5, 'Miss Nyers'),
(2, 120, 8, 'Mr Higgins');

INSERT INTO inclass VALUES
(2222222222, 1),
(0998801234, 2),
(0010784522, 2),
(0997733991, 2),
(5555555555, 2),
(1111111111, 2);

INSERT INTO question VALUES
(782, 'What do you promise when you take the oath of citizenship?', 'MC'),
(566, 'The Prime Minister, Justin Trudeau, is Canada''s Head of State', 'TF'),
(601, 'During the "Quiet Revolution," Quebec experienced rapid change. In what decade did this occur? (Enter the year that began the decade, e.g., 1840.', 'NUM'),
(625, 'What is the Underground Railroad?', 'MC'),
(790, 'During the War of 1812 the Americans burned down the Parliament Buildings in York (now Toronto). What did the British and Canadians do in return?', 'MC');

INSERT INTO answerMC VALUES
(7821, 782, 'To pledge your loyalty to the Sovereign, Queen Elizabeth II', true, NULL),
(7822, 782, 'To pledge your allegiance to the flag and fulfill the duties of a Canadian', false, 'Hint: Think regally.'),
(7823, 782, 'To pledge your loyalty to Canada from sea to sea', false, NULL),
(6251, 625, 'The first railway to cross Canada', false, 'Hint: The Underground Railroad was generally south to north, not east-west.'),
(6252, 625, 'The CPR''s secret railway line', false, 'Hint: The Underground Railroad was secret, but it had nothing to do with trains.'),
(6253, 625, 'The TTC subway system', false, 'Hint: The TTC is relatively recent; the Underground Railroad was in operation over 100 years ago.'),
(6254, 625, 'A network used by slaves who escaped the United States into Canada', true, NULL),
(7901, 790, 'They attacked American merchant ships', false, NULL),
(7902, 790, 'They expanded their defence system, including Fort York', false, NULL),
(7903, 790, 'They burned down the White House in Washington D.C.', true, NULL),
(7904, 790, 'They captured Niagra Falls', false, NULL);

INSERT INTO answerTF VALUES
(5661, 566, false);

INSERT INTO answerNUM VALUES
(6011, 601, 1960, NULL, NULL, true, NULL),
(6012, 601, NULL, 1800, 1900, false, 'The Quiet Revolution happened during the 20th Century.'),
(6013, 601, NULL, 2000, 2010, false, 'The Quiet Revolution happened some time ago.'),
(6014, 601, NULL, 2020, 3000, false, 'The Quiet Revolution has already happened!');

INSERT INTO quiz VALUES
('Pr1-220310', 'Citizenship Test Practise Questions', '2017-10-01 13:30:00', 2, true);

INSERT INTO quiz_content VALUES
('Pr1-220310', 601, 2),
('Pr1-220310', 566, 1),
('Pr1-220310', 790, 3),
('Pr1-220310', 625, 2);

INSERT INTO quiz_response VALUES
(0998801234, 'Pr1-220310'),
(0010784522, 'Pr1-220310'),
(0997733991, 'Pr1-220310'),
(5555555555, 'Pr1-220310'),
(1111111111, 'Pr1-220310');

INSERT INTO question_response VALUES
(0998801234, 'Pr1-220310', 601, NULL, NULL, 1950),
(0998801234, 'Pr1-220310', 566, NULL, false, NULL),
(0998801234, 'Pr1-220310', 790, 'They expanded their defence system, including Fort York', NULL, NULL),
(0998801234, 'Pr1-220310', 625, 'A network used by slaves who escaped the United States into Canada', NULL, NULL),

(0010784522, 'Pr1-220310', 601, NULL, NULL, 1960),
(0010784522, 'Pr1-220310', 566, NULL, false, NULL),
(0010784522, 'Pr1-220310', 790, 'They burned down the White House in Washington D.C.', NULL, NULL),
(0010784522, 'Pr1-220310', 625, 'A network used by slaves who escaped the United States into Canada', NULL, NULL),

(0997733991, 'Pr1-220310', 601, NULL, NULL, 1960),
(0997733991, 'Pr1-220310', 566, NULL, true, NULL),
(0997733991, 'Pr1-220310', 790, 'They burned down the White House in Washington D.C.', NULL, NULL),
(0997733991, 'Pr1-220310', 625, 'The CPR''s secret railway line', NULL, NULL),

(5555555555, 'Pr1-220310', 601, NULL, NULL, NULL),
(5555555555, 'Pr1-220310', 566, NULL, false, NULL),
(5555555555, 'Pr1-220310', 790, 'They captured Niagra Falls', NULL, NULL),
(5555555555, 'Pr1-220310', 625, NULL, NULL, NULL),

(1111111111, 'Pr1-220310', 601, NULL, NULL, NULL),
(1111111111, 'Pr1-220310', 566, NULL, NULL, NULL),
(1111111111, 'Pr1-220310', 790, NULL, NULL, NULL),
(1111111111, 'Pr1-220310', 625, NULL, NULL, NULL);


