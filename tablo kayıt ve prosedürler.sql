CREATE OR REPLACE PROCEDURE XXXT_DERS_EKLE_PRC(l_ders_kod in DERSLER.DERS_KOD%TYPE ,l_ders_ad DERSLER.DERS_AD%type ) is
BEGIN
INSERT INTO DERSLER (DERS_ID, DERS_KOD, DERS_AD) VALUES (xxxt_ders_id_S.NEXTVAL,l_ders_kod,l_ders_ad);
dbms_output.put_line('Veriler Girildi');
COMMIT;
END;

BEGIN
XXXT_DERS_EKLE_PRC('MAT101','MATEMATİK 1');
END;
BEGIN
XXXT_DERS_EKLE_PRC('FZK107','FİZİK 1');
XXXT_DERS_EKLE_PRC('BMB207','VERITABANI YÖNETIMI');
XXXT_DERS_EKLE_PRC('BMB212','VERI YAPILARI');
XXXT_DERS_EKLE_PRC('BMB315','WEB PROGRAMLAMA');
END;


CREATE OR REPLACE PROCEDURE XXXT_DERS_SIL_PRC (l_ders_id in dersler.DERS_id%type) is
BEGIN
DELETE FROM DERSLER WHERE ders_id = l_ders_id;
COMMIT;
END;



BEGIN
XXXT_DERS_SIL_PRC(1);
END;


CREATE OR REPLACE PROCEDURE XXXT_DERS_UPTAD_PRC(l_ders_ad in DERSLER.DERS_AD%TYPE , l_ders_id in DERSLER.DERS_ID%TYPE) is
BEGIN
UPDATE  DERSLER SET DERS_AD = l_ders_ad WHERE ders_id = l_ders_id ;
dbms_output.put_line('Seçilen Veriler Güncllendi');
COMMIT;
END;

BEGIN
XXXT_DERS_UPTAD_PRC('MATEMATİK 1' , 1);
END;

CREATE OR REPLACE PROCEDURE XXXT_DERS_UPTKOD_PRC(l_ders_kod in DERSLER.DERS_KOD%TYPE , l_ders_id in DERSLER.DERS_ID%TYPE) is
BEGIN
UPDATE  DERSLER SET DERS_kod = l_ders_kod WHERE ders_id = l_ders_id ;
dbms_output.put_line('Seçilen Veriler Güncllendi');
COMMIT;
END;



SELECT * from dersler;


CREATE OR REPLACE PROCEDURE XXXT_OGR_EKLE_PRC(l_ogr_ad in OGRENCI.ogr_ad%type,
l_ogr_soyad in OGRENCI.ogr_soyad%type,
l_ogr_cinsiyet in OGRENCI.ogr_cinsiyet%TYPE, 
l_ogr_adres in  OGRENCI.OGR_adres%TYPE, 
l_ogr_tarih in OGRENCI.OGR_DTARIH%TYPE ,  
l_ogr_dyeri in  OGRENCI.ogr_dyeri%TYPE, 
l_ogr_kaytarih in OGRENCI.ogr_kaytarih%TYPE ) is
BEGIN
INSERT INTO OGRENCI (OGR_ID, OGR_AD, OGR_SOYAD, OGR_CINSIYET , OGR_ADRES, OGR_DTARIH, OGR_DYERI , OGR_KAYTARIH) VALUES (xxxt_ogrenci_id_S.nextval,l_ogr_ad,
l_ogr_soyad, l_ogr_cinsiyet , l_ogr_adres, l_ogr_tarih, l_ogr_dyeri ,l_ogr_kaytarih);
dbms_output.put_line('Veriler Girildi');
COMMIT;
END;


CREATE OR REPLACE PROCEDURE XXXT_OGR_SIL_PRC(l_ogr_id in OGRENCI.OGR_ID%type) is
BEGIN
DELETE FROM OGRENCI WHERE ogr_id = l_ogr_id;
dbms_output.PUT_LINE('Seçilen Öğrenci Silindi');
COMMIT;
END;

CREATE OR REPLACE PROCEDURE XXXT_OGR_UPTAD_PRC (l_ogr_id in OGRENCI.OGR_ID%type , l_ogr_adres in  OGRENCI.OGR_adres%TYPE) is
BEGIN
UPDATE OGRENCI SET ogr_adres = l_ogr_adres  WHERE ogr_id = l_ogr_id;
dbms_output.PUT_LINE('Adres Bilgisi Güncellendi');
COMMIT;
END;


CREATE OR REPLACE PROCEDURE XXXT_OGR_UPTSOY_PRC (l_ogr_id in OGRENCI.OGR_ID%type , l_ogr_soyad in  OGRENCI.OGR_soyad%TYPE) is
BEGIN
UPDATE OGRENCI SET ogr_soyad = l_ogr_soyad  WHERE ogr_id = l_ogr_id;
dbms_output.PUT_LINE('Soyad Bilgisi Güncellendi');
COMMIT;
END;



CREATE OR REPLACE PROCEDURE XXXT_OGR_UPTNAME_PRC (l_ogr_id in OGRENCI.OGR_ID%type , l_ogr_ad in  OGRENCI.OGR_ad%TYPE) is
BEGIN
UPDATE OGRENCI SET ogr_ad = l_ogr_ad  WHERE ogr_id = l_ogr_id;
dbms_output.PUT_LINE('Ad Bilgisi Güncellendi');
COMMIT;
END;


BEGIN 
XXXT_OGR_EKLE_PRC('Atilla','Gündüz','Erkek','Sultangazi/İstanbul',(TO_DATE('27.07.2001','DD.MM.YYYY')),'Hatay/İskenderun',(TO_DATE('18.07.2022','DD.MM.YYYY')));    
    
END;

BEGIN
XXXT_OGR_EKLE_PRC('Kaan','Gündüz','Erkek','İskenderun/Hatay',(TO_DATE('20.05.1998','DD.MM.YYYY')), 'Çorlu/Tekirdağ',(TO_DATE('18.08.2019','DD.MM.YYYY')));
XXXT_OGR_EKLE_PRC('Ayşe','Fatma','Kadın', 'Bayrampaşa/İstanbul',(TO_DATE('15.01.1999','DD.MM.YYYY')), 'Bayrampaşa/İstanbul',(TO_DATE('14.08.2020','DD.MM.YYYY')));
XXXT_OGR_EKLE_PRC('Fatma','Ayşe','Kadın', 'Esenler/İstanbul',(TO_DATE('30.01.2000','DD.MM.YYYY')), 'Bayrampaşa/İstanbul',(TO_DATE('17.08.2018','DD.MM.YYYY')));
XXXT_OGR_EKLE_PRC('Faruk','Gün','Erkek', 'Sarıyer/İstanbul',(TO_DATE('17.01.2001','DD.MM.YYYY')), 'Gaziosmanpaşa/İstanbul',(TO_DATE('14.08.2022','DD.MM.YYYY')));
XXXT_OGR_EKLE_PRC('Faruk','Gün','Erkek', 'Sarıyer/İstanbul',(TO_DATE('17.01.2001','DD.MM.YYYY')), 'Gaziosmanpaşa/İstanbul',(TO_DATE('14.08.2022','DD.MM.YYYY')));


END;

desc ogrenci;

select * from ogrenci order by ogr_id;
select * from dersler;
BEGIN
XXXT_OGR_UPTNAME_PRC(9,'GÜNDÜZ');
END;

BEGIN
XXXT_OGR_SIL_PRC(9);
END;


CREATE OR REPLACE PROCEDURE XXXT_ALINANDERS_EKLE_PRC(l_ogr_id in  ALINAN_DERS.ogr_id%type , l_ders_id  in ALINAN_DERS.ders_id%type , l_ogr_yil ALINAN_DERS.ogr_yil%type,l_ogr_donem ALINAN_DERS.ogr_donem%type)as
ders_max DERSLER.ders_ad%type;ders_min number; ogr_min number; ogr_max number; hata1 EXCEPTION ; hata2 EXCEPTION;
begin
Select distinct d.ders_ad , o.ogr_id  into ders_max, ogr_max from   Dersler d, ogrenci o  where d.ders_id = l_ders_id and  o.ogr_id = l_ogr_id;   
IF SQL%found then
INSERT INTO ALINAN_DERS (DERS_ID , OGR_ID, OGR_YIL , OGR_DONEM) VALUES (l_ders_id, l_ogr_id, l_ogr_yil,l_ogr_donem);
Else
dbms_output.put_line('Gerekli sorgu bulunamadı');
end if;

END;
DESc aLınan_Ders;

BEGIN 
XXXT_ALINANDERS_EKLE_PRC(4,7,2022,3);
end;
begin
XXXT_ALINANDERS_EKLE_PRC(4,3,2019,1);
XXXT_ALINANDERS_EKLE_PRC(4,6,2020,3);
XXXT_ALINANDERS_EKLE_PRC(5,2,2018,1);
XXXT_ALINANDERS_EKLE_PRC(5,4,2022,5);
XXXT_ALINANDERS_EKLE_PRC(6,5,2022,3);
XXXT_ALINANDERS_EKLE_PRC(6,3,2021,1);
XXXT_ALINANDERS_EKLE_PRC(7,3,2018,1);
XXXT_ALINANDERS_EKLE_PRC(7,6,2022,7);
XXXT_ALINANDERS_EKLE_PRC(8,5,2022,3);
XXXT_ALINANDERS_EKLE_PRC(8,4,2022,5);

END;


Desc ALINAN_DERS;
Select * from ogrenci;
SELECT * FROM ALINAN_DERS;

CREATE OR REPLACE PROCEDURE XXXT_ALINANDERS_SIL_PRC(l_ogr_id in  ALINAN_DERS.ogr_id%type , l_ders_id  in ALINAN_DERS.ders_id%type)is
begin
DELETE ALINAN_DERS WHERE DERS_ID = l_ders_id and OGR_ID = l_ogr_id;
COMMIT;
END;

BEGIN
XXXT_ALINANDERS_SIL_PRC(7,4);
END;


DESC SINAV_BILGI;

CREATE OR REPLACE  PROCEDURE XXXT_SINAVBILGI_EKLE_PRC(l_ders_id SINAV_BILGI.DERS_ID%TYPE , l_tarih SINAV_BILGI.SINAV_TARIH%TYPE )as
ders_max DERSLER.DERS_AD%type;ders_min number;hata1 exception;
begin
Select distinct d.ders_ad into ders_max from  Dersler d where d.ders_id = l_ders_id ;   
IF SQL%found then
INSERT INTO SINAV_BILGI (SINAV_ID,DERS_ID ,SINAV_TARIH) values (xxxt_sinav_id_S.NEXTVAL,l_ders_id ,l_tarih );
Else
dbms_output.put_line('Gerekli sorgu bulunamadı');
end if;

END;

BEGIN
XXXT_SINAVBILGI_EKLE_PRC(2,(TO_DATE('20/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(3,(TO_DATE('21/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(4,(TO_DATE('22/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(5,(TO_DATE('23/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(6,(TO_DATE('24/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(2,(TO_DATE('25/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(3,(TO_DATE('26/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(4,(TO_DATE('27/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(5,(TO_DATE('28/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
XXXT_SINAVBILGI_EKLE_PRC(6,(TO_DATE('29/07/2022 10:00:00' , 'DD/MM/YYYY HH24:MI:SS')));
END;

SELECT * FROM SINAV_BILGI;
SELECT * from dersler;


create or replace procedure XXXT_SINAVBILGI_SIL_PRC(l_sinav_id SINAV_BILGI.SINAV_ID%TYPE ) as
begin
DELETE FROM SINAV_BILGI WHERE sinav_id = l_sinav_id ;
COMMIT;  
end;

create or replace procedure XXXT_SINAVBILGI_UPTTAR_PRC(l_sinav_id SINAV_BILGI.SINAV_ID%TYPE , l_ders_id SINAV_BILGI.DERS_ID%TYPE ,l_tarih SINAV_BILGI.SINAV_TARIH%TYPE  ) is
begin
UPDATE  SINAV_BILGI set sinav_tarih = l_tarih WHERE sinav_id = l_sınav_id and ders_id = l_ders_id;
COMMIT;  
end;

DESC SINAV_NOT;

create or replace PROCEDURE XXXT_SINAVNOT_EKLE_PCR(l_ogr_id SINAV_NOT.OGR_ID%type, l_sinav_id SINAV_NOT.SINAV_ID%type,l_sinav_not SINAV_NOT.SINAV_NOT%type) as
ogr_min number; ogr_max number; hata1 exception;hata2 exception;sinav_max number;sinav_min number ;
BEGIN
Select distinct a.ogr_id , s.sinav_id into ogr_min, ogr_max from SINAV_BILGI s , ALINAN_DERS a where a.ogr_id = l_ogr_id and s.sinav_id = l_sinav_id;

IF SQL%found then
INSERT INTO SINAV_NOT (SINAV_ID,OGR_ID ,SINAV_NOT) values (l_sinav_id,l_ogr_id ,l_sinav_not );
Else
dbms_output.put_line('Gerekli sorgu bulunamadı');
end if;
end;


BEGIN
XXXT_SINAVNOT_EKLE_PCR(4,4,80);
XXXT_SINAVNOT_EKLE_PCR(4,2,90);
XXXT_SINAVNOT_EKLE_PCR(4,5,85);
XXXT_SINAVNOT_EKLE_PCR(5,1,100);
XXXT_SINAVNOT_EKLE_PCR(5,3,80);
XXXT_SINAVNOT_EKLE_PCR(6,2,90);
XXXT_SINAVNOT_EKLE_PCR(7,2,100);
XXXT_SINAVNOT_EKLE_PCR(7,5,80);
XXXT_SINAVNOT_EKLE_PCR(8,4,90);
XXXT_SINAVNOT_EKLE_PCR(8,3,90);

END;


SELECT * FROM OGRENCI;
SELECT * FROM SINAV_BILGI;
SELECT * from SINAV_NOT;
SELECT * from ALINAN_DERS;
BEGIN 
XXXT_ALINANDERS_EKLE_PRC(7,3,2022,3);
END;

create or replace PROCEDURE XXXT_SINAVNOT_SIL_PCR(l_sinav_id SINAV_NOT.SINAV_ID%type,l_ogr_id SINAV_NOT.OGR_ID%type) as

BEGIN
DELETE FROM SINAV_NOT WHERE sinav_id = l_sinav_id and ogr_id = l_ogr_id;
COMMIT;
END;


BEGIN
XXXT_SINAVNOT_SIL_PCR(1,5);
END;

create or replace PROCEDURE XXXT_SINAVNOT_UPT_PCR(l_sinav_id SINAV_NOT.SINAV_ID%type,l_ogr_id SINAV_NOT.OGR_ID%type, l_sinav_not SINAV_NOT.SINAV_NOT%type) as
BEGIN 
UPDATE  SINAV_NOT SET SINAV_NOT = l_sinav_not WHERE sinav_id = l_sinav_id and ogr_id = l_ogr_id;
COMMIT;
END;

BEGIN
XXXT_SINAVNOT_UPT_PCR(2,7,90);
END;
BEGIN
XXXT_SINAVBILGI_SIL_PRC(2);
END;