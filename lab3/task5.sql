# 1.
SELECT idklienta FROM klienci
EXCEPT
SELECT idklienta FROM zamowienia;

# 2. ?????
SELECT idzamowienia FROM artykuly
EXCEPT
SELECT idzamowienia FROM zamowienia;

# 3.
SELECT nazwa FROM czekoladki
WHERE nazwa ILIKE '%rz%'
UNION
SELECT nazwa FROM pudelka
WHERE nazwa ILIKE '%rz%'
UNION
SELECT nazwa FROM klienci
WHERE nazwa ILIKE '%rz%';

# 4.

