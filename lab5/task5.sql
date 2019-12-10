# 1.
SELECT COUNT(zamowienia.idzamowienia), 
		DATE_PART('quarter', zamowienia.datarealizacji) AS quarter,
		DATE_PART('year', zamowienia.datarealizacji) AS year
FROM zamowienia
GROUP BY quarter, year
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 2.
SELECT COUNT(zamowienia.idzamowienia), 
		DATE_PART('month', zamowienia.datarealizacji) AS month,
		DATE_PART('year', zamowienia.datarealizacji) AS year
FROM zamowienia
GROUP BY month, year
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 3.
SELECT COUNT(zamowienia.idzamowienia), 
		DATE_PART('week', zamowienia.datarealizacji) AS week,
		DATE_PART('year', zamowienia.datarealizacji) AS year
FROM zamowienia
GROUP BY week, year
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 4.
SELECT COUNT(zamowienia.idzamowienia), klienci.miejscowosc FROM zamowienia
	INNER JOIN klienci USING(idklienta)
GROUP BY klienci.miejscowosc
ORDER BY klienci.miejscowosc DESC;
