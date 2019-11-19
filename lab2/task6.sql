# 1.
SELECT idczekoladki, nazwa, koszt, masa FROM czekoladki
WHERE 
	(masa BETWEEN 15 AND 24) OR (koszt BETWEEN 0.15 AND 0.24);

# 2.
SELECT idczekoladki, nazwa, koszt, masa FROM czekoladki
WHERE 
	((masa BETWEEN 15 AND 24) AND (koszt BETWEEN 0.15 AND 0.24)) OR
	((masa BETWEEN 25 AND 35) AND (koszt BETWEEN 0.25 AND 0.35));

# 3.
SELECT idczekoladki, nazwa, koszt, masa FROM czekoladki
WHERE 
	(masa BETWEEN 15 AND 24) AND (koszt BETWEEN 0.15 AND 0.24);

# 4.
SELECT idczekoladki, nazwa, koszt, masa FROM czekoladki
WHERE 
	(masa BETWEEN 25 AND 35) AND (koszt NOT BETWEEN 0.25 AND 0.35);

# 5.
SELECT idczekoladki, nazwa, koszt, masa FROM czekoladki
WHERE 
	(masa BETWEEN 25 AND 35) AND (koszt NOT BETWEEN 0.25 AND 0.35) AND (koszt NOT BETWEEN 0.15 AND 0.24);