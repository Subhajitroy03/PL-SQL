--- SUBSTR(string, start_position, length)

SET VERIFY OFF
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION ReverseStr(s VARCHAR2) 
RETURN VARCHAR2 IS 
rev VARCHAR2(100):='';
BEGIN
	FOR i in REVERSE 1..LENGTH(s) LOOP
		rev:=rev || SUBSTR(s,i,1);
	END LOOP;
	RETURN rev;
END;
/
SHOW ERRORS FUNCTION ReverseStr;
ACCEPT str CHAR PROMPT 'Enter a string: '
DECLARE
rev VARCHAR2(100);
BEGIN
	rev:= ReverseStr('&str');
	DBMS_OUTPUT.PUT_LINE('Reversed String: ' || rev);
END;
/

	
