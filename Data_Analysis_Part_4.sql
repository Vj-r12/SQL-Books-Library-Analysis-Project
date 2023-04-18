Select * from Library_info;			
Select * from Student_info;		    	   
Select * from Books_issued_info;						 
Select * from Books_return_info;    




/*****************          JOINS          *******************/



Select * from Library_info;				   
Select * from Student_info;		    				   
Select * from Books_issued_info;



--Fetch the records which books has issued to students.

/* INNER JOIN */

Select Books_issued_info.student_id,Student_info.Student_name,Library_info.Book_title
from ((books_issued_info inner join Student_info on books_issued_info.Student_Id = Student_info.Student_Id) 
	  inner join Library_info on library_info.books_Id = Books_issued_info.book_Id);


--Fetch the addtional records from Books_issued_info.

/* LEFT JOIN */

Select * from Books_issued_info left join Books_return_info 
on Books_issued_info.Student_Id = Books_return_info.Student_Id;


--Fetch addtional records from student_info.

/* RIGHT JOIN */

Select * from Books_issued_info right join  Student_info 
on student_info.student_id = books_issued_info.student_id;


--Fetch All records from Student_info & Books_issued_info.

/* FULL JOIN */

Select * from Student_info full join books_issued_info
on books_issued_info.student_Id = student_info.Student_Id;


--Write a query to fetch the status_info and their issued_info corespodning to thier Book_id and books_id.

/* SELF JOIN */

select book_info.book_id as B_ID,book_info.Status as status_info,book_info.issued_status as issued_info,
issued_info.book_id as B_ID,issued_info.status as status_info,issued_info.issued_status as issued_info
from book_issued as Book_info join book_issued as issued_info on issued_info.book_id = book_info.books_id;


--Write a query to fetch cartesian product.

/* CROSS JOIN */

Select student_info.student_name,library_info.book_title
from library_info cross join student_info;



/**********   UNION AND UNION ALL   **********/



--Fetch the Orignal records from two table.

/* UNION */

Select Student_id from Student_info 
Union 
select Student_id from Books_issued_info;


--Fetch the all records from two table.

/* UNION ALL */

Select Student_id from student_info
Union All 
Select Student_id from Books_issued_info;


--Fetch the orignal records under book_title from two table.

Select * from Library_info;
Select * from Books_return_info;

/* UNION */

Select * from library_info where books_id = 'LB1' or books_id = 'LB10' 
UNION 
Select * from Books_issued_info where book_id = 'LB1' or book_id = 'LB10';


--Fetch the orignal records under book_title from two table. 

/* UNION ALL */

Select * from library_info where books_id = 'LB1' 
UNION All
Select * from Books_issued_info where book_id = 'LB1';