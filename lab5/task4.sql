# 1.
SELECT idczekoladki, COUNT(idpudelka) as w_ilu_pudelkach FROM zawartosc
GROUP BY idczekoladki
ORDER BY w_ilu_pudelkach DESC
LIMIT ;


# 2.
SELECT z.idpudelka, SUM(z.sztuk) FROM zawartosc z
WHERE z.idczekoladki IN (SELECT cz.idczekoladki FROM czekoladki cz WHERE cz.orzechy IS NULL)
GROUP BY z.idpudelka
ORDER BY SUM(z.sztuk) DESC;

# 3.
SELECT idczekoladki, COUNT(idpudelka) as w_ilu_pudelkach FROM zawartosc
GROUP BY idczekoladki
ORDER BY w_ilu_pudelkach ASC
LIMIT 1;

#4. 
SELECT a.idpudelka, SUM(a.sztuk) FROM artykuly a
GROUP BY a.idpudelka
ORDER BY SUM(a.sztuk) DESC
LIMIT 1;