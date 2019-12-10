BEGIN;

SET search_path TO kwiaciarnia;

CREATE TABLE kwiaciarnia.klienci (
	idklienta varchar(10) PRIMARY KEY,
	haslo varchar(10) NOT NULL CHECK(length(haslo) >= 4),
	nazwa varchar(40) NOT NULL,
	miasto varchar(40) NOT NULL,
	kod char(6) NOT NULL,
	adres varchar(40) NOT NULL,
	email varchar(40),
	telefon varchar(16) NOT NULL,
	fax varchar(16),
	nip char(13),
	regon char(9)
);


CREATE TABLE kwiaciarnia.kompozycje (
	idkompozycji char(5) PRIMARY KEY,
	nazwa varchar(40) NOT NULL,
	opis varchar(100),
	cena numeric(6, 2) CHECK(cena >= 40),
	minimum integer,
	stan integer
);


CREATE TABLE kwiaciarnia.odbiorcy (
	idodbiorcy serial PRIMARY KEY,
	nazwa varchar(40) NOT NULL,
	miasto varchar(40) NOT NULL,
	kod char(6) NOT NULL,
	adres varchar(40) NOT NULL
);


CREATE TABLE kwiaciarnia.zamowienia (
	idzamowienia integer PRIMARY KEY,
	idklienta varchar(10) NOT NULL,
	idodbiorcy integer NOT NULL,
	idkompozycji char(5) NOT NULL,
	termin date NOT NULL,
	cena numeric(6, 2),
	zaplacone boolean,
	uwagi varchar(200)
);

CREATE TABLE kwiaciarnia.zapotrzebowanie (
	idkompozycji char(5) PRIMARY KEY,
	data date
);

CREATE TABLE kwiaciarnia.historia (
	idzamowienia integer PRIMARY KEY,
	idklienta varchar(10),
	idkompozycji char(5),
	cena numeric(6, 2),
	termin date
);


ALTER TABLE kwiaciarnia.zamowienia
	ADD CONSTRAINT zamowienia_idklienta_fkey 
	FOREIGN KEY (idklienta) REFERENCES kwiaciarnia.klienci(idklienta);

ALTER TABLE kwiaciarnia.zamowienia
	ADD CONSTRAINT zamowienia_idodbiorcy_fkey 
	FOREIGN KEY (idodbiorcy) REFERENCES kwiaciarnia.odbiorcy(idodbiorcy);

ALTER TABLE kwiaciarnia.zamowienia
	ADD CONSTRAINT zamowienia_idkompozycji_fkey 
	FOREIGN KEY (idkompozycji) REFERENCES kwiaciarnia.kompozycje(idkompozycji);

ALTER TABLE kwiaciarnia.zapotrzebowanie
	ADD CONSTRAINT zamowienia_idkompozycji_fkey 
	FOREIGN KEY (idkompozycji) REFERENCES kwiaciarnia.kompozycje(idkompozycji);



COMMIT;
