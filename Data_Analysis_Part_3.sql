SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;



--Select all from the library_info table sort AESCENDING by the "Book_Title" column.

SELECT *
FROM LIBRARY_INFO
ORDER BY BOOK_TITLE ASC;

--Select all from the Student_info table sort DESCENDING by the "student_name" column.

SELECT *
FROM STUDENT_INFO
ORDER BY STUDENT_NAME DESC;

--Find all from the Library_info and arrange Book_author in ascending and Book_category in descending order.

SELECT *
FROM LIBRARY_INFO
ORDER BY BOOK_AUTHOR ASC,
	BOOK_CATEGORY DESC;

--Select all from the Books_return_info order by.

SELECT *
FROM BOOKS_RETURN_INFO
ORDER BY PENALTY_PER_DAY;

--Find library_info fetch ten records.

SELECT BOOKS_ID,
	BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY
FROM LIBRARY_INFO
LIMIT 10;

--Find books_return_info fetch five records by penalty_amount_paid.

SELECT PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
LIMIT 5;

--Find Student_info fetch five records & Skip 2 records.

SELECT STUDENT_ID,
	STUDENT_NAME
FROM STUDENT_INFO
LIMIT 5
OFFSET 2;



/******   Aggregate Functions using COUNT,MIN,MAX,AVG,SUM,DISTINCT    ******/


SELECT *
FROM BOOKS_RETURN_INFO;

--Find total rows of books_return_info.

SELECT COUNT(*)
FROM BOOKS_RETURN_INFO;

--Find books_return_info under due_days smallest .

SELECT MIN(DUE_DAYS)
FROM BOOKS_RETURN_INFO;

--Find books_return_info under Due_Days biggest.

SELECT MAX(DUE_DAYS)
FROM BOOKS_RETURN_INFO;

--Find books_return_info under Due_Days medium.

SELECT AVG(DUE_DAYS)
FROM BOOKS_RETURN_INFO;

--Find total amount of penalty_amount_paid.

SELECT SUM(PENALTY_AMOUNT_PAID)
FROM BOOKS_RETURN_INFO;

--Find books_return_info under book_title original.

SELECT DISTINCT(BOOK_TITLE)
FROM BOOKS_RETURN_INFO;

--Find total due_days & penalty_per_day.

SELECT SUM(DUE_DAYS * PENALTY_PER_DAY)
FROM BOOKS_RETURN_INFO;



/******  Aliases  ******/


SELECT *
FROM BOOKS_ISSUED_INFO;



--Write issued_info for this query as table name.

SELECT *
FROM BOOKS_ISSUED_INFO AS ISSUED_INFO;

--Write Student_id column to S.ID .

SELECT STUDENT_ID AS "S.ID"
FROM BOOKS_ISSUED_INFO;

--Write student_id,student_name column to Id,name.

SELECT STUDENT_ID AS ID,
	STUDENT_NAME AS NAME
FROM STUDENT_INFO;