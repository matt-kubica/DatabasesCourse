# 1.
SELECT SUM(pudelka.stan * zawartosc.sztuk * czekoladki.masa) AS overall_weight FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
;

WITH m AS (
	SELECT z.idpudelka, SUM(z.sztuk * cz.masa) AS masa_pudelka FROM zawartosc z
	INNER JOIN czekoladki cz USING(idczekoladki)
	GROUP BY z.idpudelka
)
SELECT SUM(p.stan * m.masa_pudelka) FROM pudelka p
INNER JOIN m USING(idpudelka);


# 2.
SELECT SUM(pudelka.stan * zawartosc.sztuk * czekoladki.koszt) AS overall_price FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
;