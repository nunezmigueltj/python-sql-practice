CREATE TABLE Productos(
	ProductoID INT IDENTITY(1,1) PRIMARY KEY,
	Pokemon NVARCHAR(60) NOT NULL,
	Coleccion NVARCHAR(80) NOT NULL,
	NumeroCarta NVARCHAR(15) NOT NULL,

    CONSTRAINT UQ_Productos_Carta
    UNIQUE (Coleccion, NumeroCarta)
);
/*
IDENTITY(1,1) genera identificadores automáticamente.
PRIMARY KEY identifica cada registro.
NOT NULL obliga a proporcionar un valor.
UNIQUE evita repetir la combinación de colección y número de carta.
*/
CREATE TABLE Plataformas (
    PlataformaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,

    ProductoID INT NOT NULL,
    PlataformaID INT NOT NULL,

    FechaVenta DATE NOT NULL,
    PrecioMXN DECIMAL(10,2) NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Ventas_Productos
    FOREIGN KEY (ProductoID)
    REFERENCES Productos(ProductoID),

    CONSTRAINT FK_Ventas_Plataformas
    FOREIGN KEY (PlataformaID)
    REFERENCES Plataformas(PlataformaID),

    CONSTRAINT CK_Ventas_Precio
    CHECK (PrecioMXN > 0),

    CONSTRAINT CK_Ventas_Cantidad
    CHECK (Cantidad > 0)
);

INSERT INTO Productos (Pokemon, Coleccion, NumeroCarta)
VALUES
('Pikachu', 'Set Demo A', '001/100'),
('Charizard', 'Set Demo A', '002/100'),
('Mew', 'Set Demo B', '003/100'),
('Gengar', 'Set Demo B', '004/100'),
('Eevee', 'Set Demo C', '005/100');


INSERT INTO Plataformas (Nombre)
VALUES
('Mercado Libre'),
('eBay'),
('Facebook Marketplace'),
('TCGplayer');


INSERT INTO Ventas
(ProductoID, PlataformaID, FechaVenta, PrecioMXN, Cantidad)
VALUES
(1, 1, '2026-10-01', 250.00, 1),
(2, 2, '2026-10-02', 1500.00, 1),
(1, 2, '2026-10-03', 280.00, 1),
(3, 1, '2026-10-05', 700.00, 1),
(2, 1, '2026-10-07', 1450.00, 1),
(3, 2, '2026-10-08', 750.00, 1),
(1, 3, '2026-10-10', 230.00, 2),
(2, 2, '2026-10-02', 1500.00, 1),
(3, 1, '2026-10-15', 680.00, 1);