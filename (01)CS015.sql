create database insurance;
use insurance;
create table person (driver_id varchar(20), name varchar(20), address varchar(20), PRIMARY KEY(driver_id));
create table car (reg_num varchar(20), model varchar(20), year int, PRIMARY KEY(reg_num));
create table accident (report_num int, accident_date date, location varchar(20), PRIMARY KEY(report_num));

insert into person values('A01', 'Richard', 'Srinivas Nagar');
insert into person values('A02', 'Pradeep', 'Rajaji Nagar');
insert into person values('A03', 'Smith', 'Ashok Nagar');
insert into person values('A04', 'Venu', 'N R Colony');
insert into person values('A05', 'Jhon', 'Hanumanth Nagar');

insert into car values('2250', 'Indica', 1990);
insert into car values('1181', 'Lancer', 1957);
insert into car values('5477', 'Toyota', 1998);
insert into car values('3408', 'Honda', 2008);
insert into car values('1702', 'Audi', 2005);

insert into accident values (11, '03/01/01', 'Mysore Road'), (12, '04/02/02', 'South End Circle'),(13, '03/01/21', 'Bull Temple Road'),(14, '08/02/17', 'Mysore Road'),(15, '05/03/04', 'Kanakapura Road');

create table owns (driver_id varchar(20), reg_num varchar(20), foreign key (driver_id) references person (driver_id), foreign key (reg_num) references car (reg_num));
create table participated (driver_id varchar(20), reg_num varchar(20), report_num int, damage_amount int, foreign key (driver_id) references person (driver_id), foreign key (reg_num) references car (reg_num), foreign key (report_num) references accident (report_num), primary key(driver_id, reg_num, report_num));
drop table owns;
create table owns (driver_id varchar(20), reg_num varchar(20), foreign key (driver_id) references person (driver_id), foreign key (reg_num) references car (reg_num), primary key(driver_id, reg_num));

insert into owns values ('A01', '2250'), ('A02', '3408'), ('A03', '1181'), ('A04', '5477'), ('A05', '1702');
insert into participated values ('A01', '2250', 11, 10000), ('A02', '3408', 12, 50000),('A03', '5477', 13, 25000),('A04', '1181', 14, 3000),('A05', '1702', 15, 5000);





update participated set damage_amount = 25000 where reg_num = '3408' and report_num = 12;
select count(distinct driver_id)CNT from participated, accident where participated.report_num = accident.report_num and accident.accident_date like '2008%';
select count(distinct driver_id)CNT from participated, car where participated.reg_num = car.reg_num and car.model = 'Toyota';
insert into accident values(16, '20/11/09', 'Banashankari');
insert into participated values('A01', '2250', 16, 100000);

select * from participated;