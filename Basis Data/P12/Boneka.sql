/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     26-Apr-19 02:48:50 PM                        */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_HEADERPE_MELAKUKAN_MEMBER') then
    alter table HEADERPENJUALAN
       delete foreign key FK_HEADERPE_MELAKUKAN_MEMBER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HEADERPE_MELAYANI_PEGAWAI') then
    alter table HEADERPENJUALAN
       delete foreign key FK_HEADERPE_MELAYANI_PEGAWAI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_JENISMEM_RELATIONS_MEMBER') then
    alter table JENISMEMBER
       delete foreign key FK_JENISMEM_RELATIONS_MEMBER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEMBER_RELATIONS_JENISMEM') then
    alter table MEMBER
       delete foreign key FK_MEMBER_RELATIONS_JENISMEM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TERJUAL_TERJUAL_HEADERPE') then
    alter table TERJUAL
       delete foreign key FK_TERJUAL_TERJUAL_HEADERPE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TERJUAL_TERJUAL2_BONEKA') then
    alter table TERJUAL
       delete foreign key FK_TERJUAL_TERJUAL2_BONEKA
end if;

drop index if exists BONEKA.BONEKA_PK;

drop table if exists BONEKA;

drop index if exists HEADERPENJUALAN.MELAYANI_FK;

drop index if exists HEADERPENJUALAN.MELAKUKAN_FK;

drop index if exists HEADERPENJUALAN.HEADERPENJUALAN_PK;

drop table if exists HEADERPENJUALAN;

drop index if exists JENISMEMBER.RELATIONSHIP_1_FK;

drop index if exists JENISMEMBER.JENISMEMBER_PK;

drop table if exists JENISMEMBER;

drop index if exists MEMBER.RELATIONSHIP_2_FK;

drop index if exists MEMBER.MEMBER_PK;

drop table if exists MEMBER;

drop index if exists PEGAWAI.PEGAWAI_PK;

drop table if exists PEGAWAI;

drop index if exists TERJUAL.TERJUAL2_FK;

drop index if exists TERJUAL.TERJUAL_FK;

drop index if exists TERJUAL.TERJUAL_PK;

drop table if exists TERJUAL;

/*==============================================================*/
/* Table: BONEKA                                                */
/*==============================================================*/
create table BONEKA 
(
   KDBONEKA             char(5)                        not null,
   NAMABONEKA           varchar(30)                    not null,
   HARGA                integer                        not null,
   STOCK                integer                        not null,
   constraint PK_BONEKA primary key (KDBONEKA)
);

/*==============================================================*/
/* Index: BONEKA_PK                                             */
/*==============================================================*/
create unique index BONEKA_PK on BONEKA (
KDBONEKA ASC
);

/*==============================================================*/
/* Table: HEADERPENJUALAN                                       */
/*==============================================================*/
create table HEADERPENJUALAN 
(
   KDPENJUALAN          char(5)                        not null,
   KDPEGAWAI            char(5)                        null,
   KDMEMBER             char(5)                        null,
   TGLPENJUALAN         timestamp                      not null,
   constraint PK_HEADERPENJUALAN primary key (KDPENJUALAN)
);

/*==============================================================*/
/* Index: HEADERPENJUALAN_PK                                    */
/*==============================================================*/
create unique index HEADERPENJUALAN_PK on HEADERPENJUALAN (
KDPENJUALAN ASC
);

/*==============================================================*/
/* Index: MELAKUKAN_FK                                          */
/*==============================================================*/
create index MELAKUKAN_FK on HEADERPENJUALAN (
KDMEMBER ASC
);

/*==============================================================*/
/* Index: MELAYANI_FK                                           */
/*==============================================================*/
create index MELAYANI_FK on HEADERPENJUALAN (
KDPEGAWAI ASC
);

/*==============================================================*/
/* Table: JENISMEMBER                                           */
/*==============================================================*/
create table JENISMEMBER 
(
   KDJENISMEMBER        char(5)                        not null,
   KDMEMBER             char(5)                        null,
   JENISMEMBER          char(10)                       not null,
   DISC                 decimal(2,2)                   null,
   constraint PK_JENISMEMBER primary key (KDJENISMEMBER)
);

/*==============================================================*/
/* Index: JENISMEMBER_PK                                        */
/*==============================================================*/
create unique index JENISMEMBER_PK on JENISMEMBER (
KDJENISMEMBER ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on JENISMEMBER (
KDMEMBER ASC
);

/*==============================================================*/
/* Table: MEMBER                                                */
/*==============================================================*/
create table MEMBER 
(
   KDMEMBER             char(5)                        not null,
   KDJENISMEMBER        char(5)                        null,
   NAMAMEMBER           varchar(50)                    not null,
   TELPMEMBER           integer                        null,
   constraint PK_MEMBER primary key (KDMEMBER)
);

/*==============================================================*/
/* Index: MEMBER_PK                                             */
/*==============================================================*/
create unique index MEMBER_PK on MEMBER (
KDMEMBER ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on MEMBER (
KDJENISMEMBER ASC
);

/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
create table PEGAWAI 
(
   KDPEGAWAI            char(5)                        not null,
   NAMAPEGAWAI          varchar(30)                    not null,
   ALAMATPEGAWAI        varchar(50)                    null,
   TELPPEGAWAI          integer                        null,
   constraint PK_PEGAWAI primary key (KDPEGAWAI)
);

/*==============================================================*/
/* Index: PEGAWAI_PK                                            */
/*==============================================================*/
create unique index PEGAWAI_PK on PEGAWAI (
KDPEGAWAI ASC
);

/*==============================================================*/
/* Table: TERJUAL                                               */
/*==============================================================*/
create table TERJUAL 
(
   KDPENJUALAN          char(5)                        not null,
   KDBONEKA             char(5)                        not null,
   constraint PK_TERJUAL primary key clustered (KDPENJUALAN, KDBONEKA)
);

/*==============================================================*/
/* Index: TERJUAL_PK                                            */
/*==============================================================*/
create unique clustered index TERJUAL_PK on TERJUAL (
KDPENJUALAN ASC,
KDBONEKA ASC
);

/*==============================================================*/
/* Index: TERJUAL_FK                                            */
/*==============================================================*/
create index TERJUAL_FK on TERJUAL (
KDPENJUALAN ASC
);

/*==============================================================*/
/* Index: TERJUAL2_FK                                           */
/*==============================================================*/
create index TERJUAL2_FK on TERJUAL (
KDBONEKA ASC
);

alter table HEADERPENJUALAN
   add constraint FK_HEADERPE_MELAKUKAN_MEMBER foreign key (KDMEMBER)
      references MEMBER (KDMEMBER)
      on update restrict
      on delete restrict;

alter table HEADERPENJUALAN
   add constraint FK_HEADERPE_MELAYANI_PEGAWAI foreign key (KDPEGAWAI)
      references PEGAWAI (KDPEGAWAI)
      on update restrict
      on delete restrict;

alter table JENISMEMBER
   add constraint FK_JENISMEM_RELATIONS_MEMBER foreign key (KDMEMBER)
      references MEMBER (KDMEMBER)
      on update restrict
      on delete restrict;

alter table MEMBER
   add constraint FK_MEMBER_RELATIONS_JENISMEM foreign key (KDJENISMEMBER)
      references JENISMEMBER (KDJENISMEMBER)
      on update restrict
      on delete restrict;

alter table TERJUAL
   add constraint FK_TERJUAL_TERJUAL_HEADERPE foreign key (KDPENJUALAN)
      references HEADERPENJUALAN (KDPENJUALAN)
      on update restrict
      on delete restrict;

alter table TERJUAL
   add constraint FK_TERJUAL_TERJUAL2_BONEKA foreign key (KDBONEKA)
      references BONEKA (KDBONEKA)
      on update restrict
      on delete restrict;

