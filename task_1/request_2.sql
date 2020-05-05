SELECT training_course.name, COUNT(*) AS count_students
FROM student_result LEFT JOIN training_course 
ON student_result.training_course_id = training_course.id
WHERE student_result.result >= 9
GROUP BY training_course.name
ORDER BY training_course.name ASC;