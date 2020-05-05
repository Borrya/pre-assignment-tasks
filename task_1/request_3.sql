SELECT training_course.name, COUNT(*) AS count_students
FROM student_result LEFT JOIN exam_result
	ON (student_result.student_id = exam_result.student_id
	AND student_result.exam_id = exam_result.exam_id) 
	LEFT JOIN training_course 
	ON student_result.training_course_id = training_course.id
WHERE exam_result.student_id IS NULL 
GROUP BY training_course.name
ORDER BY training_course.name ASC;