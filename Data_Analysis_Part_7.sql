Select * from Library_info;					   
Select * from Student_info;								   
Select * from Books_issued_info;										 
Select * from Books_return_info;	



/***************          ANALYSIS PART          ***************/


--Find the library_info table under book_title which belongs to Autobiography and History Category.

Select Book_title,Book_Category from library_info 
where Book_category = 'Autobiography' or Book_category = 'History';

--Fetch the Book_title & book_category which not belong to Law and High Fantasy.

Select Book_title,Book_category from library_info
where not Book_category in ('Law','High Fantasy'); 

--Find the book Id which are available.

Select Book_id,Status from books_issued_info where status = 'Available';

--Find the book Id which are not available.

Select Book_id,status from books_issued_info where status = 'Not Available'

--Fetch the Book_title. which Book_author name starts with R. 

Select Book_title,Book_author from library_info where book_author like 'R%';

--Fetch the student_name which starts with A & End with a.

Select Student_name from student_info where student_name like '%a';

--Fetch the records to which students issued book.

Select student_info.student_id,student_name,Books_issued_info.issued_status from student_info inner join Books_issued_info 
on books_issued_info.student_id = Student_info.student_id;

--Create a view of book title and Book category.

Create view Book_title_category as select Book_title,Book_category 
from library_info;

Select * from Book_title_category;

--Create a view of student who paid penalty amount.

create view Student_Paid_info as select student_name from student_info
where exists (select penalty_amount_paid from books_return_info where
			  books_return_info.student_id = student_info.student_id);

Select * from Student_Paid_info;

--Write a comment on peanlty_amount_paid in which segment the payments are done, group the payment method.

--NOTE :- 20 < Cash ,40 < Phonepe ,60 < Phonepe ,ELSE Challan.

create view payment_method_info as 
Select count(penalty_amount_paid) as No_of_payment,
CASE
    When Penalty_Amount_Paid < 20 Then 'Cash'
	When Penalty_Amount_Paid < 40 Then 'Phonepe'
	When Penalty_Amount_Paid < 60 Then 'Phonepe'
	ELSE 'Challan'
	End as Payment_method
From books_return_info group by payment_method;


/* Fetch the records from payment_method_info in which segment the payments are done, 
Partition the payment_method */


Select Student_id,payment_method,penalty_amount_paid,count(payment_method)
over (Partition By Payment_method) as No_of_payment from payment_method_info;

--Fetch the records from books_return_info, group the Due Days & arrange in Ascending order.

Select due_days,count(Due_days) as No_of from books_return_info group by due_days order by due_days ASC;

--Find the total penalty amount paid.

Select Round(Sum(Penalty_amount_paid)) as Total_Penalty_amount_paid 
from books_return_info;

--Find the maximum penalty amount paided.

Select MAX(Penalty_amount_paid) from books_return_info;

--Find the book title that exists with two table 

Select book_title from library_info where exists (Select book_title from infos
												  where infos.books_id = library_info.book_id);