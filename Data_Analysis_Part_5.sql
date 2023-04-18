Select * from Library_info;			   										 
Select * from Student_info;   		   
Select * from Books_issued_info;			 
Select * from Books_return_info; 



/**********     GROUP BY     **********/         


--List the number of Book_title in each book_category.

Select * from Library_info;

Select count(Book_title) as no_of_Books ,book_category 
from library_info group by book_category; 

--List the number of status.

Select * from Books_issued_info;

Select count(status),Status from Books_issued_info group by Status;

--List the number of due_days. in descending order.

Select * from Books_return_info;

Select count(due_days) as Count_due_days ,due_days 
from Books_return_info group by due_days order by Count_due_days;



/*******      PARTITION BY     *******/


--List the number of Book_title in each book_category.

Select book_category,book_title,count(Book_category)
over (partition by book_category) from library_info;

--List the number of due_days.

Select *, count(due_days) 
over (Partition By due_days) as count_of_due_days from books_return_info;



/**********    HAVING CLAUSE    **********/


--List the number of book_category in each book_title. Only include book_category with more than 'History' book_title.

Select count(book_category) as noof ,book_category 
from library_info group by book_category having book_category = 'History';

--list the penalty_amount_paid that have more than 20 rupee.

Select count(penalty_amount_paid),penalty_amount_paid from books_return_info 
group by penalty_amount_paid having penalty_amount_paid > 20;



/**********     EXISTS     **********/


--Fetch the records that match with two table. 
     
Select student_name,student_id from student_info where exists (select student_id from books_issued_info
where student_info.student_id = books_issued_info.student_id);
													
--Fetch the records that not match with two table.

Select student_name,student_id from student_info where not exists (select student_id from books_issued_info
where student_info.student_id = books_issued_info.student_id);

--Fetch the records that match with two tables and condtions.

Select student_id from books_issued_info where exists (select book_title from books_return_info
where books_issued_info.student_id = books_return_info.student_id and book_title like 'T%');



/**********     ANY ,ALL     **********/ 


/* List the Student_name if it finds ANY records in the books_return_info table has penalty_amount_paid greater than 10 
(this will return TRUE because the penalty_amount_paid column has some values of 10). */


Select student_name,student_id from student_info where student_id = ANY (select student_id from books_return_info 
where penalty_amount_paid > 10);


/* List the Student_name if it finds ALL records in the books_return_info table has due_days equal to 10 
(this will return False because the due_days column has some values of 5). */


Select student_name from student_info where student_Id = ALL (Select student_Id from books_return_info 
where due_days = 5);