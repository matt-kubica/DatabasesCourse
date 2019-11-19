\H
SET search_path TO siatkowka;

select idmeczu, gospodarze, goscie, 
	(case when (gospodarze[1] > goscie[1]) then 1 else 0 end +
	case when (gospodarze[2] > goscie[2]) then 1 else 0 end +
	case when (gospodarze[3] > goscie[3]) then 1 else 0 end +
	case when (gospodarze[4] > goscie[4]) then 1 else 0 end +
	case when (gospodarze[5] > goscie[5]) then 1 else 0 end)
		|| ':' ||
	(case when (gospodarze[1] < goscie[1]) then 1 else 0 end +
	case when (gospodarze[2] < goscie[2]) then 1 else 0 end +
	case when (gospodarze[3] < goscie[3]) then 1 else 0 end +
	case when (gospodarze[4] < goscie[4]) then 1 else 0 end +
	case when (gospodarze[5] < goscie[5]) then 1 else 0 end)
	as punkty,
	(goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)) AS goscie
from statystyki
	where 
		(gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) > 100;