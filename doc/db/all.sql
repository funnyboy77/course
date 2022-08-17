# -------测试
drop table if exists `test`;
create table `test`(
    `id` char(8) not null default '' comment 'id',
    `name` varchar(50) comment '名称',
    primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='测试';

insert into `test` (id,name) values (2,'测试');

# ----------课程
drop table if exists `course`;
create table `course`(
       `id` char(8) not null default '' comment 'ID',
       `name` varchar(50) not null comment '名称',
       `summary` varchar(2000)  comment '概述',
       `time` int comment '时长|单位秒',
       `price` decimal(8,2)  default '0.00' comment '价格（元）',
       `image` varchar(100)  comment '封面',
       `level` char(1)  comment '级别|枚举[CourseLevelEnum]:ONE("1",初级),TWO("2",中级),THREE("3",高级)',
       `charge` char(1) comment '收费|枚举[CourseChargeEnum]:CHARGE("C","收费"),FREE("F","免费")',
       `status` char(1) comment '状态|枚举[CourseStatusEnum]:PUBLISH("P","发布"),DRAFT("D","草稿")',
       `enroll` integer default 0 comment '报名数',
       `sort` int comment '顺序',
       `created_at` DATETIME(3) comment '创建时间',
       `updated_at` DATETIME(3) comment '修改时间',
       primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='课程';

insert into course(id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
VALUES ('00000001','测试课程01','这是一门测试课程',7200,19.9,'',1,'C','D',0,1,NOW(),NOW());
insert into course(id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
VALUES ('course01','测试课程02','这是一门测试课程',5800,9.9,'',1,'C','D',0,1,NOW(),NOW());

# ----------大章
drop table if exists `chapter`;
create table `chapter`(
     `id` char(8) not null default '' comment 'id',
     `course_id` char(8) comment '课程ID',
     `name` varchar(50) comment '名称',
     primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='大章';

insert into `chapter` (id, course_id, name) values ('00000001','00000001','测试大章01');
insert into `chapter` (id, course_id, name) values ('00000002','00000001','测试大章02');
insert into `chapter` (id, course_id, name) values ('00000003','00000001','测试大章03');
insert into `chapter` (id, course_id, name) values ('00000004','00000001','测试大章04');
insert into `chapter` (id, course_id, name) values ('00000005','00000001','测试大章05');
insert into `chapter` (id, course_id, name) values ('00000006','course01','测试大章06');
insert into `chapter` (id, course_id, name) values ('00000007','course01','测试大章07');
insert into `chapter` (id, course_id, name) values ('00000008','course01','测试大章08');
insert into `chapter` (id, course_id, name) values ('00000009','00000000','测试大章09');
insert into `chapter` (id, course_id, name) values ('00000010','00000000','测试大章10');
insert into `chapter` (id, course_id, name) values ('00000011','00000000','测试大章11');
insert into `chapter` (id, course_id, name) values ('00000012','00000000','测试大章12');
insert into `chapter` (id, course_id, name) values ('00000013','00000000','测试大章13');
insert into `chapter` (id, course_id, name) values ('00000014','00000000','测试大章14');
insert into `chapter` (id, course_id, name) values ('00000015','00000000','测试大章15');
insert into `chapter` (id, course_id, name) values ('00000016','00000000','测试大章16');
insert into `chapter` (id, course_id, name) values ('00000017','00000000','测试大章17');
insert into `chapter` (id, course_id, name) values ('00000018','00000000','测试大章18');
insert into `chapter` (id, course_id, name) values ('00000019','00000000','测试大章19');
insert into `chapter` (id, course_id, name) values ('00000020','00000000','测试大章20');

# ----------小节
drop table if exists `section`;
create table `section`(
      `id` char(8) not null default '' comment 'ID',
      `title` varchar(50) not null comment '标题',
      `course_id` char(8) comment '课程|course.id',
      `chapter_id` char(8) comment '大章|chapter.id',
      `video` varchar(200) comment '视频',
      `time` int comment '时长|单位秒',
      `charge` char(1) comment '收费|C 收费;F 免费',
      `sort` int comment '顺序',
      `created_at` DATETIME(3) comment '创建时间',
      `updated_at` DATETIME(3) comment '修改时间',
      primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='小节';

insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000001','测试小节01','00000001','00000000','',500,'F',1,now(),now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000002','测试大章01-测试小节01','00000001','00000001','',500,'F',1,now(),now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000003','测试大章01-测试小节02','00000001','00000001','',500,'F',2,now(),now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000004','测试大章06-测试小节01','course01','00000006','',500,'F',1,now(),now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000005','测试大章07-测试小节01','course01','00000007','',500,'F',1,now(),now());

# ----------分类
drop table if exists `category`;
create table `category`(
       `id` char(8) not null default '' comment 'ID',
       `parent` char(8) not null default '' comment '父ID',
       `name` varchar(50) not null comment '名称',
       `sort` int comment '顺序',
       primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='分类';

insert into `category` (id, parent, name, sort) VALUES ('00000100','00000000','前端技术',100);
insert into `category` (id, parent, name, sort) VALUES ('00000101','00000100','html/css',101);
insert into `category` (id, parent, name, sort) VALUES ('00000102','00000100','javascript',102);
insert into `category` (id, parent, name, sort) VALUES ('00000103','00000100','vue.js',103);
insert into `category` (id, parent, name, sort) VALUES ('00000104','00000100','react.js',104);
insert into `category` (id, parent, name, sort) VALUES ('00000105','00000100','angular',105);
insert into `category` (id, parent, name, sort) VALUES ('00000106','00000100','node.js',106);
insert into `category` (id, parent, name, sort) VALUES ('00000107','00000100','jquery',107);
insert into `category` (id, parent, name, sort) VALUES ('00000108','00000100','小程序',108);
insert into `category` (id, parent, name, sort) VALUES ('00000200','00000000','后端技术',200);
insert into `category` (id, parent, name, sort) VALUES ('00000201','00000200','Java',201);
insert into `category` (id, parent, name, sort) VALUES ('00000202','00000200','SpringBoot',202);
insert into `category` (id, parent, name, sort) VALUES ('00000203','00000200','SpringCloud',203);
insert into `category` (id, parent, name, sort) VALUES ('00000204','00000200','ssm',204);
insert into `category` (id, parent, name, sort) VALUES ('00000205','00000200','Python',205);
insert into `category` (id, parent, name, sort) VALUES ('00000206','00000200','爬虫',206);
insert into `category` (id, parent, name, sort) VALUES ('00000300','00000300','移动开发',300);
insert into `category` (id, parent, name, sort) VALUES ('00000301','00000300','Android',301);
insert into `category` (id, parent, name, sort) VALUES ('00000302','00000300','IOS',302);
insert into `category` (id, parent, name, sort) VALUES ('00000303','00000300','react active',303);
insert into `category` (id, parent, name, sort) VALUES ('00000304','00000300','ionic',304);
insert into `category` (id, parent, name, sort) VALUES ('00000400','00000000','前沿技术',400);
insert into `category` (id, parent, name, sort) VALUES ('00000401','00000400','微服务',401);
insert into `category` (id, parent, name, sort) VALUES ('00000402','00000400','区块链',402);
insert into `category` (id, parent, name, sort) VALUES ('00000403','00000400','机器学习',403);
insert into `category` (id, parent, name, sort) VALUES ('00000404','00000400','深度学习',404);
insert into `category` (id, parent, name, sort) VALUES ('00000405','00000400','数据分析&挖掘',405);
insert into `category` (id, parent, name, sort) VALUES ('00000500','00000000','云计算&大数据',500);
insert into `category` (id, parent, name, sort) VALUES ('00000501','00000500','大数据',501);
insert into `category` (id, parent, name, sort) VALUES ('00000502','00000500','hadoop',502);
insert into `category` (id, parent, name, sort) VALUES ('00000503','00000500','spark',503);
insert into `category` (id, parent, name, sort) VALUES ('00000504','00000500','hbase',504);
insert into `category` (id, parent, name, sort) VALUES ('00000505','00000500','阿里云',505);
insert into `category` (id, parent, name, sort) VALUES ('00000506','00000500','docker',506);
insert into `category` (id, parent, name, sort) VALUES ('00000507','00000500','kubernetes',507);
insert into `category` (id, parent, name, sort) VALUES ('00000600','00000000','运维&测试',600);
insert into `category` (id, parent, name, sort) VALUES ('00000601','00000600','自动化运维',601);
insert into `category` (id, parent, name, sort) VALUES ('00000602','00000600','中间件',602);
insert into `category` (id, parent, name, sort) VALUES ('00000603','00000600','功能测试',603);
insert into `category` (id, parent, name, sort) VALUES ('00000604','00000600','性能测试',604);
insert into `category` (id, parent, name, sort) VALUES ('00000605','00000600','自动化测试',605);
insert into `category` (id, parent, name, sort) VALUES ('00000606','00000600','接口测试',606);
insert into `category` (id, parent, name, sort) VALUES ('00000607','00000600','安全测试',607);
insert into `category` (id, parent, name, sort) VALUES ('00000700','00000000','数据库',700);
insert into `category` (id, parent, name, sort) VALUES ('00000701','00000700','MySQL',701);
insert into `category` (id, parent, name, sort) VALUES ('00000702','00000700','Redis',702);
insert into `category` (id, parent, name, sort) VALUES ('00000703','00000700','MongoDB',703);
insert into `category` (id, parent, name, sort) VALUES ('00000704','00000700','OracleSQL',704);
insert into `category` (id, parent, name, sort) VALUES ('00000705','00000700','ServerNoSql',705);

# ----------课程分类
drop table if exists `course_category`;
create table `course_category`(
      `id` char(8) not null default '' comment 'id',
      `course_id` char(8)  comment '课程|course.id',
      `category_id` char(8)  comment '分类|category.id',
      primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='课程分类';

# ----------课程内容
drop table if exists `course_content`;
create table `course_content`(
      `id` char(8) not null default '' comment '课程id',
      `content` mediumtext not null comment '课程内容',
      primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='课程内容';

# ----------讲师
drop table if exists `teacher`;
create table `teacher`(
    `id` char(8) not null default '' comment 'ID',
    `name` varchar(50) not null comment '姓名',
    `nickname` varchar(50) not null comment '昵称',
    `image` varchar(100)  comment '头像',
    `position` varchar(50)  comment '职位',
    `motto` varchar(50)  comment '座右铭',
    `intro` varchar(500)  comment '简介',
    primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='讲师';

insert into `teacher` (id, name, nickname, image, position, motto, intro)
VALUES ('00000001','张三','张麻子','','高级项目经理','测试座右铭--自强不息，厚德载物，人文日新，行胜于言！','测试简介--任职以来，该同志认真贯彻科学发展观，遵守国家法律法规和企业规章制度，认真钻研业务知识，不断提升项目管理水平，总结出自已的管理办法，多次带领项目部团队在工程质量创优、工期履约、安全文明施工控制、成本节约和新技术应用等方面取得优异成绩，先后获得“20xx年出省施工优秀建造师”、“20xx年河南省工程建设优秀项目经理”。');
insert into `teacher` (id, name, nickname, image, position, motto, intro)
VALUES ('00000002','老汤','汤师爷','','高级项目经理','测试座右铭--自强不息，厚德载物，人文日新，行胜于言！','测试简介--任职以来，该同志认真贯彻科学发展观，遵守国家法律法规和企业规章制度，认真钻研业务知识，不断提升项目管理水平，总结出自已的管理办法，多次带领项目部团队在工程质量创优、工期履约、安全文明施工控制、成本节约和新技术应用等方面取得优异成绩，先后获得“20xx年出省施工优秀建造师”、“20xx年河南省工程建设优秀项目经理”。');
insert into `teacher` (id, name, nickname, image, position, motto, intro)
VALUES ('00000003','黄老爷','黄老爷','','高级项目经理','测试座右铭--自强不息，厚德载物，人文日新，行胜于言！','测试简介--任职以来，该同志认真贯彻科学发展观，遵守国家法律法规和企业规章制度，认真钻研业务知识，不断提升项目管理水平，总结出自已的管理办法，多次带领项目部团队在工程质量创优、工期履约、安全文明施工控制、成本节约和新技术应用等方面取得优异成绩，先后获得“20xx年出省施工优秀建造师”、“20xx年河南省工程建设优秀项目经理”。');

#课程表中增加讲师字段
alter table `course` add column (`teacher_id` char(8) comment '讲师|teacher.id');

# ----------文件
drop table if exists `file`;
create table `file`(
    `id` char(8) not null default '' comment 'ID',
    `path` varchar(100) not null comment '相对路径',
    `name` varchar(100) comment '文件名',
    `suffix` varchar(10) comment '后缀',
    `size` int comment '大小|字节B',
    `use` char(1) comment '用途|枚举[FileUseEnum]:COURSE("C","课程");TEACHER("T","讲师")',
    `created_at` DATETIME(3) comment '创建时间',
    `updated_at` DATETIME(3) comment '修改时间',
    primary key (`id`),
    unique key `path-unique` (`path`)
)engine=innodb default character set utf8mb4 comment ='文件';