CREATE TABLE teachers(
  id serial PRIMARY KEY NOT NULL,
  name text NOT NULL,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE
);

CREATE TABLE assistance_requests(
  id serial PRIMARY KEY NOT NULL,
  assignment_id integer REFERENCES assignments(id) ON DELETE CASCADE,
  student_id integer REFERENCES students(id) ON DELETE CASCADE,
  teacher_id integer REFERENCES teachers(id) ON DELETE CASCADE,
  created_at timestamp,
  started_at timestamp,
  completed_at timestamp,
  student_feedback text,
  teacher_feedback text
);