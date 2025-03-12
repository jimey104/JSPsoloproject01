use spring5fs;


drop table market;

CREATE TABLE market (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,

    alt varchar(20)  ,
    price int not null,
    category varchar(20),
	loc varchar(100) not null,
    
    writer VARCHAR(50) NOT NULL,
    
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    viewcount INT DEFAULT 0,

    FOREIGN KEY (writer) REFERENCES users(username)
);

select * from market;
delete from market where id = 5;
insert into market(title, content, alt, loc, price, writer) values
('티셔츠', '티셔츠 팔아요','/images/img001.jpg', 'busan', 5000, 'test1' ),
('중고', '중고요','/images/img002.jpg', '서울', 6000, 'test1' ),
('유사신품', '실 사용 2회','/images/img003.jpg', '영등포', 7000, 'test1' ),
('나무엔틱의자', '이케아에서 샀어요.','/images/img004.jpg', '마포', 8000, 'test1' );

====================================================

drop table users;

create table users(
	id varchar(100) primary key not null,
    pw varchar(100) not null,
	username varchar(50) not null UNIQUE,
    address varchar(100) not null,
    name VARCHAR(50) NOT NULL,
	email VARCHAR(100));

delete from users where id = '123';
insert into users values ('test1', 'test1', 'test1', 'test1', 'test1', 'test1@test');
select * from users;


create table comment(
	vId INT auto_increment PRIMARY KEY,
    mId int not null,
	vComment TEXT NOT NULL,
    vDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    vWriter VARCHAR(50) NOT NULL,
    FOREIGN KEY (mId) REFERENCES market(id)
);
drop table comment;
select * FROM comment;
INSERT INTO comment (vWriter, vComment, mId) VALUES ('test1','asdasd', '6');