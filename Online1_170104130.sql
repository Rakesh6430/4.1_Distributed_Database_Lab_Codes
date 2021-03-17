SET VERIFY OFF;
SET SERVEROUTPUT ON;
DECLARE
	OP varchar2(10) := '&Enter_Choice';
	ROW_NO money.id%TYPE;
	TOTAL_MONEY money.taka%TYPE;
	MONEY_ money.taka%TYPE;
BEGIN
	select count(id) into ROW_NO from money;
	IF OP='INSERT' THEN
		ROW_NO:=ROW_NO+1;
		
		IF ROW_NO <= 7 THEN
			insert into money values(ROW_NO,'A',100);
		ELSE
			insert into money values(ROW_NO,'A',200);
		END IF;
	ELSIF OP='SHOW' THEN
		TOTAL_MONEY:=0;
	        select count(id) into ROW_NO from money;
		FOR i IN 1..ROW_NO LOOP
			select taka into MONEY_ from money where id=i;
			TOTAL_MONEY:=TOTAL_MONEY+MONEY_;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('TOTAL TAKA: '||TOTAL_MONEY);
			
		END IF;
	
END;
/