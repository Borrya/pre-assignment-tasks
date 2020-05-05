SELECT EXTRACT(YEAR FROM date) AS year, AVG(result) FROM student_result 
WHERE (SELECT name FROM training_course
	  WHERE training_course.id = student_result.training_course_id) = 'Math statistics'
GROUP BY year
