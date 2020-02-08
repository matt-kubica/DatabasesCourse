-- 1.
SELECT p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
WHERE cz.idczekoladki IN (SELECT idczekoladki FROM czekoladki WHERE idczekoladki = 'd09');

-- 2.
SELECT p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
WHERE cz.idczekoladki IN (SELECT idczekoladki FROM czekoladki WHERE nazwa = 'Gorzka truskawkowa');

-- 3.
SELECT DISTINCT p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
WHERE cz.idczekoladki IN 
	(SELECT idczekoladki FROM czekoladki WHERE nazwa LIKE 'S%');

-- 4.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka IN (
		SELECT idpudelka FROM zawartosc
		WHERE zawartosc.sztuk >= 4
	);

-- 5.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka IN (
		SELECT idpudelka FROM zawartosc
		INNER JOIN czekoladki USING(idczekoladki)
		WHERE czekoladki.nazwa LIKE 'S%' AND zawartosc.sztuk >= 3
	);

-- 6.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka IN (
		SELECT idpudelka FROM zawartosc
		INNER JOIN czekoladki USING(idczekoladki)
		WHERE czekoladki.nadzienie = 'truskawki'
	);

-- 7.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka NOT IN (
		SELECT idpudelka FROM zawartosc
		INNER JOIN czekoladki USING(idczekoladki)
		WHERE czekoladki.czekolada = 'gorzka'
	);

-- 8.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka NOT IN (
		SELECT idpudelka FROM zawartosc
		INNER JOIN czekoladki USING(idczekoladki)
		WHERE czekoladki.orzechy IS NOT NULL
	);

-- 9.
SELECT p.nazwa, p.cena FROM pudelka p
	WHERE p.idpudelka IN (
		SELECT idpudelka FROM zawartosc
		INNER JOIN czekoladki USING(idczekoladki)
		WHERE czekoladki.nadzienie IS NULL
	);