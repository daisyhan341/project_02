use project_02;
drop database project_02;
create database project_02;

-- 회원정보 테이블 (수정 21.04.18 daisy)
create table project_02.member(
mem_id char(20) not null primary key,
mem_pw varchar(20) not null,
mem_nick char(10),
mem_email varchar(30) not null,
mem_phone varchar(15) not null,
mem_birth varchar(15),
mem_group varchar(45) default 'USER',
join_date datetime
);

/*
 21 04 02
 */

-- 회원별 작성 콘텐츠 테이블
create table writeContent(
mem_id varchar(20) primary key not null,
wc_cont varchar(45),
wc_comm varchar(45),
wc_review varchar(45)
-- foreign key(wc_cont) references boardList(bl_num),
-- foreign key(mem_id) references project_02.member(mem_id),
-- foreign key(wc_review) references gameReview(gr_num),
-- foreign key(wc_comm) references boardComment(bcm_cnum),
-- foreign key(wc_cont) references boardCont(bc_num)
);

-- 게시글 목록 테이블
create table project_02.boardList(
bl_num int not null primary key auto_increment,
bl_title varchar(45) not null,
bl_nick char(10) not null,
bl_date date not null,
bl_view int -- 조회수
-- foreign key(bl_nick) references project_02.member(mem_id)
);

-- 게시글 내용 테이블
create table project_02.boardCont(
bc_num int not null primary key auto_increment,
bc_content longtext
-- foreign key(bc_num) references boardList(bl_num)
);

-- 게시글 댓글 테이블
create table project_02.boardComment(
bcm_cnum int primary key not null auto_increment, -- 댓글 번호(Comment NUM)
bcm_bnum int not null, -- 게시글 번호 (Board NUM)
bcm_cont mediumtext not null,
bcm_nick char(20) not null,
bcm_date datetime(5)
-- foreign key(bcm_bnum) references boardCont(bc_num),
-- foreign key(bcm_nick) references project_02.member(mem_id)
);

-- 게임 테이블
create table game(
gm_num int not null primary key auto_increment,
gm_name varchar(30) not null,
gm_cont longtext not null,
gm_thn varchar(300), -- 게임 이미지 썸네일
gm_mark int not null, -- 평점
gm_rmd int not null -- 추천 수
);

-- 게임 리뷰 테이블
create table gameReview(
gr_num int not null primary key auto_increment,
gr_gnum int not null, -- 게임번호
gr_cont longtext not null,
gr_nick varchar(20) not null,
gr_date date not null,
gr_score int -- 평가점수
-- foreign key(gr_gnum) references game(gm_num),
-- foreign key(gr_nick) references project_02.member(mem_id)
);

-- 상호작용 하는 속성들의 값을 맞추기 위한 수정작업
alter table writeContent modify mem_id char(20);
alter table gameReview modify gr_nick varchar(10);
alter table project_02.member modify mem_nick varchar(10);
alter table boardComment modify bcm_nick varchar(10);

-- boardComment 외래키 추가
alter table boardComment add foreign key (bcm_bnum) references boardCont(bc_num);
alter table boardComment add foreign key (bcm_nick) references project_02.member(mem_id);

-- boardList 외래키 추가
alter table boardList add foreign key (bl_nick) references project_02.member(mem_id);

-- boardCont 외래키 추가
alter table boardCont add foreign key (bc_num) references boardList(bl_num);

-- gameReview 외래키 추가
alter table gameReview add foreign key (gr_gnum) references game(gm_num);
alter table gameReview add foreign key (gr_nick) references project_02.member(mem_id);

-- writeContent 테이블에 외래키 추가
alter table writeContent add foreign key (wc_cont_num) references boardList(bl_num);
alter table writeContent add foreign key (wc_cont_num) references boardCont(bc_num);
alter table writeContent add foreign key (wc_review_num) references gameReview(gr_num);
alter table writeContent add foreign key (wc_comm_num) references boardComment(bcm_cnum);
