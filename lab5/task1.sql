# 1.
SELECT COUNT(*) FROM czekoladki;

# 2.
SELECT COUNT(*) FROM czekoladki 
WHERE nadzienie IS NOT NULL;

SELECT COUNT(nadzienie) FROM czekoladki;

# 3.
SELECT pudelka.nazwa, zawartosc.sztuk  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka)
ORDER BY zawartosc.sztuk DESC
LIMIT 1;

# 4.
SELECT DISTINCT pudelka.nazwa, zawartosc.sztuk  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka)
ORDER BY zawartosc.sztuk DESC;

# 5.
SELECT DISTINCT pudelka.nazwa, zawartosc.sztuk  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.orzechy IS NULL
ORDER BY zawartosc.sztuk DESC;

# 6.
SELECT DISTINCT pudelka.nazwa, zawartosc.sztuk  FROM zawartosc
	INNER JOIN pudelka USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.czekolada IN ('mleczna')
ORDER BY zawartosc.sztuk DESC;