use Boutique
DROP TABLE Compra 
DROP TABLE Prenda
DROP TABLE Temporada
DROP TABLE Categoria
DROP TABLE Usuario

   CREATE TABLE Usuario(
    IDUsuario nvarchar(50)  PRIMARY KEY, 
    Password nvarchar(200) NOT NULL,
    Nombre nvarchar (50),
    Email nvarchar (500),
    Tipo nvarchar (100),
    Administrador BIT NOT NULL DEFAULT 0
)
     CREATE TABLE Categoria(
      IDCateg bigint NOT NULL IDENTITY (1,1) PRIMARY KEY,
      FechaCreacion datetime NOT NULL DEFAULT GETDATE (),
      Categoria nvarchar(100) NOT NULL
)
     CREATE TABLE Temporada(
       IDTemp bigint NOT NULL IDENTITY (1,1) PRIMARY KEY,
       FechaCreacion datetime NOT NULL DEFAULT GETDATE(),
       Temporada nvarchar NOT NULL
)
     CREATE TABLE Prenda(
     IDPrenda bigint NOT NULL IDENTITY (1,1) PRIMARY KEY,
     FechaCreacion datetime NOT NULL DEFAULT getdate(),
     Color nvarchar(100) NOT NULL,
     Tipo nvarchar (200) NOT NULL,
     Precio money NOT NULL UNIQUE,
	 Talla nvarchar (500) NOT NULL,
     IDCateg bigint NOT NULL  REFERENCES Categoria,
     IDTemp bigint REFERENCES Temporada
)    
    CREATE TABLE Compra(
        IDCompra bigint NOT NULL IDENTITY (1,1) PRIMARY KEY,
        IDUsuario nvarchar(50) REFERENCES Usuario,
        IDPrenda bigint REFERENCES Prenda,
        Precio money NOT NULL,
        Cantidad int NOT NULL
)
              











