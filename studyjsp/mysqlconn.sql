insert into member(id, passwd, name, reg_date, address, tel)
values('kingdora@dragon.com', '1234', '김개동', now(), '서울시', '010-1111-1111');

insert into member(id, passwd, name, reg_date, address, tel)
values('hongkd@aaa.com', '1111', '홍길동', now(), '경기도', '010-2222-2222');

select * from member;

update member set passwd ='3579' where name = '홍길동';