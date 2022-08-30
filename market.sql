DECLARE
CURSOR c_urun is 
SELECT urun_ad 
from URUNLER;
TYPE urun_list is table of urunler.urun_ad%type;
l_name_list urun_list := urun_list();
l_counter integer := 0;

BEGIN
    for rec_cust IN c_urun LOOP
    l_counter := l_counter+1;
    l_name_list.EXTEND;
    l_name_list(l_counter):= rec_cust.urun_ad;
    dbms_output.PUT_LINE(l_counter || l_name_list(l_counter));
    END LOOP;
    END;
DECLARE
l_ulkead ULKELER.ULKE_AD%type;
    BEGIN
    INSERT INTO ULKELER (ULKE_ID,ULKE_AD) VALUES('GB','Büyük Britanya');
     SELECT ulke_ad into l_ulkead FROM ULKELER WHERE ULKE_ID = 'GB';
    SAVEPOINT sv1;
   
    DELETE FROM ULKELER WHERE ULKE_ID ='GB';
    ROLLBACK TO sv1;
    dbms_output.PUT_LINE(l_ulkead);
    
    
    END;


    declare
    TYPE EmpCurTyp IS REF CURSOR;

    emp_cv EmpCurTyp;
    emp_rec MARKALAR%rowtype;
    l_sql_stmt VARCHAR2(200);
    l_emp_num VARCHAR2(10) = '1';
    BEGIN
    l_sql_stmt := 'SELECT * FROM MARKALAR WHERE ULKE_ID= :emp_num ';
    OPEN emp_cv FOR l_sql_stmt USING l_emp_num;
    LOOP
    FETCH emp_cv into emp_rec;
    EXIT WHEN emp_cv%NOTFOUND;
    dbms_output.PUT_LINE(emp_rec.MARKA_AD);
    END LOOP;
   CLOSE emp_cv; 

    end;


    DECLARE

    l_cur SYS_REFCURSOR;
    l_marka_name VARCHAR2(100);

    PROCEDURE p_test(p_id IN NUMBER , p_cursor OUT SYS_REFCURSOR)is
    BEGIN
        OPEN p_cursor FOR SELECT MARKA_AD from MARKALAR WHERE marka_id = p_id;

    END p_test;


    BEGIN
    p_test(1,l_cur);
    LOOP
        FETCH l_cur INTO l_marka_name;
        EXIT WHEN l_cur%NOTFOUND;
        dbms_output.PUT_LINE(l_marka_name);
        END LOOP;
        END;


    
    CREATE OR REPLACE TRIGGER stok_degisim 
    BEFORE DELETE OR INSERT OR UPDATE ON STOK 
    FOR EACH ROW 
    WHEN (new.urun_id>0)
    DECLARE
     stk_diff number; 
    BEGIN
    stk_diff := :NEW.stok_durum  - :OLD.stok_durum; 
    dbms_output.PUT_LINE('STOK DURUMU: '||stk_diff);
    END;

    UPDATE STOK SET stok_durum = stok_durum+2 WHERE urun_id = 1;

    stok_degisim ;


    select * from stok WHERE urun_id = 1;