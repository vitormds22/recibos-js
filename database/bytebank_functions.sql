CREATE DATABASE  IF NOT EXISTS `bytebank`;
USE `bytebank`;
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: bytebank
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.21.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'bytebank'
--
/*!50003 DROP FUNCTION IF EXISTS `deposita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`machado`@`%` FUNCTION `deposita`(valor INT, id_conta_destino INT) RETURNS int
BEGIN
	DECLARE novo_saldo INT;
    
    DECLARE saldo_conta_destino INT;
    
    DECLARE last_id_transacao INT;
    
	SET saldo_conta_destino = (SELECT saldo FROM conta WHERE id = id_conta_destino);
	
    SET novo_saldo = saldo_conta_destino + valor;
    
    UPDATE conta 
    SET 
		saldo = novo_saldo 
	WHERE 
		id = id_conta_destino;
    
    INSERT INTO 
		transacoes(id_conta_destino, valor, tipo_transacao, data) 
	values
        (id_conta_destino, valor, 'deposito', NOW());
	
    SET last_id_transacao = (SELECT MAX(id_transacao) from transacoes);
    
    INSERT INTO
		conta_transacao (id_conta, id_transacao, entrada)
	VALUES
		(id_conta_destino, last_id_transacao, valor);
        
RETURN novo_saldo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`machado`@`%` FUNCTION `saque`(valor INT, id_conta_destino INT) RETURNS int
BEGIN
	DECLARE novo_saldo INT;
    
    DECLARE saldo_conta_destino INT;
    DECLARE last_id_transacao INT;
    
	SET saldo_conta_destino = (SELECT saldo FROM conta WHERE id = id_conta_destino);
	
    SET novo_saldo = saldo_conta_destino - valor;
    
    UPDATE conta 
	SET 
		saldo = novo_saldo 
	WHERE 
		id = id_conta_destino;
    
    INSERT INTO 
		transacoes(id_conta_destino, valor, tipo_transacao, data) 
	values
        (id_conta_destino, valor, 'saque', NOW());
	
	SET last_id_transacao = (SELECT MAX(id_transacao) from transacoes);
    
	INSERT INTO
		conta_transacao (id_conta, id_transacao, saida)
	VALUES
		(id_conta_destino, last_id_transacao, valor);
        
RETURN novo_saldo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `transfere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`machado`@`%` FUNCTION `transfere`(valor INT, id_conta_origem INT, id_conta_destino INT) RETURNS tinyint(1)
BEGIN
	DECLARE novo_saldo_destino INT;
    DECLARE novo_saldo_origem INT;
    DECLARE saldo_conta_destino INT;
	DECLARE saldo_conta_origem INT;
    DECLARE last_id_transacao INT;
    
    SET saldo_conta_destino = (SELECT saldo FROM conta WHERE id = id_conta_destino);
    SET saldo_conta_origem = (SELECT saldo FROM conta WHERE id = id_conta_origem);
    
    SET novo_saldo_destino = saldo_conta_destino + valor;
    SET novo_saldo_origem = saldo_conta_origem - valor;
    
    UPDATE conta 
	SET 
        saldo = novo_saldo_destino 
	WHERE 
        id = id_conta_destino;
        
    UPDATE conta 
    SET 
		saldo = novo_saldo_origem 
	WHERE 
		id = id_conta_origem;
    
    INSERT INTO 
		transacoes(id_conta_origem, id_conta_destino, valor, tipo_transacao, data) 
	values
        (id_conta_origem, id_conta_destino, valor, 'transferencia', NOW());
        
	SET last_id_transacao = (SELECT MAX(id_transacao) from transacoes);
    
	INSERT INTO
		conta_transacao (id_conta, id_transacao, entrada, saida)
	VALUES
		(id_conta_destino, last_id_transacao, valor, valor);
	
RETURN true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 21:19:19
