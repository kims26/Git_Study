/*

create sequence seq_comment_board_c_b_idx

--댓글테이블
create table comment_board
(
    c_b_idx     int,                      
    c_b_content varchar2(1000),           
    c_b_ip      varchar2(200),            
    c_b_regdate date,                    
    b_idx           int,                      
    mem_idx         int,                      
    mem_id          varchar2(100),            
    mem_name        varchar2(100)             
)

alter table comment_board 
add constraint pk_comment_board_c_b_idx primary key(c_b_idx);

alter table comment_board 
add constraint fk_comment_board_b_idx foreign key(b_idx) references board(b_idx) on delete cascade;
                            -- on delete cascade;부모글 삭제시 자식글 같이삭제

alter table comment_board
add constraint fk_comment_board_mem_idx foreign key(mem_idx) references member(mem_idx);   



drop table comment_board

select * from comment_board