create table login (
  uid char(5) unique,
  uname varchar(20) unique,
  upass varchar(20),
  primary key(uid)
);

insert into login values ('10001', 'clive', 'gomes'), ('10002', 'riley', 'scott');
