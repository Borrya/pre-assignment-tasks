SELECT first_name, last_name, average FROM (
	SELECT teacher.first_name, teacher.last_name, AVG(result) AS average
	FROM training_course LEFT JOIN teacher ON teacher.id = training_course.teacher_id
		LEFT JOIN student_result ON training_course.id = student_result.training_course_id
	GROUP BY teacher.first_name, teacher.last_name) AS allAverage
WHERE average = (
	SELECT  MAX(average) FROM (
	SELECT teacher.first_name, teacher.last_name, AVG(result) AS average
	FROM training_course LEFT JOIN teacher ON teacher.id = training_course.teacher_id
		LEFT JOIN student_result ON training_course.id = student_result.training_course_id
	GROUP BY teacher.first_name, teacher.last_name) AS allAverage)
