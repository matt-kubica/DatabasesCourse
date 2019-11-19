# 1.
SELECT datarealizacji, COUNT(idzamowienia) FROM zamowienia
GROUP BY datarealizacji
ORDER BY datarealizacji;

# 2.
SELECT COUNT(*) FROM zamowienia;

# 3.
SELECT SUM(artykuly.sztuk * pudelka.cena) FROM zamowienia
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN pudelka USING(idpudelka);

# 4.
SELECT klienci.nazwa, COUNT(zamowienia.idzamowienia), SUM(pudelka.cena * artykuly.sztuk) FROM klienci
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN pudelka USING(idpudelka)
GROUP BY klienci.nazwa
ORDER BY COUNT(zamowienia.idzamowienia) DESC;