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


-- DAY 2: SQL PRACTICE
-- Completed: JOIN, GROUP BY, HAVING
-- Pending: Subqueries, CTE and error detection