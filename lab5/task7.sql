# 1.

WITH koszt_wytworzenia AS (
	SELECT z.idpudelka, SUM(z.sztuk * cz.koszt) AS koszt FROM zawartosc z
		INNER JOIN czekoladki cz USING(idczekoladki)
	GROUP BY z.idpudelka
)                                         
SELECT p.idpudelka, (p.cena - k.koszt) AS roznica FROM pudelka p
	INNER JOIN koszt_wytworzenia k USING(idpudelka)
ORDER BY roznica DESC;



# 2.
WITH koszt_wytworzenia AS (
	SELECT z.idpudelka, SUM(z.sztuk * cz.koszt) AS koszt FROM zawartosc z
		INNER JOIN czekoladki cz USING(idczekoladki)
	GROUP BY z.idpudelka
)
SELECT SUM(a.sztuk * (p.cena - k.koszt)) FROM artykuly a
	INNER JOIN pudelka p USING(idpudelka)
	INNER JOIN koszt_wytworzenia k USING(idpudelka);

# 2.1
WITH 
zysk AS (
	SELECT pudelka.idpudelka, abs(SUM(zawartosc.sztuk * czekoladki.koszt) - pudelka.cena) FROM pudelka
		INNER JOIN zawartosc USING(idpudelka)
		INNER JOIN czekoladki USING(idczekoladki)
	GROUP BY pudelka.idpudelka
	),
ilosc_zamowien AS (
	SELECT artykuly.idpudelka, COUNT(artykuly.idzamowienia) FROM artykuly
	GROUP BY artykuly.idpudelka
	)
SELECT DISTINCT SUM(ilosc_zamowien.count * zysk.abs * artykuly.sztuk) AS zysk_calkowity FROM artykuly
	INNER JOIN zysk USING(idpudelka)
	INNER JOIN ilosc_zamowien USING(idpudelka)
;