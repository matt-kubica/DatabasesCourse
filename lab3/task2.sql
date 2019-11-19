# 1.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S%';

# 2.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S%i';

# 3.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S% %m%';

# 4.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa SIMILAR TO '(A|B|C)%';

# 5.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa ILIKE '%orzech%';

# 6.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa LIKE 'S%m%';

# 7.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa SIMILAR TO '(%maliny%|%truskawki%)';

# 8.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa NOT SIMILAR TO '(D|E|F|G|H|I|J|K|S|T)%';

# 9.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa SIMILAR TO 'Słod%'

# 10.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nazwa NOT SIMILAR TO '% %';