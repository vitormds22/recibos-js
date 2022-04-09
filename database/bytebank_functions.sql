CREATE DATABASE  IF NOT EXISTS `bytebank`;
USE `bytebank`;

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
