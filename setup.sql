PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS study_sessions;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  student_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  cohort TEXT NOT NULL
);

CREATE TABLE courses (
  course_id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  level TEXT NOT NULL
);

CREATE TABLE study_sessions (
  session_id INTEGER PRIMARY KEY,
  student_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  session_date TEXT NOT NULL,      -- ISO format: YYYY-MM-DD
  minutes INTEGER NOT NULL CHECK (minutes > 0),
  focus TEXT NOT NULL,
  mood TEXT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE assignments (
  assignment_id INTEGER PRIMARY KEY,
  course_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  due_date TEXT NOT NULL,
  points INTEGER NOT NULL CHECK (points >= 0),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (name, cohort) VALUES
  ('Amina', 'Winter 2026'),
  ('Jordan', 'Winter 2026'),
  ('Luis', 'Winter 2026');

INSERT INTO courses (title, level) VALUES
  ('SQL Basics', 'Intro'),
  ('Data Modeling', 'Intermediate'),
  ('Python for Data', 'Intro');

INSERT INTO study_sessions (student_id, course_id, session_date, minutes, focus, mood) VALUES
  (1, 1, '2026-01-20', 45, 'SELECT + WHERE', 'good'),
  (1, 1, '2026-01-22', 60, 'GROUP BY + COUNT', 'focused'),
  (2, 1, '2026-01-22', 30, 'Filtering practice', 'tired'),
  (2, 2, '2026-01-23', 50, 'ER diagrams', 'good'),
  (3, 3, '2026-01-24', 40, 'Functions + loops', 'okay'),
  (3, 1, '2026-01-25', 35, 'JOIN basics', 'good'),
  (1, 2, '2026-01-25', 70, 'Normalization', 'focused');

INSERT INTO assignments (course_id, title, due_date, points) VALUES
  (1, 'SQL Quiz 1', '2026-01-28', 20),
  (2, 'Model a Library DB', '2026-02-02', 50),
  (3, 'Python Mini Project', '2026-02-05', 40);
