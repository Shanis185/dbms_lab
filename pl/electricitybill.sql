set serveroutput ON
DECLARE
v_unitconsumed NUMBER;
v_presentreading NUMBER;
v_pastreading number;
v_charge number;
v_consumerno number;

    cursor econsumer(p_consumerno number) is 
    select past_reading,present_reading
    from bill 
    where consumer_no=p_consumerno;

BEGIN
    dbms_output.put_line('enter the consumer no');
    v_consumerno:=&consumer_no;
    open econsumer(v_consumerno);
    fetch econsumer into v_pastreading, v_presentreading;
    IF econsumer%FOUND THEN
    
        v_unitconsumed:=v_presentreading-v_pastreading;
        IF v_unitconsumed<=100 then 
            v_charge:=v_unitconsumed*5;
        ELSIF v_unitconsumed between 101 and 300 THEN
            v_charge:=(100*5)+(v_unitconsumed-100)*7.5;
        ELSIF v_unitconsumed between 301 and 500 THEN
            v_charge:=(100*5)+(200*7.5)+(v_unitconsumed-300)*15;
        ELSE 
            v_charge:=(100*5) + (200*7.5) + (200*15) + (v_unitconsumed-500) *22.5;
        END IF;
        
        dbms_output.put_line('consumer no:'||v_consumerno);
        DBMS_OUTPUT.PUT_LINE('total unit consumed'||v_unitconsumed);
        DBMS_OUTPUT.PUT_LINE('total charge'||v_charge);
    ELSE
        DBMS_OUTPUT.PUT_LINE('the consumer no is not found'||v_consumerno);
    END IF;
    CLOSE econsumer;
end;
/   
