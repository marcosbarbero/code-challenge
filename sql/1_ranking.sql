/**
 * ---------------------------------------------------------------------------
 * Write a query to rank order the following table in MySQL by votes,
 * display the rank as one of the columns.
 * ---------------------------------------------------------------------------
 */

CREATE SCHEMA IF NOT EXISTS wallethub;
USE wallethub;

CREATE TABLE wallethub.votes ( name CHAR(10), votes INT );

INSERT INTO wallethub.votes VALUES
 ('Smith',10), ('Jones',15), ('White',20), ('Black',40), ('Green',50), ('Brown',20);

SELECT
  @curRank := @curRank + 1 AS rank,
  v.name AS name,
  v.votes AS votes
FROM
  wallethub.votes AS v,
  (SELECT @curRank := 0) AS r
ORDER BY v.votes DESC;