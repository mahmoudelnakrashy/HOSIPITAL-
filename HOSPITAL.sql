drop database hospital ;
create database hospital ;
use hospital ;
create table Doctor (
doctorid int primary key  ,
name varchar(150) ,
address varchar(200) ,
phone int ,
dept varchar(100) 
 );
describe Doctor ;
create table Nurse (
nurseid int primary key ,
name varchar(150) ,
address varchar(200) ,
phone int 
 );
 describe Nurse ;
 create table Doctor_Nurse (
 doctorid int ,
 nurseid int ,
 foreign key  (doctorid) references Doctor (doctorid) ,
 foreign key (nurseid) references Nurse (nurseid) 
 );
 describe Doctor_Nurse ;
 create table Room (
roomid int primary key   ,
location varchar(150) 
 
 );
 describe Room ;
  
 
 create table `Patient` (
patientid int  primary key ,
nam  varchar(150) ,
addres varchar(200) ,
age int ,
address varchar(150) ,
Gender varchar(20),
doctorid int ,
nurseid int ,
roomid int , 
 foreign key  (doctorid) references Doctor (doctorid) ,
 foreign key  (nurseid) references Nurse (nurseid),
 foreign key  (roomid) references Room (roomid)

  );
  describe Patient ;
 
 create table Bed (
bedid int primary key  ,
patientid int ,
roomid int,
foreign key(patientid) references Patient (nurseid),
foreign key(roomid) references Room (roomid)
);
describe Bed ;

insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 1 , 'ahmed' , 'cairo' , 344535 , 'a' );
insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 2 , 'mahmoud' , 'cairo' , 65633 , 's' );
insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 3 , 'ahmed' , 'Alex' , 763653 , 'b' );
insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 4 , 'mohamed' , 'kafrelesheikh' , 65544, 'a' );
insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 5 , 'mohamed' , 'cairo' , 987565 , 'b' );
insert into Doctor ( doctorid   ,name  ,address  ,phone  , dept ) values ( 6, 'ahmed' , 'kafreleshikh' , 345535 , 's' );
select * from Doctor ;

insert into Nurse ( nurseid   ,name  ,address  ,phone   ) values ( 1 , 'salma' , 'cairo' , 34363  );
insert into Nurse ( nurseid   ,name  ,address  ,phone   ) values ( 2 , 'fatma' , 'alex' , 56363  );
insert into Nurse ( nurseid   ,name  ,address  ,phone   ) values ( 3 , 'mai' , 'cairo' , 88798  );
insert into Nurse ( nurseid   ,name  ,address  ,phone   ) values ( 4 , 'asmaa' , 'cairo' , 92653  );
select * from Nurse ;

insert into Room ( roomid   ,location    ) values ( 1 , 'A1'   );
insert into Room ( roomid   ,location   ) values ( 2 , 'A1'   );
insert into Room ( roomid   ,location     ) values ( 3 , 'A2'   );
insert into Room ( roomid   ,location    ) values ( 4 , 'A2' );
select * from Room ;

insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 1 , 'ahmed' , 34, 'cairo' , 'mala', 1 , 2,2 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 2 , 'lamia' , 39, 'cairo' , 'femala', 2 , 2,3 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 3 , 'ahmed' , 50, 'cairo' , 'mala', 1 , 2,2 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 4 , 'asmaa' , 22, 'cairo' , 'femala', 4 , 3,3 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 5 , 'fatma' , 55, 'cairo' , 'femala', 3 , 4,4 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 6 , 'reda' , 70, 'cairo' , 'mala', 1 , 2,2 );
insert into Patient ( patientid   ,nam , age   ,address  ,Gender  , doctorid, nurseid , roomid ) values ( 7 , 'mahmoud' , 19, 'alex' , 'mala', 1 , 2,2 );

select * from Patient  ;
select doctorid from Doctor ;
select distinct roomid from Room ;
select nurseid , name from Nurse ;
select name from Doctor where doctorid =3 ;
select nam from Patient  where Patientid <3 ;
select nam from Patient where address ='cairo' ;
select * from Doctor where doctorid >2 and doctorid <5 ;
select  * from Doctor where dept ='a' ;
select * from Patient order by age  ;
select * from Patient where nam like 'a%' ;
select * from Patient where nam like '%a%' ;
select * from Patient where nam like '%a' ;
select * from Nurse where name like '_a%' ;
select * from Nurse where name like '__m%' ;
select dept from Doctor  ;
select * from Doctor  where name like '%o%' order by  doctorid  ;
select location from Room  ;
select nam , Gender from Patient where Patientid<6 ;
select * from Patient where nam ='ahmed' ;
 select * from Nurse limit 3  ;
select dept from Doctor where doctorid in (select doctorid from Patient where patientid >4 );
select name from Nurse where nurseid in (select nurseid from Patient where patientid >2 );
select address from Doctor where doctorid in (select doctorid from Patient where patientid >4 );
select  count(patientid)  from Patient  ;
select  count(doctorid)  from Doctor where address ='cairo'  ;
SELECT Doctor.doctorid, Patient.patientid FROM Doctor INNER JOIN Patient ON Patient.patientid = Patient.patientid;
SELECT Room.roomid, Patient.patientid FROM Room INNER JOIN Patient ON Patient.patientid = Patient.patientid;
SELECT Nurse.nurseid, Patient.patientid FROM Nurse INNER JOIN Patient ON Patient.patientid = Patient.patientid;
SELECT Patient.nam, Doctor.doctorid FROM Patient LEFT JOIN Doctor ON Patient.patientid = Patient.patientid  ;
SELECT Doctor.doctorid, Patient.age FROM Doctor right JOIN Patient ON Patient.patientid = Patient.patientid;

update Doctor set dept = 'sr' where doctorid = 2 ;
update Doctor set address = 'Giza' where doctorid = 4 ;
update Patient set age = 44  where patientid = 5 ;
update nurse set phone = 76546 where nurseid = 3 ;
update Room set location = 'A3' where roomid = 4 ;
delete from Patient WHERE age =44 ;
delete from Patient WHERE address ='alex' ;
delete from Doctor WHERE dept ='s';
delete from Nurse WHERE phone =34345 ;
delete from Doctor WHERE address ='suez' ;


  



 
 
 
 
