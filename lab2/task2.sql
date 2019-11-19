# 1.
SELECT nazwa, masa FROM czekoladki
WHERE masa > 20;

# 2.
SELECT nazwa, masa, koszt FROM czekoladki
WHERE masa > 20 AND koszt > 0.25;

# 3.
SELECT nazwa, masa, koszt * 100 AS "koszt [gr]" FROM czekoladki
WHERE masa > 20 AND koszt > 0.25

# 4.
SELECT nazwa, czekolada, nadzienie, orzechy FROM czekoladki
WHERE 
	(czekolada = 'mleczna' AND nadzienie = 'maliny') OR
	(czekolada = 'mleczna' AND nadzienie = 'truskawki') OR
	(czekolada != 'gorzka' AND orzechy = 'laskowe');

# 5.
SELECT nazwa, koszt FROM czekoladki
WHERE koszt > 0.25

# 6.
SELECT nazwa, czekolada FROM czekoladki
WHERE czekolada IN ('biała', 'mleczna');