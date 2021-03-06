--liquibase formatted sql

--changeset derriel:0 runAlways:true
ALTER SESSION SET CURRENT_SCHEMA = HC;

--changeset derriel:1
ALTER TABLE HC.DM_CLAIM ADD AIA_NET_ALL_PENDING NUMBER(28,8);
ALTER TABLE HC.DM_CLAIM ADD NUM_OF_CLAIM_PENDING NUMBER(28,8);

--changeset derriel:2
ALTER TABLE HC.DM_CLAIM ADD PRE_SUBMISSION_APP_TAG VARCHAR2(1);
ALTER TABLE HC.DM_CLAIM ADD BLANKET_APP_TAG VARCHAR2(1);
ALTER TABLE HC.DM_CLAIM ADD PRE_AUTH_TAG VARCHAR2(1);
ALTER TABLE HC.DM_CLAIM ADD OVERALL_COMPLY VARCHAR2(1);

--changeset derriel:4
ALTER TABLE HC.DM_CLAIM MODIFY OVERALL_COMPLY VARCHAR2(50);

--changeset Milind:5
ALTER TABLE HC.DM_CLAIM ADD HC_PLAN_GROUP4 VARCHAR2(50);

--changeset derriel:6
CREATE INDEX HC.DM_CLAIM_CNT_IDX ON HC.DM_CLAIM
(AIA_LOB, CLAIM_CNT_IDX)
  TABLESPACE EDW_IDX
  PCTFREE    10
  INITRANS   2
  MAXTRANS   255
  STORAGE    (
              BUFFER_POOL      DEFAULT
             )
LOCAL (  
  PARTITION P_DM_CLAIM_SHIELD
    NOCOMPRESS 
    TABLESPACE EDW_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P_DM_CLAIM_MM
    NOCOMPRESS 
    TABLESPACE EDW_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P_DM_CLAIM_CS
    NOCOMPRESS 
    TABLESPACE EDW_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          80K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               )
)
PARALLEL ( DEGREE 8 INSTANCES 1 );

--changeset derriel:7
CREATE INDEX HC.HC_PLAN_GROUP4_IDX ON HC.DM_CLAIM (AIA_LOB, HC_PLAN_GROUP4) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX  LOCAL
 (PARTITION P_DM_CLAIM_SHIELD 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_MM 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_CS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 81920 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX ) 
  PARALLEL 8 ;

  --chageset derriel:8
  CREATE INDEX HC.HC_BENE_GROUP_IDX ON HC.DM_CLAIM (AIA_LOB, BENE_GROUP) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX  LOCAL
 (PARTITION P_DM_CLAIM_SHIELD 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_MM 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_CS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 81920 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX ) 
  PARALLEL 8 ;

  --chageset derriel:9
  CREATE INDEX HC.OP_TOSP_CATEGORY ON HC.DM_CLAIM (AIA_LOB, OP_TOSP_CATEGORY) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX  LOCAL
 (PARTITION P_DM_CLAIM_SHIELD 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_MM 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX , 
 PARTITION P_DM_CLAIM_CS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 81920 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE EDW_IDX ) 
  PARALLEL 8 ;