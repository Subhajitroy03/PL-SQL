CREATE TABLE random_num(
    rand_no NUMBER(20)
);

BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO random_num
        VALUES(TRUNC(DBMS_RANDOM.VALUE(1,1000)));
    END LOOP;

    COMMIT;
END;
/

SELECT * from random_num;
