DROP PROCEDURE IF EXISTS StampaProponenti;
DELIMITER $$
CREATE PROCEDURE StampaProponenti()

BEGIN
SELECT CodFiscale, NomeUtenteProponente, RecensioniRicevute
FROM Proponente
ORDER BY RecensioniRicevute;

END $$
DELIMITER ;

CALL StampaProponenti()
                          
                     
                     
                          
                          