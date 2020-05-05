SELECT st.first_name, st.last_name
FROM student AS st
WHERE (
SELECT COUNT(*)
FROM student LEFT JOIN exam_result ON exam_result.student_id = st.id
WHERE 
(SELECT training_course.id FROM training_course
 WHERE training_course.name = 'Graph theory'
)=(
SELECT exam.training_course_id FROM exam
	WHERE exam.id = exam_result.exam_id
)) = 0;