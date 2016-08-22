/**
 * ---------------------------------------------------------------------------
 * Write a function to capitalize the first letter of a word in a given string;
 * Example: initcap(UNITED states Of AmERIca ) = United States Of America
 * ---------------------------------------------------------------------------
 */

CREATE SCHEMA IF NOT EXISTS wallethub;
USE wallethub;

DROP FUNCTION IF EXISTS initcap;

DELIMITER ||

CREATE FUNCTION `initcap`( input VARCHAR(256) ) RETURNS varchar(256) CHARSET latin1
BEGIN
 DECLARE currentChar CHAR(1);
 DECLARE output VARCHAR(128);
 DECLARE idx INT DEFAULT 1;
 DECLARE bool INT DEFAULT 1;
 DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';
 SET output = LCASE( input );
 WHILE idx < LENGTH( input ) DO
	BEGIN
	SET currentChar = SUBSTRING(output, idx, 1);
	IF LOCATE( currentChar, punct ) > 0 THEN
		SET bool = 1;
	ELSEIF bool=1 THEN
		BEGIN
		IF currentChar >= 'a' AND currentChar <= 'z' THEN
			BEGIN
			SET output = CONCAT(LEFT(output, idx - 1),UCASE(currentChar),SUBSTRING(output, idx + 1));
			SET bool = 0;
			END;
		ELSEIF currentChar >= '0' AND currentChar <= '9' THEN
			SET bool = 0;
		END IF;
		END;
	END IF;
	SET idx = idx + 1;
	END;
 END WHILE;
 RETURN TRIM(output);
END ||

DELIMITER ;

SELECT initcap('UNITED states Of AmERIca ');