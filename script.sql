USE [master]
GO
/****** Object:  Database [Ass2]    Script Date: 8/18/2020 9:02:38 AM ******/
CREATE DATABASE [Ass2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ass2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ass2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ass2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ass2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ass2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass2] SET RECOVERY FULL 
GO
ALTER DATABASE [Ass2] SET  MULTI_USER 
GO
ALTER DATABASE [Ass2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ass2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ass2', N'ON'
GO
USE [Ass2]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[UserID] [nvarchar](50) NOT NULL,
	[BillID] [nvarchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[PayerName] [nvarchar](50) NOT NULL,
	[AddressUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [nvarchar](50) NOT NULL,
	[BookTitle] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [nvarchar](50) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Categories] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[BookID] [nvarchar](50) NOT NULL,
	[BookTitle] [nvarchar](50) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NULL,
	[UserID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[NumBill] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountCode] [nvarchar](50) NOT NULL,
	[DiscountValue] [nvarchar](50) NOT NULL,
	[ExpiredDate] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetail](
	[BillID] [nvarchar](50) NOT NULL,
	[BookID] [nvarchar](50) NOT NULL,
	[BookTitle] [nvarchar](50) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/18/2020 9:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bill] ([UserID], [BillID], [Amount], [Date], [PayerName], [AddressUser]) VALUES (N'15', N'1460024394', 350000, N'2020-03-11', N'long', N'q4')
INSERT [dbo].[Bill] ([UserID], [BillID], [Amount], [Date], [PayerName], [AddressUser]) VALUES (N'2', N'1867713507', 1000000, N'2020-05-20', N'long', N'q5')
INSERT [dbo].[Bill] ([UserID], [BillID], [Amount], [Date], [PayerName], [AddressUser]) VALUES (N'5', N'877491597', 455200, N'2020-03-12', N'Long', N'q9')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B1', N'Sach hoc Tieng Anh 2', 150000, N'50', N'Mark Joker Beer', N'Learning', N'hoc.image', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B10', N'Ky Niem Kho Quen', 145550, N'20', N'Vo Hoang Anh', N'LoveStory', N'hhhhh', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B100', N'testboook', 200000, N'100', N'long', N'Politics - law', N'kk', N'2020-03-12', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B11', N'Sach Tap Doc 2', 155555, N'666', N'Nha Sach Thieu Nhi', N'Education', N'khosach1.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B12', N'TraverBook', 100000, N'10', N'Hoi Nguoi Thich Phuot', N'Travel', N'khosach2.jpn', N'2020-02-26', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B13', N'Dao Nguoi Ca', 200000, N'100', N'Marth JarkDan', N'Travel', N'khosach4.jpn', N'2020-02-26', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B14', N'Day Nau An ', 180000, N'200', N'Mon Ngon Moi Ngay', N'Experience', N'monngon.jpn', N'2020-02-22', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B15', N'So Tay Van Hoc 12', 18000, N'2456', N'Bo Giao Duc ', N'Education', N'hoctap.jpn', N'2020-02-24', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B16', N'So Tay Van Hoc 11', 28000, N'1200', N'Bo Giao Duc ', N'Education', N'hoctap2.jpn', N'2020-02-26', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B17', N'Nhung Bai Van Hay', 48000, N'12200', N'Bo Giao Duc ', N'Education', N'hoctap3.jpn', N'2020-02-25', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B18', N'Hoc Nhu Nao', 98000, N'120', N'Ngo Ba Kha', N'Psychological, religious', N'dappha.jpn', N'2020-02-23', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B19', N'De Men Phieu Luu', 68000, N'100', N'To Hoai', N'Phieu Luu', N'demem.jpn', N'2020-02-24', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B2', N'Nhat Ky Yeu', 200000, N'10', N'Le Hoai An', N'Experience', N'Nhatkyeuthuong.jpn', N'2020-02-23', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B20', N'Chuyen Tinh Phuong Bac', 80000, N'65', N'Ronado Messi', N'LoveStory', N'loveLife.jpn', N'2020-02-23', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B21', N'Nhat Ky Maria', 78000, N'26', N'Maria ChartLot', N'LoveStory', N'loveLife2.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B22', N'Nam Do Story', 120000, N'40', N'Nam Do', N'LoveStory', N'loveLife6.jpn', N'2020-02-24', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B3', N'Doi Hoa Si', 230000, N'10', N'Hoang Duc Luong', N'Art science', N'Nhatky.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B4', N'Trang Giay Trang', 165000, N'10', N'Bui Tien Duc', N'Politics - law', N'cuocsong.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B40', N'Ngay Tan vong', 380000, N'100', N'JACK Dragon', N'Economics', N'traidat.jpn', N'2020-02-28', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B45', N'THAM HIEM', 15200, N'10', N'THE HIEN', N'Experience', N'JNC.CM', N'2020-02-27', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B5', N'Banh My Khong Sua', 145000, N'15', N'Nguyen Tien Hai', N'Story', N'cuocsongmuonmau.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B6', N'Tinh Tay Ba', 180000, N'9', N'Pham Van Quang', N'LoveStory', N'mauxanh.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B7', N'Cuoc Song Dem', 200000, N'30', N'Nha Sach Yeu Thuong', N'Travel', N'datnuoctoi.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B8', N'Ngay Nang', 150000, N'100', N'Cao Trang', N'Travel', N'datnuoctoi.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Books] ([BookID], [BookTitle], [Price], [Quantity], [Author], [Categories], [ImageName], [Date], [Status]) VALUES (N'B9', N'Ngay Ta Mat Nhau', 250000, N'15', N'Long Han Han', N'Love', N'crycry.jpn', N'2020-02-13', N'active')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B16', N'So Tay Van Hoc 11', 1, 28000, N'5', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B20', N'Chuyen Tinh Phuong Bac', 1, 80000, N'5', N'inactive', N'5')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B45', N'THAM HIEM', 1, 15200, N'5', N'inactive', N'5')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B22', N'Nam Do Story', 3, 120000, N'5', N'inactive', N'5')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B100', N'testboook', 1, 200000, N'15', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B1', N'Sach hoc Tieng Anh 2', 1, 150000, N'15', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B13', N'Dao Nguoi Ca', 5, 200000, N'2', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B15', N'So Tay Van Hoc 12', 3, 18000, N'5', N'active', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B8', N'Ngay Nang', 2, 150000, N'11', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B5', N'Banh My Khong Sua', 1, 145000, N'5', N'active', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B4', N'Trang Giay Trang', 1, 165000, N'5', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B5', N'Banh My Khong Sua', 1, 145000, N'11', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B3', N'Doi Hoa Si', 1, 230000, N'11', N'inactive', N'4')
INSERT [dbo].[Cart] ([BookID], [BookTitle], [Quantity], [Price], [UserID], [Status], [NumBill]) VALUES (N'B15', N'So Tay Van Hoc 12', 1, 18000, N'5', N'inactive', N'4')
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountValue], [ExpiredDate], [UserID], [Status]) VALUES (N'ABC', N'10', N'2020-03-19', N'3', N'notUse')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'1460024394', N'B100', N'testboook', 1, 200000, N'done')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'1460024394', N'B1', N'Sach hoc Tieng Anh 2', 1, 150000, N'done')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'1867713507', N'B13', N'Dao Nguoi Ca', 5, 200000, N'done')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'877491597', N'B20', N'Chuyen Tinh Phuong Bac', 1, 80000, N'done')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'877491597', N'B45', N'THAM HIEM', 1, 15200, N'done')
INSERT [dbo].[HistoryDetail] ([BillID], [BookID], [BookTitle], [Quantity], [Price], [Status]) VALUES (N'877491597', N'B22', N'Nam Do Story', 3, 120000, N'done')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'', N'Crin', N'2', 1581600704, N'30177 Fisk Place', N'ccurtain1@unblog.fr', N'''user''', N'1')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'1', N'admin', N'1', 93182303, N'hcm', N'donglong453@gmail.com', N'admin', N'active')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'11', N'nam', N'1', 1135965110, N'709 Saint Paul Point', N'estrettellp8@dagondesign.com', N'user', N'active')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'15', N'user', N'1', 877601879, N'9373 Ronald Regan Road', N'dantowskip6@zimbio.com', N'user', N'active')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'2', N'hoa', N'1', 6512534, N'ha noi', N'hoa@453.com', N'user', N'active')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'3', N'minh', N'1', 96297485, N'HCM', N'minhluong@gmail.com', N'user', N'active')
INSERT [dbo].[Users] ([UserID], [UserName], [PassWord], [Phone], [Address], [Email], [Role], [Status]) VALUES (N'5', N'long', N'1', 39545556, N'HCMC', N'nam@gmail.com', N'user', N'active')
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bills_Users]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Books1] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Books1]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Users]
GO
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Bills] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Bills]
GO
USE [master]
GO
ALTER DATABASE [Ass2] SET  READ_WRITE 
GO
