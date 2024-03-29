USE [master]
GO
/****** Object:  Database [E-commerce]    Script Date: 18.07.2019 21:06:54 ******/
CREATE DATABASE [E-commerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-commerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\E-commerce.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E-commerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\E-commerce_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E-commerce] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-commerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-commerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-commerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-commerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-commerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-commerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-commerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-commerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-commerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-commerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-commerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-commerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-commerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-commerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-commerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-commerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-commerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-commerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-commerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-commerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-commerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-commerce] SET  MULTI_USER 
GO
ALTER DATABASE [E-commerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-commerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-commerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-commerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [E-commerce] SET DELAYED_DURABILITY = DISABLED 
GO
USE [E-commerce]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[billName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](500) NOT NULL,
	[code] [int] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[campaign_id] [int] IDENTITY(1,1) NOT NULL,
	[discountRate] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[lastDate] [datetime] NOT NULL,
	[compaignDetail] [nvarchar](max) NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categori_id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[model_id] [int] IDENTITY(1,1) NOT NULL,
	[modelName] [nvarchar](500) NOT NULL,
	[code] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[orderName] [nvarchar](500) NULL,
	[orderDate] [datetime] NULL,
	[deliveryDate] [datetime] NULL,
	[product_id] [int] NULL,
	[shipper_id] [int] NULL,
	[user_id] [int] NULL,
	[bill_id] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[orderStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[orderStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](500) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[categori_id] [int] NOT NULL,
	[photo] [varchar](max) NOT NULL,
	[brand_id] [int] NOT NULL,
	[productIsProved] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[productDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[properties] [nvarchar](500) NOT NULL,
	[propertiesDetail] [nvarchar](max) NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Detail] PRIMARY KEY CLUSTERED 
(
	[productDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Order]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Order](
	[productOrder_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Order] PRIMARY KEY CLUSTERED 
(
	[productOrder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Photo]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Photo](
	[productPhoto_id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [varchar](max) NOT NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Product_Photo] PRIMARY KEY CLUSTERED 
(
	[productPhoto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](500) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[shipper_id] [int] IDENTITY(1,1) NOT NULL,
	[shipperName] [nvarchar](500) NOT NULL,
	[ShipperDetail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[shipper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[lastName] [nvarchar](500) NOT NULL,
	[title] [nvarchar](500) NOT NULL,
	[adress] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](500) NOT NULL,
	[email] [nvarchar](500) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[rePassword] [nvarchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[surName] [nvarchar](500) NOT NULL,
	[phone] [varchar](500) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 18.07.2019 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([bill_id], [billName]) VALUES (1, N'Samsung Yetkili Servisi')
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (1, N'samsung S4', 12345)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (2, N'lenovo2', 54321)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (3, N'Iphone', 12345)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (5, N'Vestel', 5898)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (6, N'Huawei', 6546)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (7, N'Xiaomi', 7896)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (8, N'Nikon', 7896)
INSERT [dbo].[Brand] ([brand_id], [brandName], [code]) VALUES (9, N'Canon', 2366)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (5, N'Computer')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (6, N'Phone')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (7, N'Refrigerator')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (8, N'Tablet')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (12, N'Photograph')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (13, N'Television')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (14, N'Camera')
INSERT [dbo].[Category] ([categori_id], [categoryName]) VALUES (15, N'Storage')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (1, N'Iphone 5s', 123, 3)
INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (5, N'XR', 789, 3)
INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (6, N'sm-9300', 12356, 1)
INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (7, N'merhbaa', 123, 2)
INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (8, N'Iphone 5s', 6486, 1)
INSERT [dbo].[Model] ([model_id], [modelName], [code], [brand_id]) VALUES (9, N'P 30', 12333, 6)
SET IDENTITY_INSERT [dbo].[Model] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (18, N'deneme', 1, 0, 15, 5, N'/Uploads/Foto/23c101f4-08ce-4102-a4ca-38b64f13cd78.jpg', 1, NULL)
INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (19, N'Iphone 7 plus', 2, 1, 1000, 6, N'/Uploads/Foto/2ba2ecb5-b735-46c2-b087-c359e6b463e0.jpg', 1, NULL)
INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (20, N'Nikon machine', 1, 1, 1000, 12, N'/Uploads/Foto/713bedf4-2c83-4cf1-94d7-0f31b171ea99.jpg', 8, NULL)
INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (21, N'test ürün2', 2, 1, 2000, 12, N'/Uploads/Foto/46f65841-ac42-4e06-9c01-b48051209945.jpg', 9, NULL)
INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (22, N'test ürün 4', 2, 0, 5000, 12, N'/Uploads/Foto/7e4b5668-9ad9-49b8-8d05-b91c510c7f72.jpg', 8, NULL)
INSERT [dbo].[Product] ([product_id], [productName], [supplier_id], [quantity], [price], [categori_id], [photo], [brand_id], [productIsProved]) VALUES (23, N'Huawei P30', 3, 0, 2000, 6, N'/Uploads/Foto/360c2446-2272-4473-a9d6-f70c888a7954.jpg', 6, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_Detail] ON 

INSERT [dbo].[Product_Detail] ([productDetail_id], [properties], [propertiesDetail], [product_id]) VALUES (1, N'4K video  iPhone 7 ile sekiz milyonun üzerinde piksele sahip.', N'4K video  iPhone 7 ile sekiz milyonun üzerinde piksele sahip 4K çözünürlükte videolar çekebilirsiniz. Ve videolarınızı iMovie’de düzenleyip anında paylaşabilirsiniz.', 19)
INSERT [dbo].[Product_Detail] ([productDetail_id], [properties], [propertiesDetail], [product_id]) VALUES (2, N'The Huawei P30 mobile features a 6.1" (15.49 cm) display with a screen resolution of 1080 x 2340 pixels ', N'The Huawei P30 mobile features a 6.1" (15.49 cm) display with a screen resolution of 1080 x 2340 pixels and runs on Android v9.0 (Pie) operating system. The device is powered by Octa core (2.6 GHz, Dual core, Cortex A73 + 1.92 GHz, Dual core, Cortex A76 + 1.8 GHz, Quad core, Cortex A53) processor paired with 6 GB of RAM. As far as the battery is concerned it has 3650 mAh. Over that, as far as the rear camera is concerned this mobile has a 40MP + 16MP + 8MP camera . Other sensors include Light sensor, Proximity sensor, Accelerometer, Compass, Gyroscope. So, does it have a fingerprint sensor? Yes, it does. For graphical performance that can make games run smoothly, this phone has got a Mali-G76 MP10 GPU. On board storage is at 128 GB with the option to expand the memory by Yes Up to 256 GB. Design is one of the most important factors when it comes to mobiles. This phone is 7.5 mm ', 23)
SET IDENTITY_INSERT [dbo].[Product_Detail] OFF
SET IDENTITY_INSERT [dbo].[Product_Photo] ON 

INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (2, N'/Uploads/Foto/64f701cd-41c3-49e2-837d-63a3ba4b4918.jpg', 23)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (3, N'/Uploads/Foto/26c17ac9-29f5-4946-aeac-f7bb0ffb7acb.jpg', 23)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (4, N'/Uploads/Foto/d1e8ffce-d7b1-4df7-95b3-e8cfbd4d50cc.jpg', 23)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (5, N'/Uploads/Foto/a4aa6241-3b66-492e-ac08-f1d361ceb575.jpg', 23)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (6, N'/Uploads/Foto/19b04c84-efcc-4527-a5c1-8ed98531a371.jpg', 19)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (7, N'/Uploads/Foto/58874376-6849-42b7-8a2c-285fb86e9b6c.jpg', 19)
INSERT [dbo].[Product_Photo] ([productPhoto_id], [photo], [product_id]) VALUES (8, N'/Uploads/Foto/95cf65b4-d18e-4e00-a1c9-e718311056b2.jpg', 19)
SET IDENTITY_INSERT [dbo].[Product_Photo] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role], [status]) VALUES (4, N'Admin', 1)
INSERT [dbo].[Role] ([role_id], [role], [status]) VALUES (5, N'User', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([shipper_id], [shipperName], [ShipperDetail]) VALUES (1, N'Aras Cargo', N'Aras cargo is located in turkey')
SET IDENTITY_INSERT [dbo].[Shipper] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplier_id], [companyName], [name], [lastName], [title], [adress]) VALUES (1, N'samsung türkiye', N'can', N'güler', N'samsung', N'düğmeciler ist.')
INSERT [dbo].[Supplier] ([supplier_id], [companyName], [name], [lastName], [title], [adress]) VALUES (2, N'Apple Turkiye', N'can ', N'güler', N'apple', N'ist')
INSERT [dbo].[Supplier] ([supplier_id], [companyName], [name], [lastName], [title], [adress]) VALUES (3, N'Huawei Turkey', N'Can', N'Guler', N'can güler bu şirketi satın aldı.', N'istanbul/eyüp')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (1, N'cangüler', N'canguleer@gmail.com', N'can123', N'can123', N'can', N'güler', N'ss')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (3, N'ahmetturan', N'ahmetturan@gmail.com', N'123', N'123', N'ahmet', N'turan', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (4, N'cınarturan', N'cınarturan@gmail.com', N'123', N'123', N'çınar', N'turan', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (5, N'omerguler', N'omerguler@gmail.com', N'123', N'123', N'ömer', N'güler', N'222')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (6, N'canguler', N'cannguleer@gmail.com', N'can123', N'can123', N'cann', N'güler', N'555')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (7, N'yavuzguler', N'yavuzguler@gmail.com', N'123', N'123', N'yavuz', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (8, N'tarıkguler', N'tarıkguler@gmail.com', N'123', N'123', N'tarık', N'guler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (9, N'denizguler', N'denizguler@gmail.com', N'123', N'123', N'deniz', N'guler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (10, N'ahmetturann', N'ahmetturann@gmail.com', N'123', N'123', N'ahmet', N'turann', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (11, N'ahmettturan', N'ahmettturan@gmail.com', N'123', N'123', N'ahmett', N'turan', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (12, N'mehmetguler', N'mehmetguler@gmail.com', N'123', N'123', N'mehmet', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (13, N'ahmetguler', N'ahmetguler@gmail.com', N'123', N'123', N'ahmet', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (14, N'fatmaguler', N'fatmaguler@gmail.com', N'fatma123', N'fatma123', N'fatma', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (15, N'ahmet', N'ahmet@gmail.com', N'123', N'123', N'ahmetcan', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (16, N'yılmazguler', N'yılmazguler@gmail.com', N'123', N'123', N'yılmaz', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (17, N'farukguler', N'farukguler@gmail.com', N'123', N'123', N'faruk', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (18, N'kamilgüler', N'kamilguler@gmail.com', N'123', N'123', N'kamil', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (19, N'merhabagüler', N'merhabaguler@gmail.com', N'123', N'123', N'merhaba', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (20, N'fatihgüler', N'fatihguler@gmail.com', N'123', N'123', N'fatih', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (21, N'osmanguler', N'osmanguler@gmail.com', N'123', N'123', N'osman', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (22, N'erhanguler', N'erhanguler@gmail.com', N'123', N'123', N'erhan', N'güler', N'123')
INSERT [dbo].[User] ([user_id], [userName], [email], [password], [rePassword], [name], [surName], [phone]) VALUES (23, N'ömergülmez', N'omergulmez@gmail.com', N'123', N'123', N'ömer', N'gülmez', N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[User_Roles] ON 

INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (1, 1, 4)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (2, 3, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (3, 4, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (4, 5, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (5, 6, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (6, 7, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (7, 8, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (8, 9, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (9, 10, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (10, 11, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (11, 12, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (12, 13, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (13, 14, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (14, 15, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (15, 16, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (16, 17, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (17, 18, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (18, 19, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (19, 20, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (20, 21, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (21, 22, 5)
INSERT [dbo].[User_Roles] ([id], [user_id], [role_id]) VALUES (22, 23, 5)
SET IDENTITY_INSERT [dbo].[User_Roles] OFF
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_Product]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Brand]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Bills] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bills] ([bill_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Bills]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipper] FOREIGN KEY([shipper_id])
REFERENCES [dbo].[Shipper] ([shipper_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipper]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Status]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_Status] CHECK CONSTRAINT [FK_Order_Status_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categori_id])
REFERENCES [dbo].[Category] ([categori_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([supplier_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[Product_Order]  WITH CHECK ADD  CONSTRAINT [FK_Product_Order_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Product_Order] CHECK CONSTRAINT [FK_Product_Order_Order]
GO
ALTER TABLE [dbo].[Product_Order]  WITH CHECK ADD  CONSTRAINT [FK_Product_Order_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Order] CHECK CONSTRAINT [FK_Product_Order_Product]
GO
ALTER TABLE [dbo].[Product_Photo]  WITH CHECK ADD  CONSTRAINT [FK_Product_Photo_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Photo] CHECK CONSTRAINT [FK_Product_Photo_Product]
GO
ALTER TABLE [dbo].[User_Roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User_Roles] CHECK CONSTRAINT [FK_User_Roles_Role]
GO
ALTER TABLE [dbo].[User_Roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User_Roles] CHECK CONSTRAINT [FK_User_Roles_User]
GO
USE [master]
GO
ALTER DATABASE [E-commerce] SET  READ_WRITE 
GO
