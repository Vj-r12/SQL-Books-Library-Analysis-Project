--PROMPT CREATING COMMENTS 

comment on table Library_info

is 'Detail of the library';

comment on column Books_Id 
is 'Detail of Book_title,Book_author,Book_category';

comment on column Book_title

is 'character varying which holds only (255) words';

comment on column Book_author

is 'character varying which holds only (255) words';

comment on column Book_category

is 'which Specify the book category';

comment on table student_info

is 'Detail of the Student';

comment on column Student_Id

is 'It contain Student information';

comment on column Student_Name

is 'Character Varying(200)';

comment on table Books_issued_info

is 'Detail of the books issued';

comment on column Student_Id

is 'It contain Student information';

comment on column Book_Id

is 'Detail of Book_title,Book_author,Book_category';

comment on column Status

is 'which shows the books availability';

comment on column Issued_Status

is 'which shows the issued of books';

comment on table Books_return_info

is 'Detail of the books return information';

comment on column Student_ID

is 'It contain Student information';

comment on column Book_Title 

is 'character varying which holds only (255) words';

comment on column Due_Days

is 'it specify the due days';

comment on column Penalty_Per_Day

is 'Double Precision (Float)';

comment on column Penalty_Amount_Paid

is 'the total amount of penalty Paided (Due_Days * Penalty_Per_Day)';