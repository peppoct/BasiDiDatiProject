DROP PROCEDURE IF EXISTS InserisciVariazione;
DELIMITER $$
CREATE PROCEDURE InserisciVariazione(IN _CodiceVariazione INT, IN _Entita VARCHAR(15),
									 IN _TipologiaStradaUscita VARCHAR(15), IN _IDstradaUscita INT(5),
									 IN _KmUscita DOUBLE(4,2), IN _TipologiaStradaIngresso VARCHAR(15),
									 IN _IDstradaIngresso INT(5), IN _KmIngresso DOUBLE(4,2), IN _CodiceNuovoTragitto INT,
									 IN _CodiceTragittoAssociato INT, IN _CodicePrenotazionePool INT)
BEGIN
INSERT INTO `Variazione`
VALUES (_CodiceVariazione, _Entita, _TipologiaStradaUscita, _IDstradaUscita, _KmUscita, _TipologiaStradaIngresso,
		_IDstradaIngresso, _KmIngresso, _CodiceNuovoTragitto, _CodiceTragittoAssociato, _CodicePrenotazionePool);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS ControlloVariazione;
DELIMITER $$
CREATE TRIGGER ControlloVariazione

BEFORE INSERT ON `Variazione` FOR EACH ROW
BEGIN
IF(NEW.CodiceNuovoTragitto NOT IN(
									SELECT CodiceNuovoTragitto
                                    FROM NuovoTragitto
								  )
  ) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore! NuovoTragitto non presente nel database';
END IF;
IF(NEW.CodiceNuovoTragitto NOT IN(
									SELECT CodiceTragitto
                                    FROM Tragitto
								  )
  ) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore! TragittoAssociato non presente nel database';
END IF;
IF(NEW.CodiceNuovoTragitto NOT IN(
									SELECT CodicePrenotazionePool
                                    FROM PrenotazionePool
								  )
  ) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore! PrenotazionePool non presente nel database';
END IF;
END $$
DELIMITER ;

CALL InserisciVariazione(NULL, 'bassa','TipoD','01306',1.4,'TipoD','01306',1.5,1,1,1);