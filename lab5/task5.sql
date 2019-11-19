# 1.
SELECT COUNT(zamowienia.idzamowienia), DATE_PART('quarter', zamowienia.datarealizacji) AS quarter FROM zamowienia
GROUP BY DATE_PART('quarter', zamowienia.datarealizacji)
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 2.
SELECT COUNT(zamowienia.idzamowienia), DATE_PART('month', zamowienia.datarealizacji) AS month FROM zamowienia
GROUP BY DATE_PART('month', zamowienia.datarealizacji)
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 3.
SELECT COUNT(zamowienia.idzamowienia), DATE_PART('week', zamowienia.datarealizacji) AS week FROM zamowienia
GROUP BY DATE_PART('week', zamowienia.datarealizacji)
ORDER BY COUNT(zamowienia.idzamowienia) DESC;

# 4.
SELECT COUNT(zamowienia.idzamowienia), klienci.miejscowosc FROM zamowienia
	INNER JOIN klienci USING(idklienta)
GROUP BY klienci.miejscowosc
ORDER BY klienci.miejscowosc DESC;
