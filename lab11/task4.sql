-- 1.
CREATE OR REPLACE FUNCTION podwyzka()
RETURNS VOID AS
$$
DECLARE
	zmiana NUMERIC(10,2);
	rekord1 RECORD;
	rekord2 RECORD;

BEGIN
	FOR rekord1 IN SELECT * FROM czekoladki LOOP
		IF rekord1.koszt < 0.20 THEN
			zmiana := 0.03;
		ELSIF rekord1.koszt BETWEEN 0.20 AND 0.29 THEN
			zmiana := 0.04;
		ELSE
			zmiana := 0.05;
		END IF;

		UPDATE czekoladki SET koszt = koszt + zmiana
		WHERE idczekoladki = rekord1.idczekoladki;

		FOR rekord2 IN SELECT * FROM zawartosc WHERE idczekoladki = rekord1.idczekoladki LOOP
			UPDATE pudelka SET cena = cena + (zmiana * rekord2.sztuk) 
			WHERE idpudelka = rekord2.idpudelka;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE PLpgSQL; 


-- 2.
CREATE OR REPLACE FUNCTION obnizka()
RETURNS VOID AS
$$
DECLARE
	zmiana NUMERIC(10,2);
	rekord1 RECORD;
	rekord2 RECORD;

BEGIN
	FOR rekord1 IN SELECT * FROM czekoladki LOOP
		IF rekord1.koszt < 0.23 THEN
			zmiana := 0.03;
		ELSIF rekord1.koszt BETWEEN 0.23 AND 0.33 THEN
			zmiana := 0.04;
		ELSE
			zmiana := 0.05;
		END IF;

		UPDATE czekoladki SET koszt = koszt - zmiana
		WHERE idczekoladki = rekord1.idczekoladki;

		FOR rekord2 IN SELECT * FROM zawartosc WHERE idczekoladki = rekord1.idczekoladki LOOP
			UPDATE pudelka SET cena = cena - (zmiana * rekord2.sztuk) 
			WHERE idpudelka = rekord2.idpudelka;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE PLpgSQL; 