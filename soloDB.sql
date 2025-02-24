use spring5fs;
drop table market;

-- 본문글도 추가해할듯		content text not null	<--- 컬럼명 바꾸고

create table market( 
	sno int primary key not null,
    alt varchar(20)  ,
    title varchar(20) not null,
    loc varchar(20) not null,
    price int not null
);
select * from market;

insert into market(sno, alt, title, loc, price) values
(100, 'image', 'test', 'busan', 1234);




drop table test;

create table test(
	tno int primary key not null,
	tSno int not null references market(sno), 
    writer varchar(20) not null,
    content tinytext not null,
    conDate date default (current_timestamp)
);
delete from test where tno  = 100;
insert into test values (100, 100, 'aaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', now() );
select * from test where tSno = any(select sno from market);

create table user(
	id varchar(20) primary key not null,
    pw varchar(20) not null,
    address varchar(30) not null,
    nickname varchar(15) not null
);

select * from user;
