DROP PROCEDURE IF EXISTS InserisciStradaInNuovoTragitto;
DELIMITER $$
CREATE PROCEDURE InserisciStradaInNuovoTragitto(IN _IDcomposizioneVariazione INT, IN _TipologiaStrada VARCHAR(15), IN _IDnumericoStrada INT(5),
												IN _CodiceNuovoTragitto INT, IN _FasciaOrariaInizio TIME, IN _FasciaOrariaFine TIME, IN _Giorno DATE, 
                                                IN _KmInizioVariazione DOUBLE(4,2), IN _KmFineVariazione DOUBLE(4,2))
BEGIN
INSERT INTO `ComposizioneVariazione`
VALUES (_IDcomposizioneVariazione, _TipologiaStrada, _IDnumericoStrada, _CodiceNuovoTragitto, _FasciaOrariaInizio, _FasciaOrariaFine,
		_Giorno, _KmInizioVariazione, _KmFineVariazione);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS ControlloNuovoTragitto;
DELIMITER $$
CREATE TRIGGER ControlloNuovoTragitto

BEFORE INSERT ON `ComposizioneVariazione` FOR EACH ROW
BEGIN
IF (NEW.CodiceNuovoTragitto NOT IN (
							SELECT CodiceNuovoTragitto
							FROM NuovoTragitto
						   )
	) THEN 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Errore! NuovoTragitto non presente nel database';
END IF;
END $$
DELIMITER ;


CALL InserisciStradaInNuovoTragitto(NULL, 'TipoD', '01319',1, '17:03:01', '17:05:06', '2018-11-26', 0.0, 0.5);


