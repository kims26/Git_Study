/*

create sequence seq_admin_admin_idx

create table admin
(
    admin_idx     int,                        --회원번호
    admin_name    varchar2(100) not null,     --회원이름
    admin_id      varchar2(100) not null,     --회원아이디
    admin_pwd     varchar2(100) not null,     --회원비밀번호
    admin_ip      varchar2(100) not null      --아이피
 
 
)

--등급 컬럼 추가
alter table admin
    add admin_grade varchar2(100);

--컬럼 추가
alter table admin
    add  o_idx int;

alter table admin
    add  mem_idx int;

--외래키
alter table admin
  add constraint fk_admin_o_idx foreign key(o_idx)
                                  references owner(o_idx) ;

alter table admin
  add constraint fk_admin_mem_idx foreign key(mem_idx)
                                  references member(mem_idx) ;
--기본키
alter table admin
    add constraint pk_admin_admin_idx primary key(admin_idx);

--유니크 제약
alter table admin
    add constraint unique_admin_admin_id unique(admin_id);

ALTER TABLE admin DROP COLUMN o_idx
ALTER TABLE admin DROP COLUMN mem_idx

--sample data
insert into admin values( seq_admin_admin_idx.nextVal,
                            '배아름',
                            '1111',
                            '1111',
                            '192.168.0.23'
                            );





*/