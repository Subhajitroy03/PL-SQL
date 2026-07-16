SET VERIFY OFF
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE leap_year(d DATE)
IS
yr NUMBER;
BEGIN
	yr:=EXTRACT(YEAR FROM d);
	IF MOD(yr,100)=0 THEN
		IF MOD(yr,400)=0 THEN
			DBMS_OUTPUT.PUT_LINE(yr || ' is a leap year');
		ELSE
			DBMS_OUTPUT.PUT_LINE(yr || ' is not a leap year');
		END IF;
	ELSE
		IF MOD(yr,4)=0 THEN
			DBMS_OUTPUT.PUT_LINE(yr || ' is a leap year');
		ELSE
			DBMS_OUTPUT.PUT_LINE(yr || ' is not a leap year');
		END IF;
	END IF;
END;
/

ACCEPT n VARCHAR(10) PROMPT 'Enter a date(DD-MM-YYYY): '

BEGIN
	leap_year(TO_DATE('&n','DD-MM-YYYY'));
END;
/

