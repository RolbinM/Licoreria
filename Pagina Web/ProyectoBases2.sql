USE [master]
GO
/****** Object:  Database [ProyectoBases2]    Script Date: 11/12/2021 5:35:42 PM ******/
CREATE DATABASE [ProyectoBases2]
GO
ALTER DATABASE [ProyectoBases2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoBases2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoBases2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoBases2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoBases2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoBases2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoBases2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoBases2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoBases2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoBases2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoBases2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoBases2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoBases2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoBases2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoBases2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoBases2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoBases2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoBases2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoBases2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoBases2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoBases2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoBases2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoBases2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoBases2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoBases2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoBases2] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoBases2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoBases2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoBases2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoBases2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoBases2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoBases2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProyectoBases2] SET QUERY_STORE = OFF
GO
USE [ProyectoBases2]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Cedula] [int] NOT NULL,
	[Nacimiento] [date] NOT NULL,
	[IdTipoCliente] [int] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comida]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
 CONSTRAINT [PK_comida] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datosLicor]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datosLicor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLicor] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[NombreImagen] [varchar](64) NOT NULL,
	[Imagen] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_datosLicor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Nacimiento] [date] NOT NULL,
	[Foto] [varbinary](max) NOT NULL,
	[NombreImagen] [varchar](64) NOT NULL,
	[IdPuesto] [int] NOT NULL,
 CONSTRAINT [PK_empleado_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleadoXsucursal]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleadoXsucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_empleadoXsucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expediente]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expediente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSancion] [int] NOT NULL,
 CONSTRAINT [PK_expediente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPago] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Retencion] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Impuesto] [int] NOT NULL,
	[IdFacturador] [int] NOT NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturaXproducto]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaXproducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [PK_facturaXproducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fichaTecnicaLicor]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fichaTecnicaLicor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLicor] [int] NOT NULL,
	[Procedencia] [varchar](64) NOT NULL,
	[Edad] [int] NOT NULL,
	[IdMaduracion] [int] NOT NULL,
 CONSTRAINT [PK_fichaTecnicaLicor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[licor]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Procedencia] [varchar](64) NOT NULL,
	[Edad] [int] NOT NULL,
	[IdMaduracion] [int] NOT NULL,
	[NombreImagen] [varchar](64) NOT NULL,
	[Imagen] [varbinary](max) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_licor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[licorXcomida]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licorXcomida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLicor] [int] NOT NULL,
	[IdComida] [int] NOT NULL,
 CONSTRAINT [PK_licorXcomida] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[licorXsucursal]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licorXsucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLicor] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_licorXsucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [geography] NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidadXcliente]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidadXcliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdLocalidad] [int] NOT NULL,
 CONSTRAINT [PK_localidadXcliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Salario] [int] NOT NULL,
 CONSTRAINT [PK_puesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sancion]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sancion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [varchar](128) NOT NULL,
	[Monto] [int] NOT NULL,
 CONSTRAINT [PK_sancion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Ubicacion] [geography] NOT NULL,
 CONSTRAINT [PK_sucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoCliente]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tipoCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMaduracion]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMaduracion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tipoMaduracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPago]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tipoPago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoUsuario]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 11/12/2021 5:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_tipoCliente] FOREIGN KEY([IdTipoCliente])
REFERENCES [dbo].[tipoCliente] ([Id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_tipoCliente]
GO
ALTER TABLE [dbo].[datosLicor]  WITH CHECK ADD  CONSTRAINT [FK_datosLicor_licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[licor] ([Id])
GO
ALTER TABLE [dbo].[datosLicor] CHECK CONSTRAINT [FK_datosLicor_licor]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[puesto] ([Id])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_puesto]
GO
ALTER TABLE [dbo].[empleadoXsucursal]  WITH CHECK ADD  CONSTRAINT [FK_empleadoXsucursal_empleado1] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[empleado] ([Id])
GO
ALTER TABLE [dbo].[empleadoXsucursal] CHECK CONSTRAINT [FK_empleadoXsucursal_empleado1]
GO
ALTER TABLE [dbo].[empleadoXsucursal]  WITH CHECK ADD  CONSTRAINT [FK_empleadoXsucursal_sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[empleadoXsucursal] CHECK CONSTRAINT [FK_empleadoXsucursal_sucursal]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [FK_expediente_empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[empleado] ([Id])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [FK_expediente_empleado]
GO
ALTER TABLE [dbo].[expediente]  WITH CHECK ADD  CONSTRAINT [FK_expediente_sancion] FOREIGN KEY([IdSancion])
REFERENCES [dbo].[sancion] ([Id])
GO
ALTER TABLE [dbo].[expediente] CHECK CONSTRAINT [FK_expediente_sancion]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[cliente] ([Id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_sucursal]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_tipoPago] FOREIGN KEY([IdTipoPago])
REFERENCES [dbo].[tipoPago] ([Id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_tipoPago]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_usuario] FOREIGN KEY([IdFacturador])
REFERENCES [dbo].[usuario] ([Id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_usuario]
GO
ALTER TABLE [dbo].[facturaXproducto]  WITH CHECK ADD  CONSTRAINT [FK_facturaXproducto_factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[factura] ([Id])
GO
ALTER TABLE [dbo].[facturaXproducto] CHECK CONSTRAINT [FK_facturaXproducto_factura]
GO
ALTER TABLE [dbo].[facturaXproducto]  WITH CHECK ADD  CONSTRAINT [FK_facturaXproducto_licor] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[licor] ([Id])
GO
ALTER TABLE [dbo].[facturaXproducto] CHECK CONSTRAINT [FK_facturaXproducto_licor]
GO
ALTER TABLE [dbo].[fichaTecnicaLicor]  WITH CHECK ADD  CONSTRAINT [FK_fichaTecnicaLicor_licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[licor] ([Id])
GO
ALTER TABLE [dbo].[fichaTecnicaLicor] CHECK CONSTRAINT [FK_fichaTecnicaLicor_licor]
GO
ALTER TABLE [dbo].[licor]  WITH CHECK ADD  CONSTRAINT [FK_licor_tipoMaduracion] FOREIGN KEY([IdMaduracion])
REFERENCES [dbo].[tipoMaduracion] ([Id])
GO
ALTER TABLE [dbo].[licor] CHECK CONSTRAINT [FK_licor_tipoMaduracion]
GO
ALTER TABLE [dbo].[licorXcomida]  WITH CHECK ADD  CONSTRAINT [FK_licorXcomida_comida] FOREIGN KEY([IdComida])
REFERENCES [dbo].[comida] ([Id])
GO
ALTER TABLE [dbo].[licorXcomida] CHECK CONSTRAINT [FK_licorXcomida_comida]
GO
ALTER TABLE [dbo].[licorXcomida]  WITH CHECK ADD  CONSTRAINT [FK_licorXcomida_licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[licor] ([Id])
GO
ALTER TABLE [dbo].[licorXcomida] CHECK CONSTRAINT [FK_licorXcomida_licor]
GO
ALTER TABLE [dbo].[licorXsucursal]  WITH CHECK ADD  CONSTRAINT [FK_licorXsucursal_licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[licor] ([Id])
GO
ALTER TABLE [dbo].[licorXsucursal] CHECK CONSTRAINT [FK_licorXsucursal_licor]
GO
ALTER TABLE [dbo].[licorXsucursal]  WITH CHECK ADD  CONSTRAINT [FK_licorXsucursal_sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[licorXsucursal] CHECK CONSTRAINT [FK_licorXsucursal_sucursal]
GO
ALTER TABLE [dbo].[localidadXcliente]  WITH CHECK ADD  CONSTRAINT [FK_localidadXcliente_cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[cliente] ([Id])
GO
ALTER TABLE [dbo].[localidadXcliente] CHECK CONSTRAINT [FK_localidadXcliente_cliente]
GO
ALTER TABLE [dbo].[localidadXcliente]  WITH CHECK ADD  CONSTRAINT [FK_localidadXcliente_localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[localidad] ([Id])
GO
ALTER TABLE [dbo].[localidadXcliente] CHECK CONSTRAINT [FK_localidadXcliente_localidad]
GO
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[cliente] ([Id])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_cliente]
GO
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_factura1] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[factura] ([Id])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_factura1]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[tipoUsuario] ([Id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipoUsuario]
GO
USE [master]
GO
ALTER DATABASE [ProyectoBases2] SET  READ_WRITE 
GO
