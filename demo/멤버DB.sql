/*

create sequence seq_member_mem_idx

create table member
(
    mem_idx     int,                        --회원번호
    mem_name    varchar2(100) not null,     --회원이름
    mem_id      varchar2(100) not null,     --회원아이디
    mem_pwd     varchar2(100) not null,     --회원비밀번호
    mem_addr    varchar2(500) not null,     --회원주소
    mem_type    varchar2(500) not null,     --충전타입
    mem_zipcode varchar2(100) not null,     --회원우편번호
    mem_regdate date default sysdate,       --가입일자
    mem_tel     varchar2(500) not null,     --전화번호
    mem_ip      varchar2(100) not null      --아이피
)

--ip 컬럼 추가
alter table member
    add mem_ip varchar2(100);



--기본키
alter table member
    add constraint pk_member_mem_idx primary key(mem_idx);

--유니크 제약
alter table member
    add constraint unique_member_mem_id unique(mem_id);

--sample data
insert into member values( seq_member_mem_idx.nextVal,
                            '장민경',
                            'min',
                            '0501',
                            '경기도 부천시 길주로 210',
                            'DC콤보',
                            '12345',
                            sysdate,
                            '010-3385-2576',
                            '192.168.0.23'
                            );





*/