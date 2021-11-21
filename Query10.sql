DROP PROCEDURE IF EXISTS InserisciStrada;
DELIMITER $$
CREATE PROCEDURE InserisciStrada(IN _IDcomposizione INT, IN _CodiceTragittoAssociato INT(11),
								 IN _TipologiaStrada VARCHAR(15), IN _IDstrada INT(5),
								 IN _FasciaOrariaInizio TIME, IN _FasciaOrariaFine TIME, IN _Giorno DATE,
                                 IN _KmInizio DOUBLE(4,2), IN _KmFine DOUBLE(4,2))
BEGIN
INSERT INTO `Composizione`
VALUES (_IDcomposizione, _CodiceTragittoAssociato, _TipologiaStrada, _IDstrada, _FasciaOrariaInizio, _FasciaOrariaFine, _Giorno, _KmInizio, _KmFine);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS ControlloVariazione;
DELIMITER $$
CREATE TRIGGER ControlloVariazione

BEFORE INSERT ON `Composizione` FOR EACH ROW
BEGIN
IF(NEW.Tragitto NOT IN(
									SELECT CodiceTragitto
                                    FROM Tragitto
								  )
  ) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore! TragittoAssociato non presente nel database';
END IF;
IF(NEW.FasciaOrariaInizio > NEW.FasciaOrariaFine)
	THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore! Fascia oraria inizio maggiore di fascia oraria fine';
END IF;
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS AggiornaNumeroStrade;
DELIMITER $$
CREATE TRIGGER AggiornaNumeroStrade

AFTER INSERT ON `Composizione` FOR EACH ROW
BEGIN

	UPDATE `Tragitto`
	SET NumeroStrade = NumeroStrade + 1
	WHERE CodiceTragitto = NEW.Tragitto;

END $$
DELIMITER ;


SELECT CodiceTragitto,NumeroStrade
FROM Tragitto;

CALL InserisciStrada(NULL,1,'TipoD',01977,'16:31:00','16:34:30','2018-11-24',0.0,1.0);



