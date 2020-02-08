-- additional
CREATE OR REPLACE FUNCTION sumaZamowien(IN key INTEGER)
RETURNS INTEGER AS
$$
DECLARE
	suma_zamowien INTEGER;

BEGIN
	SELECT COUNT(z.idzamowienia) INTO suma_zamowien FROM zamowienia z
	WHERE z.idklienta = key;

	RETURN suma_zamowien;
END;
$$ LANGUAGE PLpgSQL;

-- 1.
CREATE OR REPLACE FUNCTION sumaWartosciZamowien(IN key INTEGER)
RETURNS NUMERIC(10,2) AS
$$
DECLARE 
	suma_wartosci NUMERIC(10,2);

BEGIN
	SELECT SUM(a.sztuk * p.cena) INTO suma_wartosci
		FROM pudelka p 
		INNER JOIN artykuly a USING(idpudelka)
		INNER JOIN zamowienia z USING(idzamowienia)
	WHERE z.idklienta = key;

	RETURN suma_wartosci;
END;
$$ LANGUAGE PLpgSQL;

-- 2.
CREATE OR REPLACE FUNCTION rabat(IN key INTEGER)
RETURNS INTEGER AS
$$
DECLARE
	rabat INTEGER;
	suma_wartosci_zamowien NUMERIC(10,2);

BEGIN
	SELECT sumaWartosciZamowien(key) INTO suma_wartosci_zamowien;
	
	
	IF suma_wartosci_zamowien > 100 AND suma_wartosci_zamowien <= 200 THEN
		rabat := 4;
	ELSIF suma_wartosci_zamowien > 200 AND suma_wartosci_zamowien <= 400 THEN
		rabat := 7;
	ELSIF suma_wartosci_zamowien > 400 THEN
		rabat := 8;
	ELSE
		rabat := 0;
	END IF;

	RETURN rabat;
END;
$$ LANGUAGE PLpgSQL;


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

		UPDATE czekoladki
		SET koszt = koszt + zmiana
		WHERE idczekoladki = rekord1.idczekoladki;

		FOR rekord2 IN SELECT * FROM zawartosc WHERE idczekoladki = rekord1.idczekoladki LOOP
			UPDATE pudelka
			SET cena = cena + (zmiana * z.sztuk) 
			WHERE idpudelka = rekord2.idpudelka;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE PLpgSQL; 
