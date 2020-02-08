-- 1.
SELECT z.datarealizacji, z.idzamowienia FROM zamowienia z
WHERE z.idklienta IN (SELECT idklienta FROM klienci WHERE nazwa LIKE '%Antoni');

-- 2.
SELECT z.datarealizacji, z.idzamowienia FROM zamowienia z
WHERE z.idklienta IN (SELECT idklienta FROM klienci WHERE ulica LIKE '%/%');

-- 3.
SELECT z.datarealizacji, z.idzamowienia FROM zamowienia z
	WHERE z.idklienta IN (SELECT idklienta FROM klienci WHERE miejscowosc = 'Kraków') AND 
	DATE_PART('month', z.datarealizacji) = 11;