# 1.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NOT NULL

# 2.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NULL;

# 3.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE orzechy IS NOT NULL OR nadzienie IS NOT NULL;

# 4.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada IN ('biała', 'mleczna') AND orzechy IS NULL;

# 5.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada NOT IN ('biała', 'mleczna') AND orzechy IS NOT NULL OR nadzienie IS NOT NULL;

# 6. 
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NOT NULL;

# 7. 
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NULL;

# 8.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE nadzienie IS NULL AND orzechy IS NULL

# 9.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki
WHERE czekolada IN ('mleczna', 'biała') AND nadzienie IS NULL
