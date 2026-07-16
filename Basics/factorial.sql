SET VERIFY OFF   -- to avoid extra lines not mandatory
SET SERVEROUTPUT ON;   -- to show output on screen 
ACCEPT n NUMBER PROMPT 'Enter a number: '
DECLARE
num NUMBER:=&n;
fac NUMBER:=1;
BEGIN
FOR i IN 1 .. num LOOP
	fac:=fac*i;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Factorial is: ' || fac);
END;
/
