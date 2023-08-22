select * from emp where name like 'd%';



--ADBMS Practical 7

create or replace trigger inst
    after insert on EMP
    for each row
begin
    DBMS_OUTPUT.PUT_LINE('New record added successfully');
end;

create or replace trigger upemp
    after update on EMP
    for each row
    begin
        DBMS_OUTPUT.PUT_LINE('Salary Updated Successfully');
        DBMS_OUTPUT.PUT_LINE('Old salary '|| :OLD.SAL);
        DBMS_OUTPUT.PUT_LINE('New salary '|| :NEW.SAL);
    end;

create or replace trigger deltri
    before delete on EMP
    for each row
    when(NEW.ID = 1)
    begin
        DBMS_OUTPUT.PUT_LINE('User Do not have permission');
    end;

declare
    id number;
    begin
    delete from emp where ID=1;
end;

declare
    begin
    insert into emp values(8,'dhev','cS',4000);
end;

declare
    begin
    update emp set SAL=4000 where ID=7;
end;

create or replace trigger uped
    after update of sal on EMP
--     referencing old as o new as n
    for each row when ( NEW.SAL <= 5000 )
    begin
        dbms_output.put_line('old salary was '||:OLD.SAL);
        dbms_output.put_line('new salary is '||:NEW.SAL);
    end;

--ADBMS Practical 8

create or replace package CRUDEMP
as
    procedure addemp(i number,n varchar,d varchar,sal number);
    procedure updemp(i number,sl number);
    procedure delemp(i number);
    procedure dispemp(i number,n varchar,d varchar,sal number);
end;

create or replace package body CRUDEMP
as
    procedure addemp(i number,n varchar,d varchar,sal number)
is
begin
    insert into emp values(i,n,d,sal);
    commit;
end addemp;

    procedure updemp(i number,sl number)
    is
    begin
        update emp set EMP.SAL=sl where ID=i;
        commit;
    end updemp;

    procedure delemp(i number)
    is
    begin
        delete from emp where ID=i;
        commit;
    end delemp;

    procedure dispemp(i number,n varchar,d varchar,sal number)
    is
        record emp%rowtype;
        cursor c is select * from emp;
    begin
        open c;
        loop
            fetch c into record;
            exit when c%notfound;
            DBMS_OUTPUT.PUT_LINE(record.id || ' '  || record.name || ' ' || record.dept || ' '  || record.sal);
        end loop;
        close c;
        end dispemp;

end;

-- Execution of CRUDemp

declare
    i number:=&i;n varchar(30):=&n;d varchar(30):=&d;s number:=&s;
    begin
    CRUDEMP.addemp(i,n,d,s);
    end;


declare
    i number:=&i;
    s number:=&s;
    begin
    CRUDEMP.updemp(i,s);
    end;

declare
    i number:=&i;
    begin
    CRUDEMP.delemp(i);
    end;

declare
    i number;n varchar(30);d varchar(30);s number;
    begin
    CRUDEMP.dispemp(i,n,d,s);
    end;

create or replace package HROperations
as
    procedure hire(i number,n varchar,d varchar,sla number);
    procedure fire(i number);
end;

create or replace package body HROPERATIONS
as
    procedure hire(i number,n varchar,d varchar,sla number)
    is
        begin
            insert into emp values(i,n,d,sla);
            commit;
        end;

    procedure fire(i number)
    is
    begin
    delete from emp where ID=1;
    commit;
    end fire;
end;

declare
    i number:=&i;
    begin
    HROPERATIONS.fire(i);
    end;

create or replace package MATHop
as
    function addon(x number,y number) return number;
    function sub(x number,y number) return number;
    function div(x number,y number) return number;
    function mul(x number,y number) return number;
end;

create or replace package body MATHOP
as
function addon(x number,y number) return number
is
    s number;
    begin
        s:=(x+y);
        return(s);
    end addon;

function sub(x number,y number) return number
is
    s number;
    begin
        s:=(x-y);
        return(s);
    end sub;

function div(x number,y number) return number
is
    d number;
    begin
        d:=(x/y);
        return(d);
    end div;

function mul(x number,y number) return number
is
    m number;
    begin
        m:=(x*y);
        return(m);
    end mul;
end;

create or replace function addi(x number,y number) return number
is
    sum number;
    begin
        sum:=(x+y);
        return(sum);
    end;

create or replace function mul(x number,y number) return number
is
    m number;
    begin
        m:=(x*y);
        return(m);
    end;

create or replace function a(x number,y number) return number
is
    m number;
    begin
        m:=(x+y);
        return(m);
    end;

create or replace function sub(x number,y number) return number
is
    s number;
    begin
        s:=(x-y);
        return(s);
    end sub;

create or replace function div(x number,y number) return number
is
    d number;
    begin
        d:=(x/y);
        return(d);
    end div;

begin
    DBMS_OUTPUT.PUT_LINE('Addition is '||MATHop.addon(3,5));
end;

begin
    DBMS_OUTPUT.PUT_LINE('Subtraction is '||MATHop.sub(3,5));
end;

begin
    DBMS_OUTPUT.PUT_LINE('Division is '||MATHop.div(3,5));
end;

begin
    DBMS_OUTPUT.PUT_LINE('Multiplication is '||MATHop.mul(3,5));
end;


declare
    empDetails emp%rowtype;
    cursor myCursor is select * from emp;
begin
    open myCursor;

    loop
        fetch myCursor into empDetails;
        exit when (myCursor%notfound);
        DBMS_OUTPUT.PUT_LINE(empDetails.NAME);
    end loop;
end;