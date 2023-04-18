Select * from Library_info;
Select * from Student_info;							   
Select * from Books_issued_info;										 
Select * from Books_return_info;    

				   
/*****  Find Library_info and Student_info details based on specific condition *****/

-- Find library_info details under Books_Id LB21.

Select * from library_info
where Books_Id = 'LB21';

--Find Student_info details under Student_Id SID99.

Select * from student_info
where Student_Id = 'SID99';

--Find library_info details under Books_Id LB1 AND Book_author Narayana Murthy.

Select * from library_info 
where books_Id = 'LB1' 
AND Book_Author = 'Narayana Murthy';

--Find Student_info details under Student_Id OR Student_Name.

Select * from Student_info where Student_Id = 'SID7' OR Student_Name = 'Samruddhi';

--Find Library_info details under NOT Book_Title 'The Wind In Willows'.

Select * from library_info where NOT Book_Title = 'The Wind In Willows';

--Find Library_info details under Book_Title NOT IN 'Think and Grow','My Experiments with Truth'.

Select * from library_info where Book_Title NOT IN ('Think and Grow','My Experiments with Truth');

--Find Books_return_info details under Due_Days BETWEEN 1 AND 5.

Select * from Books_return_info where Due_Days BETWEEN 1 and 5;

--Find Library_info details under In Book_Category.

Select * from library_info where Book_Category IN ('Education','Business','Fiction');

--Find Books_return_info details under Book_title NULL.

Select * FROM Books_return_info where book_title is NULL;

--Find Books_return_info details under Book_title is not null.

Select * from Books_return_info where book_title is not null;



Select * from Books_return_info;  


--Find books_return_info details under due_days Greater than 5.

Select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid
from books_return_info where due_days > 5;

--Find books_return_info details under penalty_per_day less than 2.2 .

Select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid
from books_return_info where penalty_per_day < 2.2;

--Find books_return_info details under penalty_amount_paid Greater than equals to 25.

Select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid
from books_return_info where penalty_amount_paid >= 25;

--Find books_return_info details under penalty_amount_paid less than equals to 60.

Select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid
from books_return_info where penalty_amount_paid <= 60;

--Find books_return_info details under penalty_per_day equal to 2.3.

Select * from books_return_info where penalty_per_day = 2.3;

--Find books_return_info details under penalty_amount_paid Not equals to 15.5 .

Select * from books_return_info where penalty_amount_paid <> 15.5;




/******   Search for specified pattern in a column. (Like, wildcards)   ******/


--Find Library_info under Book_title starts with A.

Select books_id,book_title,book_author,book_category from library_info
where book_title like 'A%';

--Find Library_info under Book_title End with S.

Select books_id,book_title,book_author,book_category from library_info
where book_title like '%s';

--Find Library_info under Book_title Starts with Th.

Select books_id,book_title,book_author,book_category from library_info
where book_title like 'Th%';

--Find Library_info under Book_title contain third alphabet a.

Select books_id,book_title,book_author,book_category from library_info
where book_title like '__a%';

--Find Library_info under Book_title start with H. OR End with t.

Select books_id,book_title,book_author,book_category from library_info
where book_title like 'H%' OR book_title like '%t';

--Find Library_info under Book_title contain last third alphabet c.

Select books_id,book_title,book_author,book_category from library_info
where book_title like '%C__';

--Find Student_info under Student_name NOT Start with B.

Select student_id,student_name from student_info 
where student_name NOT LIKE 'B%';

--Find Student_info under Student_name NOT End with a.

Select student_id,student_name from student_info 
where student_name NOT LIKE '%a';

--Find Student_info under Student_name NOT Start with Ab.

Select student_id,student_name from student_info 
where student_name NOT LIKE 'Ab%'; 

--Find Student_info under Student_name NOT contain third alphabet r. AND second alphabet i.

Select student_id,student_name from student_info 
where student_name NOT LIKE '___r%' AND student_name NOT LIKE 'i%';