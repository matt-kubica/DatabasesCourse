# 1.

SELECT pudelka.idpudelka, abs(SUM(zawartosc.sztuk * czekoladki.koszt) - pudelka.cena) AS zysk FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
GROUP BY pudelka.idpudelka
ORDER BY abs(SUM(zawartosc.sztuk * czekoladki.koszt) - pudelka.cena) DESC;

# 2.
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
SELECT DISTINCT artykuly.idpudelka, (ilosc_zamowien.count * zysk.abs * artykuly.sztuk) AS zysk_pudelka FROM artykuly
	INNER JOIN zysk USING(idpudelka)
	INNER JOIN ilosc_zamowien USING(idpudelka)
ORDER BY zysk_pudelka DESC;

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