
CREATE INDEX idx_enrollments_student_id ON enrollments(student_id);
CREATE INDEX idx_courses_id ON courses(id);
CREATE INDEX idx_courses_department_number_semester ON courses(department, number, semester);
CREATE INDEX idx_enrollments_course_id ON enrollments(course_id);
CREATE INDEX idx_courses_semester ON courses(semester);
CREATE INDEX idx_enrollments_course_id_semester ON enrollments(course_id);
CREATE INDEX idx_courses_department_semester ON courses(department, semester);
CREATE INDEX idx_courses_title_semester ON courses(title, semester);
CREATE INDEX idx_satisfies_course_id ON satisfies(course_id);
CREATE INDEX idx_requirements_id ON requirements(id);
CREATE INDEX idx_satisfies_requirement_id ON satisfies(requirement_id);
CREATE INDEX idx_enrollments_student_id_course_id ON enrollments(student_id, course_id);
