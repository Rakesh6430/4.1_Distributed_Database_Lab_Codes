SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ID = '
ACCEPT Y CHAR PROMPT 'NAME = '
ACCEPT Z CHAR PROMPT 'ADDRESS = '

CREATE OR REPLACE FUNCTION searchRecord(U IN supplier.sid%TYPE, V IN supplier.sname%TYPE, W IN supplier.address%TYPE)
RETURN NUMBER
IS
	F NUMBER;
	I supplier.sid%TYPE;
	J supplier.sname%TYPE;
	K supplier.address%TYPE;
BEGIN
	F:=0;
	FOR R IN (SELECT * FROM supplier) LOOP
		I:=R.sid;
		J:=R.sname;
		K:=R.address;
		IF U=I THEN
			IF V=J THEN
				IF W=K THEN
					F:=1;
				END IF;
			END IF;
		END IF;
	END LOOP;
	
	RETURN F;
END searchRecord;
/

CREATE OR REPLACE PROCEDURE PRINT_INSERT(D IN supplier.sid%TYPE, U IN supplier.sid%TYPE, V IN supplier.sname%TYPE, W IN supplier.address%TYPE)
IS

BEGIN
	IF D=0 THEN
		insert into supplier values(U,V,W);
		DBMS_OUTPUT.PUT_LINE('Account created succesfully');
		commit;
	ELSE
		DBMS_OUTPUT.PUT_LINE('Account already exists');
	END IF;
END PRINT_INSERT;
/

DECLARE
	A NUMBER;
	B VARCHAR2(30);
	C VARCHAR2(30);
	FOUNDED NUMBER;
BEGIN
	A := &X;
	B := '&Y';
	C := '&Z';
	
	FOUNDED := searchRecord(A,B,C);
	
	IF FOUNDED=0 THEN
		PRINT_INSERT(FOUNDED, A, B, C);
	ELSE
		PRINT_INSERT(FOUNDED, A, B, C);
	END IF;
END;
/
