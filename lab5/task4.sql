# 1.
SELECT czekoladki.idczekoladki, czekoladki.nazwa, COUNT(pudelka.idpudelka) FROM czekoladki
	INNER JOIN zawartosc USING(idczekoladki)
	INNER JOIN pudelka USING(idpudelka)
GROUP BY czekoladki.idczekoladki
ORDER BY COUNT(pudelka.idpudelka) DESC
LIMIT 1;

# 2.
SELECT DISTINCT pudelka.idpudelka, zawartosc.sztuk FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.orzechy IS NULL
ORDER BY zawartosc.sztuk DESC
LIMIT 1;

# 3.
SELECT czekoladki.idczekoladki, czekoladki.nazwa, COUNT(pudelka.idpudelka) FROM czekoladki
	INNER JOIN zawartosc USING(idczekoladki)
	INNER JOIN pudelka USING(idpudelka)
GROUP BY czekoladki.idczekoladki
ORDER BY COUNT(pudelka.idpudelka) ASC
LIMIT 1;

#4. 
SELECT pudelka.idpudelka, COUNT(zamowienia.idklienta) FROM pudelka
	INNER JOIN artykuly USING(idpudelka)
	INNER JOIN zamowienia USING(idzamowienia)
GROUP BY pudelka.idpudelka
ORDER BY COUNT(zamowienia.idklienta) DESC
LIMIT 1;