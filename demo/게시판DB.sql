/*
--게시판 일련번호
create sequence seq_board_b_idx

--게시판 테이블
create table board
(
    b_idx       int,                --일련번호
    b_subject     varchar2(500),    --제목
    b_content     varchar2(2000),   --내용
    b_ip          varchar2(100),    --아이피
    b_regdate     date,             --작성일자
    mem_idx      int,               --회원번호
    mem_name     varchar2(200),     --작성자명
    b_ref        int ,              --글번호
    b_step       int ,              --글순서
    b_readhit     int default 0    --조회수

)
--기본키
alter table board add constraint pk_board_b_idx primary key(b_idx);

--외래키
alter table board 
    add constraint fk_board_mem_idx foreign key(mem_idx)
                                    references member(mem_idx);


--sample date

insert into board values(

    seq_board_b_idx.nextVal,
    '시작합니다',
    '프로젝트',
    '192.168.0.239',
    sysdate,
    1,
    '김파이널',
    1,
    0,
    20

);




drop table board

select * from board

drop sequence seq_board_b_idx


*/