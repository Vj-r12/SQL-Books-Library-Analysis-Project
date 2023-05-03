SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;



/***************          ANALYSIS PART          ***************/ 


--Find the library_info table under book_title which belongs to Autobiography and History Category.

SELECT BOOK_TITLE,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE BOOK_CATEGORY = 'Autobiography'
	OR BOOK_CATEGORY = 'History';

--Fetch the Book_title & book_category which not belong to Law and High Fantasy.

SELECT BOOK_TITLE,
	BOOK_CATEGORY
FROM LIBRARY_INFO
WHERE NOT BOOK_CATEGORY in ('Law','High Fantasy');

--Find the book Id which are available.

SELECT BOOK_ID,
	STATUS
FROM BOOKS_ISSUED_INFO
WHERE STATUS = 'Available';

--Find the book Id which are not available.

SELECT BOOK_ID,
	STATUS
FROM BOOKS_ISSUED_INFO
WHERE STATUS = 'Not Available' 

--Fetch the Book_title. which Book_author name starts with R.

SELECT BOOK_TITLE,
		BOOK_AUTHOR
FROM LIBRARY_INFO WHERE BOOK_AUTHOR like 'R%';

--Fetch the student_name which starts with A & End with a.

SELECT STUDENT_NAME
FROM STUDENT_INFO
WHERE STUDENT_NAME like '%a';

--Fetch the records to which students issued book.

SELECT STUDENT_INFO.STUDENT_ID,
	STUDENT_NAME,
	BOOKS_ISSUED_INFO.ISSUED_STATUS
FROM STUDENT_INFO
INNER JOIN BOOKS_ISSUED_INFO ON BOOKS_ISSUED_INFO.STUDENT_ID = STUDENT_INFO.STUDENT_ID;

--Create a view of book title and Book category.

CREATE VIEW BOOK_TITLE_CATEGORY AS
SELECT BOOK_TITLE,
	BOOK_CATEGORY
FROM LIBRARY_INFO;


SELECT *
FROM BOOK_TITLE_CATEGORY;

--Create a view of student who paid penalty amount.

CREATE VIEW STUDENT_PAID_INFO AS
SELECT STUDENT_NAME
FROM STUDENT_INFO
WHERE EXISTS
		(SELECT PENALTY_AMOUNT_PAID
			FROM BOOKS_RETURN_INFO
			WHERE BOOKS_RETURN_INFO.STUDENT_ID = STUDENT_INFO.STUDENT_ID);


SELECT *
FROM STUDENT_PAID_INFO;

--Write a comment on peanlty_amount_paid in which segment the payments are done, group the payment method.
 
--NOTE :- 20 < Cash ,40 < Phonepe ,60 < Phonepe ,ELSE Challan.

CREATE VIEW PAYMENT_METHOD_INFO AS
SELECT COUNT(PENALTY_AMOUNT_PAID) AS NO_OF_PAYMENT,
	CASE
	    WHEN PENALTY_AMOUNT_PAID < 20 THEN 'Cash'
	    WHEN PENALTY_AMOUNT_PAID < 40 THEN 'Phonepe'
	    WHEN PENALTY_AMOUNT_PAID < 60 THEN 'Phonepe'
	    ELSE 'Challan'
	    END AS PAYMENT_METHOD
FROM BOOKS_RETURN_INFO
GROUP BY PAYMENT_METHOD;

--Fetch the records from payment_method_info in which segment the payments are done, Partition the payment_method.

SELECT STUDENT_ID,
	PAYMENT_METHOD,
	PENALTY_AMOUNT_PAID,
	COUNT(PAYMENT_METHOD) OVER (PARTITION BY PAYMENT_METHOD) AS NO_OF_PAYMENT
FROM PAYMENT_METHOD_INFO;

--Fetch the records from books_return_info, group the Due Days & arrange in Ascending order.

SELECT DUE_DAYS,
	COUNT(DUE_DAYS) AS NO_OF
FROM BOOKS_RETURN_INFO
GROUP BY DUE_DAYS
ORDER BY DUE_DAYS ASC;

--Find the total penalty amount paid.

SELECT ROUND(SUM(PENALTY_AMOUNT_PAID)) AS TOTAL_PENALTY_AMOUNT_PAID
FROM BOOKS_RETURN_INFO;

--Find the maximum penalty amount paided.

SELECT MAX(PENALTY_AMOUNT_PAID)
FROM BOOKS_RETURN_INFO;

--Find the book title that exists with two table

SELECT BOOK_TITLE
FROM LIBRARY_INFO
WHERE EXISTS
		(SELECT BOOK_TITLE
			FROM INFOS
			WHERE INFOS.BOOKS_ID = LIBRARY_INFO.BOOK_ID);
