CREATE PROCEDURE BuscarNumerosConsecutivos
    @LogTable LogTable READONLY
AS
BEGIN
    WITH NumerosConsecutivos AS (
        SELECT Num, 
               ROW_NUMBER() OVER (PARTITION BY Num ORDER BY Id) AS RowNum
        FROM @LogTable
    )
    SELECT Num
    FROM NumerosConsecutivos
    GROUP BY Num
    HAVING COUNT(*) >= 3;
END;
