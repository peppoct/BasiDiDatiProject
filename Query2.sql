DROP PROCEDURE IF EXISTS DisponibilitaAutovettura;
DELIMITER $$
CREATE PROCEDURE DisponibilitaAutovettura(IN _Targa VARCHAR(7))
BEGIN

SELECT F.Giorno, F.FasciaOrariaInizio, F.FasciaOrariaFine, P.CodFiscale, P.NomeUtenteProponente
FROM (Fruibilita F INNER JOIN Autovettura A on F.Targa=A.Targa)
	INNER JOIN Proponente P on P.NomeUtenteProponente=A.Proprietario
WHERE A.Targa=_Targa;
END$$
DELIMITER ;


call DisponibilitaAutovettura('CJ646LO')






