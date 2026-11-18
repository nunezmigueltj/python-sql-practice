-- Ejercicio 1
SELECT
	P.Pokemon,
	P.Coleccion,
	PL.Nombre AS PLATAFORMA,
	V.FechaVenta,
	V.PrecioMXN,
	V.Cantidad
FROM 
	VENTAS AS V
INNER JOIN 
	Productos AS P
ON P.ProductoID = V.ProductoID
INNER JOIN 
	Plataformas as Pl
ON PL.PlataformaID = V.PlataformaID

--Ejercicio 2: Show all products even if no sales
SELECT
	P.Pokemon,
	P.Coleccion,
	PL.Nombre AS PLATAFORMA,
	V.FechaVenta,
	V.PrecioMXN,
	V.Cantidad
FROM 
	PRODUCTOS AS P
LEFT JOIN 
	Ventas AS V
ON P.ProductoID = V.ProductoID
LEFT JOIN 
	Plataformas as Pl
ON PL.PlataformaID = V.PlataformaID

-- Ejercicio 3: Show platforms that dont have sales registered.
SELECT
	PL.Nombre
FROM 
	Plataformas AS PL
LEFT JOIN 
	VENTAS AS V
ON V.PlataformaID = PL.PlataformaID
WHERE 
	V.VentaID IS NULL

-- Ejercicio 4: Calculate how much money each Pokémon has generated.
SELECT
	P.Pokemon,
	COUNT(*) AS TRANSACCIONES,
	SUM(V.Cantidad) AS UNIDADES_VENDIDAS,
	SUM(V.PrecioMXN * V.Cantidad) AS INGRESO_TOTAL
FROM VENTAS AS V
INNER JOIN
	Productos AS P
ON P.ProductoID = V.ProductoID
GROUP BY P.ProductoID, P.Pokemon

-- Ejercicio 5: Calculate income from each platform
SELECT
	P.Nombre,
	ISNULL(SUM(V.PrecioMXN * V.Cantidad), 0) AS INGRESO_TOTAL
FROM PLATAFORMAS AS P
LEFT JOIN
	Ventas AS V
ON P.PlataformaID = V.PlataformaID
GROUP BY P.Nombre

-- Ejercicio 6: Use HAVING to show only the pokemon has income > $1000
SELECT
	P.Pokemon,
	COUNT(*) AS TRANSACCIONES,
	SUM(V.Cantidad) AS UNIDADES_VENDIDAS,
	SUM(V.PrecioMXN * V.Cantidad) AS INGRESO_TOTAL
FROM VENTAS AS V
INNER JOIN
	Productos AS P
ON P.ProductoID = V.ProductoID
GROUP BY 
	P.ProductoID, P.Pokemon
HAVING
	SUM(V.PrecioMXN * V.Cantidad) > 1000


-- Ejercicio 7: Get all sales that price is > than the AVG of all sales
SELECT
	V.VentaID,
	P.Pokemon,
	P.NumeroCarta,
	V.PrecioMXN
FROM Ventas AS V
INNER JOIN
	Productos AS P
ON P.ProductoID = V.ProductoID
WHERE V.PrecioMXN > (
	SELECT
		AVG(VE.PrecioMXN) AS AVERAGE
	FROM
		Ventas AS VE
);

-- Ejercicio 8: Get all pokemon that have 1 or more sale with price > 1000
SELECT
	P.Pokemon
FROM Ventas AS V
INNER JOIN
	Productos AS P
ON P.ProductoID = V.ProductoID
WHERE V.PrecioMXN > 1000
GROUP BY P.Pokemon

SELECT 
	*
FROM 
	Productos AS P
WHERE 
	P.ProductoID IN(
		SELECT
			V.ProductoID
		FROM 
			Ventas AS V
		WHERE
			V.PrecioMXN > 1000
	)

-- Ejercicio 9: USING CTE GET TOTAL_INCOME OF ALL POKEMON INCLUDING THOSE THAT DONT HAVE SALES. THEN WITH THE RESULT SHOW ONLY THE ONES THAT HAVE TOTAL_INCOME > 1000
WITH VentasPorProducto AS (
	SELECT
		P.Pokemon,
		ISNULL(SUM(V.PRECIOMXN * V.Cantidad), 0) AS INGRESO_TOTAL
	FROM
		Productos AS P
	LEFT JOIN 
		VENTAS AS V
	ON V.ProductoID = P.ProductoID
	GROUP BY
		P.Pokemon, P.ProductoID
)

SELECT 
	VP.*
FROM 
	VentasPorProducto AS VP
WHERE
	VP.INGRESO_TOTAL > 1000


-- Ejercicio 10: DETECT THE ERROR
SELECT
    p.Pokemon,
    SUM(v.PrecioMXN) AS TotalVentas
FROM Productos p
INNER JOIN Ventas v
    ON p.ProductoID = v.VentaID
GROUP BY p.Pokemon;

-- Answer: The inner join connection is not the same values

-- Ejercicio 11: DETECT THE ERROR
SELECT
    ProductoID,
    SUM(PrecioMXN) AS TotalVentas
FROM Ventas
GROUP BY ProductoID
HAVING TotalVentas > 1000;

-- Answer: In the having clause, it is using a column name that is not valid.

-- Ejercicio 12: Detect duplicate sale
SELECT
	V.[ProductoID],
	V.PlataformaID,
	V.FechaVenta,
	V.PrecioMXN,
	V.Cantidad, 
	COUNT(*) AS REPETICIONES
FROM
	VENTAS AS V
GROUP BY V.[ProductoID],V.PlataformaID,V.FechaVenta,V.PrecioMXN,V.Cantidad
HAVING COUNT(*) > 1