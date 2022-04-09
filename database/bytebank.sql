DROP TABLE IF EXISTS `transacoes`;

CREATE TABLE `transacoes` (
  `id_conta_origem` int DEFAULT NULL,
  `id_conta_destino` int DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `tipo_transacao` varchar(45) DEFAULT NULL,
  `id_transacao` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_transacao`)
)

DROP TABLE IF EXISTS `conta`;

CREATE TABLE `conta` (
  `id` int NOT NULL,
  `saldo` int DEFAULT NULL,
  `agencia` int DEFAULT NULL,
  `numero` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `conta_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_transacao` (
  `id_conta_transacao` int NOT NULL AUTO_INCREMENT,
  `id_conta` int DEFAULT NULL,
  `id_transacao` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `entrada` int DEFAULT '0',
  `saida` int DEFAULT '0',
  PRIMARY KEY (`id_conta_transacao`),
  KEY `fk_conta_idx` (`id_conta`),
  KEY `fk_transacao_idx` (`id_transacao`),
  CONSTRAINT `fk_conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id`),
  CONSTRAINT `fk_transacao` FOREIGN KEY (`id_transacao`) REFERENCES `transacoes` (`id_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;