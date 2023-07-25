SELECT
  count(assistance_requests.*) AS total_assistances,
  (
    SELECT
      name
    FROM
      teachers
    WHERE
      name = 'Waylon Boehm'
  )
FROM
  assistance_requests
  JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE
  assistance_requests.teacher_id = (
    SELECT
      id
    FROM
      teachers
    WHERE
      name = 'Waylon Boehm'
  );

--   SELECT count(assistance_requests.*) as total_assistances, teachers.name
-- FROM assistance_requests
-- JOIN teachers ON teachers.id = teacher_id
-- WHERE name = 'Waylon Boehm'
-- GROUP BY teachers.name;