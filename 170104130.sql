/*Question*/
 
--who have taken the faculty name of the Faculty who teaches only mechanics course
--where fname for Faculty is Zobair.
--trying to find whether he teaches only mechanics or not.
/*Preferable for deptid 3 because it contains one record*/

SET VERIFY OFF;
SET SERVEROUTPUT ON;

DECLARE
        BEFORE CONSTANT PLS_INTEGER := -1;
        AFTER CONSTANT PLS_INTEGER := 1;
        SAME CONSTANT PLS_INTEGER := 0;
	F_name FACULTY.fname%TYPE:='Zobair';
	FACULTY_ID FACULTY.Fid%TYPE;
	COURSE_num COURSE.cnum%TYPE;
	COURSE_COUNT int;
	COURSE_name COURSE.cname%TYPE;
        Result int;

BEGIN
	select Fid into FACULTY_ID from FACULTY where fname=F_name;
	select count(cnum) into COURSE_COUNT from COURSE where Fid=FACULTY_ID;
	
	IF COURSE_COUNT=1 THEN
		select cnum into COURSE_num from COURSE where Fid=FACULTY_ID;
		select cname into COURSE_name from COURSE where cnum=COURSE_num;
		
		Result :=  case when COURSE_name < 'Mechanics' then BEFORE
                when COURSE_name = 'Mechanics' then SAME else AFTER end;
		CASE Result -0  
			WHEN 0 THEN
				DBMS_OUTPUT.PUT_LINE('The Teacher only teaches Mechanics');
			ELSE
				DBMS_OUTPUT.PUT_LINE('The Teacher teaches more than one course');
		END CASE;
	
	ELSE
		DBMS_OUTPUT.PUT_LINE('  NOT POSSIBLE  ');
				
	END IF;
	
END;
/

commit;
	