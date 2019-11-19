# 1.
INSERT INTO czekoladki(idczekoladki, nazwa, czekolada, orzechy, nadzienie, opis, koszt, masa)
VALUES('W98', 'Biały kieł', 'biała', 'laskowe', 'marcepan', 'Rozpływające się w rękach i kieszeniach', 45, 20);

# 2.
INSERT INTO klienci(idklienta, nazwa, ulica, miejscowosc, kod, telefon)
VALUES(90, 'Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-417', '031 423 45 38'),
	(91, 'Matusiak Alina', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'),
	(92, 'Kimono Franek', 'Karateków 8', 'Mistrz', '30-029', '501 498 324');

# 3.
INSERT INTO klienci(idklienta, nazwa, ulica, miejscowosc, kod, telefon)
VALUES(
	93, 
	'Matusiak Iza', 
	(SELECT ulica FROM klienci WHERE nazwa = 'Matusiak Edward'),
	(SELECT miejscowosc FROM klienci WHERE nazwa = 'Matusiak Edward'),
	(SELECT kod FROM klienci WHERE nazwa = 'Matusiak Edward'),
	(SELECT telefon FROM klienci WHERE nazwa = 'Matusiak Edward')
	);