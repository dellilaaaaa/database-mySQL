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

-- insert data siswa --insert into siswa 
(name, kelas_id) values
("dellila", 1),
("inayat", 2),
("ardi", 3),
("yeyen", 4),
("auzan", 5),
("doltons", 6),
("lutfhi", 1),
("michael", 2);

-- select table siswa --
select * from siswa;

-- create table extrakurikuler --
create table  ekstrakurikuler (
id int primary key auto_increment,
name varchar(50));

-- insert data extrakurikuler --
insert into ekstrakurikuler
(name) values ("basket"), ("voli"), ("pramuka"), ("dance"), ("futsal");

-- select table extrakurikuler --
select * from extrakurikuler;

-- create table data_extra --
create table data_extra
(id int primary key auto_increment,
siswa_id int,
ekstrakurikuler_id int,
foreign key (siswa_id) references siswa(id),
foreign key (ekstrakurikuler_id) references ekstrakurikuler(id));

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







