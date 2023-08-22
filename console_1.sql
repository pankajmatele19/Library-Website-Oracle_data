-- Web Service Project Data
drop table fine;
create table fine(fineid number primary key,userid number references USER101(USERID) on delete cascade,bookid number references BOOK(BID) on delete cascade,returnDay date, day number,fine number);

create table issue(issid number primary key,userid number references USER101(USERID) on delete cascade, bookid number references BOOK(BID) on delete cascade,issd date,retd date);

create or replace procedure dispfin(cur out sys_refcursor,fid out number,uid out number,un out varchar,bi out number,rd out varchar,d out number,f out varchar)
as
    begin
        open cur for
            select fine.FINEID,fine.userid,USER101.NAME,fine.bookid,fine.returnDay,fine.DAY,fine.FINE into fid,uid,un,bi,rd,d,f from FINE,USER101 where fine.userid = USER101.USERID;

    end ;


create or replace procedure addfin(fid number,uid number,bid number,issd varchar,d number,f number)
is
begin
    insert into FINE(fineid, userid, bookid, returnDay, day, fine) values(fid,uid,bid,issd,d,f);
    commit;
end;


create or replace procedure delfin(uid in number,bid in number)
is
begin
    delete from FINE where USERID=uid and BOOKID=bid;
    commit;
end;


create table book(bid number primary key,name varchar(30) unique, author varchar(30),quantity number);

create or replace procedure addbook(bookid number,bname varchar2,authorn varchar2,quan number)
is
begin
    insert into BOOK(BID,NAME,AUTHOR,QUANTITY) values(bookid,bname,authorn,quan);
    commit;
end;



create or replace procedure dispbook(cur out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number)
as
    begin
        open cur for
            select bid, name, author, quantity into bid,bn,au,q from BOOK;

    end ;


create or replace procedure updatebo(boid number,quan number)
is
begin
    update BOOK set QUANTITY=quan where BID=boid;
    commit;
end;


create or replace procedure delb(bookid in number)
is
begin
    delete from BOOK where BID=bookid;
    commit;
end;


create or replace procedure dispiss(uid out sys_refcursor,isue out number,usid out number,un out varchar,bid out varchar,id out date,rd out date)
as
    begin
        open uid for
            select issue.issid,issue.userid,USER101.NAME,issue.bookid,issue.issd,issue.retd into isue,usid,un,bid,id,rd from ISSUE,USER101 where issue.USERID = USER101.USERID;

    end ;

create or replace procedure addiss(iss number,usid number,boid number,issued varchar,returnd varchar)
as
begin
    insert into ISSUE(issid, userid, bookid, issd, retd) values(iss,usid,boid,issued,returnd);
    commit;
end;


create or replace procedure deliss(uid in number,bid in number)
is
begin
    delete from ISSUE where USERID=uid and BOOKID=bid;
    commit;
end;


create or replace procedure upuser(usid number,pass varchar, con varchar)
is
begin
    update USER101 set PASSWORD=pass,CONTACT=con where USERID=usid;
    commit;
end;

create or replace function valid_login(uname varchar, psd varchar) return varchar is
n varchar(50);
p varchar(50);
begin
select USERNAME,PASSWORD into n,p from ADMIN101 where USERNAME=uname and PASSWORD=psd;
if(n=uname and p=psd)then
return('yes');
end if;
exception
WHEN NO_DATA_FOUND THEN
return('no');
end;

declare
    n number;
    rev number;
    rem number;
begin
    n:=&n;
    rev:=0;
    rem:=0;
    while(n>0) loop
        rem:=(n mod 10);
        rev:=(rev*10)+rem;
        n:=n/10;
    end loop;
dbms_output.put_line(rev);
end;


create or replace function coubo
return number
is
    num number;
begin
    select count(BID) into num from BOOK;
    return(num);
end;


create or replace function couiss
return number
is
    num number;
begin
    select count(USERID) into num from ISSUE;
    return(num);
end;


create or replace function coufin
return number
is
    num number;
begin
    select count(USERID) into num from FINE;
    return(num);
end;



--ADBMS Practicals
drop table emp;
    create table emp(id number,name varchar(30),dept varchar(20),sal number);

insert into emp values(101,'Pankaj','IT',5000);

insert into emp values(102,'Arpit','IT',10000);

insert into emp values(103,'Kiran','CS',6000);

declare
    rows number;
        begin
        update emp set sal = sal + 5000 where dept='IT';
        if sql%notfound then
            DBMS_OUTPUT.PUT_LINE('No emp found');
        elsif sql%found then
            rows:= sql%rowcount;
            DBMS_OUTPUT.PUT_LINE(rows ||' employees updated');
        end if;
        end;

declare
    id number;
    name varchar(30);
    dept varchar(30);
    sal number;
    cursor c is select id,name,dept,sal from emp;
    begin

    open c;
    loop
        fetch c into id,name,dept,sal;
        exit when c%notfound;
        DBMS_OUTPUT.PUT_LINE(id || ' ' ||name || ' ' || dept || ' ' || sal);

    end loop;
    close c;
end;

declare
    id emp.id%type;
    name emp.name%type;
    dept emp.dept%type;
    sal emp.sal%type;
    cursor c is select id,name,dept,sal from emp;
    begin

    open c;
    loop
        fetch c into id,name,dept,sal;
        exit when c%notfound;
        DBMS_OUTPUT.PUT_LINE(id || ' ' || name || ' ' || dept || ' ' || sal);

    end loop;
    close c;
end;

declare
    cursor c is select name,sal from emp;
    begin
    for d in c
    loop
        DBMS_OUTPUT.PUT_LINE(d.name || ' '  || d.sal);
        end loop;
end;

declare
    id number;
    data emp%rowtype;
    cursor c(eid number) is select * from emp where id=eid;
    begin
    id:=&id;
    open c(id);
    loop
        fetch c into data;
        exit when c%notfound;
        DBMS_OUTPUT.PUT_LINE(data.id || ' '  || data.name || ' ' || data.dept || ' '  || data.sal);

    end loop;
    close c;
    end;


declare
    eid number;
    id number;
    n varchar;
    sal number;
    begin
    eid:=&eid;
    select id,name,sal into id,n,sal from emp where emp.id = eid;
    if(sql%found);
end;



create table bus(busid int primary key, destination varchar(30), source varchar(30),fare int, capacity int);

create or replace procedure addbus(id number,des varchar,sc varchar,fr number,cp number)
is
begin
    insert into bus(busid, destination, source, fare, capacity) values(id,des,sc,fr,cp);
    commit;
end;

create or replace procedure updatebus(id number,des varchar,sc varchar,fr number)
is
begin
    update bus set destination=des,source=sc,fare=fr where busid=id;
    commit;
end;

create or replace procedure delbus(id number)
is
begin
    delete from bus where busid=id;
    commit;
end;

create or replace procedure dispbus(bid number,dest out varchar,st out varchar,fre out number,cpa out number)
    is
        data BUS%rowtype;
        cursor c is select * from BUS;
    begin
        open c;
        loop
            fetch c into data;
            exit when c%notfound;
            DBMS_OUTPUT.PUT_LINE(data.busid || ' '  || data.destination || ' ' || data.source || ' '  || data.fare || ' ' || data.capacity);
        end loop;
        close c;
        end;

create or replace trigger onbusupdate
    before update on BUS
    for each row
    begin
        DBMS_OUTPUT.PUT_LINE('Bus Updated');
        DBMS_OUTPUT.put_line('old destination ' || :old.destination);
        DBMS_OUTPUT.put_line('new destination ' || :new.destination);
        DBMS_OUTPUT.put_line('old source ' || :old.source);
        DBMS_OUTPUT.put_line('new source ' || :new.source);
        DBMS_OUTPUT.put_line('old fare ' || :old.fare);
        DBMS_OUTPUT.put_line('new fare ' || :new.fare);

    end;

create or replace trigger delbus
    before delete on BUS
    for each row
    begin
        dbms_output.put_line('You cannot delete bus details');
    end;

declare
    i number:=&i;d varchar(30):=&d;s varchar(30):=&s;f number:=&f; c number:=&c;
    begin
    addbus(i,d,s,f,c);
    end;

declare
    i number:=&i;d varchar(30):=&d;s varchar(30):=&s;f number:=&f;
    begin
    updatebus(i,d,s,f);
    end;

declare
    i number;d varchar(30);s varchar(30);f number;c number;
    begin
    dispbus(i,d,s,f,c);
    end;

declare
    i number:=&i;
    begin
    delbus(i);
    end;

declare
    i number;
    d varchar(30);
    s varchar(30);
    f number;
    begin
    i:=&n;
    d:=&b;
    s:=&n;
    f:=&b;
    updatebus(i,d,s,f);
end;

