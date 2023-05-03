SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;



/**********     SELECT INTO     **********/ 


--create a new, empty table using the schema of another. with no data:

SELECT * INTO BOOKS_RETURN_TABLE
FROM BOOKS_RETURN_INFO
WHERE 1 = 0;

--create a backup copy of library_info.

SELECT * INTO LIBRARY_BACKUP
FROM LIBRARY_INFO;

--Create the backup table with conditions.

SELECT * INTO STUDENT_BACKUP_INFO
FROM STUDENT_INFO
WHERE STUDENT_NAME in ('Samruddhi','Bhavana Kulkarni');

--Create the backup table with particular columns and conditions.

SELECT BOOK_TITLE,
	BOOK_AUTHOR,
	BOOK_CATEGORY INTO LIBRARY_BACKUP_INFO
FROM LIBRARY_INFO
WHERE BOOK_CATEGORY = 'Education'
	OR BOOK_CATEGORY = 'Personal Development';

--Create the backup table with two tables.

SELECT STUDENT_INFO.STUDENT_NAME,
	BOOKS_RETURN_INFO.BOOK_TITLE INTO BACKUP_STUDENT_N_B_TITLE
FROM STUDENT_INFO
FULL JOIN BOOKS_RETURN_INFO ON BOOKS_RETURN_INFO.STUDENT_ID = STUDENT_INFO.STUDENT_ID;



/**********     INSERT INTO SELECT     **********/ 


--Copy all columns from one table to another table.

SELECT *
FROM LIBRARY_INFO;


CREATE TABLE LIBRARY_DATA (BOOK_ID varchar, 
			   BOOK_TITLE varchar,
			   BOOK_AUTHOR varchar, 
			   BOOK_CATEGORY varchar
			   );

INSERT INTO LIBRARY_DATA
SELECT *
FROM LIBRARY_INFO;

--Copy some columns from one table to another table with some conditions.

SELECT *
FROM BOOKS_RETURN_INFO;


CREATE TABLE BOOKS_RETURN_DATA (STUDENT_ID varchar,
				BOOK_TITLE varchar, 
				DUE_DAYS int
			       );

INSERT INTO BOOKS_RETURN_DATA
SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS
FROM BOOKS_RETURN_INFO
WHERE DUE_DAYS > 8;



/**********     CASE EXPRESSION     **********/ 


--Segment the records from books_return_info table under due days.
 --NOTE :- (5 < C,10 < B,ELSE A)

SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID,
	CASE
	    WHEN DUE_DAYS < 5 THEN 'C'
	    WHEN DUE_DAYS < 10 THEN 'B'
	    ELSE 'A'
	    END AS COMMENT
FROM BOOKS_RETURN_INFO;


--Segment the records from books_return_info table under penalty_amount_paid. Write discount amount.
 --NOTE :- (20 < -3Rs,40 < -4.8,60 < -5.2Rs,ELSE 6RS)

SELECT STUDENT_ID,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID,
	CASE
	    WHEN PENALTY_AMOUNT_PAID < 20 THEN PENALTY_AMOUNT_PAID - 3
	    WHEN PENALTY_AMOUNT_PAID < 40 THEN PENALTY_AMOUNT_PAID - 4.8
	    WHEN PENALTY_AMOUNT_PAID < 60 THEN PENALTY_AMOUNT_PAID - 5.2
	    ELSE 6
	    END AS AFTER_DISCOUNT_AMOUNT
FROM BOOKS_RETURN_INFO;



/**********    NULL Functions    **********/


--Fetch the records that return alternative Book_author if an expression is NULL.

SELECT COALESCE(BOOK_TITLE,BOOK_AUTHOR)
FROM LIBRARY_INFO;

--Fetch the records that return an alternative value if an expression is NULL.

SELECT COALESCE(DUE_DAYS,PENALTY_PER_DAY)
FROM BOOKS_RETURN_INFO;



/**********    VIEWS    **********/


--create a view that selects every book_title in the "library_info" table with a book_category.

CREATE VIEW LIBRARY_VIEW AS
SELECT BOOK_TITLE,
	BOOK_CATEGORY
FROM LIBRARY_INFO;


SELECT *
FROM LIBRARY_VIEW;

--create a view that fetch columns and conditions.

CREATE OR REPLACE VIEW BOOKS_RETURN_VIEW AS
SELECT STUDENT_ID,
	BOOK_TITLE,
	DUE_DAYS,
	PENALTY_PER_DAY,
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
WHERE DUE_DAYS > 7;


SELECT *
FROM BOOKS_RETURN_VIEW;

--Create the temporary table of book withdrawn from library.

CREATE
TEMPORARY TABLE BOOKS_WITHDRAWN (STUDENT_ID varchar,BOOK_TITLE varchar,ISSUED_STATUS varchar);


INSERT INTO BOOKS_WITHDRAWN
SELECT BOOKS_ISSUED_INFO.STUDENT_ID,
	LIBRARY_INFO.BOOK_TITLE,
	BOOKS_ISSUED_INFO.ISSUED_STATUS
FROM BOOKS_ISSUED_INFO
INNER JOIN LIBRARY_INFO ON BOOKS_ISSUED_INFO.BOOK_ID = LIBRARY_INFO.BOOK_ID;


SELECT *
FROM BOOKS_WITHDRAWN;
