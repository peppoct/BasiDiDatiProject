DROP PROCEDURE IF EXISTS InserisciChiamata;
DELIMITER $$
CREATE PROCEDURE InserisciChiamata (IN _CodiceChiamata INT, IN _TimestampChiamata TIMESTAMP, IN _Stato VARCHAR(10), 
									IN _TimestampRisposta TIMESTAMP, IN _TimestampFineCorsa TIMESTAMP, IN _Sharing INT,
									IN _LatitudinePosizioneAttuale FLOAT(10,8), IN _LongitudinePosizioneAttuale FLOAT(11,8),
                                    IN _LatitudineDestinazione FLOAT(10,8), IN _LongitudineDestinazione FLOAT(11,8),
                                    IN _Fruitore VARCHAR(45) )

BEGIN

INSERT INTO `ChiamataSharing`
VALUES ( _CodiceChiamata, _TimestampChiamata, _Stato, _TimestampRisposta, _TimestampFineCorsa, _Sharing,
		 _LatitudinePosizioneAttuale, _LongitudinePosizioneAttuale, _LatitudineDestinazione,
         _LongitudineDestinazione, _Fruitore );
	
END $$
DELIMITER ;


CALL InserisciChiamata(NULL,'2018-10-10 12:00:00','Pending',NULL,NULL,5,48.122566,8.985663,48.122566,8.985663,'Lucy');







