create table login (
  uid char(5).
  uname varchar(20),
  upass varchar(20),
  primary key(uid, uname, upass)
);

insert into login values ("00001", "clive", "gomes"), ("00002", "riley", "scott");
