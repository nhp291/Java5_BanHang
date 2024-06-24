create database java5asm
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
use java5asm
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[photo] [varchar](50) NULL,
	[activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[username] [varchar](50) NULL,
	[createDate] [date] NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[productId] [int] NULL,
	[categoryId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[createDate] [date] NULL,
	[available] [bit] NULL,
	[brandId] [varchar](10) NULL,
	[images] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[accountId] [varchar](50) NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[role] [varchar](10) NOT NULL,
	[description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'HoaiPhong', N'123456', N'Nguyễn Hoài Phong', N'nhp2901@gmail.com', N'cat.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'nhp291', N'123456', N'Hoài Phong', N'minhtam@fpt.edu.vn', N'cat2.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'admin', N'123', N'Admin', N'admin@gmail.com', N'admin.jpg', 1)

INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'AK', N'Áo khoác', N'aoKhoac1.webp')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BA', N'Balo', N'balo1.webp')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'VI', N'Ví', N'vi1.webp')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'AT', N'Áo thun', N'aoThun1.webp')

INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM01', N'Áo khoác')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM02', N'Balo')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM03', N'Ví')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM04', N'Áo thun')

SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (0, 8, 2, 190000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (1, 9, 1, 350000, 1)

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (8, N'HoaiPhong', CAST(N'2023-06-08' AS Date), N'Gò Vấp, HCM')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (9, N'nhp291', CAST(N'2023-06-06' AS Date), 1)

SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (6, 3, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (7, 4, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (10, 6, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (40, 1, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (41, 5, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (50, 8, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (52, 7, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (57, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (58, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (59, 1, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (60, 1, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (61, 6, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (62, 9, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (63, 10, N'DM02')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 


INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (0, N'Áo khoác Bomber',					10000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["aoKhoac4.webp","aoKhoac4.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (1, N'Túi đeo thời trang',				1000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["TuiDeo.webp","TuiDeo.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (2, N'Áo khoác hoodie',					12000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["aoKhoac1.webp","aoKhoac1.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (3, N'Áo khoác Trắng',					11000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["aoKhoac5.webp","aoKhoac5.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (4, N'Áo Thun đen',						10000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["aoThun1.webp","aoThun1.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (5, N'Áo Thun Oversize',					8000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["aoThun2.webp","aoThun2.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (6, N'Áo Thun đen 1',					10000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["aoThun3.webp","aoThun3.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (7, N'Áo thun nam form rộng',			13000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["aoThunNamFormRong.webp","aoThunNamFormRong.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (8, N'Áo khoác Baby Jacket Cos',			10000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["BabyJacketCos.webp","BabyJacketCos.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (9, N'Áo thun baby Tee Frosty',			10000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["babyTeeFrosty.webp","babyTeeFrosty.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (10, N'Áo thun BabyTeePinkish',			10000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["BabyTeePinkish.webp","BabyTeePinkish.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (11, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo3.webp","balo3.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (12, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo4.webp","balo4.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (13, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo5.webp","balo5.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (14, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo6.webp","balo6.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (15, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo7.webp","balo7.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (16, N'Balo da',							20000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo8.webp","balo8.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (17, N'Balo da',							10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["balo9.webp","balo9.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (18, N'Balo Canvas Phối Da',				40000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["baloCanvasPhoiDa.webp","baloCanvasPhoiDa.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (19, N'Balo Buckle Back PackPro',			10000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["BuckleBackPackPro.webp","BuckleBackPackPro.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (20, N'Balo ConCord Back Pack PosPro',	60000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["ConCordBackPackPosPro.webp","ConCordBackPackPosPro.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (21, N'Balo Quilted Back pack',			80000, CAST(N'2023-05-15' AS Date), 1, N'BA', N'["QuiltedBackpack.webp","QuiltedBackpack.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (22, N'Áo khoác hoodie Zip',				11000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["hoodieZip.webp","hoodieZip.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (23, N'Áo khoác Jacket World SS20XX',		11000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["JacketWorldSS20XX.webp","JacketWorldSS20XX.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (24, N'Áo khoác Jersey Jacket',			11000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["JerseyJacket.webp","JerseyJacket.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (25, N'Áo khoác Teddy Varsity Jacket',	11000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["TeddyVarsityJacket.webp","TeddyVarsityJacket.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (26, N'Ví level Wallet',					11000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["levelWallet.webp","levelWallet.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (27, N'Polo Basic Ve Chai',				61000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["PoloBasicVeChai.webp","PoloBasicVeChai.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (28, N'shirt Basic',						71000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["shirtBasic.webp","shirtBasic.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (29, N'Tee Apep và Ank',					31000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["TeeApepAndAnkhTrang.webp","TeeApepAndAnkhTrang.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (30, N'Tee Logo Fire',					51000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["TeeLogoFire.webp","TeeLogoFire.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (31, N'Tee Simple Xanh',					23000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["TeeSimpleXanhBien.webp","TeeSimpleXanhBien.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (32, N'Tee Stripes',						22000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["TeeStripes.webp","TeeStripes.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (33, N'Tee Trame',						28000, CAST(N'2023-05-15' AS Date), 1, N'AT', N'["TeeTrame.webp","TeeTrame.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (34, N'Áo khoác TRACK BOMBER JACKET',		32000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["TRACKBOMBERJACKET.webp","TRACKBOMBERJACKET.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (35, N'Áo khoác varsity Jacket',			30000, CAST(N'2023-05-15' AS Date), 1, N'AK', N'["varsityJacket.webp","varsityJacket.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (36, N'Ví nam',							7800, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["vi1.webp","vi1.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (37, N'Ví nam',							5000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["vi2.webp","vi2.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (38, N'Ví nam',							6000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["vi3.webp","vi3.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (39, N'Ví nam',							7000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["vi4.webp","vi4.webp"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (40, N'Túi Đeo',							9000, CAST(N'2023-05-15' AS Date), 1, N'VI', N'["TuiDeo.webp","TuiDeo.webp"]')

SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RoleDetails] ON 

INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (0, N'admin', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (4, N'HoaiPhong', N'staff')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (6, N'nhp291', N'user')
SET IDENTITY_INSERT [dbo].[RoleDetails] OFF
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'director', N'director')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'staff', N'staff')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'user', N'user')

ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO

ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([username])
GO


ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportCost]    Script Date: 6/18/2023 7:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ReportCost] (@month INT)
AS BEGIN
SELECT 
			convert(varchar(10), o.createDate, 103) AS NgayBan,		
			COUNT(DISTINCT o.id) AS TongHoaDon,
			SUM(od.quantity * od.price) AS DoanhThu
FROM Orders o, OrderDetails od  WHERE o.id = od.orderId AND MONTH(o.createDate) = @month
GROUP BY createDate
END
GO
