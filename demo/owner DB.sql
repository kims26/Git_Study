/*
create sequence seq_owner_o_idx

create table owner
    (

        o_idx int,
        o_name varchar2(50),
        o_addr varchar2(50),
        o_tel varchar2(50),
        o_id varchar2(50),
        o_pwd varchar2(50)
    )
    
    alter table owner 
	add constraint pk_owner_o_idx primary key(o_idx);
    
    alter table owner
	add constraint unique_owner_o_id unique(o_id);
    
-----------------------------------------------------------------------------------------------


create sequence seq_product_p_idx

create table product
(
p_idx int ,
p_number int,
p_name varchar2(100),
p_price int,
p_saleprice int,
p_image_s varchar2(100),
p_image_l varchar2(100),
p_content varchar2(100),
p_regdate varchar2(100),
p_modifydate varchar2(100),
category_idx int,
o_idx int
)

alter table product
  add constraint  pk_product_p_idx primary key(p_idx);

--외래키
alter table product
  add constraint fk_product_o_idx foreign key(o_idx)
                                  references owner(o_idx) ;

alter table product
  add constraint fk_category_category_idx foreign key(category_idx)
                                  references category(category_idx) ;

select * from owner


-----------------------------------------------------------------------------------

create sequence seq_category_category_idx

create table category
(
category_idx int ,
category_code int,
category_name varchar2(100)

)

alter table category
  add constraint  pk_category_category_idx primary key(category_idx);
*/

  
  
