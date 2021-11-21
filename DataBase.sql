-- -------------------------------------------
-- Creazione del database 'ServizioDiMobilita'
-- -------------------------------------------
SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;


DROP DATABASE IF EXISTS `ServizioDiMobilita`;
CREATE DATABASE `ServizioDiMobilita`;

USE `ServizioDiMobilita`;

-- ----------------------------
-- Table structure for 'UTENTE'
-- ----------------------------
DROP TABLE IF EXISTS `UTENTE`; 
CREATE TABLE `UTENTE` (
  `CodFiscale` VARCHAR(16) NOT NULL, 
  `Nome` VARCHAR(45) NOT NULL,
  `Cognome` VARCHAR(45) NOT NULL,
  `Ruolo` VARCHAR(45) NOT NULL, 
  `NumTelefono` VARCHAR(10) NOT NULL,
  `Citta`VARCHAR(45) NOT NULL,
  `Via` VARCHAR(100) NOT NULL,
  `Civico` VARCHAR(4) NOT NULL,
  `CAP` VARCHAR(5) NOT NULL,
  `DataIscrizione` DATE NOT NULL,
  `Stato` BOOL NOT NULL,
  PRIMARY KEY (`CodFiscale`),
  CHECK (DataIscrizione<CURRENT_DATE()) 
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `UTENTE` VALUES
('CNCGPP96L31L738B','Giuseppe','Cancello Tortora','Proponente/Fruitore','3881188219','Venosa','Via Berta','15','85029','2017-08-31', 1),
('LGNNDR97L17A952S','Andrea','Lagna','Proponente/Fruitore','3921061204','Capannori','Via Corte Pellegrini','32','55012','2017-09-21', 1),
('RGNLCU69H53L738B','Lucia','Argenti','Proponente/Fruitore','3881186064','Venosa','Via Berta','15','85029','2016-04-15', 1),
-- ('MRNTZN80A01E715J','Tiziano', 'Mariani', '3978465236', 'Pisa','Via Di Gello','106','56123','2018-02-26', 1),
('CRCGAI93E71G491C','Gaia', 'Cerchai', 'Fruitore','3694565147', 'Lucca','Via Fillungo','15','55100','2015-07-19', 1),
('PLNCST66S01G702Y','Cristian', 'Paolinelli','Fruitore','3692586147','Cascina','Via Roma','15','56021','2018-09-17', 1),
('MNFNCL72M12E715V','Nicola', 'Manfredi','Fruitore','3654521459','Pisa','Via Lucchese','5','56100','2014-12-12', 1),
('BNGSFN70M56I726M','Stefania', 'Benigni','Proponente','3658445159','Pisa','Via Bovio','52','56100','2016-01-18', 1),
('FRDSFN59H14F205X','Stefano','Frediani','Proponente', '3584560426','Pisa','Via Pratale','185','56100','2018-10-12', 1),
('SLLFNC78S15H501V','Francesco', 'Sillabi','Proponente/Fruitore', '3678595249','Pisa','Via Cagliari','87','56100','2017-01-27', 1),
-- ('MRCRCC88R42A657R','Rebecca','Marchi','3874564102','Pisa','Via Betti','74','56100','2015-05-22', 1),
-- ('BRRMRA50E01G491N','Mario', 'Berrettini','3654186644','Pisa','Via Croce','26','56123','2018-06-02', 0),
('SSIDVD73M18D612R','Davide', 'Sisi','Proponente','3654521649','Pisa','Via Cattaneo','99','56123','2017-03-19', 1);
/*
('BRTMRC93T16G702F','Marco', 'Bertini', 'M', 'Provincia', '1993-12-16'),
('BCCGLC74R13E715N','Gianluca', 'Bacchi', 'M', 'Comune', '1974-10-13'),
('BRTCPI72L19D612J','Iacopo', 'Barti', 'M', 'Comune', '1972-07-19'),
('SLVCHR96C50E715M','Chiara', 'Salvetti', 'F', 'Questura', '1996-03-10' ),
('BRTSRN90T55G713Y','Sabrina', 'Berti', 'F', 'Comune', '1990-12-15'),
('FLPFBA69A30G702L','Fabio', 'Filippetti', 'M', 'Comune', '1969-01-30'),
('FRNFPP72S28G702X','Filippo', 'Franchi', 'M', 'Questura', '1972-11-28'),
('LCCDNL82E31D612Y','Daniele','Lucchesi','M','Provincia', '1982-05-15'),
('GNNLNE90T60D612T','Elena', 'Agnanti', 'F', 'Comune', '1990-12-20'),
('SRTNDR75S19A657R','Andrea', 'Sarti', 'M', 'Comune', '1975-11-19'),
('PTRVSC86C68G702S','Vasco', 'Petroni', 'M', 'Questura', '1986-03-28'),
('GNDRNN56R69G7130','Arianna', 'Gandoli', 'F', 'Questura', '1997-09-04'),
('GMBCLD00R15I726X','Claudio', 'Gambogi', 'M', 'Comune', '2000-10-15'),
('BSTCRL95T65E715R','Carla', 'Bastiani', 'F', 'Provincia', '1995-12-25'),
('MRCZGR95D27A285T','Marco', 'Zingaro', 'M', 'Questura', '1995-04-27');
*/
COMMIT;

-- ------------------------------
-- Table structure for 'FRUITORE'
-- ------------------------------
DROP TABLE IF EXISTS `FRUITORE`; 
CREATE TABLE `FRUITORE` (
  `NomeUtenteFruitore` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `DomandaRiserva` VARCHAR(100) NOT NULL,
  `RispostaRiserva` VARCHAR(100) NOT NULL,
  `Stato` BOOL NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`NomeUtenteFruitore`),
  FOREIGN KEY (`CodFiscale`) REFERENCES `Utente`(`CodFiscale`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `FRUITORE` VALUES
('PeppoCT','Peppe1996','Quanti fratelli?','2', 1,'CNCGPP96L31L738B'),
('MarcoMattei','Alice','Quale sport pratichi?','Calcio', 1,'LGNNDR97L17T698P'),
('Lucy','cargiuros','Quanti figli?','3', 1,'RGNLCU69H53L738B'),
('GaiaCer','Gaia222','Nome del padre?','Luca', 1,'CRCGAI93E71G491C'),
('PaoCri','Nelli123','Nome del cane?','Teddy', 1,'PLNCST66S01G702Y'),
('Nicredi','Nic72','Squadra preferita?','Juventus', 1,'MNFNCL72M12E715V'),
('SteFre','Lucca','Marca del cellulare?','Apple', 1,'FRDSFN59H14F205X');
COMMIT;

-- --------------------------------
-- Table structure for 'PROPONENTE'
-- --------------------------------
DROP TABLE IF EXISTS `PROPONENTE`; 
CREATE TABLE `PROPONENTE` (
  `NomeUtenteProponente` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `DomandaRiserva` VARCHAR(100) NOT NULL,
  `RispostaRiserva` VARCHAR(100) NOT NULL,
  `Stato` BOOL NOT NULL,
  `RecensioniRicevute` INT(3) NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`NomeUtenteProponente`),
  FOREIGN KEY(`CodFiscale`) REFERENCES `Utente`(`CodFiscale`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `PROPONENTE` VALUES
('Beniste','Stefi70','Colore preferito?','Rosso', 1, 6,'BNGSFN70M56I726M'),
('PaoCri','Fifa09','Animale preferito?','Cane', 1, 8,'PLNCST66S01G702Y'),
('PeppoCT','Peppe1996','Quanti fratelli?','2', 1, 7,'CNCGPP96L31L738B'),
('MarcoMattei','Alice','Quale sport pratichi?','Calcio', 1, 9,'LGNNDR97L17A952S'),
('Lucy','cargiuros','Quanti figli?','3', 1, 3,'RGNLCU69H53L738B'),
('Sillabus','Sill78','Nome madre?','Sara', 1, 7,'SLLFNC78S15H501V'),
('SisiDavi','Pass123','Quale sport segui?','Hockey', 0, 0,'SSIDVD73M18D612R'),
('SteFre','Lucca','Marca del cellulare?','Apple', 1, 2,'FRDSFN59H14F205X');
COMMIT;

-- --------------------------------
-- Table structure for 'RECENSIONE'
-- --------------------------------
DROP TABLE IF EXISTS `RECENSIONE`; 
CREATE TABLE `RECENSIONE` (
  `NomeUtenteProponente` VARCHAR(45) NOT NULL,
  `NomeUtenteFruitore` VARCHAR(45) NOT NULL,
  `CodValutazione` INT NOT NULL AUTO_INCREMENT,
  `Ruolo` VARCHAR(10) NOT NULL,
  `Testo` VARCHAR(500) NOT NULL,
  `Stelle` INT(1) NOT NULL,
  `DataRecensione` DATE NOT NULL,
  PRIMARY KEY (`CodValutazione`),
  FOREIGN KEY(`NomeUtenteProponente`) REFERENCES `Proponente`(`NomeUtenteProponente`),
  FOREIGN KEY(`NomeUtenteFruitore`) REFERENCES `Fruitore`(`NomeUtenteFruitore`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `RECENSIONE` VALUES
('Beniste','MarcoMattei',NULL,'Fruitore', 'Il giorno 22/11/2018 ho utilizzato il servizio di car pooling e mi sono trovata benissimo. Complimenti!', 5, '2018-02-17'),
('MarcoMattei','Beniste',NULL,'Proponente', 'Complimenti alla signora Benigni per la correttezza.', 5, '2018-10-12'),
('PaoCri','Sill78',NULL,'Fruitore', 'Il proponente e un maleducato e non sa guidare! Mai piu!', 1, '2018-12-14');
COMMIT;

-- -------------------------------
-- Table structure for 'DOCUMENTO'
-- -------------------------------
DROP TABLE IF EXISTS `DOCUMENTO`; 
CREATE TABLE `DOCUMENTO` (
  `Numero` VARCHAR(10) NOT NULL ,
  `Tipologia` VARCHAR(45) NOT NULL,
  `Scadenza` DATE NOT NULL,
  `EnteRilascio` VARCHAR(45) NOT NULL,
  `Controllato` BOOL NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL, 
  PRIMARY KEY (`Numero` , `Tipologia`),
  FOREIGN KEY(`CodFiscale`) REFERENCES `Utente`(`CodFiscale`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `DOCUMENTO` VALUES
('AX597859','Carta di identita','2022-07-31','Comune di Venosa',1,'CNCGPP96L31L738B'),
('AZ597845','Carta di identita','2019-07-17','Comune di Capannori', 1,'LGNNDR97L17A952S'),
('PI967456','Patente di guida','2025-12-28','Motorizzazione di Pisa', 1,'SLLFNC78S15H501V');
COMMIT;

-- ---------------------------------
-- Table structure for 'AUTOVETTURA'
-- ----------------------------------
DROP TABLE IF EXISTS `AUTOVETTURA`; 
CREATE TABLE `AUTOVETTURA` (
  `Targa` VARCHAR(7) NOT NULL ,
  `CasaProduttrice` VARCHAR(45)  NOT NULL,
  `Modello` VARCHAR(45) NOT NULL,
  `Cilindrata` INT(5) NOT NULL,
  `NumeroPosti` INT(2) NOT NULL,
  `Alimentazione` VARCHAR(45) NOT NULL,
  `Immatricolazione` DATE NOT NULL,
  `ConsumoUrbano` FLOAT(4,2)  NOT NULL,
  `ConsumoExtraUrbano` FLOAT(4,2) NOT NULL,
  `ConsumoMisto` FLOAT(4,2) NOT NULL,
  `CapacitaSerbatoio` FLOAT(4,2)  NOT NULL,
  `VelocitaMassima` INT(3) NOT NULL,
  `Disponiblita` BOOL NOT NULL,
  `CostoOperativo` FLOAT(4,2) NOT NULL,
  `LivelloComfort` INT(1),
  `Proprietario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Targa`),
  FOREIGN KEY(`Proprietario`) REFERENCES `Proponente`(`NomeUtenteProponente`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `AUTOVETTURA` VALUES
('DT909MK','Mercedes','Smart 451',1000,2,'Benzina','2009-06-12',15.30,12.67,14.09,30.00,130,0,10.50,NULL,'PeppoCT'),
('CJ646LO','Mercedes','Smart 451',600,2,'Benzina','2006-08-19',17.60,14.76,15.89,25.00,100,1,12.00,NULL,'MarcoMattei'),
('FW573ZB','Mercedes','Viano',3000,9,'Diesel','2016-10-22',09.40,07.86,08.01,40.00,110,1,09.00,NULL,'Lucy'),
('FZ646MM','Ferrari','Testarossa',6000,2,'Benzina','2018-09-09',03.45,04.90,04.00,65.00,290,1,60.00,NULL,'SteFre'),
('ET914LA','Tesla','ModelS',0,5,'Elettrica','2012-07-17',20.45,25.90,23.00,00.00,220,1,30.00,NULL,'PaoCri'),
('CD141RZ','Audi','A8',2500,5,'Diesel','2003-09-09',10.05,13.90,12.70,85.00,245,1,60.00,NULL,'Sillabus'),
('FK982BB','Bugatti','Veyron',8000,2,'Benzina','2018-05-12',02.50,03.86,03.01,60.00,420,1,55.00,NULL,'SisiDavi');
COMMIT;

-- -------------------------------
-- Table structure for 'DOTAZIONE'
-- -------------------------------
DROP TABLE IF EXISTS `DOTAZIONE`; 
CREATE TABLE `DOTAZIONE` (
  `CodiceOptional` INT(3) NOT NULL ,
  `Targa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`CodiceOptional` , `Targa`),
  FOREIGN KEY(`Targa`) REFERENCES `Autovettura`(`Targa`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `DOTAZIONE` VALUES
(1,'FW573ZB'),
(2,'FW573ZB'),
(4,'FW573ZB');
COMMIT;

-- -------------------------------
-- Table structure for 'OPTIONAL'
-- -------------------------------
DROP TABLE IF EXISTS `OPTIONAL`; 
CREATE TABLE `OPTIONAL` (
  `CodiceOptional` INT(3) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Descrizione` VARCHAR(100) NOT NULL,
  `StelleComfort` INT(1) NOT NULL,
  PRIMARY KEY (`CodiceOptional`),
  FOREIGN KEY(`CodiceOptional`) REFERENCES `Dotazione`(`CodiceOptional`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `OPTIONAL` VALUES
(NULL,'Tetto in vetro','Carrozzeria','Tetto panoramico in vetro',2),
(NULL,'Sedili riscaldabili','Interni','Sedili anteriori e posteriori riscaldabili tramite 3 diverse tipologie di intensita',3),
(NULL,'Rilevamento acustico di ostacoli','Carrozzeria','Sensori che emettono un suono in prossimita di ostacoli vicini all autovettura',5),
(NULL,'ParkAssist','Connettivita','Sistema di parcheggio autonomo dell autovettura',4),
(NULL,'Sistema di navigazione','Connettivita','Sistema di navigazione integrato nell autovettura',1),
(NULL,'Schermi Posteriori','Connettivita','Schermi touch screen fullHD presenti nella parte posteriore dei poggiatesta',5),
(NULL,'Wi-Fi','Connettivita','Connesione Wi-Fi presente nell autovettura per i passeggeri',4);
COMMIT;

-- --------------------------------
-- Table structure for 'FRUIBILITA'
-- --------------------------------
DROP TABLE IF EXISTS `FRUIBILITA`; 
CREATE TABLE `FRUIBILITA` (
  `CodiceFruibilita` INT NOT NULL AUTO_INCREMENT,
  `Targa` VARCHAR(7) NOT NULL ,
  `Giorno` DATE NOT NULL,
  `FasciaOrariaInizio` TIME NOT NULL,
  `FasciaOrariaFine` TIME NOT NULL,
  PRIMARY KEY (`CodiceFruibilita`),
  FOREIGN KEY(`Targa`) REFERENCES `Autovettura`(`Targa`),
  CHECK (FasciaOrariaInizio<FasciaOrariaFine)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `FRUIBILITA` VALUES
(NULL,'EK982BB','2018-11-10','01:00:00','06:00:00'),
(NULL,'EK982BB','2018-11-10','14:30:00','16:25:00'),
(NULL,'EK982BB','2018-11-10','20:00:00','24:00:00'),
(NULL,'DT909MK','2018-11-10','00:01:00','05:00:00'),
(NULL,'DT909MK','2018-11-10','09:00:00','14:00:00'),
(NULL,'DT909MK','2018-11-10','19:30:00','22:45:00'),
(NULL,'DT909MK','2018-10-12','06:30:00','11:45:00'),
(NULL,'DT909MK','2018-12-14','13:00:00','20:30:00'),
(NULL,'CJ646LO','2018-11-10','02:00:00','10:15:00'),
(NULL,'CJ646LO','2018-11-10','13:30:00','14:30:00'),
(NULL,'CJ646LO','2018-11-10','18:30:00','19:25:00'),
(NULL,'CJ646LO','2018-12-06','07:30:00','12:25:00'),
(NULL,'CJ646LO','2018-12-13','18:00:00','19:45:00'),
(NULL,'CJ646LO','2018-12-27','06:00:00','10:45:00'),
(NULL,'CJ646LO','2018-12-27','15:30:00','21:50:00'),
(NULL,'CJ646LO','2018-11-10','23:00:00','24:00:00');
COMMIT;

-- ----------------------------
-- Table structure for 'PERIODO'
-- ----------------------------
DROP TABLE IF EXISTS `PERIODO`; 
CREATE TABLE `PERIODO` (
  `CodicePeriodo` INT NOT NULL AUTO_INCREMENT,
  `Giorno` DATE NOT NULL,
  `FasciaOrariaInizio` TIME NOT NULL,
  `FasciaOrariaFine` TIME NOT NULL,
  PRIMARY KEY (`CodicePeriodo`),
  FOREIGN KEY (`CodicePeriodo`) REFERENCES `Fruibilita`(`CodiceFruibilita`), 
  CHECK (FasciaOrariaInizio<FasciaOrariaFine)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `PERIODO` VALUES
(NULL,'2018-11-10','01:00:00','06:00:00'),
(NULL,'2018-11-10','14:30:00','16:25:00'),
(NULL,'2018-11-10','20:00:00','24:00:00'),
(NULL,'2018-11-10','00:01:00','05:00:00'),
(NULL,'2018-11-10','09:00:00','14:00:00'),
(NULL,'2018-11-10','19:30:00','22:45:00'),
(NULL,'2018-11-10','02:00:00','10:15:00'),
(NULL,'2018-11-10','13:30:00','14:30:00'),
(NULL,'2018-11-10','18:30:00','19:25:00'),
(NULL,'2018-11-10','23:00:00','24:00:00');
COMMIT;

-- ----------------------------
-- Table structure for 'POOL'
-- ----------------------------
DROP TABLE IF EXISTS `POOL`; 
CREATE TABLE `POOL` (
  `CodicePool` INT NOT NULL AUTO_INCREMENT,
  `GiornoPartenza` DATE NOT NULL,
  `OraPartenza` TIME NOT NULL,
  `GiornoArrivo` DATE NOT NULL,
  `OraArrivo` TIME NOT NULL,
  `Flessibilita` VARCHAR(6) NOT NULL,
  `PercentualeAumentoPrezzo` INT(3) NOT NULL,
  `Stato` VARCHAR(10) NOT NULL,
  `Validita` INT(3) NOT NULL,
  `Proponente` VARCHAR(45) NOT NULL,
  `Tragitto` INT(5)  NOT NULL,
  PRIMARY KEY (`CodicePool`),
  FOREIGN KEY(`Proponente`) REFERENCES `Proponente`(`NomeUtenteProponente`),
  FOREIGN KEY(`Tragitto`) REFERENCES `Tragitto`(`CodiceTragitto`),
  CHECK (GiornoPartenza<GiornoArrivo)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `POOL` VALUES
(NULL,'2018-01-29','16:30:00','2018-10-29','20:30:00','media',20,'attivo',50,'IlPao',00001),
(NULL,'2018-02-01','11:00:00','2018-09-01','12:10:00','alta',30,'attivo',48,'PeppoCT',00006),
(NULL,'2018-04-10','23:30:00','2018-04-11','02:15:00','bassa',10,'attivo',72,'Lucy',00010),
(NULL,'2018-04-20','08:30:00','2018-04-20','13:30:00','media',15,'attivo',120,'MarcoMattei',00009),
(NULL,'2018-06-22','13:45:00','2018-06-22','21:45:00','media',2,'attivo',90,'SteFre',00004),
(NULL,'2018-10-29','16:15:00','2018-10-29','18:25:00','bassa',5,'attivo',48,'PeppoCT',00008);
COMMIT;

-- -------------------------------------------
-- Table structure for 'PRENOTAZIONENOLEGGIO'
-- -------------------------------------------
DROP TABLE IF EXISTS `PRENOTAZIONENOLEGGIO`; 
CREATE TABLE `PRENOTAZIONENOLEGGIO` (
  `CodicePrenotazioneNoleggio` VARCHAR(5) NOT NULL ,
  `DataInizioNoleggio` DATE NOT NULL,
  `DataFineNoleggio` DATE NOT NULL,
  `Stato` VARCHAR(10) NOT NULL,
  `Autovettura` VARCHAR(7) NOT NULL,
  `Fruitore` VARCHAR(45) NOT NULL,
  `Tragitto` INT(5)  NOT NULL,
  PRIMARY KEY (`CodicePrenotazioneNoleggio`),
  FOREIGN KEY(`Fruitore`) REFERENCES `Fruitore`(`NomeUtenteFruitore`),
  FOREIGN KEY(`Autovettura`) REFERENCES `Autovettura`(`Targa`),
  FOREIGN KEY(`Tragitto`) REFERENCES `Tragitto`(`CodiceTragitto`),
  CHECK (DataInizioNoleggio<DataFineNoleggio)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `PRENOTAZIONENOLEGGIO` VALUES
('00001','2018-02-20','2018-02-25',1,'FK982BB','SisiDavi',00001),
('00002','2018-03-05','2018-03-09',1,'DT909MK','PeppoCT',00006),
('00003','2018-04-29','2018-05-01',0,'FW573ZB','Lucy',00010),
('00004','2018-05-15','2018-05-17',1,'CJ646LO','MarcoMattei',00009),
('00005','2018-06-05','2018-06-08',1,'FZ646MM','SteFre',00004),
('00006','2018-10-29','2018-11-01',0,'CJ646LO','MarcoMattei',00008);
COMMIT;

-- --------------------------------
-- Table structure for 'POSIZIONE'
-- --------------------------------
DROP TABLE IF EXISTS `POSIZIONE`; 
CREATE TABLE `POSIZIONE` (
  `Latitudine` FLOAT(10,8) NOT NULL,
  `Longitudine` FLOAT(11,8) NOT NULL,
  `Km` INT(5) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada` INT(5) NOT NULL,
  PRIMARY KEY (`Latitudine`, `Longitudine`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `POSIZIONE` VALUES
(48.122566,8.985663,7,'TipoB',01010);
COMMIT;

-- ------------------------------
-- Table structure for 'TRAGITTO'
-- ------------------------------
DROP TABLE IF EXISTS `TRAGITTO`; 
CREATE TABLE `TRAGITTO` (
  `CodiceTragitto` 	INT NOT NULL AUTO_INCREMENT,
  `NumeroStrade` INT(5) NOT NULL,
  `TimestampTracking` TIMESTAMP NOT NULL,
  `LatitudinePartenza` FLOAT(10,8) NOT NULL,
  `LongitudinePartenza` FLOAT(11,8) NOT NULL,
  `LatitudineArrivo` FLOAT(10,8) NOT NULL,
  `LongitudineArrivo` FLOAT(11,8)  NOT NULL,
  PRIMARY KEY (`CodiceTragitto`),
  FOREIGN KEY(`TimestampTracking`) REFERENCES `Tracking`(`Timestamp`),
  FOREIGN KEY(`LatitudinePartenza` , `LongitudinePartenza`) REFERENCES `Posizione`(`Latitudine` , `Longitudine` ),
  FOREIGN KEY(`LatitudineArrivo` , `LongitudineArrivo`) REFERENCES `Posizione`(`Latitudine` , `Longitudine`)
  )
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `TRAGITTO` VALUES
(NULL,5,'2018-11-24 16:29:58',43.7269028,10.3976208,43.7182032,10.3894347),
(NULL,6,'2018-11-25 08:30:00',43.710309,10.396326,43.677367,10.275686);
COMMIT;

-- -------------------------------
-- Table structure for 'TRACKING'
-- -------------------------------
DROP TABLE IF EXISTS `TRACKING`; 
CREATE TABLE `TRACKING` (
  `Timestamp` TIMESTAMP NOT NULL ,
  `LatitudineTracking` FLOAT(10,8) NOT NULL,
  `LongitudineTracking` FLOAT(11,8) NOT NULL,
  PRIMARY KEY (`Timestamp`),
  FOREIGN KEY(`LatitudineTracking` , `LongitudineTracking`) REFERENCES `Posizione`(`Latitudine` , `Longitudine`)
  )
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `TRACKING` VALUES
('2018-11-24 12:00:00',48.889651,8.697823);
COMMIT;

-- ----------------------------------
-- Table structure for 'COMPOSIZIONE'
-- ----------------------------------
DROP TABLE IF EXISTS `COMPOSIZIONE`; 
CREATE TABLE `COMPOSIZIONE` (
  `IDcomposizione` INT NOT NULL AUTO_INCREMENT,
  `Tragitto` INT NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada` INT(5) NOT NULL,
  `FasciaOrariaInizio` TIME NOT NULL,
  `FasciaOrariaFine` TIME NOT NULL,
  `Giorno` DATE NOT NULL,
  `KmInizio` DOUBLE(4,2) NOT NULL,
  `KmFine` DOUBLE(4,2) NOT NULL,
  PRIMARY KEY (`IDcomposizione`),
  FOREIGN KEY (`Tragitto`) REFERENCES `TRAGITTO`(`CodiceTragitto`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`),
  CHECK (FasciaOrariaInizio < FasciaOrariaFine),
  CHECK (Tipologia IN (`TipoA`, `TipoB`, `TipoC`, `TipoD`))
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `COMPOSIZIONE` VALUES
(NULL,1,'TipoD',01201,'16:30:00','16:32:00','2018-11-26',1.1,1.3),
(NULL,1,'TipoD',01212,'16:32:00','16:45:00','2018-11-26',0.0,1.0),
(NULL,1,'TipoD',01247,'16:45:00','16:58:00','2018-11-26',0.2,0.7),
(NULL,1,'TipoD',01253,'16:58:00','17:06:00','2018-11-26',0.3,0.8),
(NULL,1,'TipoD',01306,'16:58:00','17:06:00','2018-11-26',1.1,1.6),
(NULL,2,'TipoD',01978,'08:30:01','08:35:00','2018-11-26',0.6,2.0),
(NULL,2,'TipoD',01276,'08:35:00','08:38:00','2018-11-26',0.0,1.0),
(NULL,2,'TipoD',01341,'08:38:00','08:45:00','2018-11-26',0.0,6.0),
(NULL,2,'TipoD',02211,'08:45:00','09:06:00','2018-11-26',0.0,1.0),
(NULL,2,'TipoC',00224,'08:38:00','08:45:00','2018-11-26',0.0,11.0),
(NULL,2,'TipoD',03765,'08:45:00','09:20:00','2018-11-26',0.7,1.0);
COMMIT;

-- ------------------------------
-- Table structure for 'VELOCITA'
-- ------------------------------
DROP TABLE IF EXISTS `VELOCITA`; 
CREATE TABLE `VELOCITA` (
  `CodiceVelocita` INT NOT NULL AUTO_INCREMENT,
  `KmInizio` INT(5) NOT NULL,
  `KmFine` INT(5) NOT NULL,
  `VelocitaMax` INT(3) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada` INT(5) NOT NULL,
  PRIMARY KEY (`CodiceVelocita`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `VELOCITA` VALUES
(NULL,0,36,70,'TipoC','01011'),
(NULL,0,45,90,'TipoC','02356'),
(NULL,0,120,110,'TipoB','01451'),
(NULL,0,2,50,'TipoD','01331'),
(NULL,0,5,50,'TipoD','01234'),
(NULL,0,7,30,'TipoD','01235'),
(NULL,0,8,50,'TipoD','01236'),
(NULL,0,5,50,'TipoD','01237'),
(NULL,0,79,130,'TipoA','22335'),
(NULL,0,71,110,'TipoA','22335'),
(NULL,0,90,130,'TipoA','22443');
COMMIT;

-- --------------------------------------------
-- Table structure for 'COMPOSIZIONEVARIAZIONE'
-- --------------------------------------------
DROP TABLE IF EXISTS `COMPOSIZIONEVARIAZIONE`; 
CREATE TABLE `COMPOSIZIONEVARIAZIONE` (
  `IDcomposizioneVariazione` INT NOT NULL AUTO_INCREMENT,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada` INT(5) NOT NULL,
  `CodiceNuovoTragitto` INT NOT NULL,
  `FasciaOrariaInizio` TIME NOT NULL,
  `FasciaOrariaFine` TIME NOT NULL,
  `Giorno` DATE NOT NULL,
  `KmInizioVariazione` DOUBLE(4,2) NOT NULL, 
  `KmFineVariazione` DOUBLE(4,2) NOT NULL,
  PRIMARY KEY (`IDcomposizioneVariazione`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`),
  FOREIGN KEY(`CodiceNuovoTragitto`) REFERENCES `NuovoTragitto`(`CodiceNuovoTragitto`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

-- ----------------------------
-- Table structure for 'STRADA'
-- ----------------------------
DROP TABLE IF EXISTS `STRADA`; 
CREATE TABLE `STRADA` (
  `Tipologia` VARCHAR(15) NOT NULL,
  `IDnumerico` INT(5) NOT NULL,
  `Categorizzazione` VARCHAR(45),
  `Lunghezza` DOUBLE(6,2) NOT NULL, 
  `NumeroCarreggiate` INT(2) NOT NULL,
  `NumeroCorsie` INT(2) NOT NULL,
  `NumeroSensiMarcia` INT(2) NOT NULL,
  PRIMARY KEY (`Tipologia` , `IDnumerico`),
  FOREIGN KEY(`Tipologia`, `IDnumerico`) REFERENCES `Comunale`(`TipologiaStrada`, `IDnumericoStrada`)
) 
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `STRADA` VALUES
('TipoD','01201',NULL,2,1,2,2), -- Via Rindi
('TipoD','01212',NULL,1,1,2,2), -- Via Piave
('TipoD','01247',NULL,2,1,2,2), -- Via Contessa Matilde
('TipoD','01253',NULL,1,1,2,2), -- Via Cammeo
('TipoD','01306',NULL,3,1,2,2), -- Via Bonanno Pisano
('TipoD','01319',NULL,0.5,1,2,2), -- Via Giunta Pisano
('TipoD','01320',NULL,1,1,2,2), -- Via Diotisalvi
('TipoD','01978',NULL,3,1,2,2), -- Via Battisti
('TipoD','01276',NULL,2,1,2,2), -- Via Porta a mare
('TipoD','01341',NULL,6,1,2,2), -- Via Conte Fazio
('TipoD','02211',NULL,1,1,2,2), -- Via II settembre
('TipoD','03765',NULL,1,1,2,2), -- Via Della Foce
('TipoD','01977',NULL,1,1,2,2), -- Via Gramsci

('TipoC','00225',NULL,25,1,2,2), -- Via delle cascine
('TipoC','00224',NULL,11,1,2,2), -- Lungarno D'Annunzio
('TipoC','00226',NULL,30,1,2,2), -- Viale delle Piagge

('TipoB','00025',NULL,95,1,4,2), -- Via Aurelia
('TipoB','00024',NULL,148,1,4,2), -- Via Diocleziana
('TipoB','00001',NULL,99,1,4,2), -- FI-PI-LI

('TipoA','00025',NULL,81,1,4,2), -- A11
('TipoA','00024',NULL,135,1,4,2); -- A12
COMMIT;

-- -----------------------------------
-- Table structure for 'NUOVO TRAGITTO'
-- ------------------------------------
DROP TABLE IF EXISTS `NUOVOTRAGITTO`; 
CREATE TABLE `NUOVOTRAGITTO` (
  `CodiceNuovoTragitto` INT NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (`CodiceNuovoTragitto`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `NUOVOTRAGITTO` VALUES
(NULL),
(NULL);
COMMIT;

-- --------------------------------
-- Table structure for 'VARIAZIONE'
-- --------------------------------
DROP TABLE IF EXISTS `VARIAZIONE`; 
CREATE TABLE `VARIAZIONE` (
  `CodiceVariazione` INT NOT NULL AUTO_INCREMENT,
  `Entita` VARCHAR(10) NOT NULL,
  `TipologiaStradaUscita` VARCHAR(15) NOT NULL,
  `IDnumericoStradaUscita` INT(5) NOT NULL,
  `KmUscita` DOUBLE(4,2) NOT NULL, 
  `TipologiaStradaIngresso` VARCHAR(15) NOT NULL,
  `IDnumericoStradaIngresso` INT(5) NOT NULL,
  `KmIngresso` DOUBLE(4,2) NOT NULL,
  `CodiceNuovoTragitto` INT NOT NULL,
  `CodiceTragittoAssociato` INT(5) NOT NULL,
  `CodicePrenotazionePool` INT(5) NOT NULL,
  PRIMARY KEY (`CodiceVariazione`),
  FOREIGN KEY(`CodicePrenotazionePool`) REFERENCES `PrenotazionePool`(`CodicePrenotazionePool`),
  FOREIGN KEY(`CodiceNuovoTragitto`) REFERENCES `NuovoTragitto`(`CodiceNuovoTragitto`),
  FOREIGN KEY(`CodiceTragittoAssociato`) REFERENCES `Tragitto`(`CodiceTragitto`),
  CHECK (Entita IN ('bassa','media','alta'))
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `VARIAZIONE` VALUES
(NULL,'media','TipoD',01978,0.6,'TipoD',01977,-1.0,1,2,3);
COMMIT;

-- --------------------------------------
-- Table structure for 'PRENOTAZIONEPOOL'
-- --------------------------------------
DROP TABLE IF EXISTS `PRENOTAZIONEPOOL`; 
CREATE TABLE `PRENOTAZIONEPOOL` (
  `CodicePrenotazionePool` INT NOT NULL AUTO_INCREMENT,
  `Stato` BOOL NOT NULL,
  `CodiceTragitto` INT NOT NULL,
  `Fruitore` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodicePrenotazionePool`),
  FOREIGN KEY(`CodiceTragitto`) REFERENCES `Tragitto`(`CodiceTragitto`),
  FOREIGN KEY(`Fruitore`) REFERENCES `Fruitore`(`NomeUtenteFruitore`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `PRENOTAZIONEPOOL` VALUES
(NULL,1,00001,'SisiDavi'),
(NULL,4,00003,'PeppoCT'),
(NULL,2,00005,'Lucy'),
(NULL,8,00006,'MarcoMattei');
COMMIT;

-- ----------------------------
-- Table structure for 'RICEVE'
-- ----------------------------
DROP TABLE IF EXISTS `RICEVE`; 
CREATE TABLE `RICEVE` (
  `Proponente` VARCHAR(45) NOT NULL,
  `PrenotazionePool` INT(5) NOT NULL,
  PRIMARY KEY (`Proponente` , `PrenotazionePool`),
  FOREIGN KEY (`PrenotazionePool`) REFERENCES `PrenotazionePool`(`CodicePrenotazionePool`),
  FOREIGN KEY(`Proponente`) REFERENCES `Proponente`(`NomeUtenteProponente`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `RICEVE` VALUES
('SisiDavi',00001),
('PeppoCT',00002),
('Lucy',00003),
('MarcoMattei',00004),
('SteFre',00005),
('MarcoMattei',00006);
COMMIT;

-- ------------------------------
-- Table structure for 'SINISTRO'
-- ------------------------------
DROP TABLE IF EXISTS `SINISTRO`; 
CREATE TABLE `SINISTRO` (
  `CodiceSinistro` VARCHAR(5) NOT NULL,
  `DataSinistro` DATE NOT NULL,
  `OraSinistro` TIME NOT NULL,
  `Dinamica` VARCHAR(500) NOT NULL, 
  `LatitudineSinistro` FLOAT(10,8) NOT NULL,
  `LongitudineSinistro` FLOAT(11,8) NOT NULL,
  PRIMARY KEY (`CodiceSinistro`),
  FOREIGN KEY(`LatitudineSinistro`, `LongitudineSinistro`) REFERENCES `Posizione`(`Latitudine`, `Longitudine`),
  FOREIGN KEY(`CodiceSinistro`) REFERENCES `Coinvolto`(`Sinistro`),
  FOREIGN KEY(`CodiceSinistro`) REFERENCES `Interessato`(`Codice`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `SINISTRO` VALUES
('00001','2018-01-23','18:55:09','Tamponamento a catena in fila al semaforo, coinvolte 3 autovetture. Danni lievi per le prime due(semplici graffi o ammaccature nel paraurti posteriore), danni un po piu gravi per l ultima macchina che ha danneggiato cofano anteriore, paraurti anteriore, parte del radiatore e entrambi gli pneumatici anteriori con annessi bracci',41.890251,12.492373),
('00002','2018-07-19','23:28:55', 'Un auto non rispetta lo STOP e travolge in pieno una seconda autovettura che transitava sulla via principale. L autovettura colpevole non e riuscita a frenare tempestivamente mentre sopraggiungeva nell incrocio (causa maltempo e scarsa manutenzione della stessa), Ã¨ quindi entrata nell incrocio senza concedere la precedenza e colpendo violentemente una second autovettura che reca danni gravi su tutta la parte destra (sportello anteriore e posteriore, pneumatici, carene varie, finestrini)',45.105666244,7.637997448);
COMMIT;

-- ---------------------------------
-- Table structure for 'INTERESSATO'
-- ---------------------------------
DROP TABLE IF EXISTS `INTERESSATO`; 
CREATE TABLE `INTERESSATO` (
  `Codice` VARCHAR(5) NOT NULL,
  `TargaVeicoloEsterno` VARCHAR(7) NOT NULL,
  `Ruolo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Codice` , `TargaVeicoloEsterno`),
  FOREIGN KEY(`TargaVeicoloEsterno`) REFERENCES `VeicoloEsterno`(`Targa`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `INTERESSATO` VALUES
('00001','PF987CL','Colpevole'),
('00002','LD495PT','Leso');
COMMIT;

-- ------------------------------------
-- Table structure for 'VEICOLOESTERNO'
-- ------------------------------------
DROP TABLE IF EXISTS `VEICOLOESTERNO`; 
CREATE TABLE `VEICOLOESTERNO` (
  `Targa` VARCHAR(7) NOT NULL,
  `CasaAutomobilistica` VARCHAR(45) NOT NULL,
  `Modello` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Targa`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `VEICOLOESTERNO` VALUES
('PF987CL','Fiat','Panda'),
('LD495PT','Mini','Countryman');
COMMIT;

-- -------------------------------
-- Table structure for 'COINVOLTO'
-- -------------------------------
DROP TABLE IF EXISTS `COINVOLTO`; 
CREATE TABLE `COINVOLTO` (
  `Sinistro` VARCHAR(5) NOT NULL,
  `Fruitore` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sinistro` , `Fruitore`),
  FOREIGN KEY(`Fruitore`) REFERENCES `Fruitore`(`NomeUtenteFruitore`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `COINVOLTO` VALUES
('00001','GaiaCer'),
('00002','PaoCri');
COMMIT;

-- -------------------------------------
-- Table structure for 'SHARINGONDEMAND'
-- -------------------------------------
DROP TABLE IF EXISTS `SHARINGONDEMAND`; 
CREATE TABLE `SHARINGONDEMAND` (
  `CodiceSharing` INT NOT NULL AUTO_INCREMENT,
  `OraPartenza` TIME NOT NULL,
  `Proponente` VARCHAR(45) NOT NULL,
  `Tragitto` INT(5) NOT NULL, 
  PRIMARY KEY (`CodiceSharing`),
  FOREIGN KEY(`Proponente`) REFERENCES `Proponente`(`NomeUtenteProponente`),
  FOREIGN KEY(`Tragitto`) REFERENCES `Tragitto`(`CodiceTragitto`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `SHARINGONDEMAND` VALUES
(NULL,'12:35:00','PaoCri',11110),
(NULL,'17:22:09','Sillabus',11111),
(NULL,'09:55:19','Lucy',11112),
(NULL,'10:10:10','Beniste',11113),
(NULL,'00:15:00','SisiDavi',11114),
(NULL,'03:45:07','SteFre',11115);
COMMIT;

-- -------------------------------------
-- Table structure for 'CHIAMATASHARING'
-- -------------------------------------
DROP TABLE IF EXISTS `CHIAMATASHARING`; 
CREATE TABLE `CHIAMATASHARING` (
  `CodiceChiamata` INT NOT NULL AUTO_INCREMENT,
  `TimestampChiamata` TIMESTAMP  NOT NULL,
  `Stato` VARCHAR(10) NOT NULL,
  `TimestampRisposta` TIMESTAMP,
  `TimestampFineCorsa` TIMESTAMP,
  `Sharing` INT NOT NULL,
  `LatitudinePosizioneAttuale` FLOAT(10,8) NOT NULL,
  `LongitudinePosizioneAttuale` FLOAT(11,8) NOT NULL,
  `LatitudineDestinazione` FLOAT(10,8)  NOT NULL,
  `LongitudineDestinazione` FLOAT(11,8) NOT NULL,
  `Fruitore` VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`CodiceChiamata`),
  FOREIGN KEY(`Sharing`) REFERENCES `SharingOnDemand`(`CodiceSharing`),
  FOREIGN KEY(`LatitudinePosizioneAttuale`, `LongitudinePosizioneAttuale`) REFERENCES `Posizione`(`Latitudine`, `Longitudine`),
  FOREIGN KEY(`LatitudineDestinazione`, `LongitudineDestinazione`) REFERENCES `Posizione`(`Latitudine`, `Longitudine`),
  FOREIGN KEY(`Fruitore`) REFERENCES `Fruitore`(`NomeUtenteFruitore`),
  CHECK(TimestampRisposta>TimestampChiamata),
  CHECK(TimestampFineCorsa>TimestampRisposta)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `CHIAMATASHARING` VALUES
(NULL,'2018-11-29 12:35:00','Accepted','2018-11-29 12:36:08','2018-11-29 12:45:15',2,43.709686,10.396994,43.713746,10.393753,'Nicredi'),
(NULL,'2018-11-30 19:59:55','Rejected','2018-11-30 20:06:22',NULL,5,43.714887,10.400719,43.711360,10.403313,'MarcoMattei'),
(NULL,'2018-12-07 13:17:43','Pending',NULL,NULL,6,43.712173,10.399413,43.716133,10.388004,'GaiaCer');
COMMIT;

-- -------------------------------------
-- Table structure for 'COMUNALE'
-- -------------------------------------
DROP TABLE IF EXISTS `COMUNALE`; 
CREATE TABLE `COMUNALE` (
  `Nome` VARCHAR(45) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada`INT(5) NOT NULL,
  PRIMARY KEY (`Nome`),
  FOREIGN KEY (`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `COMUNALE` VALUES
('Via Rindi','TipoD',01201),
('Via Piave','TipoD',01212),
('Via Contessa Matilde','TipoD',01247),
('Via Cammeo','TipoD',01253),
('Via Bonanno Pisano','TipoD',01306),
('Via Andrea Pisano','TipoD',01319), 
('Via Diotisalvi','TipoD',01320),
('Via Battisti','TipoD',01978),
('Via Porta a mare','TipoD',01276),
('Via Conte Fazio','TipoD',01341),
('Via II settembre','TipoD',02211),
('Via Della foce','TipoD',03765), 
('Via Gramsci','TipoD',01977);
COMMIT;

-- -------------------------------------
-- Table structure for 'EXTRAURBANASECONDARIA'
-- -------------------------------------
DROP TABLE IF EXISTS `EXTRAURBANASECONDARIA`; 
CREATE TABLE `EXTRAURBANASECONDARIA` (
  `Nome` VARCHAR(45) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada`INT(5) NOT NULL,
  PRIMARY KEY (`Nome`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `EXTRAURBANASECONDARIA` VALUES
('Lungarno D Annunzio','TipoC',00224),
('Via Delle Cascine','TipoC',00225),
('Viale delle Piagge', 'TipoC',00226);
COMMIT;

-- -------------------------------------
-- Table structure for 'EXTRAURBANAPRINCIPALE'
-- -------------------------------------
DROP TABLE IF EXISTS `EXTRAURBANAPRINCIPALE`; 
CREATE TABLE `EXTRAURBANAPRINCIPALE` (
  `Nome` VARCHAR(45) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada`INT(5) NOT NULL,
  PRIMARY KEY (`Nome`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `EXTRAURBANAPRINCIPALE` VALUES
('Via Aurelia','TipoB',00025),
('Via Diocleziana','TipoB',00024),
('FI-PI-LI','TipoB',00001);
COMMIT;

-- -------------------------------------
-- Table structure for 'AUTOSTRADA'
-- -------------------------------------
DROP TABLE IF EXISTS `AUTOSTRADA`; 
CREATE TABLE `AUTOSTRADA` (
  `Nome` VARCHAR(45) NOT NULL,
  `TipologiaStrada` VARCHAR(15) NOT NULL,
  `IDnumericoStrada`INT(5) NOT NULL,
  PRIMARY KEY (`Nome`),
  FOREIGN KEY(`TipologiaStrada`, `IDnumericoStrada`) REFERENCES `Strada`(`Tipologia`, `IDnumerico`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `AUTOSTRADA` VALUES
('A11','TipoA',00025), 
('A12','TipoA',00024); 
COMMIT;
-- --------------------------------
-- Table Structure for 'INCROCIO'
-- --------------------------------
DROP TABLE IF EXISTS `INCROCIO`;
CREATE TABLE `INCROCIO` (
   `IDincrocio` INT NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (`IDincrocio`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `INCROCIO` VALUES
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL), 
(NULL); 
COMMIT;

-- --------------------------------------
-- Table Structure for 'INCONTROCOMUNALE'
-- --------------------------------------
DROP TABLE IF EXISTS `INCONTROCOMUNALE`;
CREATE TABLE `INCONTROCOMUNALE` (
   `NomeComunale` VARCHAR(45) NOT NULL,
   `Incrocio` INT NOT NULL,
   `Km` DOUBLE NOT NULL,
   PRIMARY KEY (`NomeComunale` , `Incrocio`),
   FOREIGN KEY (`Incrocio`) REFERENCES `Incrocio`(`IDincrocio`),
   FOREIGN KEY (`NomeComunale`) REFERENCES `Comunale`(`Nome`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `INCONTROCOMUNALE` VALUES
-- incroci tragitto1 compresa variazione
('Via Rindi',1,0.0),
('Via Rindi',2,1.3),  
('Via Piave',2,0.0),
('Via Piave',3,1.0),  
('Via Contessa Matilde',3,0.2),
('Via Contessa Matilde',4,0.7),  
('Via Cammeo',4,0.3),
('Via Cammeo',5,0.8),
('Via Andrea Pisano',5,0.3),  
('Via Andrea Pisano',6,1.0),  
('Via Diotisalvi',6,0.5),
('Via Diotisalvi',7,1.0),
('Via Bonanno Pisano',7,1.0),  
('Via Bonanno Pisano',1,1.6),

-- incroci tragitto2 compresa variazione
('Via Gramsci',8,0.0), 
('Via Gramsci',9,1.0), 
('Via Battisti',9,0.6), 
('Via Battisti',10,2.0),  
('Via Porta a mare',10,0.0),
('Via Porta a mare',11,1.0),
('Via Conte Fazio',11,0.0),  
('Via Conte Fazio',12,6.0),  
('Via II settembre',12,0.0),
('Via II settembre',13,1.0),
('Lungarno D Annunzio',13,0.0), 
('Lungarno D Annunzio',14,11.0),   
('Via Della Foce',14,0.7),
('Via Della Foce',8,1.0);
COMMIT;

-- --------------------------------
-- Table Structure for 'INCONTROSECONDARIA'
-- --------------------------------
DROP TABLE IF EXISTS `INCONTROSECONDARIA`;
CREATE TABLE `INCONTROSECONDARIA` (
   `NomeSecondaria` VARCHAR(45) NOT NULL,
   `Incrocio` INT NOT NULL,
   `Km` DOUBLE(4,2) NOT NULL,
   PRIMARY KEY (`NomeSecondaria` , `Incrocio`),
   FOREIGN KEY (`Incrocio`) REFERENCES `Incrocio`(`IDincrocio`),
   FOREIGN KEY (`NomeSecondaria`) REFERENCES `ExtraUrbanaSecondaria`(`Nome`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `INCONTROSECONDARIA` VALUES
('Lungarno D Annunzio',15,0.0),
('Lungarno D Annunzio',16,11.0),
('Viale delle Piagge',16,0.0),
('Viale delle Piagge',17,15.0),
('Viale delle Cascine',17,0.0),
('Via delle Cascine',15,25.0);
COMMIT;

-- --------------------------------
-- Table Structure for 'CORSIA'
-- --------------------------------
DROP TABLE IF EXISTS `CORSIA`;
CREATE TABLE `CORSIA` (
   `Nome` VARCHAR(45) NOT NULL,
   `Ruolo` VARCHAR(10) NOT NULL,
   `NomeSecondaria` VARCHAR(45),
   `NomePrincipale` VARCHAR(45),
   `NomeAutostrada` VARCHAR(45),
   `KmSecondaria` INT(5),
   `KmPrincipale` INT(5),
   `KmAutostrada` INT(5),
   PRIMARY KEY (`Nome`,`Ruolo`),
   FOREIGN KEY (`NomeSecondaria`) REFERENCES `EXTRAURBANASECONDARIA`(`Nome`),
   FOREIGN KEY (`NomePrincipale`) REFERENCES `EXTRAURBANAPRINCIPALE`(`Nome`),
   FOREIGN KEY (`NomeAutostrada`) REFERENCES `AUTOSTRADA`(`Nome`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `CORSIA` VALUES
('Cascina','Immissione',NULL,'FI-PI-LI',NULL,NULL,62,NULL),
('Cascina','Uscita',NULL,'FI-PI-LI',NULL,NULL,63,NULL),
('Navacchio','Immissione',NULL,'FI-PI-LI',NULL,NULL,66,NULL),
('Navacchio','Uscita',NULL,'FI-PI-LI',NULL,NULL,67,NULL),
('Pisa Est','Immissione',NULL,'FI-PI-LI',NULL,NULL,70,NULL),
('Pisa Est','Uscita',NULL,'FI-PI-LI',NULL,NULL,71,NULL),
('Pisa Aeroporto','Immissione',NULL,'FI-PI-LI',NULL,NULL,72,NULL),
('Pisa Aeroporto','Uscita',NULL,'FI-PI-LI',NULL,NULL,73,NULL),
('Pisa Sud','Immissione',NULL,'FI-PI-LI',NULL,NULL,75,NULL),
('Pisa Sud','Uscita',NULL,'FI-PI-LI',NULL,NULL,76,NULL),
('Pisa Nord','Immissione',NULL,NULL,'A11',NULL,NULL,80),
('Pisa Nord','Uscita',NULL,NULL,'A11',NULL,NULL,81),
('Pisa Centro','Immissione',NULL,NULL,'A12',NULL,NULL,71),
('Pisa Centro','Uscita',NULL,NULL,'A12',NULL,NULL,72);
COMMIT;

-- --------------------------------
-- Table Structure for 'RACCORDO'
-- --------------------------------
DROP TABLE IF EXISTS `RACCORDO`;
CREATE TABLE `RACCORDO` (
   `Nome1` VARCHAR(45) NOT NULL,
   `Nome2` VARCHAR(45) NOT NULL,
   `Km1` INT(5) NOT NULL,
   `Km2` INT(5) NOT NULL,
   PRIMARY KEY (`Nome1` , `Nome2`),
   FOREIGN KEY (`Nome1`) REFERENCES `Corsia`(`Nome`),
   FOREIGN KEY (`Nome2`) REFERENCES `Corsia`(`Nome`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `RACCORDO` VALUES
('Pisa Aeroporto','Pisa Nord',73,80),
('Pisa Nord','Pisa Aeroporto',81,72),
('Cascina','Navacchio',63,66),
('Navacchio','Cascina',67,62);
COMMIT;

-- --------------------------------
-- Table Structure for 'PEDAGGIO'
-- --------------------------------
DROP TABLE IF EXISTS `PEDAGGIO`;
CREATE TABLE `PEDAGGIO` (
   `CodicePedaggio` INT NOT NULL AUTO_INCREMENT,
   `CostoKm` DOUBLE(4,2) NOT NULL,
   `KmIngresso` INT(5) NOT NULL,
   `KmUscita` INT(5) NOT NULL,
   `NomeAutostrada` VARCHAR(45) NOT NULL,
   PRIMARY KEY (`CodicePedaggio`),
   FOREIGN KEY (`NomeAutostrada`) REFERENCES `Autostrada`(`Nome`)
)
ENGINE = INNODB DEFAULT CHARSET=LATIN1;

BEGIN;
INSERT INTO `PEDAGGIO` VALUES
(NULL,1.50,58,68,'A11'), 
(NULL,1.50,20,77,'A11'), 
(NULL,1.50,0,69,'A11'), 
(NULL,1.50,58,68,'A11'), 
(NULL,1.30,0,65,'A12'), 
(NULL,1.60,100,109,'A12'),
(NULL,1.30,0,25,'A12'),
(NULL,1.30,69,99,'A12'), 
(NULL,1.60,100,135,'A12'); 
COMMIT;
