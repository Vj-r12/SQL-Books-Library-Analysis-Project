SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;



/*****  Find Library_info and Student_info details based on specific condition *****/ 


-- Find library_info details under Books_Id LB21.

SELECT *
FROM LIBRARY_INFO
WHERE BOOKS_ID = 'LB21';

--Find Student_info details under Student_Id SID99.

SELECT *
FROM STUDENT_INFO
WHERE STUDENT_ID = 'SID99';

--Find library_info details under Books_Id LB1 AND Book_author Narayana Murthy.

SELECT *
FROM LIBRARY_INFO
WHERE BOOKS_ID = 'LB1'
	AND BOOK_AUTHOR = 'Narayana Murthy';

--Find Student_info details under Student_Id OR Student_Name.

SELECT *
FROM STUDENT_INFO
WHERE STUDENT_ID = 'SID7'
	OR STUDENT_NAME = 'Samruddhi';

--Find Library_info details under NOT Book_Title 'The Wind In Willows'.

SELECT *
FROM LIBRARY_INFO
WHERE NOT BOOK_TITLE = 'The Wind In Willows';

--Find Library_info details under Book_Title NOT IN 'Think and Grow','My Experiments with Truth'.

SELECT *
FROM LIBRARY_INFO
WHERE BOOK_TITLE NOT IN ('Think and Grow','My Experiments with Truth');

--Find Books_return_info details under Due_Days BETWEEN 1 AND 5.

SELECT *
FROM BOOKS_RETURN_INFO
WHERE DUE_DAYS BETWEEN 1 AND 5;

--Find Library_info details under In Book_Category.

SELECT *
FROM LIBRARY_INFO
WHERE BOOK_CATEGORY IN ('Education','Business','Fiction');

--Find Books_return_info details under Book_title NULL.

SELECT *
FROM BOOKS_RETURN_INFO
WHERE BOOK_TITLE IS NULL;

--Find Books_return_info details under Book_title is not null.

SELECT *
FROM BOOKS_RETURN_INFO
WHERE BOOK_TITLE IS NOT NULL;


SELECT *
FROM BOOKS_RETURN_INFO;

--Find books_return_info details under due_days Greater than 5.

SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
WHERE DUE_DAYS > 5;

--Find books_return_info details under penalty_per_day less than 2.2 .

SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
WHERE PENALTY_PER_DAY < 2.2;

--Find books_return_info details under penalty_amount_paid Greater than equals to 25.

SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
WHERE PENALTY_AMOUNT_PAID >= 25;

--Find books_return_info details under penalty_amount_paid less than equals to 60.

SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
WHERE PENALTY_AMOUNT_PAID <= 60;

--Find books_return_info details under penalty_per_day equal to 2.3.

SELECT *
FROM BOOKS_RETURN_INFO
WHERE PENALTY_PER_DAY = 2.3;

--Find books_return_info details under penalty_amount_paid Not equals to 15.5 .

SELECT *
FROM BOOKS_RETURN_INFO
WHERE PENALTY_AMOUNT_PAID <> 15.5;



/******   Search for specified pattern in a column. (Like, wildcards)   ******/ 

--Find Library_info under Book_title starts with A.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like 'A%';

--Find Library_info under Book_title End with S.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like '%s';

--Find Library_info under Book_title Starts with Th.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like 'Th%';

--Find Library_info under Book_title contain third alphabet a.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like '__a%';

--Find Library_info under Book_title start with H. OR End with t.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like 'H%'
	OR BOOK_TITLE like '%t';

--Find Library_info under Book_title contain last third alphabet c.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_TITLE like '%C__';

--Find Student_info under Student_name NOT Start with B.

SELECT STUDENT_ID,
	STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_NAME NOT LIKE 'B%';

--Find Student_info under Student_name NOT End with a.

SELECT STUDENT_ID,
	STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_NAME NOT LIKE '%a';

--Find Student_info under Student_name NOT Start with Ab.

SELECT STUDENT_ID,
	STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_NAME NOT LIKE 'Ab%';

--Find Student_info under Student_name NOT contain third alphabet r. AND second alphabet i.

SELECT STUDENT_ID,
	STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_NAME NOT LIKE '___r%'
	AND STUDENT_NAME NOT LIKE 'i%';