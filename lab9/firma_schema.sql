BEGIN;

CREATE SCHEMA firma;
SET search_path TO firma;

CREATE TABLE firma.dzialy (
	iddzialu CHAR(5) PRIMARY KEY,
	nazwa VARCHAR(32) NOT NULL,
	lokalizacja VARCHAR(24) NOT NULL,
	kierownik INTEGER
);

CREATE TABLE firma.pracownicy (
	idpracownika INTEGER PRIMARY KEY,
	nazwisko VARCHAR(32) NOT NULL,
	imie VARCHAR(16) NOT NULL,
	dataUrodzenia DATE NOT NULL,
	dzial CHAR(5) NOT NULL,
	stanowisko VARCHAR(24),
	pobory NUMERIC(10, 2)
);

ALTER TABLE firma.dzialy 
	ADD CONSTRAINT kierownik_fkey FOREIGN KEY (kierownik)
	REFERENCES firma.pracownicy(idpracownika) ON UPDATE CASCADE DEFERRABLE;

ALTER TABLE firma.pracownicy 
	ADD CONSTRAINT dzial_fkey FOREIGN KEY (dzial)
	REFERENCES firma.dzialy(iddzialu) ON UPDATE CASCADE DEFERRABLE;


COMMIT;