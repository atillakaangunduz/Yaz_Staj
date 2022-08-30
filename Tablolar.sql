CREATE TABLE OGRENCI(

ogr_id NUMBER not null,
ogr_ad VARCHAR2(100) not null,
ogr_soyad VARCHAR2(100) not null,
ogr_cinsiyet VARCHAR2(6) not null,
ogr_adres VARCHAR2(250) not null,
ogr_dtarih DATE  not null,
ogr_dyeri  VARCHAR2(250) not null,
ogr_kaytarih DATE  not null



);

CREATE TABLE DERSLER (
    ders_id NUMBER not null,
    ders_kod VARCHAR2(6) NOT NULL,
    ders_ad VARCHAR2(50) not null


);

CREATE TABLE ALINAN_DERS (
    ders_id NUMBER not null,
    ogr_id NUMBER not null,
    ogr_yıl NUMBER NOT NULL,
    ogr_donem NUMBER NOT NULL
);

CREATE TABLE SINAV_BILGI(
sınav_id NUMBER not null,
ders_id NUMBER not null,
sınav_tarih date not null

);


CREATE TABLE SINAV_NOT(
sınav_id NUMBER not null,
ogr_id NUMBER not null,
sınav_not NUMBER not null

);