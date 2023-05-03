SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

SELECT *
FROM BOOKS_ISSUED_INFO;

SELECT *
FROM BOOKS_RETURN_INFO;


-- Add new student in the table.

SELECT *
FROM STUDENT_INFO
ORDER BY STUDENT_ID DESC;


ROLLBACK;

COMMIT;


INSERT INTO STUDENT_INFO (STUDENT_ID,STUDENT_NAME)
VALUES ('SID','Bhavana');


INSERT INTO STUDENT_INFO (STUDENT_ID,STUDENT_NAME)
VALUES ('SID121','Advik');

--Update the existing record which has incorrect data.

UPDATE STUDENT_INFO
SET STUDENT_ID = 'SID122',
	STUDENT_NAME = 'Bhavana Kulkarni'
WHERE STUDENT_NAME = 'Bhavana';

--Delete the student from student_info.

DELETE
FROM STUDENT_INFO
WHERE STUDENT_ID = 'SID121';

--Create backup table of student_info

CREATE TABLE STUDENT_BACKUP AS
	(SELECT * FROM STUDENT_INFO);

SELECT *
FROM STUDENT_BACKUP;

--Remove all the record from Student_backup.

TRUNCATE TABLE STUDENT_BACKUP;

--Insert all the records of student_info into Student_backup table.

INSERT INTO STUDENT_BACKUP
SELECT *
FROM STUDENT_INFO;

SELECT *
FROM STUDENT_INFO;

--Find unique Book_Category names.

SELECT DISTINCT(BOOK_CATEGORY)
FROM LIBRARY_INFO;


/***************     STRING FUNCTIONS     ***************/

SELECT *
FROM LIBRARY_INFO;

SELECT *
FROM STUDENT_INFO;

--Find the book_id length.

SELECT BOOK_ID,
	LENGTH(BOOK_ID)
FROM LIBRARY_INFO;

--Replace the book name 'Thinking with type' to 'I Love Typography'.

SELECT BOOK_TITLE,
       REPLACE(BOOK_TITLE,'Thinking with type','I Love Typography') AS NEW_BOOK_TITLE
FROM LIBRARY_INFO;

--Display the code of student id.

SELECT STUDENT_ID,
	   SUBSTRING(STUDENT_ID,1,3)
FROM STUDENT_INFO;

--Arrange the Book_title names in Upper case.

SELECT UPPER(BOOK_TITLE)
FROM LIBRARY_INFO;

--Arrange the Book_Author names in Lower case.

SELECT LOWER(BOOK_AUTHOR)
FROM LIBRARY_INFO;

--Arrange the Book_title,Book_Author in Trim case.

SELECT TRIM(BOOK_TITLE)
FROM LIBRARY_INFO;

SELECT TRIM(BOOK_AUTHOR)
FROM LIBRARY_INFO;

--Find the Books_id Length.

SELECT LENGTH(BOOKS_ID)
FROM LIBRARY_INFO;

--Add two or more expressions together.

SELECT BOOK_TITLE || ' ,' || BOOK_AUTHOR AS "Book_name,author"
FROM LIBRARY_INFO;