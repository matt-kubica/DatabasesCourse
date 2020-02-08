CREATE OR REPLACE FUNCTION wartoscZamowienZamowienia(IN id VARCHAR(10))
RETURNS NUMERIC(10,2) AS
$$
DECLARE wynik NUMERIC(10,2);

BEGIN
	SELECT SUM(cena) INTO wynik FROM zamowienia WHERE idklienta = id;
	RETURN wynik;
END;
$$ LANGUAGE PLpgSQL;


CREATE OR REPLACE FUNCTION wartoscZamowienHistoria(IN id VARCHAR(10))
RETURNS NUMERIC(10,2) AS
$$
DECLARE wynik NUMERIC(10,2);

BEGIN
	SELECT SUM(cena) INTO wynik FROM historia WHERE idklienta = id;
	RETURN wynik;
END;
$$ LANGUAGE PLpgSQL;


CREATE OR REPLACE FUNCTION rabat(IN id VARCHAR(10))
RETURNS INTEGER AS
$$
DECLARE wartoscZamowien NUMERIC(10,2);
DECLARE wynik INTEGER;

BEGIN
	wartoscZamowien := wartoscZamowienZamowienia(id) + wartoscZamowienHistoria(id);
	
	IF wartoscZamowien BETWEEN 1 AND 100 THEN
		wynik := 5;
	ELSIF wartoscZamowien BETWEEN 101 AND 400 THEN
		wynik := 10;
	ELSIF wartoscZamowien BETWEEN 401 AND 700 THEN
		wynik := 15;
	ELSIF wartoscZamowien > 700 THEN
		wynik := 20;
	END IF;

	RETURN wynik;
END;
$$ LANGUAGE PLpgSQL;