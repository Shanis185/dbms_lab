
CREATE TABLE account(accno int NOT NULL PRIMARY KEY,name VARCHAR(15) NOT NULL,accbal INT NOT NULL);
insert into account values(1,'Abhijith O',65000);
insert into account values(2,'Anu',35000);
insert into account values(3,'Aleena',25500);
insert into account values(4,'Vignesh',45900);
insert into account values(5,'Abhishek',65000);
insert into account values(6,'Sreejith',55000);


set serveroutput on
accept account_no PROMPT 'Enter account number: '
prompt '1.Debit   2.Credit   3.Check balance'
DECLARE
	choice varchar(1);
	amount number(5);
	account_no number(5) := &account_no;
	min_bal number := 500;
	bal number(10);
	ch number :=1;





BEGIN
	choice := &choice;
	amount :=&amount;
	select accbal into bal from account where accno = account_no;
	case
		when choice = '1' then
			if(min_bal<=(bal - amount)) then
				update account set accbal = accbal - amount where accno = account_no;
				dbms_output.put_line('Debited');
			else
				dbms_output.put_line('Insufficient balance');
			end if;
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('New Balance :'||amount);
		when choice = '2' then
			update account set accbal = accbal + amount where accno = account_no;
			dbms_output.put_line('Credited');
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('New Balance :'||amount);		
		when choice = '3' then
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('Balance '||amount);
	END CASE;
END;
/

