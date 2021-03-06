USE [BD_PROYECTO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](30) NULL,
	[Apellidos] [varchar](30) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
	[Usuario] [varchar](30) NULL,
	[Password] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
	[Estado] [bit] NULL,
	[DNI] [int] NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EQUIPO]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EQUIPO](
	[IDEquipo] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](30) NULL,
	[Serie] [varchar](30) NULL,
	[Stock] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[IDMarca] [int] NULL,
	[IDProveedor] [int] NULL,
	[Imagen] [varchar](50) NULL,
 CONSTRAINT [PK_EQUIPO] PRIMARY KEY CLUSTERED 
(
	[IDEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MARCA](
	[IDMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NULL,
 CONSTRAINT [PK_MARCA] PRIMARY KEY CLUSTERED 
(
	[IDMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDEN_PEDIDO]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDEN_PEDIDO](
	[IDPedido] [int] NULL,
	[IDEquipo] [int] NULL,
	[Precio_Unitario] [decimal](10, 2) NULL,
	[Cantidad] [int] NULL,
	[Descuento] [decimal](10, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[IDPedido] [int] IDENTITY(1,1) NOT NULL,
	[FechaOrden] [datetime] NULL,
	[IDCliente] [int] NULL,
	[IDTarjeta] [int] NULL,
	[UsuarioTarjeta] [varchar](50) NULL,
	[NumeroTarjeta] [varchar](50) NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PEDIDO] PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NULL,
	[DirProveedor] [varchar](60) NULL,
	[RUC] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[User] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[Activo] [bit] NULL,
	[Nombres] [varchar](30) NULL,
	[Apellidos] [varchar](30) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EQUIPO]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPO_MARCA] FOREIGN KEY([IDMarca])
REFERENCES [dbo].[MARCA] ([IDMarca])
GO
ALTER TABLE [dbo].[EQUIPO] CHECK CONSTRAINT [FK_EQUIPO_MARCA]
GO
ALTER TABLE [dbo].[EQUIPO]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPO_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[EQUIPO] CHECK CONSTRAINT [FK_EQUIPO_Proveedor]
GO
ALTER TABLE [dbo].[ORDEN_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_PEDIDO_EQUIPO] FOREIGN KEY([IDEquipo])
REFERENCES [dbo].[EQUIPO] ([IDEquipo])
GO
ALTER TABLE [dbo].[ORDEN_PEDIDO] CHECK CONSTRAINT [FK_ORDEN_PEDIDO_EQUIPO]
GO
ALTER TABLE [dbo].[ORDEN_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_PEDIDO_PEDIDO] FOREIGN KEY([IDPedido])
REFERENCES [dbo].[PEDIDO] ([IDPedido])
GO
ALTER TABLE [dbo].[ORDEN_PEDIDO] CHECK CONSTRAINT [FK_ORDEN_PEDIDO_PEDIDO]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDO_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK_PEDIDO_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[spDevolverEquipo]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDevolverEquipo]
@prmIdEquipo int
AS

	SELECT e.IDEquipo, e.Modelo, e.Serie, e.Stock,e.Precio ,
		 M.idMarca, DMarca = M.Descripcion,PRO.IDProveedor,DProveedor=PRO.RazonSocial,e.Imagen
	FROM EQUIPO e 
		INNER JOIN Marca M ON e.IDMarca = M.IDMarca
		INNER JOIN Proveedor  PRO ON e.IDProveedor = PRO.IDProveedor
	WHERE e.IDEquipo = @prmIdEquipo

GO
/****** Object:  StoredProcedure [dbo].[spEditarEquipo]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spEditarEquipo]
@prmModelo varchar(30),
@prmSerie varchar(30),
@prmStock int, 
@prmPrecio decimal(10,2),
@prmIdMarca int,
@prmIdProveedor int,
@prmImagen varchar(50),
@prmIdEquipo int
AS

	UPDATE  EQUIPO
	SET Modelo = @prmModelo , Serie  = @prmSerie , Stock = @prmStock,
		Precio =@prmPrecio, IDMarca = @prmIdMarca,IDProveedor =@prmIdProveedor, Imagen = @prmImagen 
		
	WHERE IDEquipo  = @prmIdEquipo

GO
/****** Object:  StoredProcedure [dbo].[spInsertarClientes]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spInsertarClientes]
@prmNombres varchar(30),
@prmApellidos varchar(30),
@prmDireccion varchar(50),
@prmTelefono varchar(15), 
@prmUsuario varchar(30),
@prmPassword varchar(50),
@prmDNI int
AS

	INSERT INTO Cliente(Nombres,Apellidos,Direccion,Telefono,Usuario,Password,DNI)
	VALUES(@prmNombres, @prmApellidos,@prmDireccion,
				@prmTelefono, @prmUsuario, @prmPassword,@prmDNI)


GO
/****** Object:  StoredProcedure [dbo].[spInsertarDetallePedido]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarDetallePedido]

@prmintidEquipo int,
@prmdblPrecio decimal(10,2),
@prmintCantidad int,
@prmdblDescuento decimal(10,2),
@prmintidPedido int 
As

insert into ORDEN_PEDIDO (IDEquipo, Precio_Unitario , Cantidad  ,Descuento ,
                    IDPedido )
values (@prmintidEquipo,@prmdblPrecio,@prmintCantidad,@prmdblDescuento,@prmintidPedido) 



GO
/****** Object:  StoredProcedure [dbo].[spInsertarEquipo]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spInsertarEquipo]
@prmModelo varchar(30),
@prmSerie varchar(30),
@prmStock int,
@prmPrecio decimal(10,2),
@prmIdMarca int,
@prmIdProveedor int,
@prmImagen varchar(50)
AS

	INSERT INTO EQUIPO(Modelo, Serie,Stock, Precio,idMarca,IDProveedor,Imagen)
	VALUES(@prmModelo, @prmSerie,@prmStock,@prmPrecio,
				@prmIdMarca,@prmIdProveedor, @prmImagen)

GO
/****** Object:  StoredProcedure [dbo].[spInsertarPedido]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertarPedido]

@prmintidCliente int,
@prmintidTarjetaCredito int,
@prmstrUsuarioTarjeta varchar(50),
@prmstrNumeroTarjeta varchar(50),
@prmdblTotal decimal(18,2),
@PKCreado int output
As

insert into Pedido(FechaOrden, idCliente , IDTarjeta ,
                    UsuarioTarjeta, NumeroTarjeta , Total)
values (GETDATE(), @prmintidCliente,  @prmintidTarjetaCredito ,@prmstrUsuarioTarjeta ,@prmstrNumeroTarjeta,
            @prmdblTotal) 

set @PKCreado=@@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuarios]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spInsertarUsuarios]
@prmUsuario varchar(30),
@prmPassword varchar(50),
@prmNombres varchar(30),
@prmApellidos varchar(30),
@prmTelefono varchar(20), 
@prmEmail varchar(30)

AS

	INSERT INTO USUARIO([User],[Password],Nombres,Apellidos,Telefono,Email)
	VALUES(@prmUsuario,@prmPassword,@prmNombres, @prmApellidos,
			@prmTelefono,@prmEmail)




GO
/****** Object:  StoredProcedure [dbo].[spListarClientes]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarClientes]
AS
	SELECT IDCliente,Nombres,Apellidos,Direccion , Telefono ,Usuario ,Password ,FechaRegistro ,DNI ,Foto
	FROM Cliente 
	

GO
/****** Object:  StoredProcedure [dbo].[spListarEquipos]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListarEquipos]
AS

	SELECT e.IDEquipo,e.Modelo,e.Serie,e.Stock,e.Precio, M.IDMarca, DMarca = M.Descripcion,
	P.IDProveedor,DProveedor=P.RazonSocial,e.Imagen

	FROM EQUIPO e
		INNER JOIN MARCA M ON e.IDMarca = M.IDMarca
		INNER JOIN Proveedor P on e.IDProveedor=P.IDProveedor
	ORDER BY e.Modelo

GO
/****** Object:  StoredProcedure [dbo].[spListarEquiposxMarca]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListarEquiposxMarca]
@prmintIdMarca int
AS

	SELECT E.IDEquipo, E.Modelo, E.Serie,E.Stock,E.Precio,M.IDMarca, DMarca = M.Descripcion,P.IdProveedor,DProveedor=p.RazonSocial,
	e.Imagen
	FROM EQUIPO E
		INNER JOIN Marca M ON E.idMarca = M.idmarca
		inner join Proveedor P on e.IDProveedor =p.IDProveedor 
	WHERE E.IDMarca  = @prmintIdMarca
	ORDER BY e.Modelo 


GO
/****** Object:  StoredProcedure [dbo].[spListarMarcas]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMarcas]
AS
	SELECT IDMarca,Descripcion
	FROM Marca 
	

GO
/****** Object:  StoredProcedure [dbo].[spListarProveedores]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarProveedores]
AS
	SELECT IDProveedor, RazonSocial,DirProveedor , RUC ,Telefono 
	FROM Proveedor P
	

GO
/****** Object:  StoredProcedure [dbo].[spVerificarAccesoCliente]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVerificarAccesoCliente]
@prmUsuario varchar(30), 
@prmpassword varchar(50)
AS

	SELECT IDCliente, Nombres, Apellidos, Direccion, 
		Telefono, Usuario, Password, FechaRegistro, DNI,Estado,Foto
	FROM Cliente
	WHERE Usuario= @prmUsuario AND [Password] = @prmpassword

GO
/****** Object:  StoredProcedure [dbo].[spVerificarAccesoUsuario]    Script Date: 04/11/2018 11:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVerificarAccesoUsuario]
@prmuser varchar(30), 
@prmpassword varchar(30)
AS

SELECT IDUsuario,[User],[Password], Nombres, Apellidos ,Telefono,Email
	FROM USUARIO 
	WHERE [User]  = @prmuser  

GO
