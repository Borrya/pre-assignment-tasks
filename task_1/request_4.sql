SELECT training_course.name, AVG(result)
FROM student_result LEFT JOIN training_course
ON student_result.training_course_id = training_course.id
WHERE training_course.name = 'DBMS'
GROUP BY training_course.name
ORDER BY training_course.name ASC;