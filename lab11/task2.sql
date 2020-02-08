-- 1.
CREATE OR REPLACE FUNCTION zysk(IN key CHARACTER(4))
RETURNS NUMERIC(10,2) AS
$$
DECLARE
	result NUMERIC(10,2);

BEGIN
	SELECT p.cena - 0.9 - SUM(cz.koszt * z.sztuk) INTO result
		FROM pudelka p
		INNER JOIN zawartosc z USING(idpudelka)
		INNER JOIN czekoladki cz USING(idczekoladki)
	WHERE p.idpudelka = key
	GROUP BY p.idpudelka;

	RETURN result;
END;
$$ LANGUAGE PLpgSQL;

-- 2. 
SELECT z.datarealizacji, SUM(zysk(p.idpudelka) * a.sztuk) FROM zamowienia z
	INNER JOIN artykuly a USING(idzamowienia)
	INNER JOIN pudelka p USING(idpudelka)
GROUP BY z.datarealizacji
ORDER BY z.datarealizacji;