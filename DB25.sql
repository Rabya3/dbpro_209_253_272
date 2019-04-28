USE [master]
GO
/****** Object:  Database [DB25]    Script Date: 4/28/2019 1:24:08 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 4/28/2019 1:24:09 PM ******/
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
/****** Object:  Table [dbo].[Billing]    Script Date: 4/28/2019 1:24:11 PM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 4/28/2019 1:24:11 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chef]    Script Date: 4/28/2019 1:24:11 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Salary] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[CustomerId] [int] NOT NULL,
	[Paragraphh] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[imagepath] [image] NULL,
 CONSTRAINT [PK_FoodItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeDelivery]    Script Date: 4/28/2019 1:24:11 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[customerId] [int] NOT NULL,
	[foodId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[FoodId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CustomerId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/28/2019 1:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[SQuestion] [nchar](10) NULL,
	[Answer] [nchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchasedItem]    Script Date: 4/28/2019 1:24:11 PM ******/
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
/****** Object:  Table [dbo].[Table]    Script Date: 4/28/2019 1:24:11 PM ******/
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
INSERT [dbo].[Admin] ([Email], [Password]) VALUES (N'Admin@eatry.com', N'123')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (3, N'Fast Food', N'bhdbhb')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (5, N'Chinese', N'jhj')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[FoodItem] ON 

INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (1, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (2, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (3, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (4, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (5, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (6, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (7, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (8, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (9, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (10, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (11, N'Skmch', 3, N'767', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (12, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (13, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (14, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (15, N'', 3, N'', NULL)
INSERT [dbo].[FoodItem] ([Id], [Name], [CategoryId], [Price], [imagepath]) VALUES (16, N'', 3, N'', NULL)
SET IDENTITY_INSERT [dbo].[FoodItem] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Password], [FirstName], [LastName], [Email], [Contact], [SQuestion], [Answer]) VALUES (4, N'123', N'jhahak', N'Khan', N'rabyakhan03@gmail.com', N'65757565', N'lkjrlkjyre', N'dsfs      ')
INSERT [dbo].[Person] ([Id], [Password], [FirstName], [LastName], [Email], [Contact], [SQuestion], [Answer]) VALUES (5, N'123', N'jhahak', N'Khan', N'rabyakhan03@gmail.com', N'65757565', N'lkjrlkjyre', N'dsfs      ')
SET IDENTITY_INSERT [dbo].[Person] OFF
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_Customer]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_Order]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Table] FOREIGN KEY([TableNo])
REFERENCES [dbo].[Table] ([No])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Table]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [PK_Customer_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [PK_Customer_Person]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [PK_Employee_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [PK_Employee_Person]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
ALTER TABLE [dbo].[FoodItem]  WITH CHECK ADD  CONSTRAINT [FK_FoodItem_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[FoodItem] CHECK CONSTRAINT [FK_FoodItem_Category]
GO
ALTER TABLE [dbo].[HomeDelivery]  WITH CHECK ADD  CONSTRAINT [FK_HomeDelivery_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[HomeDelivery] CHECK CONSTRAINT [FK_HomeDelivery_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Chef] FOREIGN KEY([Id])
REFERENCES [dbo].[Chef] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Chef]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Customer]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_FoodItem] FOREIGN KEY([FoodId])
REFERENCES [dbo].[FoodItem] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_FoodItem]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[PurchasedItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedItem_Billing] FOREIGN KEY([BillingId])
REFERENCES [dbo].[Billing] ([Id])
GO
ALTER TABLE [dbo].[PurchasedItem] CHECK CONSTRAINT [FK_PurchasedItem_Billing]
GO
ALTER TABLE [dbo].[PurchasedItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedItem_FoodItem] FOREIGN KEY([FoodId])
REFERENCES [dbo].[FoodItem] ([Id])
GO
ALTER TABLE [dbo].[PurchasedItem] CHECK CONSTRAINT [FK_PurchasedItem_FoodItem]
GO
ALTER TABLE [dbo].[PurchasedItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[PurchasedItem] CHECK CONSTRAINT [FK_PurchasedItem_Order]
GO
USE [master]
GO
ALTER DATABASE [DB25] SET  READ_WRITE 
GO
