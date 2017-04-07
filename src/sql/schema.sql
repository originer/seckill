--数据库初始化

--创建数据库
CREATE DATABASE seckill;
--使用数据库
use seckill;
--创建秒杀库存表
CREATE table seckill(
    `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
    `name` varchar(120) NOT NULL COMMENT '商品名称',
    `number` int NOT NULL COMMENT '库存数量',
    `start_time` timestamp NOT NULL COMMENT '秒杀开启时间',
    `end_time` timestamp NOT NULL COMMENT '秒杀结束时间',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (seckill_id),
    key idx_start_time(start_time),
    key idx_end_time(end_time),
    key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='描述库存表';

--创建索引，用于加速查询
--key idx_start_time(start_time),
--key idx_end_time(end_time),
--key idx_create_time(create_time)

--默认mysql有多种存储引擎，但是可以支持事物的只有InnoDB,所以在这里通过显示的语法去告诉mysql这个表的ENGINE引擎是InnoDB
--由于数据库采用的是自增作为主键，给出初始的自增id:AUTO_INCREMENT=1000
--默认编码 DEFAULT CHARSET=utf-8
--表的注释 COMMENT='秒杀库存表'

--初始化数据
insert into
    seckill(name,number,start_time,end_time)
value
    ('1000元秒杀iphone6',100,'2012-12-12 00:00:00','2012-12-13 00:00:00'),
    ('500元秒杀ipad2',200,'2012-12-12 00:00:00','2012-12-13 00:00:00'),
    ('300元秒杀mi4',300,'2012-12-12 00:00:00','2012-12-13 00:00:00'),
    ('200元秒杀红米note',400,'2012-12-12 00:00:00','2012-12-13 00:00:00');


--秒杀成功明细
--用户登录认证相关的信息
create table success_killed(
    `seckill_id` bigint not null COMMENT '秒杀商品id',
    `user_phone` bigint not null comment '用户手机号',
    `state` tinyint not null default -1 comment '状态标识：-1：无效  0：成功  1：已付款  2：已发货',
    `create_time` timestamp not null comment '创建时间',
    primary key(seckill_id,user_phone),/*联合主键*/
    key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

--连接数据库控制台
mysql -uroot -proot

-- --查看创建表的结构
-- show create table seckill\G
--
-- --为什么手写DDL
-- --记录每次上线的DDL修改
-- --上线V1.1
-- ALTER TABLE seckill
-- DROP INDEX idx_create_time,
-- ADD INDEX idx_c_s(start_time,create_time);
--
--
-- --上线V1.2
-- --DDL