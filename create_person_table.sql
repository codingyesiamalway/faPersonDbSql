#create database fbtest;

use fbtest;

create table person (
	pId int,
    sId int,
    sEvent varchar(255)
);

#drop table person;
# sEvent can be of three values: IMP, ANS, SKIP

insert into person values (1, 1, "IMP");
insert into person values (1, 1, "ANS");
insert into person values (1, 2, "IMP");
insert into person values (1, 2, "ANS");
insert into person values (1, 2, "IMP");
insert into person values (1, 2, "SKIP");



insert into person values (2, 1, "IMP");
insert into person values (2, 1, "ANS");
insert into person values (2, 2, "IMP");
insert into person values (2, 2, "SKIP");
insert into person values (2, 3, "IMP");
insert into person values (2, 3, "ANS");


insert into person values (3, 1, "IMP");
insert into person values (3, 1, "ANS");
insert into person values (3, 2, "IMP");
insert into person values (3, 2, "SKIP");
insert into person values (3, 4, "IMP");
insert into person values (3, 4, "SKIP");

insert into person values (4, 1, "IMP");
insert into person values (4, 2, "IMP");
insert into person values (4, 3, "IMP");
insert into person values (4, 3, "SKIP");
insert into person values (4, 4, "IMP");
insert into person values (4, 5, "IMP");