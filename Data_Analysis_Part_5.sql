SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;



/**********     GROUP BY     **********/ 


--List the number of Book_title in each book_category.

SELECT *
FROM LIBRARY_INFO;


SELECT COUNT(BOOK_TITLE) AS NO_OF_BOOKS,
	BOOK_CATEGORY
FROM LIBRARY_INFO
GROUP BY BOOK_CATEGORY;

--List the number of status.

SELECT *
FROM BOOKS_ISSUED_INFO;


SELECT COUNT(STATUS),
	STATUS
FROM BOOKS_ISSUED_INFO
GROUP BY STATUS;

--List the number of due_days. in descending order.

SELECT *
FROM BOOKS_RETURN_INFO;


SELECT COUNT(DUE_DAYS) AS COUNT_DUE_DAYS,
	DUE_DAYS
FROM BOOKS_RETURN_INFO
GROUP BY DUE_DAYS
ORDER BY COUNT_DUE_DAYS;



/**********    HAVING CLAUSE    **********/ 


--List the number of book_category in each book_title. Only include book_category with more than 'History' book_title.

SELECT COUNT(BOOK_CATEGORY) AS NOOF,
	BOOK_CATEGORY
FROM LIBRARY_INFO
GROUP BY BOOK_CATEGORY
HAVING BOOK_CATEGORY = 'History';

--list the penalty_amount_paid that have more than 20 rupee.

SELECT COUNT(PENALTY_AMOUNT_PAID),
	PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO
GROUP BY PENALTY_AMOUNT_PAID
HAVING PENALTY_AMOUNT_PAID > 20;



/*******      PARTITION BY     *******/ 


--List the number of Book_title in each book_category.

SELECT BOOK_CATEGORY,
	BOOK_TITLE,
	COUNT(BOOK_CATEGORY) OVER (PARTITION BY BOOK_CATEGORY)
FROM LIBRARY_INFO;

--List the number of due_days.

SELECT *,
	COUNT(DUE_DAYS) OVER (PARTITION BY DUE_DAYS) AS COUNT_OF_DUE_DAYS
FROM BOOKS_RETURN_INFO;



/**********     EXISTS     **********/ 


--Fetch the records that match with two table.

SELECT STUDENT_NAME,
	STUDENT_ID
FROM STUDENT_INFO
WHERE EXISTS
		(SELECT STUDENT_ID
			FROM BOOKS_ISSUED_INFO
			WHERE STUDENT_INFO.STUDENT_ID = BOOKS_ISSUED_INFO.STUDENT_ID);

--Fetch the records that not match with two table.

SELECT STUDENT_NAME,
	STUDENT_ID
FROM STUDENT_INFO
WHERE NOT EXISTS
		(SELECT STUDENT_ID
			FROM BOOKS_ISSUED_INFO
			WHERE STUDENT_INFO.STUDENT_ID = BOOKS_ISSUED_INFO.STUDENT_ID);

--Fetch the records that match with two tables and condtions.

SELECT STUDENT_ID
FROM BOOKS_ISSUED_INFO
WHERE EXISTS
		(SELECT BOOK_TITLE
			FROM BOOKS_RETURN_INFO
			WHERE BOOKS_ISSUED_INFO.STUDENT_ID = BOOKS_RETURN_INFO.STUDENT_ID
				AND BOOK_TITLE like 'T%');



/**********     ANY ,ALL     **********/ 


/* List the Student_name if it finds ANY records in the books_return_info table has penalty_amount_paid greater than 10
(this will return TRUE because the penalty_amount_paid column has some values of 10). */

SELECT STUDENT_NAME,
	STUDENT_ID
FROM STUDENT_INFO
WHERE STUDENT_ID = ANY
		(SELECT STUDENT_ID
			FROM BOOKS_RETURN_INFO
			WHERE PENALTY_AMOUNT_PAID > 10);

/* List the Student_name if it finds ALL records in the books_return_info table has due_days equal to 10
(this will return False because the due_days column has some values of 5). */

SELECT STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_ID = ALL
		(SELECT STUDENT_ID
			FROM BOOKS_RETURN_INFO
			WHERE DUE_DAYS = 5);