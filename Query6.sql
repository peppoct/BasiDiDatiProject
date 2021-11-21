DROP PROCEDURE IF EXISTS Incroci;
DELIMITER $$
CREATE PROCEDURE Incroci(IN _Nome VARCHAR(45), IN _Tipologia VARCHAR(45))
 
BEGIN
CASE 
	WHEN _Tipologia = 'Comunale' THEN
			SELECT *
			FROM(
				 SELECT P.Km AS KmStradaInput, S.NomeComunale AS NomeStrada
			  	 FROM IncontroComunale P INNER JOIN IncontroComunale S ON P.Incrocio = S.Incrocio
				 WHERE _Nome = P.NomeComunale
				) AS T
			WHERE T.NomeStrada <> _Nome;
	WHEN _Tipologia = 'ExtraUrbanaSecondaria' THEN
			SELECT *
			FROM(
				 SELECT P.Km AS KmStradaInput, S.NomeSecondaria AS NomeStrada
			  	 FROM IncontroSecondaria P INNER JOIN IncontroSecondaria S ON P.Incrocio = S.Incrocio
				 WHERE _Nome = P.NomeSecondaria
				) AS T
			WHERE T.NomeStrada <> _Nome;
END CASE;
END $$
DELIMITER ;

CALL Incroci('Via Rindi','Comunale');


