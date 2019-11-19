# 1.
SELECT nazwa, ulica, miejscowosc FROM klienci
ORDER BY nazwa ASC;

# 2.
SELECT * FROM klienci
ORDER BY miejscowosc, nazwa;

# 3.
SELECT * FROM klienci
WHERE miejscowosc = 'Kraków' OR miejscowosc = 'Warszawa'
ORDER BY miejscowosc DESC, nazwa ASC;

SELECT * FROM klienci
WHERE miejscowosc IN ('Kraków', 'Warszawa')
ORDER BY miejscowosc DESC, nazwa ASC;

# 4.
SELECT * FROM klienci
ORDER BY miejscowosc DESC;

# 5.
SELECT * FROM klienci
WHERE miejscowosc = 'Kraków'
ORDER BY nazwa;


