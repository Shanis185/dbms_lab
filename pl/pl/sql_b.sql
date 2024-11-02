set SERVEROUTPUT ON;

DECLARE
    accntno int;
    xminbal number(50);
    xbal number(50);

BEGIN
    accountno:=&accountno;
    select accbal into xbal from account where accno=accntno;

    if xbal>xminbal then
        while xbal-200>=xminbal LOOP
            xbal:=xbal-200;
            update account set accbal=xbal where accno=accntno;
        end loop;

        dbms.DBMS_OUTPUT.PUT_LINE('balance:'||xbal);

    ELSE
        DBMS_OUTPUT.PUT_LINE('unsussecfull');
        dbms_output.put_line('Current balance: ' || xbal);

    end if;
end;
/
