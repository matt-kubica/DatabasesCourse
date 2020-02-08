-- 1.
WITH query AS (
	SELECT idpudelka, SUM(sztuk) AS liczba_czekoladek_w_pudelku FROM zawartosc
	GROUP BY idpudelka
)
SELECT p.nazwa, q.liczba_czekoladek_w_pudelku FROM pudelka p
	INNER JOIN query q USING(idpudelka)
WHERE liczba_czekoladek_w_pudelku >= ALL (SELECT liczba_czekoladek_w_pudelku FROM query);


-- 2.
WITH query AS (
	SELECT idpudelka, SUM(sztuk) AS liczba_czekoladek_w_pudelku FROM zawartosc
	GROUP BY idpudelka
)
SELECT p.nazwa, q.liczba_czekoladek_w_pudelku FROM pudelka p
	INNER JOIN query q USING(idpudelka)
WHERE liczba_czekoladek_w_pudelku <= ALL (SELECT liczba_czekoladek_w_pudelku FROM query);


-- 3.
WITH query AS (
	SELECT idpudelka, SUM(sztuk) AS liczba_czekoladek_w_pudelku FROM zawartosc
	GROUP BY idpudelka
)
SELECT p.nazwa, q.liczba_czekoladek_w_pudelku FROM pudelka p
	INNER JOIN query q USING(idpudelka)
WHERE liczba_czekoladek_w_pudelku > ALL (SELECT AVG(liczba_czekoladek_w_pudelku) FROM query);


-- 4.
WITH query AS (
	SELECT idpudelka, SUM(sztuk) AS liczba_czekoladek_w_pudelku FROM zawartosc
	GROUP BY idpudelka
)
SELECT p.nazwa, q.liczba_czekoladek_w_pudelku FROM pudelka p
	INNER JOIN query q USING(idpudelka)
WHERE 
	liczba_czekoladek_w_pudelku <= ALL (SELECT liczba_czekoladek_w_pudelku FROM query) OR
	liczba_czekoladek_w_pudelku >= ALL (SELECT liczba_czekoladek_w_pudelku FROM query);