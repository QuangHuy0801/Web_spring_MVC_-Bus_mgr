USE [QLXB_31]
GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 6/25/2023 12:40:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[ID] [int] NOT NULL,
	[TEN] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_CHUCVU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_TUYENDUONG]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_TUYENDUONG](
	[IDTD] [int] NOT NULL,
	[MATRAM] [nchar](10) NOT NULL,
	[THUTU] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CT_TUYENDUONG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOANHTHUNGAY]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOANHTHUNGAY](
	[IDTD] [int] NOT NULL,
	[NGAY] [date] NOT NULL,
	[SOVEHSSV] [int] NULL,
	[SOVEBT] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MANVNHAP] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOANHTHUTRAM]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOANHTHUTRAM](
	[IDTRAMVE] [int] NULL,
	[IDDTN] [int] NULL,
	[SOVETAP] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DOANHTHUTRAM_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAVE]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAVE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GIAVEHSSV] [int] NOT NULL,
	[GIAVEBT] [int] NOT NULL,
	[GIAVETAP] [int] NOT NULL,
	[LOAIHINH] [nchar](5) NOT NULL,
 CONSTRAINT [PK_GIAVE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [nchar](10) NOT NULL,
	[HO] [nvarchar](40) NOT NULL,
	[TEN] [nvarchar](20) NOT NULL,
	[GIOITINH] [nchar](10) NULL,
	[SODT] [nchar](15) NULL,
	[DIACHI] [ntext] NULL,
	[NGAYSINH] [date] NULL,
	[TRANGTHAI] [int] NULL,
	[IDCV] [int] NOT NULL,
	[CCCD] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[PASSWORD] [nchar](20) NOT NULL,
	[HOATDONG] [int] NULL,
	[MANV] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAMVE]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAMVE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DIADIEM] [nvarchar](80) NOT NULL,
	[TENTRAMVE] [nvarchar](50) NOT NULL,
	[MANVBV] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TRAMVE_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAMXE]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAMXE](
	[MASO] [nchar](10) NOT NULL,
	[DIADIEM] [nvarchar](80) NOT NULL,
	[TENTRAM] [nvarchar](50) NOT NULL,
	[MANVTAO] [nchar](10) NULL,
 CONSTRAINT [PK_TRAMXE] PRIMARY KEY CLUSTERED 
(
	[MASO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUYENDUONG]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUYENDUONG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TEN] [nvarchar](80) NOT NULL,
	[GIANCACH] [nvarchar](20) NOT NULL,
	[THOIGIANHD] [nchar](20) NOT NULL,
	[THOIGIANCHUYEN] [nvarchar](20) NOT NULL,
	[CULY] [float] NOT NULL,
	[MANVTAO] [nchar](10) NULL,
	[IDGV] [int] NULL,
 CONSTRAINT [PK_TUYENDUONG_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XE]    Script Date: 6/25/2023 12:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[BIENSOXE] [nchar](12) NOT NULL,
	[LOAIXE] [nvarchar](30) NOT NULL,
	[TINHTRANGXE] [int] NOT NULL,
	[MOTAXE] [ntext] NULL,
	[MANVLAIXE] [nchar](10) NOT NULL,
	[MANVPHUCVU] [nchar](10) NULL,
	[IDTD] [int] NOT NULL,
 CONSTRAINT [PK_XE] PRIMARY KEY CLUSTERED 
(
	[BIENSOXE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CHUCVU] ([ID], [TEN]) VALUES (1, N'Admin')
INSERT [dbo].[CHUCVU] ([ID], [TEN]) VALUES (3, N'Lái xe')
INSERT [dbo].[CHUCVU] ([ID], [TEN]) VALUES (4, N'Nhân viên bán vé')
INSERT [dbo].[CHUCVU] ([ID], [TEN]) VALUES (5, N'Nhân viên phụ xe')
INSERT [dbo].[CHUCVU] ([ID], [TEN]) VALUES (8, N'Nhân viên nhập doanh thu')
GO
SET IDENTITY_INSERT [dbo].[CT_TUYENDUONG] ON 

INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'BX 01     ', 29, 83)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'BX 06     ', 5, 1)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'BX14      ', 2, 2)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'BX38      ', 30, 84)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 020    ', 4, 3)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 031    ', 1, 4)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 102    ', 10, 5)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 124    ', 11, 6)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 125    ', 12, 7)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 126    ', 13, 8)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 127    ', 14, 9)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 128    ', 15, 10)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 129    ', 16, 11)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 130    ', 17, 12)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 193    ', 6, 13)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q1 194    ', 8, 14)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 014    ', 9, 15)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 015    ', 3, 16)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 083    ', 18, 17)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 084    ', 19, 18)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 085    ', 20, 19)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 086    ', 21, 20)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 087    ', 22, 21)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 088    ', 23, 22)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 089    ', 24, 23)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 090    ', 26, 24)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 091    ', 27, 25)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 092    ', 28, 26)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 099    ', 25, 27)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (1, N'Q5 102    ', 7, 28)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'BX 01     ', 1, 29)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'BX38      ', 52, 30)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 017    ', 9, 31)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 024    ', 10, 32)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 057    ', 11, 33)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 058    ', 12, 34)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 059    ', 13, 35)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 060    ', 14, 36)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 061    ', 15, 37)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 062    ', 16, 38)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 063    ', 17, 39)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 064    ', 18, 40)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 179    ', 4, 41)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 180    ', 5, 42)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 190    ', 1, 43)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 191    ', 2, 44)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 192    ', 3, 45)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 195    ', 7, 46)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 1950   ', 6, 47)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q1 200    ', 8, 48)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 032   ', 38, 49)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 033   ', 39, 50)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 034   ', 40, 51)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 035   ', 41, 52)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 036   ', 42, 53)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 037   ', 43, 54)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 038   ', 44, 55)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 039   ', 45, 56)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 040   ', 46, 57)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 041   ', 47, 58)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 042   ', 48, 59)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 043   ', 49, 60)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 044   ', 50, 61)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'Q12 232   ', 51, 62)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 040   ', 28, 63)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 042   ', 29, 64)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 104   ', 31, 65)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 106   ', 32, 66)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 107   ', 33, 67)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 108   ', 34, 68)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 109   ', 35, 69)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 110   ', 36, 72)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 111   ', 37, 70)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 125   ', 27, 71)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QGV 187   ', 30, 74)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 001   ', 22, 75)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 002   ', 23, 76)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 003   ', 24, 77)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 004   ', 25, 78)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 005   ', 26, 79)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 012   ', 19, 80)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 013   ', 20, 81)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (2, N'QPN 014   ', 21, 82)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (17, N'BX 01     ', 2, 118)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (17, N'BX 06     ', 3, 119)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (17, N'Q12 036   ', 1, 113)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'BX 01     ', 1, 85)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'BX 06     ', 3, 87)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'BX14      ', 2, 86)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'BX38      ', 7, 92)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q1 017    ', 8, 93)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q1 020    ', 4, 88)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q1 031    ', 5, 89)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q1 058    ', 6, 90)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q1 124    ', 10, 98)
INSERT [dbo].[CT_TUYENDUONG] ([IDTD], [MATRAM], [THUTU], [ID]) VALUES (18, N'Q12 040   ', 9, 96)
SET IDENTITY_INSERT [dbo].[CT_TUYENDUONG] OFF
GO
SET IDENTITY_INSERT [dbo].[DOANHTHUNGAY] ON 

INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (1, CAST(N'2023-03-01' AS Date), 3600, 3000, 1, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (2, CAST(N'2023-03-01' AS Date), 3200, 2800, 3, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (1, CAST(N'2023-02-01' AS Date), 3000, 2700, 4, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (2, CAST(N'2023-02-01' AS Date), 3100, 2500, 5, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (1, CAST(N'2023-01-01' AS Date), 2500, 2000, 6, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (2, CAST(N'2023-01-01' AS Date), 2800, 2300, 7, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (18, CAST(N'2023-06-15' AS Date), 320, 210, 11, N'NDT2      ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (1, CAST(N'2023-06-24' AS Date), 120, 100, 13, N'AD1       ')
INSERT [dbo].[DOANHTHUNGAY] ([IDTD], [NGAY], [SOVEHSSV], [SOVEBT], [ID], [MANVNHAP]) VALUES (2, CAST(N'2023-06-09' AS Date), 100, 100, 1015, N'AD1       ')
SET IDENTITY_INSERT [dbo].[DOANHTHUNGAY] OFF
GO
SET IDENTITY_INSERT [dbo].[DOANHTHUTRAM] ON 

INSERT [dbo].[DOANHTHUTRAM] ([IDTRAMVE], [IDDTN], [SOVETAP], [ID]) VALUES (2, 7, 10, 2)
INSERT [dbo].[DOANHTHUTRAM] ([IDTRAMVE], [IDDTN], [SOVETAP], [ID]) VALUES (1, 11, 10, 3)
SET IDENTITY_INSERT [dbo].[DOANHTHUTRAM] OFF
GO
SET IDENTITY_INSERT [dbo].[GIAVE] ON 

INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (1, 3000, 5000, 112500, N'TG   ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (2, 3000, 6000, 135000, N'TG   ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (3, 10000, 15000, 112500, N'KTG  ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (4, 3000, 7000, 157500, N'TG   ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (5, 8000, 15000, 112500, N'KTG  ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (6, 3000, 6000, 135000, N'TG   ')
INSERT [dbo].[GIAVE] ([ID], [GIAVEHSSV], [GIAVEBT], [GIAVETAP], [LOAIHINH]) VALUES (9, 3000, 5000, 80000, N'TG   ')
SET IDENTITY_INSERT [dbo].[GIAVE] OFF
GO
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'AD1       ', N'Vo Quang', N'Huy', N'nam       ', N'0375250833     ', N'Bình Châu- Bình Sơn-Quảng Ngãi', CAST(N'2000-08-01' AS Date), 1, 1, N'0929288222     ', N'voquanghuy8082@gmail.com')
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'AD2       ', N'Nguyễn Hải', N'Hà', N'Nam       ', N'0375250833     ', N'Bình Châu- Bình Sơn-Quảng Ngãi', CAST(N'2000-08-01' AS Date), 1, 1, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'AD3       ', N'Nguyễn Văn B', N'A', N'Nam       ', N'0945222812     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'2002-03-12' AS Date), 0, 1, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'BV1       ', N'Nguyễn Hải', N'Nhi', N'Nữ        ', N'096898644      ', N'Bình Sơn - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'BV2       ', N'Bùi Bích', N'Thuyền', N'Nữ        ', N'0945232812     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'1998-03-12' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'BV3       ', N'Đoàn Huyền', N'Hân', N'Nữ        ', N'0912377709     ', N'Biên Hòa - Đồng Nai', CAST(N'1994-12-06' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'BV4       ', N'Huỳnh Bá ', N'Kiên', N'Nam       ', N'0923274389     ', N'Tam kì - Quảng Nam', CAST(N'1995-09-22' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX1       ', N'Trần Việt', N'Anh', N'Nam       ', N'0932226222     ', N'Bình Sơn - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX10      ', N'Nguyễn Trung Thành', N'Đạt', N'Nam       ', N'0912311199     ', N'Biên Hòa - Ðồng Nai', CAST(N'1994-12-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX11      ', N'Bùi Trần Thanh', N'Thảo', N'Nam       ', N'0922245611     ', N'Tam kì - Quảng Nam', CAST(N'1995-09-22' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX2       ', N'Trần Văn', N'Minh', N'Nam       ', N'0933335699     ', N'Bình Sơn - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX3       ', N'Bùi Tuấn', N'Tú', N'Nam       ', N'0912345889     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'1998-03-12' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX4       ', N'Nguyễn Thành', N'Công', N'Nam       ', N'0912312699     ', N'Biên Hòa - Đồng Nai', CAST(N'1994-12-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX5       ', N'Mai Anh', N'Tú', N'Nam       ', N'0922245699     ', N'Tam kì - Quảng Nam', CAST(N'1995-09-22' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX6       ', N'Nguyễn Văn', N'Tùng', N'Nam       ', N'0912345611     ', N'Thuận An -Bình Duong', CAST(N'1988-03-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX7       ', N'Nguyễn Ðào', N'Ðào', N'Nam       ', N'0912341199     ', N'Thuận An -Bình Duong', CAST(N'1988-03-06' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX8       ', N'Trần Thanh', N'Hùng', N'Nam       ', N'0933331199     ', N'Bình Son - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'LX9       ', N'Bùi Thúy', N'Ly', N'Nam       ', N'0912345119     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'1998-03-12' AS Date), 1, 4, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT2      ', N'Ðào Bá', N'Lộc', N'Nam       ', N'0912345678     ', N'Dĩ An -Bình Dương', CAST(N'1989-03-02' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT3      ', N'Nguyễn Thanh', N'Tùng', N'Nam       ', N'0912345698     ', N'Thuận An -Bình Dương', CAST(N'1988-03-06' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT4      ', N'Nguyễn thị', N'Ðào', N'Nữ        ', N'0912345699     ', N'Thuận An -Bình Dương', CAST(N'1988-03-06' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT5      ', N'Trần Văn', N'Hùng', N'Nam       ', N'0933335699     ', N'Bình Son - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT6      ', N'Bùi Thị', N'Ly', N'Nữ        ', N'0912345889     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'1998-03-12' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT7      ', N'Nguyễn Thành', N'Ðạt', N'Nam       ', N'0912312699     ', N'Biên Hòa - Ðồng Nai', CAST(N'1994-12-06' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'NDT8      ', N'Bùi Thị Thanh', N'Thảo', N'Nữ        ', N'0922245699     ', N'Tam kì - Quảng Nam', CAST(N'1995-09-22' AS Date), 1, 8, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'PX1       ', N'Nguyễn Tuyết', N'Nhi', N'Nữ        ', N'096722612      ', N'Bình Sơn - Quảng Ngãi', CAST(N'1978-04-06' AS Date), 1, 5, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'PX2       ', N'Bùi Văn', N'Cường', N'Nam       ', N'0933345812     ', N'Bình Thạnh -TP.Hồ Chí Minh', CAST(N'1998-03-12' AS Date), 1, 5, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'PX3       ', N'Đoàn Hải', N'Kiên', N'Nam       ', N'0912354909     ', N'Biên Hòa - Đồng Nai', CAST(N'1994-12-06' AS Date), 1, 5, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'PX4       ', N'Huỳnh Trung ', N'Huyền', N'Nam       ', N'0923225189     ', N'Tam kì - Quảng Nam', CAST(N'1995-09-22' AS Date), 1, 5, NULL, NULL)
INSERT [dbo].[NHANVIEN] ([MANV], [HO], [TEN], [GIOITINH], [SODT], [DIACHI], [NGAYSINH], [TRANGTHAI], [IDCV], [CCCD], [EMAIL]) VALUES (N'px5       ', N'Nguyễn Tấn', N'Tới', N'nam       ', N'0902221211     ', N'Bình Sơn - Quảng Ngãi', CAST(N'2000-01-06' AS Date), 1, 5, N'122112121', N'nguyentantoi@gmail.com')
GO
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'AD1       ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 0, N'AD2       ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'AD3       ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'NDT2      ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'NDT3      ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'NDT4      ')
INSERT [dbo].[TAIKHOAN] ([PASSWORD], [HOATDONG], [MANV]) VALUES (N'123456              ', 1, N'NDT5      ')
GO
SET IDENTITY_INSERT [dbo].[TRAMVE] ON 

INSERT [dbo].[TRAMVE] ([ID], [DIADIEM], [TENTRAMVE], [MANVBV]) VALUES (1, N'54 - đường số 8 Linh Trung - tp Thủ Đức', N'Trạm vé 1 Thủ Đức', N'BV1       ')
INSERT [dbo].[TRAMVE] ([ID], [DIADIEM], [TENTRAMVE], [MANVBV]) VALUES (2, N'12 Tân Lập - Dĩ An -Bình Dương', N'Trạm vé Đại học quốc gia', N'BV2       ')
INSERT [dbo].[TRAMVE] ([ID], [DIADIEM], [TENTRAMVE], [MANVBV]) VALUES (3, N'20  Nguyễn Kiệm, Phường 9, Phú Nhuận, Thành phố Hồ Chí Minh, Việt Nam', N'Trạm vé 1 Phúc Nhuận', N'BV3       ')
INSERT [dbo].[TRAMVE] ([ID], [DIADIEM], [TENTRAMVE], [MANVBV]) VALUES (4, N'100 Đ. Phạm Văn Đồng, Phường 13, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'Trạm vé 1 Bình Thạnh', N'BV4       ')
SET IDENTITY_INSERT [dbo].[TRAMVE] OFF
GO
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'BX 01     ', N'BẾN XE BUÝT SÀI GÒN Lê Lai, Phường Phạm Ngũ Lão, Quận 1', N'Bến xe buýt Sài Gòn', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'BX 06     ', N'Công trường Mê Linh Thi Sách, Quận 1', N'Công Trường Mê Linh', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'BX14      ', N'GA HKXB CHO LON Lê Quang Sung, Quận 5', N'Bến xe Chợ Lớn', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'BX38      ', N'Thửa đất số 413 tờ bản đồ số 04, phường Thạnh Xuân, Quận 12 Thạnh Lộc 52, Quận 1', N'THẠNH LỘC', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 017    ', N'67 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', N'Hồ Tùng Mậu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 020    ', N'2-4 Hàm Nghi, Phường Bến Nghé, Quận 1', N'Cục Hải Quan Thành Phố', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 024    ', N'Bến thủy nội địa Thủ Thiêm Tôn Đức Thắng, Quận 1', N'Bến Bạch Đằng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 031    ', N'21 Tôn Đức Thắng, Quận 1', N'Bến Bạch Đằng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 057    ', N'2 Hai Bà Trưng, Quận 1', N'Công Trường Mê Linh', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 058    ', N'74/A2-74/A4 Hai Bà Trưng, Quận 1
', N'Nhà Hát Thành Phố', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 059    ', N'Đối diện 115Ter Hai Bà Trưng, Quận 1', N'Bệnh viện Nhi Đồng 2', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 060    ', N'86 Hai Bà Trưng, Quận 1', N'Bưu Điện Thành Phố', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 061    ', N'142 Hai Bà Trưng, Quận 1', N'Sở Công Thương', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 062    ', N'Đối diện 245 Hai Bà Trưng, Quận 1', N'Công viên Lê Văn Tám', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 063    ', N'298 Hai Bà Trưng, Quận 1', N'Nhà thờ Tân Định', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 064    ', N'372-374 Hai Bà Trưng, Quận 1
', N'Chợ Tân Định', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 102    ', N'Hàm Nghi 4 Hàm Nghi, Phường Bến Thành, Quận 1', N'Trạm Trung chuyển trên đường Hàm Nghi', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 124    ', N'8 Trần Hưng Đạo, Quận 1', N'Trường Ernst Thalmann', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 125    ', N'10 Trần Hưng Đạo, Quận 1', N'KTX Trần Hưng Đạo', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 126    ', N'112 Trần Hưng Đạo, Quận 1', N'Rạp Hưng Đạo', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 127    ', N'150 Trần Hưng Đạo, Quận 1', N'Bệnh viện Răng Hàm Mặt', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 128    ', N'210 - 212 Trần Hưng Đạo, Quận 1
', N'Trần Đình Xu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 129    ', N'262 Trần Hưng Đạo, Quận 1', N'Tổng Cty Samco', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 130    ', N'290-292-292A Trần Hưng Đạo, Quận 1', N'Chợ Nanci', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 179    ', N'Hàm nghi 5 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', N'Trạm Trung chuyển trên đường Hàm Nghi 1', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 180    ', N'Hàm Nghi 7 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', N'Trạm Trung chuyển trên đường Hàm Nghi 2', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 190    ', N'277-279-275Y Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1', N'Tôn Thất Tùng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 191    ', N'187 Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1', N'Nguyễn Thị Nghĩa', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 192    ', N'Trường Emst Thalmann Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1', N'Trường Emst Thalmann', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 193    ', N'84 Hàm Nghi, Phường Bến Nghé, Quận 1', N'Chợ Cũ', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 194    ', N'Trường Cao Thắng Hàm Nghi, Phường Bến Nghé, Quận 1', N'Trường Cao Thắng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 195    ', N'89A Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', N'Chợ Cũ', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 1950   ', N'93-95 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', N'Nam Kỳ Khởi Nghĩa', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q1 200    ', N'81-83-83B Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1
', N' Giao lộ Hàm Nghi - Tôn Thất Đạm', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 032   ', N'42 Hà Huy Giáp, Quận 12', N'Nhà hàng Bến Xưa', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 033   ', N'154 Hà Huy Giáp, Quận 12', N'Ngã tư Ga', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 034   ', N'332 Hà Huy Giáp, Qu?n 12', N'Đình thần Giao Khẩu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 035   ', N'408B Hà Huy Giáp, Qu?n 12', N'Cây xăng Tài Lộc', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 036   ', N'452 Hà Huy Giáp, Qu?n 12', N'Vườn kiểng Quang Dũng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 037   ', N'508 Hà Huy Giáp, Qu?n 12', N'Ga ra Thanh Hậu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 038   ', N'Nhà văn hóa P. Thạnh Lộc Hà Huy Giáp, Quận 12', N'Chợ Thạnh Xuân', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 039   ', N'554 Hà Huy Giáp, Quận 12', N'Trường Điện lực 2', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 040   ', N'628B Hà Huy Giáp, Quận 12', N'Trường Nguyễn Văn Thệ', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 041   ', N'704 Hà Huy Giáp, Quận 12', N'Cây xăng Thanh Bình', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 042   ', N'1/111 Hà Huy Giáp, Quận 12', N'Cầu Ông Dung', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 043   ', N'856 Hà Huy Giáp, Quận 12', N'Cầu Phú Long', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 044   ', N'938 Hà Huy Giáp, Quận 12', N'Chùa Báo Ấn', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q12 232   ', N'18 Bùi Công Trọng, Quận 12', N'Chợ Đường', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 014    ', N'13-15 Châu Van Liêm,Quận 5', N'Bưu điện Quận 5', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 015    ', N'210-212 Hải Thượng Lãn Ông, Quận 5', N'Hải Thượng Lãn Ông', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 083    ', N'454 Trần Hưng Đạo, Quận 5', N'Nguyễn Biểu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 084    ', N'520 Trần Hưng Đạo, Quận 5', N'Trường Cao đẳng Kinh tế Đối ngoại', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 085    ', N'560(564) Trần Hưng Đạo, Quận 5', N'Trần Bình Trọng', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 086    ', N'696 Trần Hưng Đạo, Quận 5', N'Bệnh viện Chấn thương Chỉnh hình', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 087    ', N'780 Trần Hưng Đạo, Quận 5', N'Rạp Đồng Tháp', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 088    ', N'882 Trần Hưng Đạo, Quận 5', N'Rạp Đống Đa', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 089    ', N'18 Trần Hưng Đạo, Quận 5', N'Đồng Khánh', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 090    ', N'212 Trần Hưng Đạo, Quận 5', N'Ngô Quyền', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 091    ', N'274 Trần Hưng Đạo, Quận 5', N'Tản Đà', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 092    ', N'390 Trần Hưng Đạo, Quận 5', N'Triệu Quang Phục', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 099    ', N'388 Trần Phú, Quận 5', N'Nhà Văn hóa Quận 5', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'Q5 102    ', N'5 Trang Tử, Quận 5', N'Chợ Kim Biên', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 040   ', N'86 - 86C Nguyễn Thái Sơn, Quận Gò Vấp', N'Cầu vượt Nguyễn Thái Sơn - Nguyễn Kiệm', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 042   ', N'182 Nguyễn Thái Sơn, Quận Gò Vấp', N'Ngã ba Phạm Ngũ Lão', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 104   ', N'110-112 Nguyễn Oanh, Quận Gò Vấp
', N'Cầu vượt ngã sáu Gò Vấp', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 106   ', N'152 Nguyễn Oanh, Quận Gò Vấp', N'Ngã tư Phan Văn Trị', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 107   ', N'214 Nguyễn Oanh, Quận Gò Vấp', N'Cư xá Lam Sơn', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 108   ', N'Đối diện 197 (93) Nguyễn Oanh, Quận Gò Vấp', N'Đài Liệt sĩ', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 109   ', N'388 Nguyễn Oanh, Quận Gò Vấp', N'Ngã tư An Nhơn', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 110   ', N'538 Nguyễn Oanh, Quận Gò Vấp', N'Bến Đò', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 111   ', N'604 Nguyễn Oanh, Phường 06, Quận Gò Vấp', N'Cầu An Lộc', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 125   ', N'780A Nguyễn Kiệm, Quận Gò Vấp', N'Trường Cao đẳng Hải Quan', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QGV 187   ', N'140-142 Phạm Ngũ Lão , Quận Gò Vấp
', N'Cầu vượt ngã sáu Gò Vấp', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 001   ', N'392 Nguyễn Kiệm, Quận Phú Nhuận', N'Ngã tư Phú Nhuận', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 002   ', N'466 Nguyễn Kiệm, Quận Phú Nhuận', N'Nhà Truyền Thông', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 003   ', N'582 Nguyễn Kiệm, Quận Phú Nhuận', N'Ngã ba Hồ Văn Huê', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 004   ', N'668-Nguyễn Kiệm, Quận Phú Nhuận', N' Coop Mart Nguyễn Kiệm', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 005   ', N'750 Nguyễn Kiệm, Quận Phú Nhuận', N'Chùa Vạn Hạnh', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 012   ', N'28 - 30 Phan Đình Phùng, Quận Phú Nhuận', N'Cầu Kiệu', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 013   ', N'158 - 160 Phan Đình Phùng, Quận Phú Nhuận', N'Chợ Phú Nhuận', N'AD2       ')
INSERT [dbo].[TRAMXE] ([MASO], [DIADIEM], [TENTRAM], [MANVTAO]) VALUES (N'QPN 014   ', N'312 - 314 Phan Đình Phùng, Quận Phú Nhuận', N'Trường Cao đẳng Kinh tế Đối ngoại', N'AD2       ')
GO
SET IDENTITY_INSERT [dbo].[TUYENDUONG] ON 

INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (1, N'Bến Thành - Bến Xe buýt Chợ Lớn', N'15:00', N'5:00-20:15          ', N'35 - 40', 8.9, NULL, 1)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (2, N'Bến Thành - Thạnh Lộc', N'6- 12', N'4:00-20:40          ', N'55 - 65', 20.6, NULL, 2)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (3, N'Bến Thành - Cộng Hòa - Bến Xe An Sương', N'8 - 10', N'5:00 - 20:15        ', N'50 - 70', 16.42, NULL, 3)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (4, N'Bến Xe buýt Chợ Lớn - Bến xe Biên Hòa', N'40- 60', N'5:00 - 17:40        ', N'100', 38, NULL, 4)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (5, N' Bến Xe Buýt Chợ Lớn- Đại học Nông Lâm', N'20', N'04:55 - 20:30       ', N'70', 26.5, NULL, 5)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (6, N'Bến Xe Buýt Chợ Lớn- Gò vấp', N'12 - 18', N'05:00 - 19:30       ', N'60 - 65', 15.5, NULL, 6)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (7, N'Bến Xe Buýt Quận 8- Đại học Quốc Gia', N'4 - 10', N'04:40 - 20:30       ', N' 80 - 90', 33, NULL, 1)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (8, N'Bến Xe Buýt Chợ Lớn - Bình Chánh - Hưng Long', N'8 - 25', N'03:45 - 19:10       ', N'70', 25, NULL, 2)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (9, N'Đại học Quốc Gia- Bến xe Miền Tây', N'15 - 25', N' 05:00 - 18:45      ', N'80', 30.85, NULL, 3)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (10, N'Bến Xe Củ Chi - Cầu Tân Thái', N'10 - 21', N'05:00 - 19:10       ', N'35', 16.8, NULL, 4)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (11, N'Bến Xe Buýt Chợ Lớn - Chợ Tân Nhựt', N'12 - 15 ', N'05:00 - 18:30       ', N'55', 19.35, NULL, 5)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (12, N'Bến Xe Buýt Sài Gòn - Nguyễn Văn Linh - Bến xe Miền Tây', N'15 - 20', N'04:45 - 19:00       ', N'80', 32.72, NULL, 6)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (13, N'Bến Xe Buýt Chợ Lớn - Bến xe Ngã 4 Ga', N'12 - 18', N'05:00 - 19:00       ', N'70 - 85', 24.9, NULL, 1)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (14, N'Bến xe An Sương - Đại học Nông Lâm', N' 6 - 12', N'04:40 - 20:00       ', N'75', 30.5, NULL, 2)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (15, N'Bến xe Củ Chi - Bố Heo', N'20 - 30', N'05:00 - 19:00       ', N'30', 15.6, NULL, 3)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (16, N'Bến Xe Buýt Sài Gòn - Sân bay Tân Sơn Nhất', N'40 - 45', N'05:30 - 22:15       ', N'45', 9.48, NULL, 4)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (17, N'Hiệp Phước - Phước Lộc', N'12 - 15', N'05:00 - 19:45       ', N'65', 26.5, NULL, 5)
INSERT [dbo].[TUYENDUONG] ([ID], [TEN], [GIANCACH], [THOIGIANHD], [THOIGIANCHUYEN], [CULY], [MANVTAO], [IDGV]) VALUES (18, N'Bến xe An Sương - Tân Quy', N'7 - 12', N'04:45 - 19:30       ', N'50', 19, NULL, 3)
SET IDENTITY_INSERT [dbo].[TUYENDUONG] OFF
GO
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-123.46  ', N'15', 1, N'xe sử dụng tốt', N'LX2       ', N'PX1       ', 17)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-123.47  ', N'15', 1, N'xe sử dụng tốt', N'LX3       ', N'PX1       ', 17)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-123.48  ', N'15', 1, N'xe sử dụng tốt', N'LX4       ', N'PX1       ', 17)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-234.56  ', N'15', 1, N'xe sử dụng tốt', N'LX5       ', N'PX2       ', 18)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-234.77  ', N'12', 1, N'xe sử dụng tốt', N'LX7       ', N'PX2       ', 18)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-234.79  ', N'12', 1, N'xe sử dụng tốt', N'LX6       ', N'PX2       ', 18)
INSERT [dbo].[XE] ([BIENSOXE], [LOAIXE], [TINHTRANGXE], [MOTAXE], [MANVLAIXE], [MANVPHUCVU], [IDTD]) VALUES (N'51B-234.80  ', N'12', 1, N'Xe sử dụng tốt', N'LX8       ', N'px5       ', 18)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CT_TUYENDUONG]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[CT_TUYENDUONG] ADD  CONSTRAINT [IX_CT_TUYENDUONG] UNIQUE NONCLUSTERED 
(
	[IDTD] ASC,
	[MATRAM] ASC,
	[THUTU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CT_TUYENDUONG_1]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[CT_TUYENDUONG] ADD  CONSTRAINT [IX_CT_TUYENDUONG_1] UNIQUE NONCLUSTERED 
(
	[IDTD] ASC,
	[MATRAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Uk_DOANHTHUNGAY]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[DOANHTHUNGAY] ADD  CONSTRAINT [Uk_DOANHTHUNGAY] UNIQUE NONCLUSTERED 
(
	[IDTD] ASC,
	[NGAY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_ID_DTT]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[DOANHTHUNGAY] ADD  CONSTRAINT [UK_ID_DTT] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_DIADIEMTV]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[TRAMVE] ADD  CONSTRAINT [UK_DIADIEMTV] UNIQUE NONCLUSTERED 
(
	[DIADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_MANVBV]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[TRAMVE] ADD  CONSTRAINT [UK_MANVBV] UNIQUE NONCLUSTERED 
(
	[MANVBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_DIADIEM]    Script Date: 6/25/2023 12:40:42 AM ******/
ALTER TABLE [dbo].[TRAMXE] ADD  CONSTRAINT [UK_DIADIEM] UNIQUE NONCLUSTERED 
(
	[DIADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOANHTHUNGAY] ADD  CONSTRAINT [DF_DOANHTHUTHANG_SOVEHSSV]  DEFAULT ((0)) FOR [SOVEHSSV]
GO
ALTER TABLE [dbo].[DOANHTHUNGAY] ADD  CONSTRAINT [DF_DOANHTHUTHANG_SOVEBT]  DEFAULT ((0)) FOR [SOVEBT]
GO
ALTER TABLE [dbo].[DOANHTHUTRAM] ADD  CONSTRAINT [DF_DOANHTHUTRAM_SOVETAP]  DEFAULT ((0)) FOR [SOVETAP]
GO
ALTER TABLE [dbo].[GIAVE] ADD  CONSTRAINT [DF_GIAVE_LOAIHINH]  DEFAULT ('TG') FOR [LOAIHINH]
GO
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [DF_NHANVIEN_PHAI]  DEFAULT ((1)) FOR [GIOITINH]
GO
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [DF_NHANVIEN_TRANGTHAI]  DEFAULT ((1)) FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_USER_HOATDONG]  DEFAULT ((1)) FOR [HOATDONG]
GO
ALTER TABLE [dbo].[XE] ADD  CONSTRAINT [DF_XE_TINHTRANGXE]  DEFAULT ((1)) FOR [TINHTRANGXE]
GO
ALTER TABLE [dbo].[CT_TUYENDUONG]  WITH CHECK ADD  CONSTRAINT [FK_CT_TUYENDUONG_TRAMXE] FOREIGN KEY([MATRAM])
REFERENCES [dbo].[TRAMXE] ([MASO])
GO
ALTER TABLE [dbo].[CT_TUYENDUONG] CHECK CONSTRAINT [FK_CT_TUYENDUONG_TRAMXE]
GO
ALTER TABLE [dbo].[CT_TUYENDUONG]  WITH CHECK ADD  CONSTRAINT [FK_CT_TUYENDUONG_TUYENDUONG] FOREIGN KEY([IDTD])
REFERENCES [dbo].[TUYENDUONG] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_TUYENDUONG] CHECK CONSTRAINT [FK_CT_TUYENDUONG_TUYENDUONG]
GO
ALTER TABLE [dbo].[DOANHTHUNGAY]  WITH CHECK ADD  CONSTRAINT [FK_DOANHTHUTHANG_TUYENDUONG] FOREIGN KEY([IDTD])
REFERENCES [dbo].[TUYENDUONG] ([ID])
GO
ALTER TABLE [dbo].[DOANHTHUNGAY] CHECK CONSTRAINT [FK_DOANHTHUTHANG_TUYENDUONG]
GO
ALTER TABLE [dbo].[DOANHTHUTRAM]  WITH CHECK ADD  CONSTRAINT [FK_DOANHTHUTRAM_DOANHTHUNGAY] FOREIGN KEY([IDDTN])
REFERENCES [dbo].[DOANHTHUNGAY] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DOANHTHUTRAM] CHECK CONSTRAINT [FK_DOANHTHUTRAM_DOANHTHUNGAY]
GO
ALTER TABLE [dbo].[DOANHTHUTRAM]  WITH CHECK ADD  CONSTRAINT [FK_DOANHTHUTRAM_TRAMVE] FOREIGN KEY([IDTRAMVE])
REFERENCES [dbo].[TRAMVE] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DOANHTHUTRAM] CHECK CONSTRAINT [FK_DOANHTHUTRAM_TRAMVE]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_CHUCVU] FOREIGN KEY([IDCV])
REFERENCES [dbo].[CHUCVU] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_CHUCVU]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_NHANVIEN]
GO
ALTER TABLE [dbo].[TRAMVE]  WITH CHECK ADD  CONSTRAINT [FK_TRAMVE_NHANVIEN1] FOREIGN KEY([MANVBV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TRAMVE] CHECK CONSTRAINT [FK_TRAMVE_NHANVIEN1]
GO
ALTER TABLE [dbo].[TRAMXE]  WITH CHECK ADD  CONSTRAINT [FK_TRAMXE_NHANVIEN1] FOREIGN KEY([MANVTAO])
REFERENCES [dbo].[NHANVIEN] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TRAMXE] CHECK CONSTRAINT [FK_TRAMXE_NHANVIEN1]
GO
ALTER TABLE [dbo].[TUYENDUONG]  WITH CHECK ADD  CONSTRAINT [FK_TUYENDUONG_GIAVE] FOREIGN KEY([IDGV])
REFERENCES [dbo].[GIAVE] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TUYENDUONG] CHECK CONSTRAINT [FK_TUYENDUONG_GIAVE]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_NHANVIEN] FOREIGN KEY([MANVPHUCVU])
REFERENCES [dbo].[NHANVIEN] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_NHANVIEN]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_NHANVIEN5] FOREIGN KEY([MANVPHUCVU])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_NHANVIEN5]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_NHANVIEN6] FOREIGN KEY([MANVLAIXE])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_NHANVIEN6]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_TUYENDUONG] FOREIGN KEY([IDTD])
REFERENCES [dbo].[TUYENDUONG] ([ID])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_TUYENDUONG]
GO
ALTER TABLE [dbo].[DOANHTHUNGAY]  WITH CHECK ADD  CONSTRAINT [CK_SOVEBT] CHECK  (([SOVEBT]>=(0)))
GO
ALTER TABLE [dbo].[DOANHTHUNGAY] CHECK CONSTRAINT [CK_SOVEBT]
GO
ALTER TABLE [dbo].[DOANHTHUNGAY]  WITH CHECK ADD  CONSTRAINT [CK_SOVEHSSV] CHECK  (([SOVEHSSV]>=(0)))
GO
ALTER TABLE [dbo].[DOANHTHUNGAY] CHECK CONSTRAINT [CK_SOVEHSSV]
GO
