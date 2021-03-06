USE [master]
GO
/****** Object:  Database [DB25]    Script Date: 5/4/2019 8:10:43 PM ******/
CREATE DATABASE [DB25]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB25', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB25.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB25_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB25_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB25] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB25].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB25] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB25] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB25] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB25] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB25] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB25] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB25] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DB25] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB25] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB25] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB25] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB25] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB25] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB25] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB25] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB25] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB25] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB25] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB25] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB25] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB25] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB25] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB25] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB25] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB25] SET  MULTI_USER 
GO
ALTER DATABASE [DB25] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB25] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB25] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB25] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DB25]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Billing](
	[Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TotalAmount] [varchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[MinLimit] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] NOT NULL,
	[TableNo] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[TableNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chef]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chef](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_Chef] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[SQuestion] [nvarchar](50) NOT NULL,
	[SAnswer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Salary] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[CustomerId] [int] NOT NULL,
	[Paragraphh] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodItem](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[IsSpecial] [varchar](50) NULL,
	[imagepath] [varchar](max) NULL,
 CONSTRAINT [PK_FoodItem] PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[foodwa]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[foodwa](
	[id] [nchar](10) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[path] [varchar](max) NOT NULL,
 CONSTRAINT [PK_foodwa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HomeDelivery]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeDelivery](
	[Id] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[DispatchedTime] [time](7) NOT NULL,
 CONSTRAINT [PK_HomeDelivery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[customerId] [int] NOT NULL,
	[foodId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchasedItem]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchasedItem](
	[OrderId] [int] NOT NULL,
	[FoodId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[BillingId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TotalAmount] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PurchasedItem] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table](
	[No] [int] NOT NULL,
	[Details] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 5/4/2019 8:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1](
	[UserType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[UserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([Email], [Password]) VALUES (N'Admin@eatry.com', N'123')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Fast Food')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'Chinese')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (6, N'Skmch')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (7, N'Rabia')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (1, N'Ahmad@yahoo.com', N'345', N'bhjb', N'nbnmb', N'Abu Sadiq Block kjhkjhj', N'3553', N'jwnerjk', N'mlk')
INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (2, N'rabyakhan03@gmail.com', N'Password', N'jkwhqjhe', N'Khan', N'Abu Sadiq Block', N'0334045823', N'jkhjkh', N'nm')
INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (4, N'roota@domain.com', N'hhhh', N'hekahmja', N'mdbjha', N'adbjbd', N'322444', N'lkjrlkjyre', N'adbjbd')
INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (5, N'rabyakhan@gmail.com', N'bnj', N'jhahak', N'Khan', N'Abu Sadiq Block', N'0334045823', N'jkhjkh', N'Abu Sadiq Block')
INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (6, N'rabyakhan1111@gmail.com', N'bnj', N'jhahak', N'Khan', N'Abu Sadiq Block', N'0334045823', N'jkhjkh', N'Abu Sadiq Block')
INSERT [dbo].[Customer] ([Id], [Email], [Password], [FirstName], [LastName], [Address], [Contact], [SQuestion], [SAnswer]) VALUES (7, N'rabyakhan00@gmail.com', N'123', N'jhahak', N'bds', N'Abu Sadiq Block', N'0334045823', N'jkhjkh', N'Abu Sadiq Block')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Contact], [Address], [Designation], [Salary]) VALUES (1, N'jhahak', N'Khan', N'0348590843', N'Abu Sadiq Block', N'bbb', N'666')
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Contact], [Address], [Designation], [Salary]) VALUES (2, N'jhahak', N'Khan', N'0348590843', N'Abu Sadiq Block', N'bbb', N'666')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[FoodItem] ON 

INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1003, N'ff', 5, N'dd', N'ee', N'~/Image/SI_20171126_204951193715673.jpg')
INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1004, N'ff', 5, N'dd', N'ee', N'~/Image/SI_20171126_204951193727590.jpg')
INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1005, N'burger', 3, N'1000', N'yes', N'~/Image/food2194512119.jpg')
INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1006, N'ddd', 3, N'699', N'no', N'~/Image/food2191001110.jpg')
INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1007, N'nbnbn', 3, N'767', N'nbn', N'~/Content/images/UploadsDel191837412.png')
INSERT [dbo].[FoodItem] ([FoodId], [FoodName], [CategoryId], [Price], [IsSpecial], [imagepath]) VALUES (1008, N'hh', 3, N'699', N'no', N'~/Content/images/Uploadsfood2191631115.jpg')
SET IDENTITY_INSERT [dbo].[FoodItem] OFF
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Table] FOREIGN KEY([TableNo])
REFERENCES [dbo].[Table] ([No])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Table]
GO
ALTER TABLE [dbo].[FoodItem]  WITH CHECK ADD  CONSTRAINT [FK_FoodItem_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[FoodItem] CHECK CONSTRAINT [FK_FoodItem_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_FoodItem] FOREIGN KEY([foodId])
REFERENCES [dbo].[FoodItem] ([FoodId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_FoodItem]
GO
USE [master]
GO
ALTER DATABASE [DB25] SET  READ_WRITE 
GO
