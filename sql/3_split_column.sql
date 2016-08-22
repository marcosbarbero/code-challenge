/**
 * Write a procedure in MySQL to split a column into rows using a delimiter.
 * CREATE TABLE sometbl ( ID INT, NAME VARCHAR(50) );
 * INSERT INTO sometbl VALUES (1, 'Smith'), (2, 'Julio|Jones|Falcons'), (3,
 * 'White|Snow'), (4, 'Paint|It|Red'), (5, 'Green|Lantern'), (6, 'Brown|bag');
 * For (2), example rows would look like >> “3, white”, “3, Snow” …
 */

CREATE SCHEMA IF NOT EXISTS wallethub;
USE wallethub;
 
DROP TABLE IF EXISTS wallethub.sometbl;
CREATE TABLE wallethub.sometbl ( ID INT, NAME VARCHAR(50) );
INSERT INTO wallethub.sometbl VALUES (1, 'Smith'), (2, 'Julio|Jones|Falcons'), (3,
'White|Snow'), (4, 'Paint|It|Red'), (5, 'Green|Lantern'), (6, 'Brown|bag');

-- -----------------------------------------------------------------------
-- Create the procedure to explode the column into rows
-- -----------------------------------------------------------------------
DROP PROCEDURE IF EXISTS explode_table;

DELIMITER ||

CREATE PROCEDURE explode_table(IN split CHAR(1))
BEGIN
    DECLARE is_finished INTEGER DEFAULT 0;
    DECLARE is_found INT DEFAULT 0;
    DECLARE current_id INT;
    DECLARE current_name VARCHAR(50);

    DECLARE cursor_rows CURSOR FOR
        SELECT tbl.ID, tbl.NAME FROM wallethub.sometbl AS tbl;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_finished = 1;

    DROP TEMPORARY TABLE IF EXISTS wallethub.tmp_explode_table;
    CREATE TEMPORARY TABLE wallethub.tmp_explode_table (ID INT, NAME VARCHAR(50));

    OPEN cursor_rows;

    loop_rows: LOOP

		FETCH cursor_rows INTO current_id, current_name;

        IF is_finished = 1 THEN
			CLOSE cursor_rows;
            LEAVE loop_rows;
        END IF;

        has_column: WHILE 1 = 1 DO
            BEGIN

            SET is_found = INSTR(current_name, split);

            IF is_found = 0 THEN
                BEGIN

                INSERT INTO wallethub.tmp_explode_table (ID, NAME) VALUES (current_id, current_name);
                LEAVE has_column;

                END;
            ELSE
                BEGIN

                INSERT INTO wallethub.tmp_explode_table
                     VALUES (current_id, SUBSTRING(current_name, 1, is_found - 1));

                SET current_name = SUBSTRING(current_name, is_found + 1);

                END;
            END IF;

            END;
        END WHILE;
    END LOOP;

    SELECT exploded.* FROM wallethub.tmp_explode_table AS exploded;

    DROP TEMPORARY TABLE IF EXISTS wallethub.tmp_explode_table;

END ||

DELIMITER ;

-- -----------------------------------------------------------------------
-- Call the procedure setting the delimiter on column
-- -----------------------------------------------------------------------
CALL explode_table('|');