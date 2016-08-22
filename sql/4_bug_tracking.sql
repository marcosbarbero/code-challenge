/**
 * I have a table for bugs from a bug tracking software; let’s call the table “bugs”.
 * The table has four columns (id, open_date, close_date, severity). On any given day
 * a bug is open if the open_date is on or before that day and close_date is after
 * that day. For example, a bug is open on “2012-01-01”, if it’s created on or
 * before “2012-01-01” and closed on or after “2012-01-02”. I want a SQL to show
 * number of bugs open for a range of dates.
 */

CREATE SCHEMA IF NOT EXISTS wallethub;
USE wallethub;

DROP TABLE IF EXISTS bugs;
CREATE TABLE wallethub.bugs (
  ID INT,
  OPEN_DATE DATE,
  CLOSE_DATE DATE,
  SEVERITY INT
);

INSERT INTO wallethub.bugs (ID, OPEN_DATE, CLOSE_DATE, SEVERITY) VALUES
  (1, STR_TO_DATE('2011-12-31', '%Y-%m-%d'), STR_TO_DATE('2011-12-31', '%Y-%m-%d'), 1),
  (2, STR_TO_DATE('2012-01-01', '%Y-%m-%d'), STR_TO_DATE('2012-01-02', '%Y-%m-%d'), 1),
  (3, STR_TO_DATE('2012-01-03', '%Y-%m-%d'), STR_TO_DATE('2012-01-03', '%Y-%m-%d'), 1),
  (4, STR_TO_DATE('2012-01-03', '%Y-%m-%d'), STR_TO_DATE('2012-01-04', '%Y-%m-%d'), 1),
  (5, STR_TO_DATE('2012-01-06', '%Y-%m-%d'), STR_TO_DATE('2012-01-07', '%Y-%m-%d'), 1);

-- -----------------------------------------------------------------------
-- Sum all open bugs in a given range of dates
-- -----------------------------------------------------------------------
SELECT COUNT(*) FROM wallethub.bugs AS bug
WHERE
	bug.OPEN_DATE >= STR_TO_DATE('2012-01-01', '%Y-%m-%d')
  AND bug.CLOSE_DATE <= STR_TO_DATE('2012-01-03', '%Y-%m-%d');

-- -----------------------------------------------------------------------
-- Sum bugs per day
-- -----------------------------------------------------------------------
SELECT bug.OPEN_DATE, COUNT(*) AS number_of_bugs
FROM wallethub.bugs AS bug
WHERE
	bug.OPEN_DATE >= STR_TO_DATE('2012-01-01', '%Y-%m-%d')
    AND bug.CLOSE_DATE <= STR_TO_DATE('2012-01-03', '%Y-%m-%d')
GROUP BY bug.OPEN_DATE;
