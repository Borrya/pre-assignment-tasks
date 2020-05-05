SELECT student.id, student.last_name
FROM student 
WHERE (
SELECT COUNT(*)
	FROM(
		SELECT exam_result.result, rank() OVER (
		PARTITION BY exam_result.exam_id
		ORDER BY result
		)
	FROM exam_result
	WHERE exam_result.student_id = student.id) AS rank_filter
	WHERE RANK > 1 AND rank_filter.result > 4	
) > 0