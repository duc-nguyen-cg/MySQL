use student_management;

#count by address
select address, count(StudentID)
from student
group by address;

# display student and average mark
select student.StudentID, student.studentName, avg(mark)
from student
join mark on student.studentID = mark.studentID
group by student.studentID, student.studentName;

# display students whose average mark > 15
select student.StudentID, student.studentName, avg(mark)
from student
join mark on student.studentID = mark.studentID
group by student.studentID, student.studentName
having avg(mark) > 15;

#display student with highest average score
select student.StudentID, student.studentName, avg(mark)
from student
join mark on student.studentID = mark.studentID
group by student.studentID, student.studentName
having avg(mark) >= all (select avg(mark) from mark group by mark.studentID);



