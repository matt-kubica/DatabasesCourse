INSERT INTO pudelka(idpudelka, nazwa, opis, cena, stan)
VALUES
(
	"raz",
	"Pierwszorzędne czekoladki",
	"Polecam, Adam Małysz",
	69,
	420
), (
	"dwa",
	"Drugorzędne czekoladki",
	"Poldecam, Mariusz Pudzianowski",
	420, 
	69
);

INSERT INTO zawartosc(idpudelka, idczekoladki, sztuk)
VALUES
(
	"raz",
	"b02",
	4
), (
	"raz",
	"m09",
	4
), (
	"raz",
	"b03",
	4
), (
	"raz",
	"b05",
	4
), (
	"dwa",
	"b02",
	4
), (
	"dwa",
	"m09",
	4
), (
	"dwa",
	"b03",
	4
), (
	"dwa",
	"b05",
	4
);