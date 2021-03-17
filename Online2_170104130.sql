SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT "ID = "
ACCEPT Y char PROMPT "NAME = "
ACCEPT Z char PROMPT "ADDRESS = "



CREATE OR REPLACE PROCEDURE printprocedure(A IN supplier.sid%TYPE,B IN supplier.sname%TYPE,C IN supplier.address%TYPE)
IS
FOUND_ID int;
BEGIN
    FOUND_ID:=searchAccount(A);
    IF FOUND_ID=1 then
        DBMS_OUTPUT.PUT_LINE('Account already exists!');
    ELSEIF FOUND_ID=0 then
        insert into supplier values(A, B, C);
        DBMS_OUTPUT.PUT_LINE('Account created');
    END IF;

END printprocedure;
/

CREATE OR REPLACE FUNCTION SearchAccount(A IN supplier.sid%TYPE,B IN supplier.sname%TYPE,C IN supplier.address%TYPE)
RETURN int
IS
FOUND_ID int:=0;

BEGIN

    FOR R in(select * from supplier where sid=A,sname=B,address=C) LOOP
        FOUND_ID:=1;
    END LOOP;

    RETURN FOUND_ID;
END SearchAccount;
/

DECLARE
    ID supplier.sid%type;
    NAME supplier.sname%type;
    ADDRESS supplier.address%type;

BEGIN
    ID:=&X;
    NAME:='&Y';
    ADDRESS:='&Z';
    printprocedure(ID,NAME,ADRESS);

END;
/

commit;