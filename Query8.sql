DROP PROCEDURE IF EXISTS EliminazioneUtentiInattivi;
DELIMITER $$
CREATE PROCEDURE EliminazioneUtentiInattivi()
BEGIN 

DELETE 
FROM Proponente 
WHERE NomeUtenteProponente NOT IN 
									(SELECT A.Proponente 
									 FROM 
										(SELECT PO.Proponente , P.DataInizioNoleggio, P.DataFineNoleggio, P.CodicePrenotazioneNoleggio 
										 FROM Autovettura A INNER JOIN PrenotazioneNoleggio P ON A.Targa=P.Autovettura
															INNER JOIN Pool PO ON PO.Proponente=A.Proprietario
										 WHERE `DataInizioNoleggio` > DATE_SUB(current_date(), INTERVAL 12 month) ) A 
                                         
                                         INNER JOIN 
																			
										 (SELECT Proponente, CodicePool, GiornoPartenza
										  FROM Pool 
										  WHERE `GiornoPartenza` > DATE_SUB(current_date(), INTERVAL 12 month) ) B on A.Proponente=B.Proponente);
END $$
DELIMITER ;
                                          
                                          
call EliminazioneUtentiInattivi();

