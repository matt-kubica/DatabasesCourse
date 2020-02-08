-- 1.
SELECT 
	p.nazwisko, 
	DATE_PART('year', NOW()) - DATE_PART('year', p.dataUrodzenia) AS wiek, 
	12*p.pobory AS roczne_pobory 
FROM pracownicy p
ORDER BY roczne_pobory, nazwisko;

-- 2.
SELECT nazwisko, imie, dataUrodzenia, stanowisko, dzial, pobory FROM pracownicy
WHERE stanowisko IN ('robotnik', 'analityk') AND pobory > 2000;

-- 3.
SELECT imie, nazwisko FROM pracownicy 
	WHERE pobory > (SELECT pobory FROM pracownicy WHERE imie = 'Adam' AND nazwisko = 'Kowalik');

-- 4.
UPDATE pracownicy
SET pobory = pobory * 1.1
WHERE stanowisko = 'robotnik';

-- 5.
SELECT stanowisko, COUNT(nazwisko), AVG(pobory) FROM pracownicy
WHERE stanowisko != 'kierownik'
GROUP BY stanowisko;
