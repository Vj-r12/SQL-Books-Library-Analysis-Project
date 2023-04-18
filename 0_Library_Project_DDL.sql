---PROMPT Creating tables

 Create Table Library_info (Book_Id Varchar PRIMARY KEY,
						  Book_Title Varchar(255),
						  Book_Author Varchar(255) Not Null,
						  Book_Category Varchar(200) Not Null                   
                           );

Create Table Student_info (Student_Id Varchar Not Null,
						  Student_Name varchar(10)
						  );


Create Table Books_issued_info (Student_Id Varchar Not Null,
								Book_Id Varchar Not Null,
								Status Varchar,
								Issued_Status Varchar,
								Student_Name varchar,
								FOREIGN KEY (Book_Id)
								REFERENCES Library_info(Book_Id)         							
							   );

Create Table Books_return_info (Student_Id Varchar Not Null,
							   Book_Title Varchar(255),
							   Due_Days int,
							   Penalty_Per_Day Float,
							   Penalty_Amount_Paid Float
				               );
							   
--ALTER TABLE LIBRARY_INFO	

Alter Table Library_info Rename Column Book_Id to Books_Id;

--ALTER TABLE STUDENT_INFO

Alter Table Student_info Alter Column Student_Name set data type Varchar(200);

--ALTER TABLE BOOKS_ISSUED_INFO

Alter Table Books_issued_info Drop Column Student_Name;