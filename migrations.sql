-- Improvements: view + index

CREATE VIEW IF NOT EXISTS session_details AS
SELECT
  s.session_id,
  s.session_date,
  st.name AS student,
  c.title AS course,
  s.minutes,
  s.focus,
  s.mood
FROM study_sessions s
JOIN students st ON st.student_id = s.student_id
JOIN courses c ON c.course_id = s.course_id;

CREATE INDEX IF NOT EXISTS idx_sessions_student_date
ON study_sessions(student_id, session_date);
