-- 1.
SELECT idczekoladki, nazwa FROM czekoladki czekoladki
	WHERE koszt > ANY (SELECT koszt FROM czekoladki WHERE idczekoladki = 'd08');

-- 2.
SELECT DISTINCT k.nazwa FROM klienci k
	INNER JOIN zamowienia z USING(idklienta)
	INNER JOIN artykuly a USING(idzamowienia)
	INNER JOIN pudelka p USING(idpudelka)
WHERE p.idpudelka IN (
	SELECT idpudelka FROM pudelka p
		INNER JOIN artykuly a USING(idpudelka)
		INNER JOIN zamowienia z USING(idzamowienia)
		INNER JOIN klienci k USING(idklienta)
	WHERE k.nazwa = 'Górka Alicja'
) AND k.nazwa != 'Górka Alicja';


-- 3.
SELECT DISTINCT k.nazwa FROM klienci k
	INNER JOIN zamowienia z USING(idklienta)
	INNER JOIN artykuly a USING(idzamowienia)
	INNER JOIN pudelka p USING(idpudelka)
WHERE p.idpudelka IN (
	SELECT idpudelka FROM pudelka p
		INNER JOIN artykuly a USING(idpudelka)
		INNER JOIN zamowienia z USING(idzamowienia)
		INNER JOIN klienci k USING(idklienta)
	WHERE k.miejscowosc = 'Katowice'
) AND k.miejscowosc != 'Katowice';