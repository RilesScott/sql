create table login (
  uid char(5) unique,
  uname varchar(20) unique,
  upass varchar(20),
  primary key(uid)
);

insert into login values ('10001', 'clive', 'gomes'), ('10002', 'riley', 'scott');

create table customer(
cid char(5),
fname varchar(10) not null,
lname varchar(10) not null,
balance numeric(20,2) default 0.0,
primary key (id)
);

create table cinfo(
cid char(5),
cnumber char(16) not null,
month char(2) not null,
year char(4) not null,
street varchar(50) not null,
city varchar(20) not null,
state char(2) not null,
zip char(5) not null,
primary key(cid,cnumber),
foreign key(cid) references customer,
check (char_length(cnumber) = 16),
check (char_length(month) = 2),
check (char_length(year) = 4),
check (char_length(state) = 2),
check (char_length(zip) = 5)
);

create table staff(
sid char(5),
fname varchar(20) not null,
lname varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
street char(2) not null,
zip char(5) not null,
salary numeric(10,2) not null default 0.0,
title varchar(20) not null,
primary key(sid),
check (char_length(state) = 2),
check (char_length(zip) = 5)
);

create table product(
pid char(5),
pname varchar(200) not null,
size numeric(10,2) not null,
category varchar(10) not null,
info varchar(500) not null,
image varchar(40) not null default 'default.png',
primary key(pid)
);

create table pprice(
pid char(5),
state varchar(20) not null,
price numeric(10,2) not null,
primary key(pid,state),
foreign key(pid) references product,
check (price > 0)
);

create table cart(
ccid char(6) not null,
cid char(5) not null,
pid char(5) not null,
qty int not null default 0,
primary key(ccid, cid, pid),
foreign key(pid) references product(id),
foreign key(cid) references customer(id),
check (qty >= 0)
);

create table order(
oid char(6) not null,
cid char(5) not null,
pid char(5) not null,
qty int not null default 0,
cnumber char(16) not null,
status varchar(20) not null default 'issued',
issued TIMESTAMP not null,
primary key(oid, cid, pid),
foreign key(pid) references product,
foreign key(cid, cnumber) references creditcard,
check (qty >= 0),
check (char_length(cnumber) = 16)
);

create table stock(
pid char(5) not null,
qty int not null default 0,
wid char(5) not null,
primary key(pid, wid),
foreign key(wid) references warehouse,
foreign key(pid) references product
check (qty >= 0),
);

create table warehouse(
wid char(5) not null,
street varchar(50) not null,
city varchar(20) not null,
state char(2) not null,
zip char(5) not null,
capacity numeric(10,2) not null default 0.0,
primary key(wid),
check (char_length(state) = 2),
check (char_length(zip) = 5)
);

create table supplier(
ssid char(5),
fname varchar(10) not null,
lname varchar(10) not null,
street varchar(50) not null,
city varchar(20) not null,
state char(2) not null,
zip numeric(5,0) not null,
primary key(ssid),
check (char_length(state) = 2),
check (char_length(zip) = 5)
);

create table sells(
ssid char(5),
iid varchar(5) not null,
iprice numeric(10,2) not null,
primarykey(ssid, iid),
check (iprice > 0)
);
