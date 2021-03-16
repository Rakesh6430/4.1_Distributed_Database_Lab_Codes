SET SERVEROUTPUT ON;

DECLARE
    t_name money.name%TYPE;
    t_taka money.taka%TYPE;
BEGIN
    select name, taka into t_name, t_taka, from money where id=1;
    DBMS_OUTPUT.PUT_LINE(t_name);
    DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/