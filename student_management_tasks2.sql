use student_management;

# display subjects with the max credit
select * from subject
group by SubName 
having credit >= all (select credit from subject);

#display subject with max score
select subject.SubID, subject.SubName, avg(mark.Mark) as AverageMarkperSubject
from subject
join mark on subject.SubID = mark.SubID
group by subject.SubID
having avg(mark.Mark) >= all (select avg(mark.Mark) from mark);


# sort student by average score
select student.StudentID, student.studentName, avg(mark)
from student
join mark on student.studentID = mark.studentID
group by student.studentID, student.studentName
order by avg(mark) desc;


