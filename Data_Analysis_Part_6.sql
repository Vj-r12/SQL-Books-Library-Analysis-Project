Select * from Library_info;					   
Select * from Student_info;								   
Select * from Books_issued_info;										 
Select * from Books_return_info;	



/**********     SELECT INTO     **********/


--create a new, empty table using the schema of another. with no data:

Select * into Books_return_table from Books_return_info where 1 = 0;

--create a backup copy of library_info.
				  
Select * into library_backup from library_info;

--Create the backup table with conditions.

Select * into Student_backup_info from student_info 
where student_name in ('Samruddhi','Bhavana Kulkarni');

--Create the backup table with particular columns and conditions.

Select book_title,book_author,book_category into library_backup_info from library_info 
where book_category = 'Education' or book_category = 'Personal Development';

--Create the backup table with two tables.

select student_info.student_name,books_return_info.book_title into Backup_Student_n_b_title from student_info
full join books_return_info on books_return_info.student_id = student_info.student_id;



/**********     INSERT INTO SELECT     **********/


--Copy all columns from one table to another table:

Select * from Library_info;					   


Create table library_Data (Book_id varchar,
						   book_title varchar,
						   book_author varchar,
						   book_category varchar
						  );

Insert into library_Data select * from library_info;

--Copy some columns from one table to another table with some conditions.

Select * from Books_return_info;	

Create table books_return_data (Student_id varchar,
							    Book_title varchar,
							    Due_days int
							   );
							   
Insert into books_return_data select student_id,book_title,due_days from books_return_info
where due_days > 8;



/**********     CASE EXPRESSION     **********/


--Segment the records from books_return_info table under due days.

--NOTE :- (5 < C,10 < B,ELSE A)


Select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid,
CASE
     When Due_Days < 5 Then 'C'
	 When Due_Days < 10 Then 'B'
	 Else 'A'
END as Comment
From books_return_info;


--Segment the records from books_return_info table under penalty_amount_paid. Write discount amount.

--NOTE :- (20 < -3Rs,40 < -4.8,60 < -5.2Rs,ELSE 6RS)
 
 
Select Student_id,due_days,penalty_per_day,penalty_amount_paid,
CASE
    When penalty_amount_paid < 20 Then penalty_amount_paid - 3
	When penalty_amount_paid < 40 Then penalty_amount_paid - 4.8
	When penalty_amount_paid < 60 Then penalty_amount_paid - 5.2
	ELSE 6
END as After_discount_amount
From books_return_info;


/**********    NULL Functions    **********/


--Fetch the records that return alternative Book_author if an expression is NULL.

Select coalesce(book_title,book_author) from library_info;

--Fetch the records that return an alternative value if an expression is NULL.

Select coalesce(Due_days,penalty_per_day) from books_return_info;



/**********    VIEWS    **********/


--create a view that selects every book_title in the "library_info" table with a book_category.

Create view library_view as select book_title,book_category from library_info;

Select * from library_info;

--create a view that fetch columns and conditions.

create or replace view books_return_view as select student_id,book_title,due_days,penalty_per_day,penalty_amount_paid
from books_return_info where due_days > 7;

Select * from books_return_view;