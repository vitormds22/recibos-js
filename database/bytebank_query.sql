SELECT 
    (SELECT 
            SUM(saida)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-01-01') AND CONCAT(YEAR(CURRENT_DATE()), '-01-31')) AS 'Saida Janeiro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-01-01') AND CONCAT(YEAR(CURRENT_DATE()), '-01-31')) AS 'Entrada Janeiro',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-02-01') AND CONCAT(YEAR(CURRENT_DATE()), '-02-28')) AS 'Saida Fevereiro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-02-01') AND CONCAT(YEAR(CURRENT_DATE()), '-02-28')) AS 'Entrada Fevereiro',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-03-01') AND CONCAT(YEAR(CURRENT_DATE()), '-03-31')) AS 'Saida Março',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-03-01') AND CONCAT(YEAR(CURRENT_DATE()), '-03-31')) AS 'Entrada Março',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-04-01') AND CONCAT(YEAR(CURRENT_DATE()), '-04-30')) AS 'Saida Abril',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-04-01') AND CONCAT(YEAR(CURRENT_DATE()), '-04-30')) AS 'Entrada Abril',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-05-01') AND CONCAT(YEAR(CURRENT_DATE()), '-05-31')) AS 'Saida Maio',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-05-01') AND CONCAT(YEAR(CURRENT_DATE()), '-05-31')) AS 'Entrada Maio',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-06-01') AND CONCAT(YEAR(CURRENT_DATE()), '-06-30')) AS 'Saida Junho',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-06-01') AND CONCAT(YEAR(CURRENT_DATE()), '-06-30')) AS 'Entrada Junho',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-07-01') AND CONCAT(YEAR(CURRENT_DATE()), '-07-31')) AS 'Saida Julho',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-07-01') AND CONCAT(YEAR(CURRENT_DATE()), '-07-31')) AS 'Entrada Julho',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-08-01') AND CONCAT(YEAR(CURRENT_DATE()), '-08-31')) AS 'Saida Agosto',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-08-01') AND CONCAT(YEAR(CURRENT_DATE()), '-08-31')) AS 'Entrada Agosto',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-09-01') AND CONCAT(YEAR(CURRENT_DATE()), '-09-30')) AS 'Saida Setembro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-09-01') AND CONCAT(YEAR(CURRENT_DATE()), '-09-30')) AS 'Entrada Setembro',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-10-01') AND CONCAT(YEAR(CURRENT_DATE()), '-10-31')) AS 'Saida Outubro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-10-01') AND CONCAT(YEAR(CURRENT_DATE()), '-10-31')) AS 'Entrada Outubro',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-11-01') AND CONCAT(YEAR(CURRENT_DATE()), '-11-30')) AS 'Saida Novembro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-11-01') AND CONCAT(YEAR(CURRENT_DATE()), '-11-30')) AS 'Entrada Novembro',
	(SELECT 
			SUM(saida)
		FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-12-01') AND CONCAT(YEAR(CURRENT_DATE()), '-12-31')) AS 'Saida Dezembro',
	(SELECT 
            SUM(entrada)
        FROM
            conta_transacao
        WHERE
            data BETWEEN CONCAT(YEAR(CURRENT_DATE()), '-12-01') AND CONCAT(YEAR(CURRENT_DATE()), '-12-31')) AS 'Entrada Dezembro';