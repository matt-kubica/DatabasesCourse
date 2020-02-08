-- 1.
CREATE OR REPLACE FUNCTION masaPudelka(IN key CHARACTER(4))
RETURNS INTEGER AS 
$$
DECLARE
	result INTEGER;

BEGIN
	SELECT SUM(cz.masa * z.sztuk) INTO result FROM czekoladki cz
		INNER JOIN zawartosc z USING(idczekoladki)
	WHERE z.idpudelka = key;

	RETURN result;
END;
$$ LANGUAGE PLpgSQL;

-- 2.
CREATE OR REPLACE FUNCTION liczbaCzekoladek(IN key CHARACTER(4))
RETURNS INTEGER AS 
$$
DECLARE
	result INTEGER;

BEGIN
	SELECT SUM(z.sztuk) INTO result FROM zawartosc z
	WHERE z.idpudelka = key;

	RETURN result;
END;
$$ LANGUAGE PLpgSQL;