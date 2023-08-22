-- insert into ISSUE101 values(4,11,'22-05-2022','25-07-2022');
--
-- select * from FINE101;
--
create table admin101(aid number primary key,name varchar(30) unique,username varchar(30),password varchar(30),email varchar(30),contact varchar(20));

create table user101(userid number primary key,name varchar(30) unique,username varchar(30),password varchar(30),email varchar(30),contact varchar(20));
-- ALTER TABLE ISSUE101
-- ADD CONSTRAINT usssserid
-- FOREIGN KEY(USERID)
-- REFERENCES USER101 (USERID);

-- select * from BOOKS101;
--
-- select * from ISSUE101;
--
--
-- insert into FINE101 values(4,11,'22-07-2022',6,'6rs');
--

-- user procedure

-- select * from USER101;
--
--
-- create  or replace procedure "ADDUSER"(userid number,name varchar,uname varchar,pass varchar,email varchar,contact varchar)
-- as
-- begin
--     insert into USER101(USERID,NAME,USERNAME,PASSWORD,EMAIL,CONTACT) values (userid,name,uname,pass,email,contact);
--     commit;
-- end;
-- /

-- declare
--     n varchar(30);
--     u varchar(30);
--     p varchar(30);
--     e varchar(30);
--     c varchar(30);
-- begin
--     n:=&n;
--     u:=&u;
--     p:=&p;
--     e:=&e;
--     c:=&c;
--     ADDUSER(n,u,p,e,c,e);
--     DBMS_OUTPUT.PUT_LINE(e);
-- end;
--
-- -- Add Book Procedure
--
-- --

-- declare
--     b number(10);
--     n varchar(30);
--     a varchar(30);
--     q number(10);
--     d varchar(30);
-- begin
--     b:=&b;
--     n:=&n;
--     a:=&a;
--     q:=&q;
--     d:=&d;
--     addbooks(b,n,a,q,d);
-- end;
--
-- -- function to get count of books
--
-- create or replace function coubook
-- return number
-- is
--     num number;
-- begin
--     select count(BID) into num from BOOK101;
--     return(num);
-- end;
--
--
--
-- declare
-- begin
--     dbms_output.PUT_LINE(coubook);
-- end;
--
-- create or replace function couusers
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from USER101;
--     return(num);
-- end;
--
--
--
--
-- declare
--     n number;
-- begin
--     dbms_output.PUT_LINE(couusers(n));
-- end;
--
--
-- create or replace function couissue
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from ISSUE101;
--     return(num);
-- end;
--
--
--
-- declare
--     n number;
-- begin
--     dbms_output.PUT_LINE(couissue(n));
-- end;

create or replace function coufine
return number
is
    num number;
begin
    select count(fine_id) into num from FINE101;
    return(num);
end;
--
-- declare
--     n number;
-- begin
--     dbms_output.PUT_LINE(coufine(n));
-- end;

--

-- create or replace package body ADBMS_PROJECT as
--     create or replace function cubook11(n out number)
--         return number
--         is
--         begin
--             select count(bid) into n from books101;
--             return(n);
--             end;
--         end ADBMS_PROJECT;
--         /
-- select * from BOOKS101;

--

-- udpate user procedure

-- create or replace procedure updateuser(usid number,pass varchar, con varchar)
-- is
-- begin
--     update USER101 set PASSWORD=pass,CONTACT=con where USERID=usid;
--     commit;
-- end;
--
-- CREATE OR REPLACE Function dispuser
--    (id in number,e in varchar)
--    RETURN varchar
-- IS
--    uid number;
--
--    CURSOR c1
--    IS
--      SELECT USERID
--      FROM USER101
--      WHERE USERID = uid;
--
-- BEGIN
--
--    OPEN c1;
--    FETCH c1 INTO uid;
--
--    if c1%notfound then
--       uid := 9999;
--    end if;
--
--    CLOSE c1;
--
-- RETURN uid;
--
-- END;
--
-- create or replace procedure dispuser(uid out sys_refcursor,usid out number,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar,res out varchar)
-- as
--     begin
--         open uid for
--             select userid, name, username, password, email, contact into usid,n,un,ps,e,c from USER101;
--
--     end ;
--
-- declare
--     n number;
--     ex exception;
-- begin
--     n:=&n;
--     if(n>2) then
--         raise ex;
--     end if;
--
-- exception
-- when ex then
--     dbms_output.PUT_LINE('number exceded');
-- end;
-- -- update book procedure

-- create or replace procedure updatebook(boid number,quan number)
-- is
-- begin
--     update BOOKS101 set QUANTITY=quan where BID=boid;
--     commit;
-- end;
-- /
--
-- declare
--     bid number(10);
--     quantity number(10);
-- begin
--     bid:=&bid;
--     quantity:=&quantity;
--     UPDATEBOOK(bid,quantity);
-- end;

-- add fine procedure

-- create or replace procedure addfine(uid number,bid number,issd varchar,d number,f number)
-- is
-- begin
--     insert into FINE101(userid, bid, returned, day, fine) values(uid,bid,issd,d,f);
--     commit;
-- end;

--display users
--
-- create or replace procedure dispuser(uid out sys_refcursor,usid out number,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar)
-- as
--     begin
--         open uid for
--             select USERID,NAME,USERNAME,PASSWORD,EMAIL,CONTACT into usid,n,un,ps,e,c from USER101;
--
--     end ;

--display books


-- create or replace procedure disbooks(uid out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number,d out varchar)
-- as
--     begin
--         open uid for
--             select  BID,NAME,AUTHOR,QUANTITY,DEPARTMENT into bid,bn,au,q,d from BOOKS101;
--
--     end ;


-- create or replace procedure disissue(uid out sys_refcursor,usid out number,bid out varchar,id out varchar,rd out varchar, ex out varchar)
-- as
--     begin
--         open uid for
--             select USERID,BOOKID,ISSUE_DATE,returned_date into usid,bid,id,rd from ISSUE101;
--     exception
--     end ;

-- delete issue procedure

-- create or replace procedure delissue(uid in number,bid in number)
-- is
-- begin
--     delete from ISSUE101 where USERID=uid and BOOKID=bid;
--     commit;
-- end;
--
-- declare
--     n number(10);
--     b number(10);
--     begin
--     n:=&n;
--     b:=&b;
--     DELISSUE(n,b);
-- end;

-- delete fines

-- create or replace procedure delfine(uid in number,bid in number)
-- is
-- begin
--     delete from FINE101 where USERID=uid and BID=bid;
--     commit;
-- end;

-- add user procedure

-- create  or replace procedure "ADDUSER"(name varchar,uname varchar,pass varchar,email varchar,contact varchar,ex out varchar)
-- as
-- begin
--     insert into USER101(USERID,NAME,USERNAME,PASSWORD,EMAIL,CONTACT) values (usid.nextval,name,uname,pass,email,contact);
--     commit;
--     ex:='User Added Successfully';
--     exception
--     when dup_val_on_index then
--         ex:='User Already Exists';
-- end;

--
-- add books procedure

-- create or replace procedure addbooks(bname varchar2,authorn varchar2,quan number,dept varchar2,ex out varchar)
-- is
-- begin
--     insert into BOOK101(BID,NAME,AUTHOR,QUANTITY,DEPARTMENT) values(bookid.nextval,bname,authorn,quan,dept);
--     commit;
--     ex:='Book Added Successfully';
--     exception
--     when dup_val_on_index then
--         ex:= 'Book already exists';
-- end;
-- --
-- declare
--     n varchar(30);
--     a varchar(30);
--     q number(10);
--     d varchar(30);
--     e varchar(30);
-- begin
--     n:=&n;
--     a:=&a;
--     q:=&q;
--     d:=&d;
--     addbooks(n,a,q,d,e);
--     DBMS_OUTPUT.PUT_LINE(e);
-- end;

--
-- add issue procedure
--
-- create or replace procedure addissue(usid number,boid number,issued varchar,returnd varchar)
-- as
-- begin
--     insert into ISSUE101(USERID,BOOKID,ISSUE_DATE,RETURNED_DATE) values(usid,boid,issued,returnd);
--     commit;
-- end;

--
-- create or replace procedure addfine(uid number,bid number,issd varchar,d number,f number)
-- is
-- begin
--     insert into FINE101(userid, bid, returned, day, fine) values(uid,bid,issd,d,f);
--     commit;
-- end;
--
-- create or replace procedure updateuser(usid number,pass varchar, con varchar)
-- is
-- begin
--     update USER101 set PASSWORD=pass,CONTACT=con where USERID=usid;
--     commit;
-- end;
-- /
--
-- create or replace procedure updatebook(boid number,quan number)
-- is
-- begin
--     update BOOKS101 set QUANTITY=quan where BID=boid;
--     update BOOKS101 set QUANTITY=quan where BID=boid;
--     commit;
-- end;
-- /
--
-- create or replace procedure delfine(uid in number,bid in number)
-- is
-- begin
--     delete from FINE101 where USERID=uid and BID=bid;
--     commit;
-- end;
-- /

create or replace procedure delissue(uid in number,bid in number)
is
begin
    delete from ISSUE101 where USERID=uid and BID=bid;
    commit;
end;
-- /

declare
    n number;
    u number;
    begin
    n:=&n;
    u:=&u;
    delissue(u,n);
    end;
-- create or replace procedure dispissue(uid out sys_refcursor,usid out number,un out varchar,bid out varchar,id out date,rd out date)
-- as
--     begin
--         open uid for
--             select issue101.USERID,USER101.NAME,issue101.BOOKID,issue101.issue_date,issue101.RETURNED_DATE into usid,un,bid,id,rd from ISSUE101,USER101 where issue101.USERID = USER101.USERID;
--
--     end ;
-- /

--

-- create or replace procedure dispbooks(cur out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number,d out varchar)
-- as
--     begin
--         open cur for
--             select BID,NAME,AUTHOR,QUANTITY,DEPARTMENT into bid,bn,au,q,d from BOOK101;
--
--     end ;
--
-- create or replace procedure dispfine(cur out sys_refcursor,uid out number,un out varchar,bi out number,rd out varchar,d out number,f out varchar)
-- as
--     begin
--         open cur for
--             select fine101.USERID,USER101.NAME,fine101.BID,fine101.RETURNED,fine101.DAY,fine101.FINE into uid,un,bi,rd,d,f from FINE101,USER101 where fine101.userid = USER101.USERID;
--
--     end ;


-- user - 3 (add,update,disp)
-- books - 3 (add,update,disp)
-- issue - 3 (add,del,disp)
-- fine - 3 (add,del,disp)
--

--
-- create or replace trigger tr1
--     after delete on ISSUE101
--     for each row
--     begin
--         dbms_output.put_line('issue is deleted');
--     end;

-- update ISSUE101 set userid=1 where ISSUEID=
--
-- insert into ISSUE101(userid, bookid, issue_date, returned) values (1,11,'21-06-2022','11-06-2022');
--
-- commit;

--
-- create or replace procedure delbook(bd in number)
--     is
--     iid number;
--     fid number;
--     begin
--         select ISSUE101.BOOKID,FINE101.BID into iid,fid from books101, issue101, FINE101 where books101.bid = bd and (ISSUE101.bookid is null) and (FINE101.BID is null);
--         if ((iid and fid) is null )
--     then
--     delete from books101 where bid = bd;
--     end if;
--
--         end;

--
--
-- ALTER TABLE SYSTEM.BOOKS101
-- ADD CONSTRAINT bookid
-- FOREIGN KEY (BID)
-- REFERENCES SYSTEM.FINE101 (BID) ON DELETE CASCADE;

-- drop table FINE101;
--
-- create table fine101(userid references USER101(USERID) on delete cascade, bid number references BOOKS101(BID) on delete cascade,returned_date date,day number,fine number);

-- select * from USER101;
--
--
-- delete from USER101 where USERID=5;
--
-- delete from USER101 where USERID=3;
--
--
--
-- create or replace procedure delbook(bookid in number)
-- is
-- begin
--     delete from BOOK101 where BID=bookid;
--     commit;
-- end;
-- /

-- create or replace function validate_Login(uname varchar, psd varchar) return varchar is
-- n varchar(50);
-- p varchar(50);
-- begin
-- select USERNAME,PASSWORD into n,p from ADMIN101 where USERNAME=uname and PASSWORD=psd;
-- if(n=uname and p=psd)then
-- return('Login Successfully');
-- end if;
-- EXCEPTION
-- WHEN NO_DATA_FOUND THEN
-- return('Wrong username or password');
-- end;
--
--
--
--
-- select VALIDATE_LOGIN('pankaj19','Pankaj@19') from dual;
--
-- drop sequence bookid;
--
--
-- insert into BOOK101(name,author,quantity,department) values (bookid.nextval,'cypher','valorant',10,'Game');
--
--
-- drop table USER101;
-- create table book101(bid number primary key,name varchar(30) unique,author varchar(30),quantity number,department varchar(20));
-- drop table ISSUE101;
-- create table issue101(USERID int references user101(USERID) on delete cascade ,user_name varchar(30),bookid number references BOOK101(BID) on delete cascade ,issue_date date,returned_date date);
--
-- insert into book101 values(1,'Data Science','MK',10,'CS');
-- drop table FINE101;
-- create table fine101(userid number references user101(USERID) on delete cascade ,user_name varchar(30),bid number references BOOK101(BID) on delete cascade ,returned date,day number,fine number);

-- select USER101.USERID,user101.name,FINE101.fine from USER101,FINE101 where fine101.userid = USER101.USERID;
--
-- select USER101.USERID,user101.name,issue101.issue_date from USER101,issue101 where issue101.userid = USER101.USERID;

--
-- create table fine101(userid number references user101(USERID) on delete cascade ,bid number references BOOKS101(BID) on delete cascade ,returned date,day number,fine number);
--
-- insert into BOOKS101(BID,NAME,AUTHOR,QUANTITY,DEPARTMENT) values (bid.nextval)


-- create or replace procedure finduser(uid in number, id out number,n out varchar)
-- is
-- begin
--         select USERID,NAME into id,n from USER101 where USERID=uid;
-- end;
--
-- declare
--     id number;
--     na varchar(30);
-- begin
--     id:=&id;
--     select USERID,NAME into id,na from USER101 where USERID=id;
--     dbms_output.PUT_LINE(id);
--     dbms_output.PUT_LINE(na);
-- end;
--
-- declare
--     id number;
--     uid number;
--     n varchar(30);
-- begin
--     id:=&id;
--     FINDUSER(id,uid,n);
-- end;



-- declare
--     n varchar(30);
--     marks number(10);
--     per float;
--     begin
--     n:=&n;
--     marks:=&marks;
--     per:=marks*5/100;
--     dbms_output.put_line('Name in Uppercase is :'||UPPER(n));
--     dbms_output.put_line('length of a name is :'||LENGTH(n));
--     dbms_output.put_line('Percentage is :'||per);
--     end;
--
-- -- Web Service Project Data
--
-- create table fine(fineid number primary key,userid number references USER101(USERID) on delete cascade,bookid number references BOOK101(BID) on delete cascade,returnDay date, day number,fine number);
--
-- create table issue(issid number primary key,userid number references USER101(USERID) on delete cascade, bookid number references BOOK101(BID) on delete cascade,issd date,retd date);
--
--
-- create or replace procedure dispfin(cur out sys_refcursor,fid out number,uid out number,un out varchar,bi out number,rd out varchar,d out number,f out varchar)
-- as
--     begin
--         open cur for
--             select fine.FINEID,fine.userid,USER101.NAME,fine.bookid,fine.returnDay,fine.DAY,fine.FINE into fid,uid,un,bi,rd,d,f from FINE,USER101 where fine.userid = USER101.USERID;
--
--     end ;
--
--
-- create or replace procedure addfin(fid number,uid number,bid number,issd varchar,d number,f number)
-- is
-- begin
--     insert into FINE(fineid, userid, bookid, returnDay, day, fine) values(fid,uid,bid,issd,d,f);
--     commit;
-- end;
--
--
-- create or replace procedure delfin(uid in number,bid in number)
-- is
-- begin
--     delete from FINE where USERID=uid and BID=bid;
--     commit;
-- end;
--
--
-- create or replace procedure dispiss(uid out sys_refcursor,isue out number,usid out number,un out varchar,bid out varchar,id out date,rd out date)
-- as
--     begin
--         open uid for
--             select issue.issid,issue.userid,USER101.NAME,issue.bookid,issue.issd,issue.retd into isue,usid,un,bid,id,rd from ISSUE,USER101 where issue.USERID = USER101.USERID;
--
--     end ;
--
-- create or replace procedure addiss(iss number,usid number,boid number,issued varchar,returnd varchar)
-- as
-- begin
--     insert into ISSUE(issid, userid, bookid, issd, retd) values(iss,usid,boid,issued,returnd);
--     commit;
-- end;
--
-- create table book(bid number primary key,name varchar(30) unique, author varchar(30),quantity number);
--
-- create or replace procedure addbook(bookid number,bname varchar2,authorn varchar2,quan number)
-- is
--     ex exception;
-- begin
--     if(quan>20) then
--         raise ex;
--     end if;
--     insert into BOOK(BID,NAME,AUTHOR,QUANTITY) values(bookid,bname,authorn,quan);
--     commit;
--     exception
--         when ex then
--         dbms_output.put_line('quantity cannot be greater than 20');
-- end;
--
--
--
-- create or replace procedure dispbook(cur out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number)
-- as
--     begin
--         open cur for
--             select bid, name, author, quantity into bid,bn,au,q from BOOK;
--
--     end ;
--
--
create or replace procedure updatebook(boid number,quan number,ex out varchar)
is
    e exception;
begin
    if(quan > 20) then
        raise e;
    end if;
    update BOOK set QUANTITY=quan where BID=boid;
    commit;
    ex:='book updated successfully';
    exception
    when e then
    ex:= 'quantity shold 20';
end;
--
-- create or replace procedure delbook(bookid in number)
-- is
-- begin
--     delete from BOOK101 where BID=bookid;
--     commit;
-- end;
-- /
--
--
--
-- create or replace procedure delb(bookid in number)
-- is
-- begin
--     delete from BOOK where BID=bookid;
--     commit;
-- end;
-- /


-- create or replace package WSproject as
--
-- --procedures
--
--     procedure addbook(bookid number,bname varchar2,authorn varchar2,quan number);
--
--     procedure addfin(fid number,uid number,bid number,issd varchar,d number,f number);
--
--     procedure addiss(iss number,usid number,boid number,issued varchar,returnd varchar);
--
--     procedure "ADDUSER"(userid number,name varchar,uname varchar,pass varchar,email varchar,contact varchar);
--
--     procedure delb(bookid in number);
--
--     procedure delfin(uid in number,bid in number);
--
--     procedure deliss(uid in number,bid in number);
--
--     procedure updatebo(boid number,quan number);
--
--     procedure upuser(usid number,pass varchar, con varchar);
--
-- --functions
--
--     function valid_login(uname varchar, psd varchar) return varchar;
--
--     function coubo return number;
--
--     function coufin return number;
--
--     function couus return number;
--
--     function couiss return number;
--
-- end WSproject;

-- create or replace package body WSproject as
--
-- procedure addbook(bookid number,bname varchar2,authorn varchar2,quan number)
-- is
-- begin
--     insert into BOOK(BID,NAME,AUTHOR,QUANTITY) values(bookid,bname,authorn,quan);
--     commit;
-- end addbook;
--
-- procedure addfin(fid number,uid number,bid number,issd varchar,d number,f number)
-- is
-- begin
--     insert into FINE(fineid, userid, bookid, returnDay, day, fine) values(fid,uid,bid,issd,d,f);
--     commit;
-- end addfin;
--
-- procedure addiss(iss number,usid number,boid number,issued varchar,returnd varchar)
-- as
-- begin
--     insert into ISSUE(issid, userid, bookid, issd, retd) values(iss,usid,boid,issued,returnd);
--     commit;
-- end addiss;
--
-- procedure "ADDUSER"(userid number,name varchar,uname varchar,pass varchar,email varchar,contact varchar)
-- as
-- begin
--     insert into USER101(USERID,NAME,USERNAME,PASSWORD,EMAIL,CONTACT) values (userid,name,uname,pass,email,contact);
--     commit;
-- end ADDUSER;
--
-- procedure updatebo(boid number,quan number)
-- is
-- begin
--     update BOOK set QUANTITY=quan where BID=boid;
--     commit;
-- end updatebo;
--
-- procedure upuser(usid number,pass varchar, con varchar)
-- is
-- begin
--     update USER101 set PASSWORD=pass,CONTACT=con where USERID=usid;
--     commit;
-- end upuser;
--
-- procedure delb(bookid in number)
-- is
-- begin
--     delete from BOOK where BID=bookid;
--     commit;
-- end delb;
--
-- procedure deliss(uid in number,bid in number)
-- is
-- begin
--     delete from ISSUE where USERID=uid and BOOKID=bid;
--     commit;
-- end deliss;
--
-- procedure delfin(uid in number,bid in number)
-- is
-- begin
--     delete from FINE where USERID=uid and BOOKID=bid;
--     commit;
-- end delfin;
--
-- function valid_login(uname varchar, psd varchar) return varchar is
-- n varchar(50);
-- p varchar(50);
-- begin
-- select USERNAME,PASSWORD into n,p from ADMIN101 where USERNAME=uname and PASSWORD=psd;
-- if(n=uname and p=psd)then
-- return('yes');
-- end if;
-- EXCEPTION
-- WHEN NO_DATA_FOUND THEN
-- return('no');
-- end valid_login;
--
-- function couus
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from USER101;
--     return(num);
-- end couus;
--
--  function coubo
-- return number
-- is
--     num number;
-- begin
--     select count(BID) into num from BOOK;
--     return(num);
-- end coubo;
--
-- function couiss
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from ISSUE;
--     return(num);
-- end couiss;
--
-- function coufin
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from FINE;
--     return(num);
-- end coufin;
--
-- end WSproject;

--
--     create or replace function couus
-- return number
-- is
--     num number;
-- begin
--     select count(USERID) into num from USER101;
--     return(num);
-- end;
-- /


--
-- create or replace trigger upuser
--     before update of CONTACT
--     on USER101
--     for each row
--     when(USERID>0)
--     declare
--         uid number;
--     begin
--
--     end;


drop sequence fid;

create sequence usid
    minvalue 100
    start with 101
    increment by 1;

create sequence bookid
    minvalue 1
    start with 1
    increment by 1;

create sequence isid
    minvalue 200
    start with 201
    increment by 1;

create sequence fid
    minvalue 300
    start with 301
    increment by 1;


create or replace function calfine return number
is
    d number;
    f number;
begin
    d:=&d;
    f:=d*2;
    return(f);
end;

declare
    d number;
    f number;
begin
    d:=&d;
    DBMS_OUTPUT.PUT_LINE(calfine);
end;

create or replace trigger onupdate
    before update on BOOK101
    for each row
    begin
        DBMS_OUTPUT.PUT_LINE('Book Updated');
        DBMS_OUTPUT.put_line('old quantity ' || :old.quantity);
        DBMS_OUTPUT.put_line('new quantity ' || :new.quantity);
    end;


-- create or replace procedure updatebook(boid number,quan number)
-- is
-- begin
--     update BOOK101 set QUANTITY=quan where BID=boid;
--     commit;
-- end;

declare
    n number;
    b number;
    begin
    n:=&n;
    b:=&b;
    updatebook(b,n);
end;



create or replace package LastYearProject as

--procedures

    procedure addbooks(bname varchar2,authorn varchar2,quan number,dept varchar2,ex out varchar);

    procedure addfine(uid number,bid number,issd varchar,d number,f number);

    procedure addissue(usid number,boid number,issued varchar,returnd varchar);

    procedure "ADDUSER"(name varchar,uname varchar,pass varchar,email varchar,contact varchar,ex out varchar);

    procedure delbook(bookid in number);

    procedure delfine(fid in number);

    procedure delissue(isid in number);

    procedure dispbooks(cur out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number,d out varchar);

    procedure dispissue(uid out sys_refcursor,isid out number,usid out number,un out varchar,bid out varchar,id out date,rd out date);

    procedure dispuserissue(uiid out sys_refcursor,bn out varchar,isd out date,red out date,un in varchar);

    procedure dispfine(cur out sys_refcursor,fid out number,uid out number,un out varchar,bi out number,rd out varchar,d out number,f out varchar);

    procedure dispuserfine(curr out sys_refcursor,bn out varchar,red out varchar,dy out number,fi out varchar,un in varchar);

    procedure dispuser(uid out sys_refcursor,usid out number,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar);

    procedure getuser(us out sys_refcursor,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar,una in varchar);

    procedure updatebook(boid number,quan number);

    procedure updateuser(un in varchar,pass varchar, con varchar);

--functions

    function validate_Login(uname varchar, psd varchar) return varchar;

    function user_Login(uname varchar, psd varchar) return varchar;

    function coubook return number;

    function coufine return number;

    function couusers return number;

    function couissue return number;

end LastYearProject;

create or replace package body LastYearProject as

procedure addbooks(bname varchar2,authorn varchar2,quan number,dept varchar2,ex out varchar)
is
begin
    insert into BOOK101(BID,NAME,AUTHOR,QUANTITY,DEPARTMENT) values(bookid.nextval,bname,authorn,quan,dept);
    commit;
    ex:='Book Added Successfully';
    exception
    when dup_val_on_index then
        ex:= 'Book already exists';
end addbooks;

procedure addfine(uid number,bid number,issd varchar,d number,f number)
is
begin
    insert into FINE101(FINEID,userid, bid, returned, day, fine) values(FID.nextval,uid,bid,issd,d,f);
    commit;
end addfine;

procedure addissue(usid number,boid number,issued varchar,returnd varchar)
as
begin
    insert into ISSUE101(issueid, userid, bid, issued, returnd) values(ISID.nextval,usid,boid,issued,returnd);
    commit;
end addissue;

procedure "ADDUSER"(name varchar,uname varchar,pass varchar,email varchar,contact varchar,ex out varchar)
as
begin
    insert into USER101(USERID,NAME,USERNAME,PASSWORD,EMAIL,CONTACT) values (usid.nextval,name,uname,pass,email,contact);
    commit;
    ex:='User Added Successfully';
    exception
    when dup_val_on_index then
        ex:='User Already Exists';
end ADDUSER;

procedure dispbooks(cur out sys_refcursor,bid out number,bn out varchar,au out varchar,q out number,d out varchar)
as
    begin
        open cur for
            select BID,NAME,AUTHOR,QUANTITY,DEPARTMENT into bid,bn,au,q,d from BOOK101 order by BID;

    end dispbooks;

procedure dispfine(cur out sys_refcursor,fid out number,uid out number,un out varchar,bi out number,rd out varchar,d out number,f out varchar)
as
    begin
        open cur for
            select FINE101.FINEID,fine101.USERID,USER101.NAME,fine101.BID,fine101.RETURNED,fine101.DAY,fine101.FINE into fid,uid,un,bi,rd,d,f from FINE101,USER101 where fine101.userid = USER101.USERID;

    end dispfine;

procedure dispuserfine(curr out sys_refcursor,bn out varchar,red out varchar,dy out number,fi out varchar,un in varchar)
as
    begin
        open curr for
            select BOOK101.NAME,fine101.RETURNED,fine101.DAY,fine101.FINE into bn,red,dy,fi from FINE101,BOOK101,USER101 where fine101.BID = BOOK101.BID and FINE101.USERID = USER101.USERID and USERNAME=un;
end dispuserfine;

procedure dispissue(uid out sys_refcursor,isid out number,usid out number,un out varchar,bid out varchar,id out date,rd out date)
as
    begin
        open uid for
            select ISSUE101.ISSUEID,issue101.USERID,USER101.NAME,issue101.BID,issue101.ISSUED,issue101.RETURND into isid,usid,un,bid,id,rd from ISSUE101,USER101 where issue101.USERID = USER101.USERID;
    end dispissue;

procedure dispuserissue(uiid out sys_refcursor,bn out varchar,isd out date,red out date,un in varchar)
as
    begin
        open uiid for
            select BOOK101.NAME,issue101.ISSUED,issue101.RETURND into bn,isd,red from ISSUE101,USER101,BOOK101 where issue101.USERID = USER101.USERID and ISSUE101.BID = BOOK101.BID and USERNAME=un;
    end dispuserissue;

procedure dispuser(uid out sys_refcursor,usid out number,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar)
as
    begin
        open uid for
            select userid, name, username, password, email, contact into usid,n,un,ps,e,c from USER101;
    end dispuser;

procedure getuser(us out sys_refcursor,n out varchar,un out varchar,ps out varchar,e out varchar,c out varchar,una in varchar)
as
    begin
        open us for
            select name, username, password, email, contact into n,un,ps,e,c from USER101 where USERNAME=una;
    end getuser;

procedure updatebook(boid number,quan number)
is
begin
    update BOOK101 set QUANTITY=quan where BID=boid;
    commit;
end updatebook;

procedure updateuser(un in varchar,pass varchar, con varchar)
is
begin
    update USER101 set PASSWORD=pass,CONTACT=con where USERNAME=un;
    commit;
end updateuser;


procedure delbook(bookid in number)
is
begin
    delete from BOOK101 where BID=bookid;
    commit;
end delbook;

procedure delfine(fid in number)
is
begin
    delete from FINE101 where FINEID=fid;
    commit;
end delfine;

 procedure delissue(isid in number)
is
begin
    delete from ISSUE101 where ISSUEID=isid;
    commit;
end delissue;

function validate_Login(uname varchar, psd varchar) return varchar is
n varchar(50);
p varchar(50);
begin
select USERNAME,PASSWORD into n,p from ADMIN101 where USERNAME=uname and PASSWORD=psd;
if(n=uname and p=psd)then
return('Login successfully');
end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN
return('Wrong username or password');
end validate_Login;


function user_Login(uname varchar, psd varchar) return varchar is
n varchar(50);
p varchar(50);
begin
select USERNAME,PASSWORD into n,p from USER101 where USERNAME=uname and PASSWORD=psd;
if(n=uname and p=psd)then
return('Login successfully');
end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN
return('Wrong username or password');
end user_Login;

function coubook
return number
is
    num number;
begin
    select count(BID) into num from BOOK101;
    return(num);
end coubook;

function couusers
return number
is
    num number;
begin
    select count(USERID) into num from USER101;
    return(num);
end couusers;

function couissue
return number
is
    num number;
begin
    select count(ISSUEID) into num from ISSUE101;
    return(num);
end couissue;

function coufine
return number
is
    num number;
begin
    select count(FINEID) into num from FINE101;
    return(num);
end coufine;

end LastYearProject;

drop sequence payid;
create sequence pyid
    minvalue 500
    start with 501
    increment by 1;

drop table payment;
create table payment(payid number primary key,fineid number references fine101(fine_id)on delete cascade ,paydate date,fine number,status varchar(30));


create or replace procedure addpay(fid number,amt number)
is
begin
    insert into PAYMENT(payid, fineid, paydate, fine,status) values(pyid.nextval,fid,current_date,amt,'PAID');
    update FINE101 set status='PAID' where fine_id=fid;
    commit;
end;


create or replace procedure disppay(cur out sys_refcursor,payid out number,issid out number,payd out date,f out number,st out varchar)
as
    begin
        open cur for
            select payment.payid,fine101.fine_id,payment.paydate,payment.fine,fine101.status into payid,issid,payd,f,st from PAYMENT,FINE101 where fine101.fine_id =  payment.fineid;

    end ;

create or replace procedure dispuserpay(cur out sys_refcursor,payid out number,issid out number,payd out date,f out number,usern in varchar)
as
    begin
        open cur for
            select payment.payid,fine101.fine_id,payment.paydate,payment.fine into payid,issid,payd,f from PAYMENT,USER101,ISSUE101,FINE101 where fine101.issue_id = ISSUE101.ISSUEID and payment.fineid = fine101.fine_id and username=usern;

    end ;

    drop sequence reqid;
create sequence rid
    minvalue 600
    start with 601
    increment by 1;

drop table request;
create table request(reqid number primary key,bid number references BOOK101(BID) on delete cascade,user_id number references USER101(USERID) on delete cascade,username varchar(50));


create or replace procedure getreq(id in number,una in varchar)
is
    uid number;
begin
    select USERID into uid from USER101 where USERNAME=una;
    insert into request(reqid, bid, user_id, username) values(rid.nextval,id,uid,una);
    commit;
end;

create or replace procedure dispreq(cur out sys_refcursor,uid out number,bi out number,una out varchar)
as
    begin
        open cur for
            select request.bid,request.user_id,request.username into uid,bi,una from REQUEST,USER101 where request.user_id = USER101.USERID;

    end ;


--
-- create or replace procedure addissue(usid number,boid number,isd varchar,retd varchar)
-- as
-- begin
--     insert into ISSUE101(issueid, userid, bid, issued, returnd) values(isid.nextval,usid,boid,isd,retd);
--     update BOOK101 set QUANTITY = QUANTITY - 1 where BID = boid;
--     commit;
-- end;

    drop table iss;
create table iss(issueid number primary key ,USERID int references user101(USERID) on delete cascade ,user_name varchar(30),bookid number references BOOK101(BID) on delete cascade ,issue_date date,returned_date date,status varchar(30));

create or replace procedure addiss(usid number,boid number,isd varchar,retd varchar,st varchar)
as
begin
    insert into ISSUE101(issueid, userid, bid, issued, returnd, status) values(isid.nextval,usid,boid,isd,retd,st);
    update BOOK101 set QUANTITY = QUANTITY - 1 where BID = boid;
    delete from request where user_id=usid and bid=boid;
    commit;
end;

create or replace procedure dispiss(uid out sys_refcursor,isid out number,usid out number,un out varchar,bid out varchar,id out date,rd out date,st out varchar)
as
    begin
        open uid for
            select ISSUE101.ISSUEID,ISSUE101.USERID,USER101.USERNAME,ISSUE101.BID,ISSUE101.ISSUED,ISSUE101.RETURND,ISSUE101.STATUS into isid,usid,un,bid,id,rd,st from ISSUE101,USER101 where ISSUE101.USERID = USER101.USERID;
    end ;

    commit;

drop table fine101;
create table fine101(fine_id number primary key ,issue_id number references ISSUE101(ISSUEID) on delete cascade,returned_date date,day number,fine number,status varchar(20));

create table fin(fine_id number primary key ,issue_id number references ISSUE101(ISSUEID) on delete cascade,returned_date date,day number,fine number,status varchar(20));

create or replace procedure addfine(isd number,issd varchar,d number,f number)
is
begin
    insert into FINE101(fine_id, issue_id, returned_date, day, fine,status) values(fid.nextval,isd,issd,d,f,'pending');
    commit;
end;

create or replace procedure dispfine(cur out sys_refcursor,uid out number,un out varchar,rd out date,d out number,f out varchar,st out varchar)
as
    begin
        open cur for
            select fine101.fine_id,USER101.NAME,fine101.returned_date,fine101.DAY,fine101.FINE,fine101.status into uid,un,rd,d,f,st from FINE101,USER101,ISSUE101 where fine101.issue_id = ISSUE101.ISSUEID and ISSUE101.USERID = user101.userid;

    end;

create or replace procedure dispuserfine(cur out sys_refcursor,uid out number,un out varchar,rd out date,d out number,f out varchar,st out varchar,una in varchar)
as
    begin
        open cur for
            select fine101.fine_id,USER101.NAME,fine101.returned_date,fine101.DAY,fine101.FINE,fine101.status into uid,un,rd,d,f,st from FINE101,USER101,ISSUE101 where fine101.issue_id = ISSUE101.ISSUEID and ISSUE101.USERID = user101.userid and username=una;

    end;


