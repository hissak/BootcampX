SELECT
  students.name,
  sum(assignment_submissions.duration) / count(assignment_submissions) AS average_assignment_duration
FROM
  assignment_submissions
  JOIN students ON student_id = students.id
WHERE
  students.end_date IS NULL
GROUP BY
  students.id
ORDER BY
  average_assignment_duration DESC;