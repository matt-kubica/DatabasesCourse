# 1.
SELECT czekoladki.idczekoladki, czekoladki.nazwa FROM czekoladki
WHERE czekoladki.koszt > (SELECT koszt FROM czekoladki WHERE idczekoladki = 'd08');

# 2.
WITH gorka AS (
	SELECT artykuly.idpudelka FROM klienci
		INNER JOIN zamowienia USING(idklienta)
		INNER JOIN artykuly USING(idzamowienia)
	WHERE klienci.nazwa = 'Górka Alicja'
	)
SELECT klienci.nazwa FROM klienci
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN gorka USING(idpudelka) 
WHERE klienci.nazwa <> 'Górka Alicja'
GROUP BY klienci.nazwa
ORDER BY klienci.nazwa;

# 3.
WITH kato AS (
	SELECT artykuly.idpudelka FROM klienci
		INNER JOIN zamowienia USING(idklienta)
		INNER JOIN artykuly USING(idzamowienia)
	WHERE klienci.miejscowosc = 'Katowice'
	)
SELECT klienci.nazwa FROM klienci
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN kato USING(idpudelka) 
WHERE klienci.miejscowosc <> 'Katowice'
GROUP BY klienci.nazwa
ORDER BY klienci.nazwa;