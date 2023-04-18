Select * from Library_info;
Select * from Student_info;							   
Select * from Books_issued_info;										 
Select * from Books_return_info;      


/* Select all from the library_info table 
sort AESCENDING by the "Book_Title" column */


Select * from library_info order by Book_title ASC;

/* Select all from the Student_info table 
sort DESCENDING by the "student_name" column */

Select * from student_info order by student_name desc;

/* Find all from the Library_info and arrange Book_author in ascending 
and Book_category in descending order */

Select * from Library_info order by Book_author asc,Book_category desc;

--Select all from the Books_return_info order by. 

Select * from Books_return_info order by penalty_per_day;

--Find library_info fetch ten records.

Select books_id,book_title,book_author,book_category
from library_info limit 10;

--Find books_return_info fetch five records by penalty_amount_paid.

Select penalty_amount_paid from books_return_info limit 5;

--Find Student_info fetch five records & Skip 2 records.

Select student_id,student_name from student_info limit 5 offset 2;



/******   Aggregate Functions using COUNT,MIN,MAX,AVG,SUM,DISTINCT    ******/


Select * from Books_return_info;      

--Find total rows of books_return_info.

Select Count(*) from books_return_info;        

--Find books_return_info under due_days smallest .

Select Min(Due_Days) from books_return_info;

--Find books_return_info under Due_Days biggest.

Select Max(Due_days) from books_return_info;

--Find books_return_info under Due_Days medium.

Select Avg(Due_Days) from books_return_info;

--Find total amount of penalty_amount_paid.

Select Sum(penalty_amount_paid) from books_return_info; 

--Find books_return_info under book_title original.

Select Distinct(book_title) from books_return_info;

--Find total due_days & penalty_per_day.

Select Sum(due_days*penalty_per_day) from books_return_info;


/******  Aliases  ******/

Select * from Books_issued_info;

--Write issued_info for this query as table name.

Select * from Books_issued_info AS issued_info;

--Write Student_id column to S.ID .

Select Student_Id AS "S.ID" from books_issued_info;

--Write student_id,student_name column to Id,name.

Select Student_ID As Id,Student_name AS Name from Student_info;