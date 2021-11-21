DROP TRIGGER IF EXISTS CheckUtente;
DELIMITER $$
CREATE TRIGGER CheckUtente

BEFORE INSERT ON `Recensione` FOR EACH ROW
BEGIN
IF (NEW.NomeUtenteProponente = NEW.NomeUtenteFruitore) THEN 

	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = ' Errore! I due utenti non possono coincidere.';
END IF;	
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS InserisciRecensione;
DELIMITER $$
CREATE PROCEDURE InserisciRecensione (IN _NomeUtenteProponente VARCHAR(45), IN _NomeUtenteFruitore VARCHAR(45),
									  IN _CodValutazione INT(5), IN _Ruolo VARCHAR(10), IN _Testo VARCHAR(500), IN _Stelle INT(1), IN _DataRecensione DATE)
BEGIN
INSERT INTO `Recensione`
VALUES ( _NomeUtenteProponente, _NomeUtenteFruitore, _CodValutazione, _Ruolo, _Testo, _Stelle, _DataRecensione);
END $$
DELIMITER ;



DROP TRIGGER IF EXISTS AggiornaRecensioniRicevute;
DELIMITER $$
CREATE TRIGGER AggiornaRecensioniRicevute

AFTER INSERT ON `Recensione` FOR EACH ROW
BEGIN
IF (new.Ruolo = 'Fruitore') THEN

	UPDATE `Proponente`
	SET RecensioniRicevute = RecensioniRicevute + 1
	WHERE NomeUtenteProponente = NEW.NomeUtenteProponente;
END IF;
END $$
DELIMITER ;

CALL InserisciRecensione('PeppoCT','SteFre',NULL,'Fruitore','Servizio pessimo, a mai piu.',1, current_date());
                          
                          
                          
                          
                          
                          
