# 1.
SELECT DISTINCT nazwa, ulica, miejscowosc FROM klienci NATURAL JOIN zamowienia
WHERE datarealizacji > current_date - interval '7 years'
ORDER BY nazwa;

# 2.
SELECT DISTINCT klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci 
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia) 
	INNER JOIN pudelka USING(idpudelka)
WHERE pudelka.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna')
ORDER BY klienci.nazwa;

# 3.
SELECT DISTINCT klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci 
	INNER JOIN zamowienia USING(idklienta)
ORDER BY klienci.nazwa;

# 4. ????
SELECT klienci.idklienta, klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci
	LEFT JOIN zamowienia USING(idklienta)
WHERE zamowienia.idzamowienia IS NULL;

# 5.
SELECT DISTINCT klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci
	INNER JOIN zamowienia USING(idklienta)
WHERE DATE_PART('year', zamowienia.datarealizacji) = 2013 AND DATE_PART('month', zamowienia.datarealizacji) = 11
ORDER BY klienci.nazwa;

# 6.
SELECT DISTINCT klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN pudelka USING(idpudelka)
WHERE artykuly.sztuk >= 2 AND pudelka.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna')
ORDER BY klienci.nazwa;

# 7.
SELECT DISTINCT klienci.nazwa, klienci.ulica, klienci.miejscowosc FROM klienci
	INNER JOIN zamowienia USING(idklienta)
	INNER JOIN artykuly USING(idzamowienia)
	INNER JOIN pudelka USING(idpudelka)
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE czekoladki.orzechy IN ('migdały')
ORDER BY klienci.nazwa;