-- Show Database --
show databases;

-- Create Database --
create database sekolah;

-- create table kelas --
create table kelas
(id int primary key auto_increment, 
name varchar(20));

-- Insert Data kelas --
insert into kelas
(name) values ("I"), ("II"), ("III"), ("IV"), ("V"), ("VI");

-- select table kelas --
select * from kelas;

-- create table siswa -- 
create table siswa (
id int primary key auto_increment,
name varchar(50),
kelas_id int,
foreign key (kelas_id) references kelas(id));

-- insert data siswa --
insert into siswa 
(name, kelas_id) values
("dellila", 1),
("inayat", 2),
("ardi", 3),
("yeyen", 4),
("auzan", 5),
("doltons", 6),
("lutfhi", 1),
("michael", 2);

-- add new row in table siswa --
-- 1. drop foreign key --
alter table siswa 
drop foreign key siswa_ibfk_1; -- drop fk kelas_id in table siswa -- 

alter table data_extra
drop foreign key data_extra_ibfk_1; -- drop fk siswa_id in table data_extra --

-- 2. drop table siswa --
drop table siswa;

-- Recreate table siswa --
create table siswa (
id int primary key auto_increment,
name varchar(50),
birthdate date,
address text,
kelas_id int,
foreign key (kelas_id) references kelas(id));

insert into siswa 
(name, birthdate, address, kelas_id) 
values ("dellila", "2003-09-26", "sumbawa besar", 1),
("inayat", "2000-12-22", "sumbawa barat", 2), 
("ardi", "1999-11-20", "sumbawa barat", 3),
("yeyen", "2000-01-20", "sumbawa barat", 4), 
("auzan", "2003-09-26", "jakarta", 5), 
("doltons", "2002-12-20", "maros", 6),
("lutfhi", "2000-10-10", "bandung", 1), 
("michael",  "2001-01-10", "sumatra", 2);


-- select table siswa --
select * from siswa;

-- create table extrakurikuler --
create table  ekstrakurikuler (
id int primary key auto_increment,
name varchar(50));

-- insert data extrakurikuler --
insert into ekstrakurikuler
(name) values ("basket"), ("voli"), ("pramuka"), ("dance"), ("futsal");

-- add new row in table ekstrakurikuler --
-- 1. drop foreign key --
alter table data_extra
drop foreign key data_extra_ibfk_2; -- drop fk ekstrakurikuler_id in table data_extra --

-- 2. drop table  ekstrakurikuler--
drop table ekstrakurikuler;

-- Recreate table ekstrakurikuler --
create table  ekstrakurikuler (
id int primary key auto_increment,
name varchar(50),
pembimbing varchar(50),
jumlah_anggota int);

insert into ekstrakurikuler
(name, pembimbing, jumlah_anggota) values 
("basket", "Toni S.Pd", 17), 
("voli", "Lukman S.Pd", 20), 
("pramuka", "Jonny S.pd", 37), 
("dance", "Sri Bulan S.Pd", 21), 
("futsal", "Agung S.pd", 13);

-- select table extrakurikuler --
select * from extrakurikuler;

-- create table data_extra --
create table data_extra
(id int primary key auto_increment,
siswa_id int,
ekstrakurikuler_id int,
foreign key (siswa_id) references siswa(id),
foreign key (ekstrakurikuler_id) references ekstrakurikuler(id));

-- add foreign key in table data_extra --
alter table data_extra
add foreign key (siswa_id) references siswa(id);

-- insert table data_extra --
insert into data_extra 
(siswa_id, ekstrakurikuler_id) values
(1, 4),
(2, 1),
(3, 2),
(4, 4),
(5, 3),
(6, 5),
(7, 1),
(8, 2);

-- select table data_extra --
select * from data_extra;

-- select --
select data_extra.id, siswa.name as nama_siswa, ekstrakurikuler.name as nama_ekstrakurikuler
from data_extra
join siswa on data_extra.siswa_id = siswa.id
join ekstrakurikuler on data_extra.ekstrakurikuler_id = ekstrakurikuler.id
order by siswa.id;







