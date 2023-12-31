USE [master]
GO
/****** Object:  Database [HOUSE]    Script Date: 2018-05-16 16:58:21 ******/
CREATE DATABASE [HOUSE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOUSE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HOUSE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HOUSE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HOUSE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HOUSE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOUSE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOUSE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOUSE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOUSE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOUSE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOUSE] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOUSE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOUSE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOUSE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOUSE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOUSE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOUSE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOUSE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOUSE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOUSE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOUSE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HOUSE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOUSE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOUSE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOUSE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOUSE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOUSE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOUSE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOUSE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HOUSE] SET  MULTI_USER 
GO
ALTER DATABASE [HOUSE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOUSE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOUSE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOUSE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HOUSE] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HOUSE]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[IDAddress] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Rank] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[IDAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AddressDuAn]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressDuAn](
	[IDAddressDuAn] [int] IDENTITY(1,1) NOT NULL,
	[IDDuAn] [int] NULL,
	[IDAddress] [int] NULL,
 CONSTRAINT [PK_AddressDuAn] PRIMARY KEY CLUSTERED 
(
	[IDAddressDuAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AddressHouse]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressHouse](
	[IDAdressHouse] [int] IDENTITY(1,1) NOT NULL,
	[IDHouse] [int] NULL,
	[IDAddress] [int] NULL,
 CONSTRAINT [PK_AddressHouse] PRIMARY KEY CLUSTERED 
(
	[IDAdressHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuAn]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuAn](
	[IDDuAn] [int] IDENTITY(1,1) NOT NULL,
	[Block] [int] NULL,
	[Floor] [int] NULL,
	[House] [int] NULL,
	[Sumary] [nvarchar](3000) NULL,
	[IDInvestor] [int] NULL,
	[IDMap] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[Name] [nvarchar](100) NULL,
	[Start] [date] NULL,
	[IDTaiKhoan] [int] NULL,
	[GiaBan] [nvarchar](50) NULL,
	[GiaThue] [nvarchar](50) NULL,
 CONSTRAINT [PK_DuAn] PRIMARY KEY CLUSTERED 
(
	[IDDuAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[House]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[House](
	[IDHouse] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[IDTaiKhoan] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Sumary] [nvarchar](3000) NULL,
	[IDDuAn] [int] NULL,
	[Views] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[IDMap] [nvarchar](50) NULL,
	[BedRoom] [int] NULL,
	[Area] [int] NULL,
	[Price] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[IDHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE House
ALTER COLUMN Price decimal(18,2);

GO
/****** Object:  Table [dbo].[ImageDuAn]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageDuAn](
	[IDImageDuAn] [int] IDENTITY(1,1) NOT NULL,
	[IDDuAn] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[Rank] [int] NULL,
 CONSTRAINT [PK_ImageDuAn] PRIMARY KEY CLUSTERED 
(
	[IDImageDuAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageHouse]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageHouse](
	[IDImageHouse] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IDHouse] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[Rank] [int] NULL,
 CONSTRAINT [PK_ImageHouse] PRIMARY KEY CLUSTERED 
(
	[IDImageHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoDuAn]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoDuAn](
	[IDInfoDuAn] [int] IDENTITY(1,1) NOT NULL,
	[IDDuAn] [int] NULL,
	[IDKey] [int] NULL,
	[Value] [nvarchar](500) NULL,
 CONSTRAINT [PK_InfoDuAn] PRIMARY KEY CLUSTERED 
(
	[IDInfoDuAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoHouse]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoHouse](
	[IDInfoHouse] [int] IDENTITY(1,1) NOT NULL,
	[IDHouse] [int] NULL,
	[IDKey] [int] NULL,
	[Value] [nvarchar](500) NULL,
 CONSTRAINT [PK_InfoHouse] PRIMARY KEY CLUSTERED 
(
	[IDInfoHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Investor]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investor](
	[IDInvestor] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Logo] [nvarchar](500) NULL,
	[Sumary] [nvarchar](1000) NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_Investor] PRIMARY KEY CLUSTERED 
(
	[IDInvestor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Key]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Key](
	[IDKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Rank] [int] NULL,
	[Active] [bit] NULL,
	[Required] [bit] NULL,
	[Type] [nvarchar](50) NULL,
	[IDCategory] [int] NULL,
 CONSTRAINT [PK_Key] PRIMARY KEY CLUSTERED 
(
	[IDKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](500) NULL,
	[FullName] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Adress] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[POSITION] [nvarchar](50) NULL,
	[State] [tinyint] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 2018-05-16 16:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[IDTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [int] NULL,
	[Contents] [nvarchar](max) NULL,
	[Avatar] [nvarchar](225) NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[IDTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([IDAddress], [Name], [Type], [Rank], [Active]) VALUES (1, N'Hà Nội', N'Tỉnh', 1, 1)
INSERT [dbo].[Address] ([IDAddress], [Name], [Type], [Rank], [Active]) VALUES (2, N'Từ Liêm', N'Huyện', 2, 1)
INSERT [dbo].[Address] ([IDAddress], [Name], [Type], [Rank], [Active]) VALUES (3, N'Trần Cung', N'Xã', 3, 1)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[AddressDuAn] ON 

INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (1, 1, 1)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (2, 1, 2)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (3, 1, 3)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (4, 2, 1)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (5, 2, 2)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (6, 2, 3)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (7, 3, 1)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (8, 3, 2)
INSERT [dbo].[AddressDuAn] ([IDAddressDuAn], [IDDuAn], [IDAddress]) VALUES (9, 3, 3)
SET IDENTITY_INSERT [dbo].[AddressDuAn] OFF
SET IDENTITY_INSERT [dbo].[AddressHouse] ON 

INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (1, 2, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (2, 2, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (3, 2, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (4, 3, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (5, 3, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (6, 3, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (7, 4, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (8, 4, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (9, 4, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (10, 5, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (11, 5, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (12, 5, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (13, 6, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (14, 6, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (15, 6, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (16, 7, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (17, 7, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (18, 7, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (19, 8, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (20, 8, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (21, 8, 3)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (22, 9, 1)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (23, 9, 2)
INSERT [dbo].[AddressHouse] ([IDAdressHouse], [IDHouse], [IDAddress]) VALUES (24, 9, 3)
SET IDENTITY_INSERT [dbo].[AddressHouse] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IDCategory], [Rank], [Name], [Active], [State]) VALUES (1, 1, N'Thông tin cơ bản', 1, N'house list')
INSERT [dbo].[Category] ([IDCategory], [Rank], [Name], [Active], [State]) VALUES (2, 2, N'Nội thất', 1, N'house list')
INSERT [dbo].[Category] ([IDCategory], [Rank], [Name], [Active], [State]) VALUES (3, 3, N'Tiện nghi', 1, N'house list')
INSERT [dbo].[Category] ([IDCategory], [Rank], [Name], [Active], [State]) VALUES (4, 4, N'Ưu điểm ngôi nhà', 1, N'house adv')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[DuAn] ON 

INSERT [dbo].[DuAn] ([IDDuAn], [Block], [Floor], [House], [Sumary], [IDInvestor], [IDMap], [State], [Name], [Start], [IDTaiKhoan], [GiaBan], [GiaThue]) VALUES (1, 4, 3, 100, N'Palm Garden là giai đoạn 2 của khu đô thị Palm City, vị trí đẹp, liền kề Palm Height, mặt tiền sông. Dự án mang đến không gian sống tốt, đầy đủ tiện nghi, chủ đầu tư uy tín, đảm bảo chất lượng và tiến độ thi công. Giá bán cạnh tranh, thanh toán nhẹ nhàng, chỉ 1%/tháng.', 3, NULL, 1, N'Palm Garden - Palm City', CAST(N'2017-12-12' AS Date), 1, N'12 tỷ', N'12 tr/tháng')
INSERT [dbo].[DuAn] ([IDDuAn], [Block], [Floor], [House], [Sumary], [IDInvestor], [IDMap], [State], [Name], [Start], [IDTaiKhoan], [GiaBan], [GiaThue]) VALUES (2, 4, 3, 200, N'Tháng 11/2003 thương hiệu Ðất Xanh chính thức có mặt trên thị truờng bất động sản Việt Nam. Trải qua 14 năm hình thành, Ðất Xanh luôn vững vàng với mục tiêu mang lại cho khách hàng những sản phẩm bất động sản tốt nhất bằng dịch vụ chuyên nghiệp nhất. 

Với tiềm lực mạnh về tài chính, vững vàng về kinh nghiệm, cùng đội ngũ cán bộ nhân viên được đào tạo chuyên nghiệp, Ðất Xanh nỗ lực không ngừng trong mọi hoàn cảnh để khẳng định và nâng cao vị thế của mình trên thị trường bất động sản Việt Nam, giữ vững niềm tin trong tâm trí khách hàng và đối tác.', 4, NULL, 1, N'Gem Riverside', CAST(N'2017-12-12' AS Date), 1, N'12 tỷ', N'12 tr/tháng')
INSERT [dbo].[DuAn] ([IDDuAn], [Block], [Floor], [House], [Sumary], [IDInvestor], [IDMap], [State], [Name], [Start], [IDTaiKhoan], [GiaBan], [GiaThue]) VALUES (3, 4, 3, 150, N'Căn hộ La Astoria tọa lạc tại đường Nguyễn Duy Trinh, Phường Bình Trưng Tây quận 2, được ôm trọn bởi dòng Sông Giồng Ông Tố. Kết nối với Quận 1 (chợ Bến Thành) chỉ 15 phút qua hầm Thủ Thiêm; Chỉ mất 5 - 7 phút để đi đến khu đô thị mới Thủ Thiêm. Thiết kế dự án gồm 1 block cao 20 tầng và 18 khu nhà liên kế. Hầu hết căn hộ được thiết kế theo hướng mở, có lửng hoặc không có nhằm tạo thêm không gian, diện tích sử dụng cho khách hàng.', 5, NULL, 0, N'La Astoria', CAST(N'2017-12-12' AS Date), 1, N'12 tỷ', N'12 tr/tháng')
SET IDENTITY_INSERT [dbo].[DuAn] OFF
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (2, N'The Ascent', 1, N'Căn hộ The Ascent 2 phòng ngủ tầng thấp tháp B đầy đủ tiện nghi', N'Căn hộ tọa lạc ở vị trí tầng thấp tháp B The Ascent được xây dựng với không gian sống thoáng đãng và rộng rãi. Toàn bộ căn hộ được đều sơn trắng chủ đạo, điểm tô những bức tường trang trí họa tiết hoa có gam màu trẻ trung. Phòng khách được dẫn sáng từ ô cửa kính lớn, 2 phòng ngủ đều được lót sàn gỗ cao cấp.Căn hộ nằm trong dự án cao cấp The Ascent được xây dựng như một khu căn hộ nghĩ dưỡng phong cách Singapore. Các tiện ích nội khu được chủ đầu tư chú trọng có thể kể đến như hồ bơi nước ấm, khu vui chơi trẻ em, khu đa năng ngoài trời, khu sinh hoạt cộng đồng, v.v.', 1, 1000, N'0', N'12', 2, 89, N'23', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (3, N'Masteri ', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 1, 1121, N'0', N'12', 2, 89, N'5', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (4, N'Astoria ', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 2, NULL, N'0', N'12', 5, 50, N'6', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (5, N'Hopati', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 3, NULL, N'0', N'12', 5, 64, N'7', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (6, N'Masteri 2', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 1, NULL, N'0', NULL, 4, 65, N'5', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (7, N'Masteri 3', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 2, NULL, N'0', NULL, 5, 45, N'6', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (8, N'Masteri 4', 1, N'Căn hộ hướng Tây Bắc tầng cao T4A Masteri Thảo Điền', N'Căn hộ hướng Tây Bắc, tầng cao tháp T4A Masteri Thảo Điền không chỉ có không gian sống rộng rãi và thoáng mát mà còn được gia chủ chăm chút kỹ lưỡng trong thiết kế nội thất khi khoác lên căn hộ nét sang trọng và hiện đại được thiết kế nội thất bởi Boho Decor.  Từ căn hộ, bạn có thể nhìn được một phần hồ điều hòa của công viên nội khu, khu biệt thự Thảo Điền rợp bóng cây xanh, sông Sài Gòn và bán đảo Thanh Đa.', 3, NULL, N'0', NULL, 6, 98, N'7', 1)
INSERT [dbo].[House] ([IDHouse], [Code], [IDTaiKhoan], [Name], [Sumary], [IDDuAn], [Views], [Type], [IDMap], [BedRoom], [Area], [Price], [State]) VALUES (9, N'deemoo', 1, N'Nam Cường', N'Nam Cường', NULL, 1002, N'0', NULL, 2, 32, N'65', 3)
SET IDENTITY_INSERT [dbo].[House] OFF
SET IDENTITY_INSERT [dbo].[ImageDuAn] ON 

INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (1, 1, N'https://photo.rever.vn/photo/v2/get/2kVT5lHXLP4dPF5pADwdWagzp4IjCcGx0L1D7gJdAYA=/450x300/nUFQdXlRkHHLaFWa.jpg', 0)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (2, 1, N'https://photo.rever.vn/photo/v2/get/gevneV0T7XonK9R1gftuM64Med9M8g_o4ifnQvakVjA=/750x500/vAelxuJcu1p2I3ug.jpg', 1)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (3, 1, N'https://photo.rever.vn/photo/v2/get/hZ1RTSc7IvayrPgoy4mQo9Rj9zzgJTGG5CyyUVxsjPw=/750x500/9MbouWFxXR6QYmy7.jpg', 2)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (4, 1, N'https://photo.rever.vn/photo/v2/get/2kVT5lHXLP4dPF5pADwdWagzp4IjCcGx0L1D7gJdAYA=/450x300/nUFQdXlRkHHLaFWa.jpg', 3)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (5, 1, N'https://photo.rever.vn/photo/v2/get/cdMNhseTqfXxVn1jIuIsQjwH01gT1c6gorkBWSfrow8=/750x500/YAR5HR9qTNxdHsmk.jpg', 4)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (6, 2, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 0)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (7, 2, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 1)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (8, 2, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 2)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (9, 2, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 3)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (10, 2, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 5)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (11, 3, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 0)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (12, 3, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 1)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (13, 3, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 2)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (14, 3, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 3)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (15, 3, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 4)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (16, NULL, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 0)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (17, NULL, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 1)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (18, NULL, N'https://photo.rever.vn/photo/v2/get/mr85czHRjm0T1G7eKvcVsu7qy3N83oNQYTXPu8llPMA=/750x500/0sZh5FGs5QSpjHtC.jpg', 2)
INSERT [dbo].[ImageDuAn] ([IDImageDuAn], [IDDuAn], [Link], [Rank]) VALUES (19, NULL, N'https://photo.rever.vn/photo/v2/get/i7wi2TOkyqQtyjwmp4igt+H0jD+HEsSvtdS3Te16KpI=/750x500/Eb2iIbjcqhYFMaFP.jpg', 3)
SET IDENTITY_INSERT [dbo].[ImageDuAn] OFF
SET IDENTITY_INSERT [dbo].[ImageHouse] ON 

INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (1, N'Phòng khách', 2, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (2, N'Bếp', 2, N'https://photo.rever.vn/photo/v2/get/KGZzcSq88h0BWoMFkh2hk9NnV4nBEdSamdQlTPw9MLA=/750x500/2FcD85MXW6j18StL.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (3, N'Phòng ngủ 1', 2, N'https://photo.rever.vn/photo/v2/get/yHDmp9xvQTgmrcIg0uM_YKO6jXOoIvXhGYQHaMyYNbw=/750x500/udOedr3LZmjQFiPp.jpg', 2)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (4, N'Phòng ngủ 2', 2, N'https://photo.rever.vn/photo/v2/get/P9SPlUNy+_mUTMIPVvoaEi2cLYQw0Fr8srOeO1OMkI4=/750x500/7U9rVWxJI7J3bTZS.jpg', 3)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (5, N'View', 2, N'https://photo.rever.vn/photo/v2/get/VLP8F014XXqaNQQ3s0b5Om1jUYQCO0Qjhggicx8KoTE=/750x500/FhsHsDYb9X22DnUs.jpg', 4)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (6, N'Phòng khách', 3, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (7, N'Phòng khách', 3, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (8, N'Phòng khách', 3, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 2)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (9, N'Phòng khách', 3, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 3)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (10, N'Phòng khách', 4, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (11, N'Phòng khách', 4, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (12, N'Phòng khách', 4, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 2)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (13, N'Phòng khách', 4, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 3)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (14, N'Phòng khách', 5, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (15, N'Phòng khách', 5, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (16, N'Phòng khách', 5, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 2)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (17, N'Phòng khách', 5, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 3)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (18, N'Phòng khách', 6, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (19, N'Phòng khách', 6, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (20, N'Phòng khách', 6, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 2)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (21, N'Phòng khách', 7, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 3)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (22, N'Phòng khách', 7, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (23, N'Phòng khách', 7, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (24, N'Phòng khách', 8, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 0)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (25, N'Phòng khách', 8, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 1)
INSERT [dbo].[ImageHouse] ([IDImageHouse], [Name], [IDHouse], [Link], [Rank]) VALUES (26, N'Phòng khách', 8, N'https://photo.rever.vn/photo/v2/get/GTPhvK5XGsDGdsRatNaUTYEqHelXpjToIytJM9dWpLU=/450x300/avnpUhwMg1XDDNca.jpg', 2)
SET IDENTITY_INSERT [dbo].[ImageHouse] OFF
SET IDENTITY_INSERT [dbo].[InfoHouse] ON 

INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (1, 2, 1, N'2')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (2, 2, 2, N'2')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (3, 2, 3, N'69 m2')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (4, 2, 4, N'Đầy đủ nội thất')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (5, 2, 5, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (6, 2, 6, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (7, 2, 7, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (8, 2, 8, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (9, 2, 9, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (10, 2, 10, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (11, 2, 11, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (12, 2, 12, N'false')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (13, 2, 13, N'Bán căn hộ được xây dựng với không gian sống thoáng đãng, thiết kế nội thất sang trọng và trẻ trung. Căn hộ với diện tích 69m2, kết cấu 2 phòng ngủ và 2WC, với thiết kế hiện đại, không gian rộng mở.')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (14, 2, 14, N'Căn hộ đã bố trí sẵn nội thất, chỉ cần dọn vali vào là ở ngay.')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (15, 2, 15, N'The Ascent được xây dựng như một khu căn hộ nghỉ dưỡng phong cách Singapore nổi bật với hồ bơi nước ấm, hồ ánh sao, v.v cùng nhiều tiện ích cao cấp bao bọc bởi thiên nhiên xanh mát, kiến tạo nên một cộng đồng dân cư văn minh.')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (16, 2, 16, N'Khu căn hộ cách trường Quốc tế Horizon International Bilingual 280m, ĐH Văn hóa Tp.HCM 69m, ĐH Quốc tế Sài Gòn 220m, trường Quốc tế EUROPEAN 550m, Tiểu học Huỳnh Văn Ngỡi 250m, trường Quốc tế Anh BIS 750m và CĐ nghề Hàng hải Tp.HCM 850m.')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (17, 9, 1, N'22')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (18, 9, 2, N'33')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (19, 9, 3, N'56')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (20, 9, 4, N'Đầy đủ')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (21, 9, 5, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (22, 9, 6, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (23, 9, 7, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (24, 9, 8, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (25, 9, 9, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (26, 9, 10, N'true')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (29, 9, 13, N'Nam Cường 2')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (30, 9, 14, N'Nam Cường 2')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (31, 9, 15, N'Nam Cường')
INSERT [dbo].[InfoHouse] ([IDInfoHouse], [IDHouse], [IDKey], [Value]) VALUES (32, 9, 16, N'Nam Cường')
SET IDENTITY_INSERT [dbo].[InfoHouse] OFF
SET IDENTITY_INSERT [dbo].[Investor] ON 

INSERT [dbo].[Investor] ([IDInvestor], [Name], [Logo], [Sumary], [State]) VALUES (3, N'Tập đoàn Bất Động Sản Đất Xanh', N'https://photo.rever.vn/photo/get/bhGeMgz8bDtJHUwHtLWkMGanQaKVI3D0UW5F75gV7Dk=/iyI91GlsrgpqtuP5.jpg', N'Tháng 11/2003 thương hiệu Ðất Xanh chính thức có mặt trên thị truờng bất động sản Việt Nam. Trải qua 14 năm hình thành, Ðất Xanh luôn vững vàng với mục tiêu mang lại cho khách hàng những sản phẩm bất động sản tốt nhất bằng dịch vụ chuyên nghiệp nhất. 

Với tiềm lực mạnh về tài chính, vững vàng về kinh nghiệm, cùng đội ngũ cán bộ nhân viên được đào tạo chuyên nghiệp, Ðất Xanh nỗ lực không ngừng trong mọi hoàn cảnh để khẳng định và nâng cao vị thế của mình trên thị trường bất động sản Việt Nam, giữ vững niềm tin trong tâm trí khách hàng và đối tác.', 1)
INSERT [dbo].[Investor] ([IDInvestor], [Name], [Logo], [Sumary], [State]) VALUES (4, N'Tập đoàn bất động sản Keppel Land (Singapore)', N'https://photo.rever.vn/photo/get/mhPnOL0woR7AINwkHlEfy2anQaKVI3D0UW5F75gV7Dk=/rMlzVkVD3W74Rx9X.jpg', N'Keppel Land là một trong những nhà đầu tư bất động sản tiên phong và lớn nhất tại Việt Nam với một danh mục đầu tư bất động sản đa dạng tại Hà Nội, Tp.HCM, Đồng Nai và Vũng Tàu bao gồm các cao ốc văn phòng hạng A, các căn hộ dịch vụ và các dự án khu đô thị mới phức hợp. Với 20 dự án được cấp phép và kế hoạch định hướng phát triển hơn 25,000 ngôi nhà tại Việt Nam, Keppel Land đang khẳng định tên tuổi là nhà phát triển bất động sản được lựa chọn hàng đầu, luôn tạo nên sự khác biệt bằng chất lượng vượt trội cũng như mang đến những đột phá mới về phong cách sống.', NULL)
INSERT [dbo].[Investor] ([IDInvestor], [Name], [Logo], [Sumary], [State]) VALUES (5, N'Công ty Cổ Phần Đầu Tư Xây Dựng An Gia Hưng', N'https://photo.rever.vn/photo/get/BvujZoAMrYqhruxq4ZMXdWanQaKVI3D0UW5F75gV7Dk=/EqSrFaSsTTSSzOcY.jpg', N'Hoạt động chuyên về lĩnh vực xây dựng bất động sản, An Gia Hưng luôn khát khao tạo ra những công trình chất lượng, bền vững. Với những sản phẩm chất lượng, An Gia Hưng đáp ứng được nhu cầu của khách hàng, mang lại không gian sống thông minh. Với quá trình hình thành và phát triển, An Gia Hưng đã gây dựng được uy tín của mình bằng các dịch vụ, sản phẩm, công trình chất lượng.

Công ty An Gia Hưng luôn kiến tạo “không gian sống thông minh” trên cơ sở thấu hiểu nhu cầu mà còn mang đến môi trường sống kết nối cộng đồng nhân văn, tạo nên giá trị sống gia tăng cho khách hàng và xã hội.', NULL)
SET IDENTITY_INSERT [dbo].[Investor] OFF
SET IDENTITY_INSERT [dbo].[Key] ON 

INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (1, N'Phòng ngủ', 1, 1, 1, N'text', 1)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (2, N'Phòng tắm', 2, 1, 1, N'text', 1)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (3, N'Diện tích', 3, 1, 1, N'text', 1)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (4, N'Tình hình nội thất', 4, 1, 1, N'text', 1)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (5, N'Sofa', 1, 1, 1, N'check', 2)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (6, N'Bàn ăn', 2, 1, 1, N'check', 2)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (7, N'Nhà bếp', 3, 1, 1, N'check', 2)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (8, N'Tủ bếp', 4, 1, 1, N'check', 2)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (9, N'Internet', 1, 1, 1, N'check', 3)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (10, N'Truyền hình cable', 2, 1, 1, N'check', 3)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (11, N'Cho phép thú cưng', 3, 1, 1, N'check', 3)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (12, N'Thang máy', 4, 1, 1, N'check', 3)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (13, N'ĐẶC ĐIỂM NỔI BẬT', 1, 1, 1, N'text', 4)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (14, N'TÌNH HÌNH NỘI THẤT', 2, 1, 1, N'text', 4)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (15, N'CỘNG ĐỒNG DÂN CƯ', 3, 1, 1, N'text', 4)
INSERT [dbo].[Key] ([IDKey], [Name], [Rank], [Active], [Required], [Type], [IDCategory]) VALUES (16, N'VỀ GIÁO DỤC', 4, 1, 1, N'text', 4)
SET IDENTITY_INSERT [dbo].[Key] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [Username], [Password], [Avatar], [FullName], [Birthday], [Adress], [Phone], [Email], [POSITION], [State], [Description]) VALUES (1, N'admin', N'admin', NULL, N'Nguyễn Văn Trung', CAST(N'2002-07-03' AS Date), N'Quảng Bình', N'0974 131 292', N'QuanLy@gmail.com', N'ADMIN', 1, NULL)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 


INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (2, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', N'https://photo.rever.vn/photo/v2/get/Mf_qfeVm+BqQj5wk7y7UcsP0BuRCT2tdzKqRqK6f5YE=/750x500/eLFssr5Mk2G3XQGV.jpg', NULL)
INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (3, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, NULL, N'https://photo.rever.vn/photo/v2/get/fDqWoxZFI4r1VPYwwwcr0Js44znDlMysuuZnGzNOc+s=/225x150/5bFKyfhwfwPGWBv2.jpg', NULL)
INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (4, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, NULL, N'https://photo.rever.vn/photo/v2/get/fDqWoxZFI4r1VPYwwwcr0Js44znDlMysuuZnGzNOc+s=/225x150/5bFKyfhwfwPGWBv2.jpg', NULL)
INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (5, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, NULL, N'https://photo.rever.vn/photo/v2/get/fDqWoxZFI4r1VPYwwwcr0Js44znDlMysuuZnGzNOc+s=/225x150/5bFKyfhwfwPGWBv2.jpg', NULL)
INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (6, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, NULL, N'https://photo.rever.vn/photo/v2/get/fDqWoxZFI4r1VPYwwwcr0Js44znDlMysuuZnGzNOc+s=/225x150/5bFKyfhwfwPGWBv2.jpg', NULL)
INSERT [dbo].[TinTuc] ([IDTinTuc], [Title], [CreateTime], [CreateBy], [Contents], [Avatar], [State]) VALUES (7, N'Những hình ảnh đầu tiên về khu cảnh quan công cộng dự án Empire City', CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1, NULL, N'https://photo.rever.vn/photo/v2/get/fDqWoxZFI4r1VPYwwwcr0Js44znDlMysuuZnGzNOc+s=/225x150/5bFKyfhwfwPGWBv2.jpg', NULL)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
ALTER TABLE [dbo].[AddressDuAn]  WITH CHECK ADD  CONSTRAINT [FK_AddressDuAn_Address] FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[AddressDuAn] CHECK CONSTRAINT [FK_AddressDuAn_Address]
GO
ALTER TABLE [dbo].[AddressDuAn]  WITH CHECK ADD  CONSTRAINT [FK_AddressDuAn_DuAn] FOREIGN KEY([IDDuAn])
REFERENCES [dbo].[DuAn] ([IDDuAn])
GO
ALTER TABLE [dbo].[AddressDuAn] CHECK CONSTRAINT [FK_AddressDuAn_DuAn]
GO
ALTER TABLE [dbo].[AddressHouse]  WITH CHECK ADD  CONSTRAINT [FK_AddressHouse_Address] FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[AddressHouse] CHECK CONSTRAINT [FK_AddressHouse_Address]
GO
ALTER TABLE [dbo].[AddressHouse]  WITH CHECK ADD  CONSTRAINT [FK_AddressHouse_House] FOREIGN KEY([IDHouse])
REFERENCES [dbo].[House] ([IDHouse])
GO
ALTER TABLE [dbo].[AddressHouse] CHECK CONSTRAINT [FK_AddressHouse_House]
GO
ALTER TABLE [dbo].[DuAn]  WITH CHECK ADD  CONSTRAINT [FK_DuAn_Investor] FOREIGN KEY([IDInvestor])
REFERENCES [dbo].[Investor] ([IDInvestor])
GO
ALTER TABLE [dbo].[DuAn] CHECK CONSTRAINT [FK_DuAn_Investor]
GO
ALTER TABLE [dbo].[DuAn]  WITH CHECK ADD  CONSTRAINT [FK_DuAn_TaiKhoan] FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IDTaiKhoan])
GO
ALTER TABLE [dbo].[DuAn] CHECK CONSTRAINT [FK_DuAn_TaiKhoan]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_DuAn] FOREIGN KEY([IDDuAn])
REFERENCES [dbo].[DuAn] ([IDDuAn])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_DuAn]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_TaiKhoan] FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IDTaiKhoan])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_TaiKhoan]
GO
ALTER TABLE [dbo].[ImageDuAn]  WITH CHECK ADD  CONSTRAINT [FK_ImageDuAn_DuAn] FOREIGN KEY([IDDuAn])
REFERENCES [dbo].[DuAn] ([IDDuAn])
GO
ALTER TABLE [dbo].[ImageDuAn] CHECK CONSTRAINT [FK_ImageDuAn_DuAn]
GO
ALTER TABLE [dbo].[ImageHouse]  WITH CHECK ADD  CONSTRAINT [FK_ImageHouse_House] FOREIGN KEY([IDHouse])
REFERENCES [dbo].[House] ([IDHouse])
GO
ALTER TABLE [dbo].[ImageHouse] CHECK CONSTRAINT [FK_ImageHouse_House]
GO
ALTER TABLE [dbo].[InfoDuAn]  WITH CHECK ADD  CONSTRAINT [FK_InfoDuAn_DuAn] FOREIGN KEY([IDDuAn])
REFERENCES [dbo].[DuAn] ([IDDuAn])
GO
ALTER TABLE [dbo].[InfoDuAn] CHECK CONSTRAINT [FK_InfoDuAn_DuAn]
GO
ALTER TABLE [dbo].[InfoDuAn]  WITH CHECK ADD  CONSTRAINT [FK_InfoDuAn_Key] FOREIGN KEY([IDKey])
REFERENCES [dbo].[Key] ([IDKey])
GO
ALTER TABLE [dbo].[InfoDuAn] CHECK CONSTRAINT [FK_InfoDuAn_Key]
GO
ALTER TABLE [dbo].[InfoHouse]  WITH CHECK ADD  CONSTRAINT [FK_InfoHouse_House] FOREIGN KEY([IDHouse])
REFERENCES [dbo].[House] ([IDHouse])
GO
ALTER TABLE [dbo].[InfoHouse] CHECK CONSTRAINT [FK_InfoHouse_House]
GO
ALTER TABLE [dbo].[InfoHouse]  WITH CHECK ADD  CONSTRAINT [FK_InfoHouse_Key] FOREIGN KEY([IDKey])
REFERENCES [dbo].[Key] ([IDKey])
GO
ALTER TABLE [dbo].[InfoHouse] CHECK CONSTRAINT [FK_InfoHouse_Key]
GO
ALTER TABLE [dbo].[Key]  WITH CHECK ADD  CONSTRAINT [FK_Key_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([IDCategory])
GO
ALTER TABLE [dbo].[Key] CHECK CONSTRAINT [FK_Key_Category]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_TaiKhoan] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[TaiKhoan] ([IDTaiKhoan])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [HOUSE] SET  READ_WRITE 
GO

ALTER TABLE House
ADD CreateTime DATETIME NULL ,
    CreateBy int ;
