SET VERIFY OFF
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE prime(n NUMBER) IS
flag NUMBER:=1;
BEGIN
IF n=1 THEN 
	DBMS_OUTPUT.PUT_LINE('1 is not a prime nor composite');
	RETURN;
END IF;
FOR i in 2..n-1 LOOP
	IF MOD(n,i)=0 THEN
		flag:=0;
	END IF;
END LOOP;
IF flag=1 THEN
	DBMS_OUTPUT.PUT_LINE(n|| ' is a prime number');
ELSE 
	DBMS_OUTPUT.PUT_LINE(n|| ' is not a prime number');
END IF;
END;
/

ACCEPT a NUMBER PROMPT 'Enter a number: '

BEGIN
	prime(&a);
END;
/
