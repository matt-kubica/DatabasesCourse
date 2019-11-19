# 1.
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki
WHERE masa BETWEEN 15 AND 24;

# 2.
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki
WHERE koszt BETWEEN 0.25 AND 0.35;

# 3.
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki
WHERE
	(koszt BETWEEN 0.15 AND 0.24) OR
	(masa BETWEEN 25 AND 35);