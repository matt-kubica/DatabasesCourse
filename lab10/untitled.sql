-- 1.
CREATE OR REPLACE FUNCTION zamowieniaInfo(IN key INTEGER)
RETURNS TABLE (idzamowienia INTEGER, idpudelka CHAR(4), datarealizacji DATE) AS
$$
BEGIN
	RETURN QUERY
	SELECT z.idzamowienia, a.idpudelka, z.datarealizacji FROM zamowienia z
		INNER JOIN artykuly a USING(idzamowienia)
		WHERE z.idklienta = key;
END;
$$ LANGUAGE PLpgSQL;
	
-- 2.
CREATE OR REPLACE FUNCTION klienciInfo(IN key VARCHAR(15))
RETURNS TABLE (nazwa VARCHAR(130), adres VARCHAR(30)) AS
$$
BEGIN
	RETURN QUERY
	SELECT k.nazwa, k.ulica FROM klienci k
	WHERE k.miejscowosc = key;
END;
$$ LANGUAGE PLpgSQL;