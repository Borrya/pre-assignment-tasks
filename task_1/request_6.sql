SELECT id FROM teacher
WHERE (SELECT COUNT(*) FROM training_course 
	  WHERE (teacher.id = training_course.teacher_id)) > 2