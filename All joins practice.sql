use regex;
select * from students;
select * from enrollments;
#inner join -comman elements
select s.student_id,s.student_name ,e.enrollment_id,e.course_name from students as s join enrollments as e on s.student_id = e.student_id;
#left join-students all column
select s.student_id,s.student_name ,e.enrollment_id,e.course_name from students as s left join enrollments as e on s.student_id = e.student_id
 WHERE e.enrollment_id IS NULL;
 #count in how many courses student have enrolled
 select s.student_id,s.student_name,count(e.enrollment_id) from students as s  join enrollments as e  on s.student_id = e.student_id group by s.student_id;
 #count student of each major
 select count(student_id) , major from students group by major;
 #count sum credits of each major 
  select s.major, sum(e.credits)  from students as s join enrollments as e  on s.student_id = e.student_id  group by s.major;
select  char_length(student_name),count(student_id)  from students group by char_length(student_name);
#how many student are enroll in courses
select  char_length(student_name),count(enrollment_id)  from students as s join enrollments as e group by char_length(student_name) order by count(enrollment_id)
desc limit 2;




