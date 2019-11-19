# 1.
SELECT idzamowienia, datarealizacji FROM zamowienia NATURAL JOIN klienci
WHERE nazwa LIKE '%Antoni';

# 2.
SELECT idzamowienia, datarealizacji FROM zamowienia NATURAL JOIN klienci
WHERE ulica LIKE '%/%';

# 3.
SELECT idzamowienia, datarealizacji FROM zamowienia NATURAL JOIN klienci
WHERE miejscowosc = 'Kraków' AND DATE_PART('year', datarealizacji) = 2013 AND DATE_PART('month', datarealizacji) = 11;