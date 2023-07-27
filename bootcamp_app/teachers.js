const { Pool } = require('pg');
const { rows } = require('pg/lib/defaults');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortArg = process.argv[2];
const lim = process.argv[3] || 5;
const values = [`%${cohortArg}%`, lim];
const queryString = `
SELECT
  DISTINCT(teachers.name) AS teacher,
  cohorts.name AS cohort
FROM
  assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE
  cohorts.name like $1
ORDER BY
  teachers.name
  limit $2
  ;`;

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
    pool.end();
  }).catch(err => console.error('query error', err.stack));

