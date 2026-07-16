SET VERIFY OFF
SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION leap_year_check(d DATE)
RETURN NUMBER
IS
yr NUMBER;
BEGIN
	yr:=EXTRACT(YEAR FROM d);
	IF MOD(yr,100)=0 THEN
		IF MOD(yr,400)=0 THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	ELSE
		IF MOD(yr,4)=0 THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	END IF;
END;
/

ACCEPT n CHAR PROMPT 'Enter a date(DD-MM-YYYY): '
DECLARE
result NUMBER;
dt DATE;
yr NUMBER;
BEGIN
	result:=leap_year_check(TO_DATE('&n','DD-MM-YYYY'));
	dt:=TO_DATE('&n','DD-MM-YYYY');
	yr:=EXTRACT(YEAR FROM dt);
	IF result=1 THEN
		DBMS_OUTPUT.PUT_LINE(yr || ' is a leap year');
	ELSE
		DBMS_OUTPUT.PUT_LINE(yr || ' is not a leap year');
	END IF;
END;
/




