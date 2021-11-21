DROP PROCEDURE IF EXISTS RecensioniPubblicate;
DELIMITER $$
CREATE PROCEDURE RecensioniPubblicate(IN _Mese INT, IN _Anno INT)
BEGIN

SELECT CodFiscale
FROM ( 
		SELECT COUNT(*) AS Y, U.CodFiscale
        FROM Utente AS U INNER JOIN Proponente AS P ON U.CodFiscale = P.CodFiscale
					     INNER JOIN Fruitore AS F ON U.CodFiscale = P.CodFiscale
					     INNER JOIN Recensione AS R ON (R.NomeUtenteProponente = P.NomeUtenteProponente 
														AND R.NomeUtenteFruitore = F.NomeUtenteFruitore)
		WHERE MONTH(R.DataRecensione) = _Mese AND YEAR(R.DataRecensione) = _Anno
        GROUP BY U.CodFiscale
	 ) AS T
WHERE T.Y >= ALL (
					SELECT COUNT(*)
                    FROM Utente AS U INNER JOIN Proponente AS P ON U.CodFiscale = P.CodFiscale
								     INNER JOIN Fruitore AS F ON U.CodFiscale = P.CodFiscale
								     INNER JOIN Recensione AS R ON (R.NomeUtenteProponente = P.NomeUtenteProponente 
																	AND R.NomeUtenteFruitore = F.NomeUtenteFruitore)
					WHERE MONTH(R.DataRecensione) = _Mese AND YEAR(R.DataRecensione) = _Anno
					GROUP BY U.CodFiscale
				 );
END $$
DELIMITER ;

CALL RecensioniPubblicate(12,2018);




