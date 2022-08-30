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
       `id` char(8) not null default '' comment 'id',
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
     `course_id` char(8) comment '课程id',
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
      `id` char(8) not null default '' comment 'id',
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
       `id` char(8) not null default '' comment 'id',
       `parent` char(8) not null default '' comment '父id',
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

# ----------课程内容文件
drop table if exists `course_content_file`;
create table `course_content_file`(
    `id` char(8) not null default '' comment 'id',
    `course_id` char(8)  comment '课程id',
    `url` varchar(100) comment '地址',
    `name` varchar(100) comment '文件名',
    `size` int comment '大小|字节B',
    primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='课程内容文件';

# ----------讲师
drop table if exists `teacher`;
create table `teacher`(
    `id` char(8) not null default '' comment 'id',
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
    `id` char(8) not null default '' comment 'id',
    `path` varchar(100) not null comment '相对路径',
    `name` varchar(100) comment '文件名',
    `suffix` varchar(10) comment '后缀',
    `size` int comment '大小|字节B',
    `use` char(1) comment '用途|枚举[FileUseEnum]:COURSE("C","课程");TEACHER("T","讲师")',
    `created_at` DATETIME(3) comment '创建时间',
    `updated_at` DATETIME(3) comment '修改时间',
    primary key (`id`),
    unique key `path_unique` (`path`)
)engine=innodb default character set utf8mb4 comment ='文件';

alter table `file` add column (`shard_index` int comment '已上传分片');
alter table `file` add column (`shard_size` int comment '分片大小|B');
alter table `file` add column (`shard_total` int comment '分片总数');
alter table `file` add column (`key` varchar(32) comment '文件标识');
alter table `file` add unique key key_unique(`key`);

# ----------用户
drop table if exists `user`;
create table `user`(
    `id` char(8) not null default '' comment 'id',
    `login_name` varchar(50) not null comment '登录名',
    `name` varchar(50) comment '昵称',
    `password` char(32) not null comment '密码',
    primary key (`id`),
    unique key `login_name_unique` (`login_name`)
)engine=innodb default character set utf8mb4 comment ='用户';

INSERT INTO `user` VALUES ('1xISB8qT', 'business', 'business', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user` VALUES ('9hYDWroh', 'file', 'file', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user` VALUES ('LVl9Ak3L', 'system', 'system', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user` VALUES ('PrGeVjl7', 'user', 'user', 'fb09b64e309e1c33e7cf8cfe99b07bd5');

# ----------资源
drop table if exists `resource`;
create table `resource`(
   `id` char(6) not null default '' comment 'id',
   `name` varchar(100) not null comment '名称|菜单或按钮',
   `page` varchar(50) null comment '页面|路由',
   `request` varchar(200) null comment '请求|接口',
   `parent` char(6) comment '父id',
   primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='资源';

INSERT INTO `resource` VALUES ('00', '欢迎', 'welcome', null, '');
INSERT INTO `resource` VALUES ('01', '系统管理', null, null, '');
INSERT INTO `resource` VALUES ('0101', '用户管理', 'system/user', null, '01');
INSERT INTO `resource` VALUES ('010101', '保存', null, '[\"/system/admin/user/list\",\"/system/admin/user/save\"]', '0101');
INSERT INTO `resource` VALUES ('010102', '删除', null, '[\"/system/admin/user/delete\"]', '0101');
INSERT INTO `resource` VALUES ('010103', '重置密码', null, '[\"/system/admin/user/save-password\"]', '0101');
INSERT INTO `resource` VALUES ('0102', '资源管理', 'system/resource', null, '01');
INSERT INTO `resource` VALUES ('010201', '保存/显示', null, '[\"/system/admin/resource\"]', '0102');
INSERT INTO `resource` VALUES ('0103', '角色管理', 'system/role', null, '01');
INSERT INTO `resource` VALUES ('010301', '角色/权限管理', null, '[\"/system/admin/role\"]', '0103');
INSERT INTO `resource` VALUES ('02', '业务管理', null, null, '');
INSERT INTO `resource` VALUES ('0201', '分类管理', 'business/category', null, '02');
INSERT INTO `resource` VALUES ('020101', '增删改查', null, '[\"/business/admin/category\"]', '0201');
INSERT INTO `resource` VALUES ('0202', '课程管理', 'business/course', null, '02');
INSERT INTO `resource` VALUES ('020201', '增删改查', null, '[\"/business/admin/course\",\"/business/admin/category/all\"]', '0202');
INSERT INTO `resource` VALUES ('0203', '讲师管理', 'business/teacher', null, '02');
INSERT INTO `resource` VALUES ('020301', '增删改查', null, '[\"/business/admin/teacher\"]', '0203');
INSERT INTO `resource` VALUES ('03', '文件管理', null, null, '');
INSERT INTO `resource` VALUES ('0301', '文件管理', 'file/file', null, '03');
INSERT INTO `resource` VALUES ('030101', '文件管理', null, '[\"/file/admin/file\"]', '0301');

# ----------角色
drop table if exists `role`;
create table `role`(
  `id` char(8) not null default '' comment 'id',
  `name` varchar(50) not null comment '角色',
  `desc` varchar(100) not null comment '描述',
  primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='角色';

insert into `role` values ('00000000','系统管理员','管理用户、角色权限');
insert into `role` values ('00000001','开发','维护资源');
insert into `role` values ('00000002','业务管理员','负责业务管理');

# ----------角色资源
drop table if exists `role_resource`;
create table `role_resource`(
   `id` char(8) not null default '' comment 'id',
   `role_id` char(8) not null default '' comment '角色|id',
   `resource_id` char(6) not null default '' comment '资源|id',
   primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='角色资源';

INSERT INTO `role_resource` VALUES ('0pFAadJK', '00000001', '0103');
INSERT INTO `role_resource` VALUES ('0rj4lCon', '00000001', '030101');
INSERT INTO `role_resource` VALUES ('0v2Li7c1', '00000002', '0201');
INSERT INTO `role_resource` VALUES ('21QehmZC', '00000000', '03');
INSERT INTO `role_resource` VALUES ('5MZOS7Mx', '00000002', '020301');
INSERT INTO `role_resource` VALUES ('AadcexkB', '00000000', '00');
INSERT INTO `role_resource` VALUES ('BzwAhdmw', '00000000', '0201');
INSERT INTO `role_resource` VALUES ('ceIs5G7R', '00000002', '0203');
INSERT INTO `role_resource` VALUES ('cHPaJnXG', '00000000', '010101');
INSERT INTO `role_resource` VALUES ('eMJpYiXz', '00000002', '0202');
INSERT INTO `role_resource` VALUES ('g5M9VC5p', '00000001', '0102');
INSERT INTO `role_resource` VALUES ('iJhGCo3c', '00000001', '01');
INSERT INTO `role_resource` VALUES ('jcpmcF6V', '00000001', '010103');
INSERT INTO `role_resource` VALUES ('JUCvZhan', '00000000', '010201');
INSERT INTO `role_resource` VALUES ('lgvRNNWq', '00000001', '010201');
INSERT INTO `role_resource` VALUES ('mTUVEK60', '00000000', '020201');
INSERT INTO `role_resource` VALUES ('nJaCwDGX', '00000000', '0202');
INSERT INTO `role_resource` VALUES ('nNnXKvat', '00000000', '020301');
INSERT INTO `role_resource` VALUES ('OJJSEvAC', '00000002', '020101');
INSERT INTO `role_resource` VALUES ('Pg1Obc8V', '00000001', '03');
INSERT INTO `role_resource` VALUES ('pOXVaBI5', '00000000', '010103');
INSERT INTO `role_resource` VALUES ('QknHIlCs', '00000000', '010102');
INSERT INTO `role_resource` VALUES ('rfFswrxh', '00000001', '010301');
INSERT INTO `role_resource` VALUES ('sk0AHmCJ', '00000000', '0203');
INSERT INTO `role_resource` VALUES ('SSC1DZrH', '00000000', '0101');
INSERT INTO `role_resource` VALUES ('toj7i6UU', '00000000', '010301');
INSERT INTO `role_resource` VALUES ('vlyzEdTw', '00000000', '020101');
INSERT INTO `role_resource` VALUES ('W6YdlJLr', '00000002', '02');
INSERT INTO `role_resource` VALUES ('WexNoshT', '00000001', '010102');
INSERT INTO `role_resource` VALUES ('WpTITpTa', '00000000', '02');
INSERT INTO `role_resource` VALUES ('WsBwQax2', '00000000', '0103');
INSERT INTO `role_resource` VALUES ('XAGSnQjy', '00000000', '01');
INSERT INTO `role_resource` VALUES ('XaPBccOQ', '00000002', '020201');
INSERT INTO `role_resource` VALUES ('XgTLBFem', '00000000', '0301');
INSERT INTO `role_resource` VALUES ('Xwl6fvnF', '00000000', '030101');
INSERT INTO `role_resource` VALUES ('XYkl8wMF', '00000001', '010101');
INSERT INTO `role_resource` VALUES ('yskAc09e', '00000000', '0102');
INSERT INTO `role_resource` VALUES ('zGnfcrT6', '00000001', '0101');
INSERT INTO `role_resource` VALUES ('ZvNONixc', '00000001', '0301');

# ----------角色用户
drop table if exists `role_user`;
create table `role_user`(
  `id` char(8) not null default '' comment 'id',
  `role_id` char(8) not null default '' comment '角色|id',
  `user_id` char(8) not null default '' comment '用户|id',
  primary key (`id`)
)engine=innodb default character set utf8mb4 comment ='角色用户';

INSERT INTO `role_user` VALUES ('00000000', '00000000', 'LVl9Ak3L');
INSERT INTO `role_user` VALUES ('gjTgpy0i', '00000001', 'PrGeVjl7');
INSERT INTO `role_user` VALUES ('UZmA6SiV', '00000002', '1xISB8qT');
INSERT INTO `role_user` VALUES ('VHthrvWl', '00000001', '9hYDWroh');