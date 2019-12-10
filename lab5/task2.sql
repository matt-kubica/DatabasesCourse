# 1.
SELECT pudelka.idpudelka, SUM(czekoladki.masa * zawartosc.sztuk) FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
GROUP BY pudelka.idpudelka
ORDER BY SUM(czekoladki.masa * zawartosc.sztuk) DESC;


# 2.
SELECT pudelka.idpudelka, SUM(czekoladki.masa * zawartosc.sztuk) FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
GROUP BY pudelka.idpudelka
ORDER BY SUM(czekoladki.masa * zawartosc.sztuk) DESC
LIMIT 1;

# 3.
WITH m AS(
	SELECT SUM(czekoladki.masa * zawartosc.sztuk) as suma FROM pudelka
		INNER JOIN zawartosc USING(idpudelka)
		INNER JOIN czekoladki USING(idczekoladki)
	GROUP BY pudelka.idpudelka
	)
SELECT AVG(suma) FROM m;

# 4.
SELECT pudelka.nazwa, AVG(czekoladki.masa) FROM czekoladki
	INNER JOIN zawartosc USING(idczekoladki)
	INNER JOIN pudelka USING(idpudelka)
GROUP BY pudelka.nazwa
ORDER BY AVG(czekoladki.masa) DESC;


