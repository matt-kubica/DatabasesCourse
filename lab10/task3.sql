-- 1.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN 
	(SELECT idklienta FROM zamowienia WHERE datarealizacji = '2013-11-12');

-- 2.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN 
	(SELECT idklienta FROM zamowienia WHERE DATE_PART('month', datarealizacji) = 11 AND 
		DATE_PART('year', datarealizacji) = 2013);

-- 3.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN (
		SELECT z.idklienta FROM zamowienia z
			INNER JOIN artykuly a USING(idzamowienia)
			INNER JOIN pudelka p USING(idpudelka)
		WHERE p.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna')
	);

-- 4.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN (
		SELECT z.idklienta FROM zamowienia z
			INNER JOIN artykuly a USING(idzamowienia)
			INNER JOIN pudelka p USING(idpudelka)
		WHERE p.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna') 
		AND a.sztuk >= 2
	);

-- 5.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN (
		SELECT z.idklienta FROM zamowienia z
			INNER JOIN artykuly a USING(idzamowienia)
			INNER JOIN pudelka p USING(idpudelka)
			INNER JOIN zawartosc za USING(idpudelka)
			INNER JOIN czekoladki cz USING(idczekoladki)
		WHERE cz.orzechy = 'migdały'
	);

-- 6.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta IN (SELECT idklienta FROM zamowienia);

-- 7.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM klienci k
	WHERE k.idklienta NOT IN (SELECT idklienta FROM zamowienia);