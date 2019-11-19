# 1.
SELECT * FROM zamowienia
WHERE datarealizacji BETWEEN '2013-11-12' AND '2013-11-20';

# 2.
SELECT * FROM zamowienia
WHERE 
	datarealizacji BETWEEN '2013-12-01' AND '2013-12-06' OR
	datarealizacji BETWEEN '2013-12-15' AND '2013-12-20';

# 3.
SELECT * FROM zamowienia
WHERE datarealizacji BETWEEN '2013-12-01' AND '2013-12-31'
ORDER BY datarealizacji ASC;

# 4.
SELECT * FROM zamowienia
WHERE date_part('year', datarealizacji) = 2013;

# 5.
SELECT * FROM zamowienia
WHERE date_part('day', datarealizacji) IN (17, 18, 19);

# 6.
SELECT * FROM zamowienia
WHERE floor(extract(DOY FROM datarealizacji) / 7) = 47 OR floor(extract(DOY FROM datarealizacji) / 7) = 46;