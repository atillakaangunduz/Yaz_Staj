
create or replace procedure prc_cok_siparis (l_vendor_id number)is
begin
for  l_c in (select distinct PO_HEADER_ID,COMMENTS,VENDOR_NAME from akg_view1 where Tamamlanma_Yuzde = (select max(Tamamlanma_Yuzde)  from akg_view1 where VENDOR_ID=l_vendor_id ) ) loop
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
dbms_output.PUT_LINE(l_c.PO_HEADER_ID);
dbms_output.PUT_LINE(l_c.COMMENTS);
dbms_output.PUT_LINE(l_c.VENDOR_NAME);
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
end loop;
end;


begin
prc_cok_siparis(1060);
end;


create or replace procedure tamamlanmamýs_siparis_vendor (l_vendor_id number)is
begin
for  l_c in (select distinct PO_HEADER_ID,COMMENTS,VENDOR_NAME ,Tamamlanma_Yuzde from akg_view1 where Tamamlanma_Yuzde <90 and  VENDOR_ID=l_vendor_id ) loop
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
dbms_output.PUT_LINE(l_c.PO_HEADER_ID);
dbms_output.PUT_LINE(l_c.COMMENTS);
dbms_output.PUT_LINE(l_c.VENDOR_NAME);
dbms_output.PUT_LINE(l_c.Tamamlanma_Yuzde);
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
end loop;
end;

begin
tamamlanmamýs_siparis;
end;

create or replace procedure tamamlanmamýs_siparis is
begin
for  l_c in (select distinct PO_HEADER_ID,COMMENTS,VENDOR_NAME ,Tamamlanma_Yuzde from akg_view1 where Tamamlanma_Yuzde <90  ) loop
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
dbms_output.PUT_LINE(l_c.PO_HEADER_ID);
dbms_output.PUT_LINE(l_c.COMMENTS);
dbms_output.PUT_LINE(l_c.VENDOR_NAME);
dbms_output.PUT_LINE(l_c.Tamamlanma_Yuzde);
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
end loop;
end;


create or replace procedure siparisgun is
begin
for  l_c in (select distinct PO_HEADER_ID,COMMENTS,VENDOR_NAME ,Tamamlanma_Yuzde from akg_view1 where to_date('01.01.2020','DD.MM.YYYY')<to_date(CREATION_DATE,'DD.MM.YYYY' ) ) loop
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
dbms_output.PUT_LINE(l_c.PO_HEADER_ID);
dbms_output.PUT_LINE(l_c.COMMENTS);
dbms_output.PUT_LINE(l_c.VENDOR_NAME);
dbms_output.PUT_LINE(l_c.Tamamlanma_Yuzde);
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
end loop;
end;


begin
siparisgun;
end;





create or replace procedure siparisiptal is
begin
for  l_c in (select distinct PO_HEADER_ID,COMMENTS,VENDOR_NAME ,Tamamlanma_Yuzde from akg_view2 where to_date('01.01.2020','DD.MM.YYYY')<to_date(CREATION_DATE,'DD.MM.YYYY' ) and cancel_flag = 'Y' ) loop
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
dbms_output.PUT_LINE(l_c.PO_HEADER_ID);
dbms_output.PUT_LINE(l_c.COMMENTS);
dbms_output.PUT_LINE(l_c.VENDOR_NAME);
dbms_output.PUT_LINE(l_c.Tamamlanma_Yuzde);
dbms_output.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
end loop;
end;

begin
siparisiptal;
end;


select LAST_UPDATE_DATE,CREATION_DATE,(to_date(LAST_UPDATE_DATE )- to_date(CREATION_DATE))from po_headers_all