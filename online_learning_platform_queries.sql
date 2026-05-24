SELECT 
    e.enrollment_id,
    student.name AS student_name,
    c.course_name,
    instructor.name AS instructor_name
FROM onlinelearningplatform.enrollments e
JOIN onlinelearningplatform.users student ON e.user_id = student.user_id
JOIN onlinelearningplatform.courses c ON e.course_id = c.course_id
JOIN onlinelearningplatform.users instructor ON c.instructor_id = instructor.user_id;
