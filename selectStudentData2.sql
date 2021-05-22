use student_management;

#display all student name that start with 'h'
select * from student
where StudentName like 'h%';

#display class starts in December
select * from class
where StartDate like '%-12-%';

#display subject whose credit between 3 and 5
select * from subject
where Credit between 3 and 5;

#update info of a student
set sql_safe_updates = 0;
update student
set ClassID = 2 where StudentName = 'Hung';

#sort
select student.StudentName, subject.SubName, mark.Mark from student 
join mark on student.StudentID = mark.StudentID
join subject on mark.SubID = subject.SubID
order by Mark desc, StudentName asc;

