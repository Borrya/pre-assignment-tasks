SELECT name, first_name, last_name FROM (
	SELECT name, first_name, last_name, rank() OVER(
	PARTITION BY allNames.name
	ORDER BY first_name)
	FROM (
SELECT training_course.name, student.first_name, student.last_name
FROM training_course RIGHT JOIN student_result 
ON training_course.id = student_result.training_course_id
RIGHT JOIN student ON student_result.student_id = student.id
WHERE student_result.result = 10) AS allNames
	) AS rank_filter	
WHERE RANK <= 5