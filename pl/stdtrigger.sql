set serverout ON;
create or replace TRIGGER stdtrigger
before insert or update or DELETE on std_honors
for each row

DECLARE
v_message VARCHAR(50);

BEGIN
    if deleting then
    v_message:='deleting' ||:old.name;
    elsif inserting THEN
    v_message:='inserting'||:new.name;
    elsif updating THEN
        if :new.name=:old.name then
            v_message:='updated'||:new.name;
        else
            v_message:=:old.name||'changed to'||:new.name;
        end if;
    end if;
    dbms_output.put_line(v_message);
end;
/

    