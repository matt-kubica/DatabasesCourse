# 1.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.idczekoladki = 'd09';

# 2.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.nazwa LIKE 'S%';

# 3.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
WHERE zawartosc.sztuk >= 4;

# 4.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.nadzienie = 'truskawki';

# 5.
SELECT DISTINCT p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
EXCEPT
SELECT DISTINCT  p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
WHERE cz.czekolada = 'gorzka';

# 6.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE zawartosc.sztuk >= 3 AND czekoladki.nazwa IN ('Gorzka truskawkowa');

# 7.
SELECT DISTINCT p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
EXCEPT
SELECT DISTINCT  p.nazwa, p.cena FROM pudelka p
	INNER JOIN zawartosc z USING(idpudelka)
	INNER JOIN czekoladki cz USING(idczekoladki)
WHERE cz.orzechy IS NOT NULL;

#8.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.nazwa IN ('Gorzka truskawkowa');

# 9.
SELECT DISTINCT pudelka.nazwa, pudelka.opis, pudelka.cena FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE zawartosc.sztuk >= 1 AND czekoladki.nadzienie IS NULL;