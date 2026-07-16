SET VERIFY OFF   -- to avoid extra lines not mandatory
SET SERVEROUTPUT ON;   -- to show output on screen 


CREATE OR REPLACE FUNCTION factorial_func(num NUMBER) RETURN NUMBER IS
fac NUMBER:=1;
BEGIN
FOR i IN 1 .. num LOOP
	fac:=fac*i;
END LOOP;
RETURN fac;
END;
/


ACCEPT n NUMBER PROMPT 'Enter a number: '
DECLARE
result NUMBER;
BEGIN
	result:=factorial_func(&n);
	DBMS_OUTPUT.PUT_LINE(result);
END;
/

