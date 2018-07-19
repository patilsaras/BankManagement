create table userstore
(
userid varchar2(50) not null unique,
password varchar2(50) not null,
usertype varchar2(30) not null
)
drop table userstore
insert into userstore values('Amritesh','12345','Executive')
insert into userstore values('PD','12345','Teller')
insert into userstore values('Suraj','171994','Teller')
select usertype from USERSTORE where userid='Amritesh'
select * from USERSTORE

create table customer_12345
(
custid number(9) primary key not null,
ssnid number(9) not null unique,
name varchar2(40) not null,
age number(3) not null,
address varchar2(120) not null
)

create table account_12345
(
accid number(9) primary key,
custid number(9)not null,
acctype varchar(20) not null,
balance decimal(10,3),
cr_date DATE default (sysdate),
cr_lastdate DATE default (sysdate),
foreign key(custid) references customer_12345(custid)
)
insert into account_12345 values(accid.nextval,100000055,'saving',21000,default,default)
insert into account_12345 values(accid.nextval,100000020,'saving',40000,default,default)
select accid from account_12345 where custid=100000040
drop table account_12345

  100000038 123456789 Suraj     21 Trivandrum
select * from customer_12345
select * from account_12345

delete  account_12345 where custid=100000001
create sequence seqcust
start with 100000000
maxvalue 999999999
increment by 1

create sequence accid
start with 100000000
maxvalue 999999999
increment by 10


create table cust_status
(
custid number(9),
ssnid number(9),
status varchar2(40) not null,
message varchar2(40) not null,
lastupdated DATE default (sysdate)
)
drop table cust_status
insert into cust_status values(100000020,112233112,'Active','Checked',default)
select * from cust_status

create table acc_status
(
custid number(9),
accid number(9),
acctype varchar2(20),
status varchar2(40),
message varchar2(40),
lastupdated  DATE default (sysdate)
)
drop table acc_status
select * from acc_status
update acc_status set message='Not verified' where accid=100000710
update acc_status set status='inactive' where accid=100000550

create table transaction_group_G
(
transid number(9)primary key,
accids number(9),
acctypes varchar2(20),
transdate timestamp default(systimestamp),
accidd number(9), 
acctyped varchar2(20),
descr varchar2(10),
amount number(10),
balance number(10)
)

create sequence transid
start with 100000000
increment by 1

select * from transaction_group_G

SELECT TOP 3 * FROM transaction_group_G;
SELECT * FROM transaction_group_G
WHERE ROWNUM <= 3;

insert into transaction_group_G values(transid.nextval,100000610,'s',default,0000,'xxxx','credit',120,12000)
SELECT ACCIDS,TRANSID,TRANSDATE,DESCR,AMOUNT,BALANCE FROM (SELECT ACCIDS,TRANSID,TRANSDATE,DESCR,AMOUNT,BALANCE from transaction_group_G WHERE ACCIDS=100001010 ORDER BY TRANSDATE desc) where ROWNUM <=5


select TRANSID,TRANSDATE,DESCR,AMOUNT,BALANCE FROM transaction_group_G
WHERE accids=100000790 and TRANSDATE BETWEEN TO_DATE('2017/08/24', 'YYYY/MM/DD')AND TO_DATE('2017/08/30', 'YYYY/MM/DD') ;

 100000003 100000610 saving   2017-08-25 14:33:16.548         0 xxxx     debit       200   58600
  100000011 100000630 saving   2017-08-26 11:03:22.588         0 xxxx     debit       100    9300

select * from acc_status order by custid



insert into transaction_group_G values(transid.nextval,100000900,'s',default,?,?,'credit',?,?


