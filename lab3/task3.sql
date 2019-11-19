# 1.
SELECT miejscowosc FROM klienci
WHERE miejscowosc SIMILAR TO '%( |-)%';

# 2.
SELECT * FROM klienci
WHERE telefon SIMILAR TO '0% %';

# 3.
SELECT * FROM klienci
WHERE telefon NOT SIMILAR TO '0% %';