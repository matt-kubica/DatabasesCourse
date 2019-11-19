# 1.
UPDATE klienci
SET nazwa = 'Nowak Iza'
WHERE nazwa = 'Matusiak Iza';

# 2.
UPDATE czekoladki
SET koszt = koszt * 1.1
WHERE idczekoladki IN ('W98', 'M98', 'X91');

# 3.
UPDATE czekoladki
SET koszt = (SELECT koszt FROM czekoladki WHERE idczekoladki = 'W98')
WHERE nazwa = 'Nieznana Nieznana';

# 4.
UPDATE klienci
SET miejscowosc = 'Piotrograd'
WHERE miejscowosc = 'Leningrad';

# 5.
UPDATE czekoladki
SET koszt = koszt + 0.15
WHERE substr(czekoladki.idczekoladki, 2, 2)::int > 90;