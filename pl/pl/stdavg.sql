set serveroutput on;
DECLARE
    average number(5);
    f_date VARCHAR2(20);
    f_day varchar2(20);
    rollno number(5);
    nm varchar2(15);

BEGIN
    rollno:=&rollno;
    select((mark1+mark2+mark3)/3) into average from student where roll_no=rollno;
    select name into nm from student where name=nm;
    dbms_output.put_line('name:'||nm);
    dbms_output.put_line('rollnumber:'||rollno);
    DBMS_OUTPUT.PUT_LINE('average:'||average);
    if average<40 THEN
        DBMS_OUTPUT.PUT_LINE('need improvement');
    end if;
    SELECT TO_CHAR(sysdate, 'DD-mm-YYYY')into f_date from dual;
    select TO_CHAR (sysdate,'day')into f_day from dual;
    DBMS_OUTPUT.PUT_LINE('date:'||f_date);
    DBMS_OUTPUT.PUT_LINE('day:'||f_day);

end;
/