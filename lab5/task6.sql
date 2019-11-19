# 1.
SELECT SUM(pudelka.stan * zawartosc.sztuk * czekoladki.masa) AS overall_weight FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
;

# 2.
SELECT SUM(pudelka.stan * zawartosc.sztuk * czekoladki.koszt) AS overall_price FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
;