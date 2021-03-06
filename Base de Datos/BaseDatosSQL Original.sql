USE [master]
GO
/****** Object:  Database [ProyectoBases2]    Script Date: 18/11/2021 8:00:10 ******/
CREATE DATABASE [ProyectoBases2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoBases2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoBases2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoBases2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoBases2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
/****** Object:  User [usersql]    Script Date: 18/11/2021 8:00:11 ******/
CREATE USER [usersql] FOR LOGIN [usersql] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 18/11/2021 8:00:11 ******/
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
	[CorreoElectronico] [varchar](64) NULL,
	[IdLocalidad] [int] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comida]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_comida] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datosLicor]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[empleado]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[empleadoXsucursal]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[Errores]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDate] [datetime] NULL,
 CONSTRAINT [PK_Errores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expediente]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[factura]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Retencion] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturaXproducto]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaXproducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_facturaXproducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fichaTecnicaLicor]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[licor]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[licorXcomida]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[licorXsucursal]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[localidad]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[puesto]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[sancion]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[sucursal]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Ubicacion] [geography] NOT NULL,
	[Horario] [varchar](64) NULL,
 CONSTRAINT [PK_sucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoCliente]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[tipoEnvio]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoEnvio](
	[Id] [int] NOT NULL,
	[IdLocalidad] [int] NOT NULL,
 CONSTRAINT [PK_tipoEnvio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMaduracion]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[tipoPago]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[tipoUsuario]    Script Date: 18/11/2021 8:00:11 ******/
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
/****** Object:  Table [dbo].[transaccion]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTipoPago] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Username] [varchar](32) NULL,
	[Contraseña] [varchar](32) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[localidad] ([Id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_localidad]
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
ALTER TABLE [dbo].[tipoEnvio]  WITH CHECK ADD  CONSTRAINT [FK_tipoEnvio_factura] FOREIGN KEY([Id])
REFERENCES [dbo].[factura] ([Id])
GO
ALTER TABLE [dbo].[tipoEnvio] CHECK CONSTRAINT [FK_tipoEnvio_factura]
GO
ALTER TABLE [dbo].[tipoEnvio]  WITH CHECK ADD  CONSTRAINT [FK_tipoEnvio_localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[localidad] ([Id])
GO
ALTER TABLE [dbo].[tipoEnvio] CHECK CONSTRAINT [FK_tipoEnvio_localidad]
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
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_tipoPago] FOREIGN KEY([IdTipoPago])
REFERENCES [dbo].[tipoPago] ([Id])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_tipoPago]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[tipoUsuario] ([Id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarPrecioLicor]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ActualizarPrecioLicor]
@inIdLicor INT,
@inPrecio INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF(EXISTS(SELECT Id FROM dbo.licor WHERE Id = @inIdLicor))
		BEGIN
			UPDATE dbo.licor
			SET
				Precio = @inPrecio
			WHERE Id = @inIdLicor
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarEmpleadosXSucursal]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarEmpleadosXSucursal]
	@inIdSucursal INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;


		IF(EXISTS(SELECT Id FROM dbo.sucursal WHERE Id = @inIdSucursal))
		BEGIN
			SELECT
				E.Id AS Id,
				E.Nombre AS Nombre,
				E.Telefono AS Telefono,
				E.Nacimiento AS Nacimiento,
				E.Foto AS Foto,
				E.NombreImagen AS NombreImagen,
				P.Nombre AS Puesto
			FROM dbo.empleado E INNER JOIN dbo.puesto P
			ON P.Id = E.IdPuesto INNER JOIN dbo.empleadoXsucursal ES
			ON E.Id = ES.IdEmpleado INNER JOIN dbo.sucursal S
			ON S.Id = ES.IdSucursal
			WHERE S.Id = @inIdSucursal
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe la sucursal
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarExistencias]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarExistencias]
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @OutResultCode INT
    SET @OutResultCode = 0

    BEGIN TRY
        SELECT 
            S.Nombre AS NombreSucursal,
            L.Nombre AS NombreLicor,
            L.Precio AS Precio,
            LS.Cantidad AS Cantidad
        FROM Licor L INNER JOIN licorXsucursal LS
            ON L.Id = LS.IdLicor INNER JOIN sucursal S 
            ON LS.IdSucursal = S.Id


    END TRY
    BEGIN CATCH
        INSERT INTO dbo.Errores VALUES(
            ERROR_NUMBER(),
            ERROR_STATE(),
            ERROR_SEVERITY(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE(),
            GETDATE()
        )

        SET @OutResultCode = 501;                -- Error al consultar

    END CATCH

    SET NOCOUNT OFF

    SELECT @OutResultCode
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarExistenciasXSucursal]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarExistenciasXSucursal]
    @inIdSucursal INT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @OutResultCode INT
    SET @OutResultCode = 0

    BEGIN TRY


        IF EXISTS(SELECT Id FROM Sucursal WHERE Id = @inIdSucursal)
        BEGIN
            SELECT 
                S.Nombre AS NombreSucursal,
                L.Nombre AS NombreLicor,
                L.Precio AS Precio,
                LS.Cantidad AS Cantidad
            FROM Licor L INNER JOIN licorXsucursal LS
                ON L.Id = LS.IdLicor INNER JOIN sucursal S 
                ON LS.IdSucursal = S.Id
            WHERE S.Id = @inIdSucursal

        END
        ELSE
        BEGIN
            SET @OutResultCode = 1
        END
    END TRY
    BEGIN CATCH
        INSERT INTO dbo.Errores VALUES(
            ERROR_NUMBER(),
            ERROR_STATE(),
            ERROR_SEVERITY(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE(),
            GETDATE()
        )

        SET @OutResultCode = 501;                -- Error al consultar

    END CATCH

    SET NOCOUNT OFF

    SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarLicor]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarLicor]
@inIdLicor INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF(EXISTS(SELECT Id FROM dbo.licor WHERE Id = @inIdLicor))
		BEGIN
			SELECT
				L.Id AS Id,
				L.Nombre AS Nombre,
				L.Procedencia AS Procedencia,
				L.Edad AS Edad,
				TP.Nombre AS TipoMaduracion,
				L.NombreImagen AS NombreImagen,
				L.Imagen AS Imagen,
				L.Precio AS Precio
			FROM dbo.licor L INNER JOIN dbo.tipoMaduracion TP
			ON TP.Id = L.IdMaduracion
			WHERE L.Id = @inIdLicor
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarPrecioLicor]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ConsultarPrecioLicor]
@inIdLicor INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF(EXISTS(SELECT Id FROM dbo.licor WHERE Id = @inIdLicor))
		BEGIN
			SELECT
				Precio 
			FROM dbo.licor
			WHERE Id = @inIdLicor
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarSucursalXLicor]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarSucursalXLicor]
	@inIdLicor INT,
	@inIdLocalidad INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		DECLARE @puntoInicio GEOGRAPHY = (SELECT Ubicacion FROM localidad WHERE Id = @inIdLocalidad)


		IF(EXISTS(SELECT Id FROM dbo.licor WHERE Id = @inIdLicor))
		BEGIN
			SELECT
				S.Id,
				S.Nombre,
				S.Ubicacion,
				S.Horario,
				S.Ubicacion.STDistance(@puntoInicio) AS Distancia
			FROM dbo.licor L INNER JOIN dbo.licorXsucursal LS
			ON L.Id = LS.IdLicor
			INNER JOIN sucursal S ON S.Id = LS.IdSucursal
			WHERE L.Id = @inIdLicor AND LS.Cantidad > 0
			ORDER BY S.Ubicacion.STDistance(@puntoInicio)


		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearFactura]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearFactura]
@inIdCliente INT,
@inIdSucursal INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF EXISTS(SELECT Id FROM cliente WHERE Id = @inIdCliente)
		BEGIN
			IF EXISTS(SELECT Id FROM sucursal WHERE Id = @inIdSucursal)
			BEGIN
				INSERT INTO factura
				(
					IdCliente,
					Retencion,
					Total,
					IdSucursal,
					Fecha,
					Impuesto,
					Activo
				)
				VALUES
				(
					@inIdCliente,
					0.0,
					0,
					@inIdSucursal,
					getdate(),
					0.0,
					1
				)
			END
			ELSE
			BEGIN
				SET @OutResultCode = 501;
			END
		END
		ELSE
		BEGIN
			SET @OutResultCode = 501;
		END

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProductosFactura]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarProductosFactura]
@inIdFacturaProducto INT,
@inIdProducto INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @Sucursal INT
		DECLARE @Factura INT --Factura cliente
		DECLARE @Cantidad INT
		DECLARE @PrecioLicor INT --PrecioBebida
		SET @OutResultCode = 0;

		SET @Factura = (SELECT Idfactura From facturaXproducto WHERE Id = @inIdFacturaProducto)

		SET @Sucursal = (SELECT IdSucursal FROM factura WHERE Id = @Factura)

		IF EXISTS(SELECT Id FROM factura 
					WHERE Id = @Factura AND Activo = 1) --Existe factura abierta
		BEGIN
			IF EXISTS(SELECT IdLicor FROM licorXsucursal 
						WHERE IdLicor = @inIdProducto AND  IdSucursal = @Sucursal) --Licor existe en esa sucursal

			BEGIN

				SET @Factura = (SELECT MAX(Id) FROM factura 
								WHERE Activo = 1 AND Id = @Factura)

				SET @Cantidad = (SELECT Cantidad FROM facturaXproducto 
										WHERE IdProducto = @inIdProducto AND Id = @inIdFacturaProducto)

				SET @PrecioLicor = (SELECT Precio FROM licor WHERE Id = @inIdProducto)

					
					UPDATE licorXsucursal
					SET 
						Cantidad = Cantidad +  @Cantidad
					WHERE IdLicor = @inIdProducto AND IdSucursal = @Sucursal --Devuelvo inventario

					UPDATE factura 
					SET
						Total = Total - (@PrecioLicor * @Cantidad),
						Impuesto = Impuesto - ((@PrecioLicor * @Cantidad)*0.13)
					WHERE Id = @Factura --Remuevo valores de factura

					DELETE FROM facturaXproducto WHERE Id = @inIdFacturaProducto --Elimino productos 

			END
			ELSE
			BEGIN
				SET @OutResultCode = 501; --No existe el licor
			END
		END
		ELSE
		BEGIN
			SET @OutResultCode = 501; --No existe el cliente
		END

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerarTransaccion]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerarTransaccion]
@inIdFactura INT,
@inIdTipoPago INT,
@inAcumuladoMensual INT, --Aplicar el descuento
@inIdUbicacion INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @Sucursal INT
		DECLARE @Cliente INT
		DECLARE @Total INT
		DECLARE @TotalMensual INT
		DECLARE @CantCompras INT
		DECLARE @Descuento INT
		DECLARE @Retencion FLOAT

		SET @OutResultCode = 0;

		SET @Cliente = (SELECT IdCliente FROM factura WHERE Activo = 1 AND Id = @inIdFactura)

		IF EXISTS (SELECT MAX(ID) FROM factura WHERE Activo = 1 AND IdCliente = @Cliente)
		BEGIN
			SET @Total = ( SELECT (Total + Impuesto) FROM factura WHERE Id = @inIdFactura)

			IF (@Total > 0)
			BEGIN

				
				SET @TotalMensual = (SELECT (Total + Impuesto) FROM factura 
										WHERE Fecha < DATEADD(month, -1, GETDATE()) 
										AND IdCliente = @Cliente 
										AND Activo = 0) --Mes pasado acumulado, cliente y factura cerrada //PROBAR

				SET @CantCompras = (SELECT COUNT (DISTINCT Id) FROM factura 
										WHERE Fecha < DATEADD(month, -1, GETDATE()) 
										AND IdCliente = @Cliente 
										AND Activo = 0) --Cantidad compras ultimo mes
				
				IF (@CantCompras >= 5)
				BEGIN
					UPDATE cliente
					SET
					IdTipoCliente = 2
					WHERE Id = @Cliente --Cliente VIP
				END
				
				IF (@TotalMensual >= @inAcumuladoMensual)
				BEGIN
					SET @Descuento = (@Total * 0.1)
					UPDATE factura
					SET
					Total = Total - @Descuento
					WHERE Id = @inIdFactura --Agrego descuento
				END


				IF (@inIdTipoPago = 2) --Tarjeta
				BEGIN
					SET @Retencion = (@Total * 0.1)
					
					UPDATE factura
					SET
					Retencion = @Retencion
					WHERE Id = @inIdFactura --Agrego retencion
				END

				INSERT INTO transaccion
				(
					IdFactura,
					IdCliente,
					IdTipoPago,
					Fecha
				)
				VALUES
				(
					@inIdFactura,
					@Cliente,
					@inIdTipoPago,
					GETDATE()
				) --INGRESO transaccion

				UPDATE factura
					SET
					Activo = 0
				WHERE Id = @inIdFactura --Cierro Factura


				IF (@inIdUbicacion IS NOT NULL)
				BEGIN
					INSERT INTO dbo.tipoEnvio(
						Id,
						IdLocalidad
					)VALUES(
						@inIdFactura,
						@inIdUbicacion
					)
				END


			END
			ELSE
			BEGIN
				SET @OutResultCode = 501;				-- No hay compras
			END

		END
		ELSE
		BEGIN
			SET @OutResultCode = 501;				-- No existe la factura
		END

		

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCliente]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCliente]
@inNombre VARCHAR(64),
@inCedula INT,
@inNacimiento DATE,
@inCorreo VARCHAR(64),
@inLatitud DECIMAL,
@inLongitud DECIMAL
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @Edad INT
		DECLARE @IdCliente INT
		SET @OutResultCode = 0;

		IF EXISTS(SELECT Id FROM cliente WHERE Cedula = @inCedula)
		BEGIN
			SET @OutResultCode = 1;
		END
		ELSE
		BEGIN
			SET @Edad = (Select DATEDIFF(YEAR,@inNacimiento,GETDATE()))

			IF ( @Edad >= 18)
			BEGIN
				EXEC sp_InsertarLocalidadCliente @inLatitud, @inLongitud

				INSERT INTO dbo.cliente(
					Nombre,
					Cedula,
					Nacimiento,
					CorreoElectronico,
					IdTipoCliente,
					IdLocalidad
				)VALUES(
					@inNombre,
					@inCedula,
					@inNacimiento,
					@inCorreo,
					1,
					(SELECT MAX(Id) FROM dbo.localidad)
				)

			END
			ELSE
			BEGIN
				SET @OutResultCode = 2;
			END
		END

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode AS Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarComida]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarComida]
@inNombre VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.Comida(
			Nombre
		)VALUES(
			@inNombre
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEmpleado]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarEmpleado]
@inNombre VARCHAR(64),
@inSucursal INT,
@inTelefono INT,
@inNacimiento DATE,
@inImagen VARBINARY(MAX),
@inNombreImagen VARCHAR(64),
@inPuesto INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @IdEmpleado INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.empleado(
			Nombre,
			Telefono,
			Nacimiento,
			Foto,
			NombreImagen,
			IdPuesto
		)VALUES(
			@inNombre,
			@inTelefono,
			@inNacimiento,
			@inImagen,
			@inNombreImagen,
			@inPuesto
		)

		SET @IdEmpleado = (SELECT MAX(Id) FROM dbo.empleado)

		INSERT INTO empleadoXsucursal(
			IdSucursal,
			IdEmpleado
		)VALUES(
			@inSucursal,
			@IdEmpleado
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarLicor]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarLicor]
@inNombre VARCHAR(64),
@inProcedencia VARCHAR(64),
@inEdad INT,
@inIdTipoMaduracion INT,
@inNombreImagen VARCHAR(64),
@inImagen VARBINARY(MAX),
@inPrecio INT,
@inComidas NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @idLicor INT
		DECLARE @Count INT

		DECLARE @Comidas TABLE				-- Tabla para almacenar las comidas
		(	
			Nombre VARCHAR(64)
		)

		SET @OutResultCode = 0;


		-- Inserción de licor
		INSERT INTO dbo.licor(
			Nombre,
			Procedencia,
			Edad,
			IdMaduracion,
			NombreImagen,
			Imagen,
			Precio
		)VALUES(
			@inNombre,
			@inProcedencia,
			@inEdad,
			@inIdTipoMaduracion,
			@inNombreImagen,
			@inImagen,
			@inPrecio
		)


		SET @idLicor = (SELECT MAX(Id) FROM dbo.licor)

		-- Inserción de Fragmentación de Licor en DatosLicor y FichaTecnicaLicor
		INSERT INTO dbo.fichaTecnicaLicor(
			IdLicor,
			Procedencia,
			Edad,
			IdMaduracion
		)VALUES(
			@idLicor,
			@inProcedencia,
			@inEdad,
			@inIdTipoMaduracion
		)


		INSERT INTO dbo.datosLicor(
			IdLicor,
			Nombre,
			NombreImagen,
			Imagen
		)VALUES(
			@idLicor,
			@inNombre,
			@inNombreImagen,
			@inImagen
		)


		-- Inserción de comidas para este licor
		INSERT INTO @Comidas
		SELECT
			Value
		FROM OPENJSON(@inComidas, '$.Comidas')

		SELECT @Count = COUNT(*) FROM @Comidas;


		WHILE @Count>0
		BEGIN
			INSERT INTO dbo.comida
			SELECT
				TOP(1)Nombre
			FROM @Comidas


			INSERT INTO dbo.licorXcomida(
				IdComida,
				IdLicor
			)VALUES(
				(SELECT MAX(Id) FROM dbo.comida),
				@idLicor
			)



			DELETE TOP (1) FROM @Comidas
			SELECT @Count = COUNT(*) FROM @Comidas;

		END


		SET @OutResultCode = 0

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarLicorXSucursal]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarLicorXSucursal]
@inLicor INT,
@inSucursal INT,
@inCantidad INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF EXISTS(SELECT Id FROM licorXsucursal WHERE IdSucursal = @inSucursal AND IdLicor = @inLicor)
		BEGIN
			UPDATE licorXsucursal
			SET 
			Cantidad = Cantidad + @inCantidad
			WHERE IdSucursal = @inSucursal AND IdLicor = @inLicor
		END
		ELSE
		BEGIN
			INSERT INTO dbo.licorXsucursal(
				IdLicor,
				IdSucursal,
				Cantidad
			)VALUES(
				@inLicor,
				@inSucursal,
				@inCantidad
			)
		END

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarLocalidadCliente]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarLocalidadCliente]
	@inLatitud DECIMAL,
	@inLongitud DECIMAL
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		DECLARE @Ubicacion GEOGRAPHY = CONCAT('POINT(', @inLatitud, ' ', @inLongitud,')')

		INSERT INTO dbo.localidad(
			Ubicacion
		)VALUES(
			@Ubicacion
		)


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarPuesto]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarPuesto]
@inNombre VARCHAR(64),
@inSalario INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.puesto(
			Nombre,
			Salario
		)VALUES(
			@inNombre,
			@inSalario
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarSancion]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarSancion]
@inIdEmpleado INT,
@inDetalle VARCHAR (128),
@inMonto INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @IdSancion INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.sancion(
			Detalle,
			Monto
		)VALUES(
			@inDetalle,
			@inMonto
		)

		SET @IdSancion = (SELECT MAX(Id) FROM dbo.sancion)

		INSERT INTO expediente(
			IdEmpleado,
			IdSancion
		)VALUES(
			@inIdEmpleado,
			@IdSancion
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarSucursal]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarSucursal]
@inNombre VARCHAR (64),
@inUbicacion GEOGRAPHY,
@inHorario VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.sucursal(
			Nombre,
			Ubicacion,
			Horario
		)VALUES(
			@inNombre,
			@inUbicacion,
			@inHorario
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTipoCliente]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarTipoCliente]
@inNombre VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.tipoCliente(
			Nombre
		)VALUES(
			@inNombre
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTipoMaduracion]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarTipoMaduracion]
@inNombre VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.tipoMaduracion(
			Nombre
		)VALUES(
			@inNombre
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTipoPago]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarTipoPago]
@inNombre VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.tipoPago(
			Nombre
		)VALUES(
			@inNombre
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTipoUsuario]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarTipoUsuario]
@inNombre VARCHAR(64)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		INSERT INTO dbo.tipoUsuario(
			Nombre
		)VALUES(
			@inNombre
		)

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductosAFactura]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProductosAFactura]
@inIdCliente INT,
@inIdSucursal INT,
@inIdProducto INT,
@inCantidad INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		DECLARE @CantDisponible INT --Cantidad de bebidas disponibles en X sucursal
		DECLARE @Factura INT --Factura cliente
		DECLARE @PrecioLicor INT --PrecioBebida
		SET @OutResultCode = 0;

		IF EXISTS(SELECT Id FROM cliente 
					WHERE Id = @inIdCliente) --Existe cliente y es mayor
		BEGIN
			IF EXISTS(SELECT IdLicor FROM licorXsucursal 
						WHERE IdLicor = @inIdProducto AND  IdSucursal = @inIdSucursal)

			BEGIN
				
				IF NOT EXISTS (SELECT MAX(Id) FROM factura 
								WHERE Activo = 1 AND IdCliente = @inIdCliente) --Cliente sin factura abierta
					BEGIN
						EXEC sp_CrearFactura @inIdCliente, @inIdSucursal
					END

				SET @Factura = (SELECT MAX(Id) FROM factura 
								WHERE Activo = 1 AND IdCliente = @inIdCliente)

				SET @CantDisponible = (SELECT Cantidad FROM licorXsucursal 
										WHERE IdLicor = @inIdProducto AND IdSucursal = @inIdSucursal)

				SET @PrecioLicor = (SELECT Precio FROM licor WHERE Id = @inIdProducto)

				IF ( @CantDisponible >= @inCantidad )
				BEGIN
					INSERT INTO facturaXproducto
					(
						IdFactura,
						IdProducto,
						Cantidad
					)
					VALUES
					(
						@Factura,
						@inIdProducto,
						@inCantidad
					
					)--Aumento carrito
					
					UPDATE licorXsucursal
					SET 
						Cantidad = Cantidad - @inCantidad
					WHERE IdLicor = @inIdProducto AND IdSucursal = @inIdSucursal --Reduzco inventario

					UPDATE factura 
					SET
						Total = Total + (@PrecioLicor * @inCantidad),
						Impuesto = Impuesto + ((@PrecioLicor * @inCantidad)*0.13)
					WHERE Id = @Factura --Aumento valores de factura


				END
				ELSE
				BEGIN
					SET @OutResultCode = 501; -- No hay cantidad suficiente
				END

			END
			ELSE
			BEGIN
				SET @OutResultCode = 501; --No existe el licor
			END
		END
		ELSE
		BEGIN
			SET @OutResultCode = 501; --No existe el cliente
		END

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarAdministrador]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarAdministrador]
@inUsuario VARCHAR(32),
@inContraseña VARCHAR(32)
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF(EXISTS(SELECT Id FROM dbo.usuario WHERE Username = @inUsuario AND Contraseña = @inContraseña))
		BEGIN
			SET @OutResultCode = 0;
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode AS Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarCliente]    Script Date: 18/11/2021 8:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarCliente]
@inCedula INT
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @OutResultCode INT
		SET @OutResultCode = 0;

		IF(EXISTS(SELECT Id FROM dbo.cliente WHERE Cedula = @inCedula))
		BEGIN
			SET @OutResultCode = 0;
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;	-- No existe el licor
		END


	END TRY
	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES(
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_MESSAGE(),
			GETDATE()
		)

		SET @OutResultCode = 501;				-- Error al consultar

	END CATCH

	SET NOCOUNT OFF

	SELECT @OutResultCode AS Codigo
END
GO
USE [master]
GO
ALTER DATABASE [ProyectoBases2] SET  READ_WRITE 
GO
