# 1.
SELECT pudelka.nazwa, pudelka.opis, czekoladki.nazwa, czekoladki.opis FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki);

# 2.
SELECT pudelka.nazwa, pudelka.opis, czekoladki.nazwa, czekoladki.opis FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE pudelka.idpudelka = 'heav';

# 3.
SELECT pudelka.nazwa, pudelka.opis, czekoladki.nazwa, czekoladki.opis FROM pudelka
	INNER JOIN zawartosc USING(idpudelka)
	INNER JOIN czekoladki USING(idczekoladki)
WHERE pudelka.nazwa LIKE '%Kolekcja%';