USE [master]
GO
/****** Object:  Database [tours Savchenko]    Script Date: 23.03.2023 15:01:04 ******/
CREATE DATABASE [tours Savchenko]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tours Savchenko', FILENAME = N'C:\Users\Ad\tours Savchenko.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tours Savchenko_log', FILENAME = N'C:\Users\Ad\tours Savchenko_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tours Savchenko] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tours Savchenko].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tours Savchenko] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tours Savchenko] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tours Savchenko] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tours Savchenko] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tours Savchenko] SET ARITHABORT OFF 
GO
ALTER DATABASE [tours Savchenko] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tours Savchenko] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tours Savchenko] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tours Savchenko] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tours Savchenko] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tours Savchenko] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tours Savchenko] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tours Savchenko] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tours Savchenko] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tours Savchenko] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tours Savchenko] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tours Savchenko] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tours Savchenko] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tours Savchenko] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tours Savchenko] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tours Savchenko] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tours Savchenko] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tours Savchenko] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tours Savchenko] SET  MULTI_USER 
GO
ALTER DATABASE [tours Savchenko] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tours Savchenko] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tours Savchenko] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tours Savchenko] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tours Savchenko] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tours Savchenko] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tours Savchenko] SET QUERY_STORE = OFF
GO
USE [tours Savchenko]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfAtars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Descriprion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 23.03.2023 15:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour_1] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [Name], [Descriprion]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([id], [Name], [Descriprion]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([id], [Name], [Descriprion]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([id], [Name], [Descriprion]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([id], [Name], [Descriprion]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country1] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country1]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel1] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel1]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [tours Savchenko] SET  READ_WRITE 
GO
