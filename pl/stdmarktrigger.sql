set SERVEROUTPUT ON
create or replace trigger std_trigger
before insert on student_avg
for each ROW
BEGIN
    :new.total:=:new.subj1+:new.subj2+:new.subj3;
    :new.avg:=:new.total/3;
end;
/