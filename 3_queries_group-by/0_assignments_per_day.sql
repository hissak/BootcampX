SELECT
  DAY,
  count(*) AS total_assignments
FROM
  assignments
GROUP BY
  DAY
ORDER BY
  DAY ASC;