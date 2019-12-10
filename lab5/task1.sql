# 1.
SELECT COUNT(*) FROM czekoladki;

# 2.
SELECT COUNT(*) FROM czekoladki 
WHERE nadzienie IS NOT NULL;

SELECT COUNT(nadzienie) FROM czekoladki;

# 3.
SELECT pudelka.nazwa, SUM(zawartosc.sztuk)  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka) 
GROUP BY pudelka.nazwa
ORDER BY SUM(zawartosc.sztuk) DESC
LIMIT 1;

# 4.
SELECT pudelka.nazwa, SUM(zawartosc.sztuk)  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka) 
GROUP BY pudelka.nazwa
ORDER BY SUM(zawartosc.sztuk) DESC;

# 5.
SELECT p.nazwa, SUM(z.sztuk) FROM pudelka p
	INNER JOIN zawartosc z ON p.idpudelka = z.idpudelka
	INNER JOIN czekoladki cz ON z.idczekoladki = cz.idczekoladki
WHERE cz.orzechy IS NULL
GROUP BY p.nazwa
ORDER BY SUM(z.sztuk) DESC;

# 6.
SELECT p.nazwa, SUM(z.sztuk) FROM pudelka p
	INNER JOIN zawartosc z ON p.idpudelka = z.idpudelka
	INNER JOIN czekoladki cz ON z.idczekoladki = cz.idczekoladki
WHERE cz.czekolada IN ('mleczna')
GROUP BY p.nazwa
ORDER BY SUM(z.sztuk) DESC;