# -------测试
drop table if exists `test`;
create table `test`(
    `id` char(8) not null default '' comment 'id',
    `name` varchar(50) comment '名称',
    primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='测试';

insert into `test` (id,name) values (2,'测试');

# ----------大章
drop table if exists `chapter`;
create table `chapter`(
     `id` char(8) not null default '' comment 'id',
     `course_id` char(8) comment '课程ID',
     `name` varchar(50) comment '名称',
     primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='大章';

