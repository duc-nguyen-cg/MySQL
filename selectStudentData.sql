use student_management;

#display all data
select * from student;

#display with condition
select * from student where Status = true;

select * from subject where Credit <10;

#join 2 tables
select S.StudentID, S.StudentName, C.ClassName
from student S join class C on S.ClassID = C.ClassID;

select S.StudentID, S.StudentName, C.ClassName
from student S join Class C on S.ClassID = C.ClassID
where C.ClassName = 'A1';

#join 3 tables
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId;

select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';


