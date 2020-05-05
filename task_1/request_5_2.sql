SELECT first_name, last_name FROM student
LEFT JOIN (
SELECT DISTINCT student.id
FROM student LEFT JOIN exam_result ON student.id = exam_result.student_id
LEFT JOIN exam ON exam_result.exam_id = exam.id
LEFT JOIN training_course ON exam.training_course_id = training_course.id
WHERE training_course.name = 'Graph theory') AS s ON student.id = s.id
WHERE s.id IS NULL;