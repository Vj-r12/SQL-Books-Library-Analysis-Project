Select * from Library_info;					   
Select * from Student_info;	   
Select * from Books_issued_info;										 
Select * from Books_return_info;	



-- Add new student in the table.

select * from student_info order by student_id desc;

ROLLBACK;
COMMIT;

Insert into Student_info (Student_id,Student_name) values ('SID','Bhavana');
Insert into Student_info (Student_id,Student_name) values ('SID121','Advik');

--Update the existing record which has incorrect data.

Update student_info set student_id = 'SID122',student_name = 'Bhavana Kulkarni' where student_name = 'Bhavana';

--Delete the student from student_info.

delete from student_info where student_id = 'SID121';

--Create backup table of student_info 

create table student_backup as (
select * from student_info);

select * from Student_backup; 

--Remove all the record from Student_backup.

Truncate table Student_backup;

--Insert all the records of student_info into Student_backup table.

Insert into student_backup select * from student_info;



Select * from Library_info;					   
Select * from Student_info;	

--Find unique Book_Category names.

Select Distinct(Book_category) from library_info;



/***************     STRING FUNCTIONS     ***************/


Select * from Library_info;					   
Select * from Student_info;	

--Find the book_id length. 

Select book_id,length(book_id) from Library_info;

--Replace the book name 'Thinking with type' to 'I Love Typography'.

Select book_title,replace(book_title,'Thinking with type','I Love Typography') as new_book_title
from library_info;

--Display the code of student id.

Select Student_id,substring(Student_id,1,3) from student_info;

--Arrange the Book_title names in Upper case.

Select upper(Book_title) from library_info;

--Arrange the Book_Author names in Lower case.

select lower(book_author) from library_info;

--Arrange the Book_title,Book_Author in Trim case.

select Trim(Book_title) from library_info;
select Trim(Book_author) from library_info;

--Find the Books_id Length.

select Length(Books_id) from library_info;

--Add two or more expressions together.

select Book_title||' ,'||Book_author as "Book_name,author" from library_info;