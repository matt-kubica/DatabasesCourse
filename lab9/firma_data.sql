BEGIN;

SET CONSTRAINTS kierownik_fkey DEFERRED;
INSERT INTO dzialy VALUES ('PH101','Handlowy','Marki',77);
INSERT INTO dzialy VALUES ('PR202','Projektowy','Olecko',27);
INSERT INTO dzialy VALUES ('PK101','Personalny','Niwka',72);


INSERT INTO pracownicy (idpracownika, nazwisko, imie, dataUrodzenia, dzial, stanowisko, pobory) VALUES
(27,'Kruk','Adam','15/12/1989','PK101','kierownik',2200.00),
(270,'Kowalik','Artur','13/12/1988','PK101','analityk',2400.00),
(72,'Kowalik','Adam','15/11/1989','PR202','kierownik',2600.00),
(720,'Kowalik','Amadeusz','17/12/1988','PK101','analityk',3200.00),
(707,'Kukulka','Antoni','15/12/1999','PH101','robotnik',1600.00),
(207,'Kowal','Alojzy','15/10/1998','PH101','robotnik',2000.00),
(77,'Kowalus','Adam','12/11/1998','PH101','kierownik',5400.00),
(1010,'Kawula','Alojzy','15/11/1998','PK101','robotnik',2500.00);

COMMIT;