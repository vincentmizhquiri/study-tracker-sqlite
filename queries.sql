-- Study sessions with student and course names
SELECT
  s.session_date,
  st.name AS student,
  c.title AS course,
  s.minutes,
  s.focus,
  s.mood
FROM study_sessions s
JOIN students st ON st.student_id = s.student_id
JOIN courses c ON c.course_id = s.course_id
ORDER BY s.session_date, student;

-- Total study time per student
SELECT
  st.name,
  SUM(s.minutes) AS total_minutes,
  COUNT(*) AS sessions
FROM study_sessions s
JOIN students st ON st.student_id = s.student_id
GROUP BY st.name
ORDER BY total_minutes DESC;

-- Total study time per course
SELECT
  c.title,
  SUM(s.minutes) AS total_minutes,
  COUNT(*) AS sessions
FROM study_sessions s
JOIN courses c ON c.course_id = s.course_id
GROUP BY c.title
ORDER BY total_minutes DESC;

-- Upcoming assignments
SELECT
  c.title AS course,
  a.title AS assignment,
  a.due_date,
  a.points
FROM assignments a
JOIN courses c ON c.course_id = a.course_id
ORDER BY a.due_date;
