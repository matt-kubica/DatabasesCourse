# 1.
DELETE FROM klienci
WHERE nazwa LIKE 'Matusiak%';

# 2.
DELETE FROM klienci
WHERE idklienta > 91;

# 3.
DELETE FROM czekoladki
WHERE koszt >= 0.45 OR masa >= 36 or masa = 0;