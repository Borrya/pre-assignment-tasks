select student.first_name, student.last_name, training_course.name 
from student_result left join student on student_result.student_id = student.id left join training_course on student_result.training_course_id = training_course.id
where student_result.result >= 4
order by student_result.exam_id ASC, student_result.result DESC;