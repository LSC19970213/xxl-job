

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_group";
CREATE TABLE "xxl_job_group" (
                                 "id" int4 NOT NULL,
                                 "app_name" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
                                 "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
                                 "address_type" int4 NOT NULL,
                                 "address_list" text COLLATE "pg_catalog"."default",
                                 "update_time" timestamp(0)
)
;
COMMENT ON COLUMN "xxl_job_group"."id" IS 'id';
COMMENT ON COLUMN "xxl_job_group"."app_name" IS '执行器AppName';
COMMENT ON COLUMN "xxl_job_group"."title" IS '执行器名称';
COMMENT ON COLUMN "xxl_job_group"."address_type" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "xxl_job_group"."address_list" IS '执行器地址列表，多地址逗号分隔';
COMMENT ON TABLE "xxl_job_group" IS '执行器信息表';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_group" ("id", "app_name", "title", "address_type", "address_list", "update_time") VALUES (1, 'xxl-job-executor-sample', '示例执行器', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_info";
CREATE TABLE "xxl_job_info" (
                                "id" int4 NOT NULL,
                                "job_group" int4 NOT NULL,
                                "job_desc" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
                                "add_time" timestamp(0),
                                "update_time" timestamp(0),
                                "author" varchar(500) COLLATE "pg_catalog"."default",
                                "alarm_email" varchar(500) COLLATE "pg_catalog"."default",
                                "executor_route_strategy" varchar(150) COLLATE "pg_catalog"."default",
                                "executor_handler" varchar(500) COLLATE "pg_catalog"."default",
                                "executor_param" varchar(1000) COLLATE "pg_catalog"."default",
                                "executor_block_strategy" varchar(150) COLLATE "pg_catalog"."default",
                                "executor_timeout" int4 NOT NULL DEFAULT 0,
                                "executor_fail_retry_count" int4 NOT NULL,
                                "glue_type" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
                                "glue_source" text COLLATE "pg_catalog"."default",
                                "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
                                "glue_updatetime" timestamp(0),
                                "child_jobid" varchar(500) COLLATE "pg_catalog"."default",
                                "trigger_status" int4 NOT NULL DEFAULT 0,
                                "trigger_last_time" bigint NOT NULL DEFAULT 0,
                                "trigger_next_time" bigint NOT NULL DEFAULT 0,
                                "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default",
                                "schedule_type" varchar(50) COLLATE "pg_catalog"."default",
                                "schedule_conf" varchar(128) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl_job_info"."id" IS '主键
';
COMMENT ON COLUMN "xxl_job_info"."job_group" IS '执行器主键ID
';
COMMENT ON COLUMN "xxl_job_info"."job_desc" IS '任务描述';
COMMENT ON COLUMN "xxl_job_info"."add_time" IS '添加时间';
COMMENT ON COLUMN "xxl_job_info"."update_time" IS '更新时间';
COMMENT ON COLUMN "xxl_job_info"."author" IS '作者';
COMMENT ON COLUMN "xxl_job_info"."alarm_email" IS '报警邮件';
COMMENT ON COLUMN "xxl_job_info"."executor_route_strategy" IS '执行器路由策略';
COMMENT ON COLUMN "xxl_job_info"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl_job_info"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl_job_info"."executor_block_strategy" IS '阻塞处理策略';
COMMENT ON COLUMN "xxl_job_info"."executor_timeout" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "xxl_job_info"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl_job_info"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl_job_info"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl_job_info"."glue_remark" IS 'GLUE备注';
COMMENT ON COLUMN "xxl_job_info"."glue_updatetime" IS 'GLUE更新时间';
COMMENT ON COLUMN "xxl_job_info"."child_jobid" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "xxl_job_info"."trigger_status" IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN "xxl_job_info"."trigger_last_time" IS '上次调度时间';
COMMENT ON COLUMN "xxl_job_info"."trigger_next_time" IS '下次调度时间';
COMMENT ON COLUMN "xxl_job_info"."misfire_strategy" IS '调度过期策略';
COMMENT ON COLUMN "xxl_job_info"."schedule_type" IS '调度类型';
COMMENT ON COLUMN "xxl_job_info"."schedule_conf" IS '调度配置，值含义取决于调度类型';
COMMENT ON TABLE "xxl_job_info" IS '调度信息表';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_info" ("id", "job_group", "job_desc", "add_time", "update_time", "author", "alarm_email", "executor_route_strategy", "executor_handler", "executor_param", "executor_block_strategy", "executor_timeout", "executor_fail_retry_count", "glue_type", "glue_source", "glue_remark", "glue_updatetime", "child_jobid", "trigger_status", "trigger_last_time", "trigger_next_time", "misfire_strategy", "schedule_type", "schedule_conf") VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', NULL, 'FIRST', 'demoJobHandler', NULL, 'SERIAL_EXECUTION', 0, 0, 'BEAN', NULL, 'GLUE代码初始化', '2018-11-03 22:21:31', NULL, 0, 0, 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_lock";
CREATE TABLE "xxl_job_lock" (
    "lock_name" varchar(150) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "xxl_job_lock"."lock_name" IS '锁名称';
COMMENT ON TABLE "xxl_job_lock" IS '锁信息';

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_lock" ("lock_name") VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log";
CREATE TABLE "xxl_job_log" (
                               "id" int4 NOT NULL,
                               "job_group" int4 NOT NULL,
                               "job_id" int4 NOT NULL,
                               "executor_address" varchar(500) COLLATE "pg_catalog"."default",
                               "executor_handler" varchar(500) COLLATE "pg_catalog"."default",
                               "executor_param" varchar(1000) COLLATE "pg_catalog"."default",
                               "executor_sharding_param" varchar(50) COLLATE "pg_catalog"."default",
                               "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
                               "trigger_time" timestamp(0),
                               "trigger_code" int4 NOT NULL,
                               "trigger_msg" text COLLATE "pg_catalog"."default",
                               "handle_time" timestamp(0),
                               "handle_code" int4 NOT NULL,
                               "handle_msg" text COLLATE "pg_catalog"."default",
                               "alarm_status" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl_job_log"."id" IS '主键ID';
COMMENT ON COLUMN "xxl_job_log"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "xxl_job_log"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl_job_log"."executor_address" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "xxl_job_log"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl_job_log"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl_job_log"."executor_sharding_param" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "xxl_job_log"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl_job_log"."trigger_time" IS '调度-时间';
COMMENT ON COLUMN "xxl_job_log"."trigger_code" IS '调度-结果';
COMMENT ON COLUMN "xxl_job_log"."trigger_msg" IS '调度-日志';
COMMENT ON COLUMN "xxl_job_log"."handle_time" IS '执行-时间';
COMMENT ON COLUMN "xxl_job_log"."handle_code" IS '执行-状态';
COMMENT ON COLUMN "xxl_job_log"."handle_msg" IS '执行-日志';
COMMENT ON COLUMN "xxl_job_log"."alarm_status" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';
COMMENT ON TABLE "xxl_job_log" IS '任务日志信息';

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log_report";
CREATE TABLE "xxl_job_log_report" (
                                      "id" int4 NOT NULL,
                                      "trigger_day" timestamp(0),
                                      "running_count" int4 NOT NULL DEFAULT 0,
                                      "suc_count" int4 NOT NULL DEFAULT 0,
                                      "fail_count" int4 NOT NULL DEFAULT 0,
                                      "update_time" timestamp(0)
)
;
COMMENT ON COLUMN "xxl_job_log_report"."id" IS 'id';
COMMENT ON COLUMN "xxl_job_log_report"."trigger_day" IS '调度-时间';
COMMENT ON COLUMN "xxl_job_log_report"."running_count" IS '运行中-日志数量';
COMMENT ON COLUMN "xxl_job_log_report"."suc_count" IS '执行成功-日志数量';
COMMENT ON COLUMN "xxl_job_log_report"."fail_count" IS '执行失败-日志数量';
COMMENT ON COLUMN "xxl_job_log_report"."update_time" IS '更新时间';
COMMENT ON TABLE "xxl_job_log_report" IS '日志报表';

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_logglue";
CREATE TABLE "xxl_job_logglue" (
                                   "id" int4 NOT NULL,
                                   "job_id" int4 NOT NULL,
                                   "glue_type" varchar(150) COLLATE "pg_catalog"."default",
                                   "glue_source" text COLLATE "pg_catalog"."default",
                                   "glue_remark" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
                                   "add_time" timestamp(0),
                                   "update_time" timestamp(0)
)
;
COMMENT ON COLUMN "xxl_job_logglue"."id" IS '主键ID';
COMMENT ON COLUMN "xxl_job_logglue"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl_job_logglue"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl_job_logglue"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl_job_logglue"."glue_remark" IS 'GLUE备注';
COMMENT ON COLUMN "xxl_job_logglue"."add_time" IS '添加时间';
COMMENT ON COLUMN "xxl_job_logglue"."update_time" IS '更新时间';
COMMENT ON TABLE "xxl_job_logglue" IS '任务GLUE日志';

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_registry";
CREATE TABLE "xxl_job_registry" (
                                    "id" int4 NOT NULL,
                                    "registry_group" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
                                    "registry_key" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
                                    "registry_value" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
                                    "update_time" timestamp(0)
)
;
COMMENT ON COLUMN "xxl_job_registry"."id" IS '主键ID';
COMMENT ON COLUMN "xxl_job_registry"."registry_group" IS '注册组';
COMMENT ON COLUMN "xxl_job_registry"."registry_key" IS '注册key';
COMMENT ON COLUMN "xxl_job_registry"."registry_value" IS '注册value';
COMMENT ON COLUMN "xxl_job_registry"."update_time" IS '修改时间';
COMMENT ON TABLE "xxl_job_registry" IS '执行器注册表';

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_user";
CREATE TABLE "xxl_job_user" (
                                "id" int4 NOT NULL,
                                "username" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
                                "password" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
                                "role" int4 NOT NULL,
                                "permission" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl_job_user"."id" IS '主键ID';
COMMENT ON COLUMN "xxl_job_user"."username" IS '账号';
COMMENT ON COLUMN "xxl_job_user"."password" IS '密码';
COMMENT ON COLUMN "xxl_job_user"."role" IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN "xxl_job_user"."permission" IS '权限：执行器ID列表，多个逗号分割';
COMMENT ON TABLE "xxl_job_user" IS '登录用户信息';

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO "xxl_job_user" ("id", "username", "password", "role", "permission") VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

-- ----------------------------
-- Indexes structure for table xxl_job_group
-- ----------------------------
CREATE INDEX "idx_xxl_job_group_app_name" ON "xxl_job_group" USING btree (
    "app_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "idx_xxl_job_log_handle_code" ON "xxl_job_log" USING btree (
    "handle_code" "pg_catalog"."int4_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_log_handle_time" ON "xxl_job_log" USING btree (
    "handle_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_log_job_group" ON "xxl_job_log" USING btree (
    "job_group" "pg_catalog"."int4_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_log_job_id" ON "xxl_job_log" USING btree (
    "job_id" "pg_catalog"."int4_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_log_trigger_code" ON "xxl_job_log" USING btree (
    "trigger_code" "pg_catalog"."int4_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_log_trigger_time" ON "xxl_job_log" USING btree (
    "trigger_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_logglue
-- ----------------------------
CREATE INDEX "idx_xxl_job_logglue_job_id" ON "xxl_job_logglue" USING btree (
    "job_id" "pg_catalog"."int4_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE INDEX "idx_xxl_job_registry_registry_group" ON "xxl_job_registry" USING btree (
    "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );
CREATE INDEX "idx_xxl_job_registry_update_time" ON "xxl_job_registry" USING btree (
    "update_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");




-- Create sequence
create sequence XXL_JOB_GROUP_ID
minvalue 1
maxvalue 999999999999
start with 2
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_INFO_ID
minvalue 1
maxvalue 999999999999
start with 2
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_LOGGLUE_ID
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_LOG_ID
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_LOG_REPORT_ID
minvalue 1
maxvalue 999999999999
start with 2
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_REGISTRY_ID
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20
cycle;

-- Create sequence
create sequence XXL_JOB_USER_ID
minvalue 1
maxvalue 999999999999
start with 2
increment by 1
cache 20
cycle;



