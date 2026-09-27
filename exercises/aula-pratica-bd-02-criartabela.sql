USE ULHT_DB26;
GO

DROP TABLE IF EXISTS dbo.AP02_LAB;
GO

CREATE TABLE dbo.AP02_LAB (
    id INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(40) NULL,
    pontos INT NOT NULL DEFAULT 0,
    ativo BIT NOT NULL DEFAULT 1
);
GO

INSERT INTO dbo.AP02_LAB
    (id, nome, cidade, pontos, ativo)
VALUES
    (101, 'Ana', 'Lisboa', 10, 1);

SELECT *
FROM dbo.AP02_LAB;

SELECT * FROM dbo.AP02_LAB WHERE id = 101;

UPDATE dbo.AP02_LAB
SET pontos += 5 
WHERE id = 101; 

SELECT * FROM dbo.AP02_LAB WHERE id = 101;

INSERT INTO dbo.AP02_LAB
    (id, nome, cidade, pontos, ativo)
VALUES
    (103, 'Patrick', 'California', 50, 1);

SELECT * FROM dbo.AP02_LAB;

DELETE FROM dbo.AP02_LAB 
WHERE id = 103;

SELECT * FROM dbo.AP02_LAB;

BEGIN TRANSACTION;

UPDATE dbo.AP02_LAB
SET pontos += 10
WHERE id = 101;

INSERT INTO dbo.AP02_LAB
    (id, nome, cidade, pontos, ativo)
VALUES  
    (104, 'John', 'New York', 20, 1);

SELECT * FROM dbo.AP02_LAB;

ROLLBACK TRANSACTION;

SELECT * FROM dbo.AP02_LAB;

DELETE FROM dbo.AP02_LAB;
