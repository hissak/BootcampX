const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const arg = process.argv[2];
const lim = process.argv[3];

pool.query(`
SELECT students.id as id, students.name as name, cohorts.name as cohort
FROM students
join cohorts on cohorts.id = cohort_id
where cohorts.name like '%${arg}%'
LIMIT ${lim || 5};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    })
  }).catch(err => console.error('query error', err.stack));

