# 1.
SELECT idmeczu, 
	(gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) AS gospodarze, 
	(goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)) AS goscie
FROM statystyki;

# 2.
SELECT idmeczu, 
	(gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) AS gospodarze, 
	(goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)) AS goscie
FROM statystyki
	WHERE 
		array_length(gospodarze, 1) = 5 AND
		(gospodarze[5] > 15 OR goscie[5] > 15);

# 3.
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
	as punkty
from statystyki;

# 4.
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

# 5.
SELECT idmeczu, gospodarze[1] AS "pierwszy set", (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) AS "gospodarze punkty"
FROM statystyki
	WHERE sqrt(gospodarze[1]) < log(2, (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)));
	