create database PoliceStation;
use PoliceStation;


create table station(stationid INT not null primary key,
 stationname varchar(20),
 stationcity  varchar(20),
 stationphonenumber varchar(20),
 Address varchar(20)
)

create table criminal(criminalid INT not null primary key,
criminalname varchar(20),
criminalphno varchar(20),
criminalcity varchar(20),
criminalhomeaddress varchar(20),
criminalDOB date,
crimialgender boolean
)

insert into criminal values(1,'hari','9399887891','hyderbad','kothaguda','1993-12-01',true);

delete from criminal where crimialgender = true;

alter table criminal add column criminalgender INT;

alter table criminal add foreign key(criminalgender) references gender(genderid);

create table gender (
        genderid INT not null primary key,
        male boolean,
        female boolean

)

create table policestatus(policestatusid INT not null primary key,
policestatusname varchar(20),
policeincome varchar(20),
description varchar(30)
)

alter table policestatus add unique key (policestatusname)


create table crimes(crimesid INT not null primary key,
crimename varchar(20),
crimecategory varchar(20)
)

create table police(policeid INT not null,
policename varchar(20),
policephone varchar(20),
policecity varchar(20),
policeAddress varchar(20),
policedob DATE,
policegender boolean,
policestatusid INT,
stationid INT,
primary key(policeid),
FOREIGN KEY (policestatusid) REFERENCES policestatus(policestatusid),
FOREIGN KEY (stationid) REFERENCES station(stationid)  
)



create table crimeincident(
incidentid INT not null,
policeid INT,
criminalid INT,
crimesid INT,
primary key(incidentid),
foreign key (policeid) references police(policeid),
foreign key (criminalid) references criminal(criminalid),
foreign key (crimesid) references crimes(crimesid)
)

alter table crimeincident add column incidentdate date

alter table crimeincident add column incidentoccuredlocation varchar(40)

select * from station;

insert into station values(1,"central",'mumbai','94909533306','streetno.5,checkpost')

insert into station values(2,"main",'delhi','84909533306','roadno.6,arungzab')

insert into station values(3,"jadgur",'chennai','94303833306','roadno.36, srihari')

insert into station values(4,"transport",'bhopal','83909533306','behindmall')

insert into station values(5,"gazi",'jqf','94909555506','streetno.7')

select * from gender;
insert into gender values(1,true,false)

insert into gender values(2,false,true)

insert into gender values(3,true,false)

insert into gender values(4,false,true)

insert into gender values(5,true,false)

select * from gender;

alter table gender add unique key (genderid)

select * from criminal;

alter table criminal drop column crimialgender

insert into criminal values(1,'john','943257891','mumbai','himayath roadnon.5','2003-12-03',1)

insert into criminal values(2,'jane','954257891','mumbai','Bandra streetno.6','2003-10-04',2)

insert into criminal values(3,'joseph','843256691','delhi','andheri nachcolony','2006-12-03',3)

insert into criminal values(4,'kevin','883257891','mumbai','kanvi roadno.10','1999-09-03',4)

insert into criminal values(5,'mark','8889957891','chennai','1-11-10/144','1991-02-15',5)

select * from policestatus;

insert into policestatus values(1,'SI','100000','manages staff')

insert into policestatus values(2,'CI','300000','inchargeofpolicecircle')

insert into policestatus values(3,'headconstable','30000','superviseconstables')

insert into policestatus values(4,'constables','10000','tasksrelatedtolawsenforcement')

insert into policestatus values(5,'SP','500000','enforces law')

select * from crimes;
alter table crimes drop column crimecategory

alter table crimes add column crimecategory varchar(40)

insert into crimes values(1,'theft','offencesagainstproperty')

insert into crimes values(2,'assault','criminaloffence')

insert into crimes values(3,'terroristattack','terroristcrimes')

insert into crimes values(4,'illegaldrugs','illegaldrugpossession')

insert into crimes values(5,'datatheft','accessingdatawithoutpermissions')

show tables;

select * from police

insert into police values(1,'hari','9355567812','mumbai','andheri','1991-01-05',1,1,1)

insert into police values(2,'mauria','9355566312','mumbai','bandhuru','1990-10-06',2,2,2)

insert into police values(3,'moana','9356667812','delhi','south extension','1991-11-05',3,3,3)

insert into police values(4,'anvesh','8455567812','delhi','jagatpur','1989-01-05',4,4,4)

insert into police values(5,'aban','8335567812','hyderabd','gachibowli','1991-01-05',5,5,5)

select * from crimeincident;

insert into crimeincident values(1,1,1,1,'2020-01-10','hitech city')

insert into crimeincident values(2,2,2,2,'2021-01-10','gachibowli')

insert into crimeincident values(3,3,3,3,'2019-11-10','jubileehills')

insert into crimeincident values(4,4,4,4,'2020-12-10','hitech city')

insert into crimeincident values(5,5,5,5,'2017-11-20','madhapur')

alter table station add unique key(stationphonenumber);

alter table station add unique key(address);

alter table police add unique key(policephone);
