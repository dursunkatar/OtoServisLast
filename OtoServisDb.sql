USE [OtoServis]
GO
/****** Object:  Table [dbo].[Araclar]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araclar](
	[AracID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[Plaka] [nvarchar](20) NOT NULL,
	[AracRenk] [nvarchar](50) NULL,
	[ModelID] [int] NOT NULL,
	[MarkaID] [int] NOT NULL,
	[Yil] [int] NOT NULL,
 CONSTRAINT [PK__Araclar__1E09A830FC43D4AA] PRIMARY KEY CLUSTERED 
(
	[AracID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marka](
	[MarkaID] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Marka__38C03DC4218050B4] PRIMARY KEY CLUSTERED 
(
	[MarkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelAdi] [nvarchar](50) NOT NULL,
	[Yil] [int] NOT NULL,
	[MarkaID] [int] NOT NULL,
 CONSTRAINT [PK__Model__E8D7A1CCC453ECA1] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Silindimi] [bit] NOT NULL,
	[KayitTarihi] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__Musteril__7262447174D70AA4] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcalar]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcalar](
	[ParcaID] [int] IDENTITY(1,1) NOT NULL,
	[ParcaAdi] [nvarchar](255) NOT NULL,
	[StokAdet] [int] NOT NULL,
	[Fiyat] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Parcalar__ECA5E711C4FE4427] PRIMARY KEY CLUSTERED 
(
	[ParcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[RolID] [int] NOT NULL,
	[Aktifmi] [bit] NOT NULL,
	[Maas] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Personel__0F0C5751DEE59C13] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Rol__F92302D1399F0FAC] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolYetkisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolYetkisi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NOT NULL,
	[YetkiId] [int] NOT NULL,
 CONSTRAINT [PK_RolYetkisi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[ParcaID] [int] NOT NULL,
	[SatisPersonelID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[AracId] [int] NOT NULL,
	[Miktar] [int] NOT NULL,
	[ToplamTutar] [decimal](10, 2) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[Silindimi] [bit] NOT NULL,
 CONSTRAINT [PK__Satis__80CB4CFFF5F9AA45] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tamir]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tamir](
	[TamirID] [int] IDENTITY(1,1) NOT NULL,
	[AracID] [int] NOT NULL,
	[MekanikUstaID] [int] NOT NULL,
	[TamirTarihi] [smalldatetime] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[TamirDurumId] [int] NOT NULL,
	[Silindimi] [bit] NOT NULL,
 CONSTRAINT [PK__Tamir__81FE4AB3A9A7CEA2] PRIMARY KEY CLUSTERED 
(
	[TamirID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TamirDurum]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TamirDurum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Durum] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TamirDurum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetkiler]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetkiler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersonelYetkileri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Araclar] ON 

INSERT [dbo].[Araclar] ([AracID], [MusteriID], [Plaka], [AracRenk], [ModelID], [MarkaID], [Yil]) VALUES (1, 1, N'34ABC01', N'Mavi', 4, 4, 2022)
INSERT [dbo].[Araclar] ([AracID], [MusteriID], [Plaka], [AracRenk], [ModelID], [MarkaID], [Yil]) VALUES (2, 2, N'34FRZ131', N'Sarı', 13, 13, 2020)
SET IDENTITY_INSERT [dbo].[Araclar] OFF
GO
SET IDENTITY_INSERT [dbo].[Marka] ON 

INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (1, N'Volkswagen')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (2, N'Toyota')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (3, N'Ford')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (4, N'Renault')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (5, N'Peugeot')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (6, N'BMW')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (7, N'Mercedes-Benz')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (8, N'Audi')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (9, N'Skoda')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (10, N'Honda')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (11, N'Hyundai')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (12, N'Kia')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (13, N'Fiat')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (14, N'Nissan')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (15, N'Mazda')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (16, N'Seat')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (17, N'Citroen')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (18, N'Opel')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (19, N'Dacia')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (20, N'Chevrolet')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (21, N'Alfa Romeo')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (22, N'Subaru')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (23, N'Suzuki')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (24, N'Lexus')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (25, N'Jeep')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (26, N'Land Rover')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (27, N'Jaguar')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (28, N'Volvo')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (29, N'Porsche')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi]) VALUES (30, N'Tesla')
SET IDENTITY_INSERT [dbo].[Marka] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (1, N'Golf', 2020, 1)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (2, N'Corolla', 2020, 2)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (3, N'Focus', 2019, 3)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (4, N'Megane', 2020, 4)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (5, N'308', 2018, 5)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (6, N'3 Serisi', 2020, 6)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (7, N'C Serisi', 2019, 7)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (8, N'A3', 2020, 8)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (9, N'Octavia', 2019, 9)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (10, N'Civic', 2020, 10)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (11, N'i20', 2018, 11)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (12, N'Rio', 2019, 12)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (13, N'Egea', 2020, 13)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (14, N'Qashqai', 2018, 14)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (15, N'3', 2019, 15)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (16, N'Leon', 2020, 16)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (17, N'C3', 2018, 17)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (18, N'Astra', 2019, 18)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (19, N'Sandero', 2020, 19)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (20, N'Cruze', 2018, 20)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (21, N'Giulietta', 2019, 21)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (22, N'Impreza', 2020, 22)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (23, N'Swift', 2018, 23)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (24, N'IS', 2019, 24)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (25, N'Renegade', 2020, 25)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (26, N'Discovery', 2020, 26)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (27, N'XE', 2019, 27)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (28, N'S60', 2020, 28)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (29, N'Cayman', 2020, 29)
INSERT [dbo].[Model] ([ModelID], [ModelAdi], [Yil], [MarkaID]) VALUES (30, N'Model 3', 2018, 30)
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (1, N'Şehmuz', N'Yılmaz', N'54684', N'sehmuz@hotmail.com', 0, CAST(N'2024-03-30T18:54:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (2, N'Faruk', N'Korkmaz', N'32424', N'faruk.korkmaz@hotmail.com', 0, CAST(N'2024-03-30T18:54:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (3, N'Ahmet', N'Demir', N'05001112233', N'ahmet.demir@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (4, N'Merve', N'Aslan', N'05001112234', N'merve.aslan@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (5, N'Emre', N'Kaya', N'05001112235', N'emre.kaya@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (6, N'Zeynep', N'Çelik', N'05001112236', N'zeynep.celik@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (7, N'Oğuz', N'Arslan', N'05001112237', N'oguz.arslan@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (8, N'Elif', N'Yılmaz', N'05001112238', N'elif.yilmaz@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
INSERT [dbo].[Musteriler] ([MusteriID], [Ad], [Soyad], [Telefon], [Email], [Silindimi], [KayitTarihi]) VALUES (9, N'Kemal', N'Uzun', N'05001112239', N'kemal.uzun@example.com', 0, CAST(N'2024-04-08T05:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Parcalar] ON 

INSERT [dbo].[Parcalar] ([ParcaID], [ParcaAdi], [StokAdet], [Fiyat]) VALUES (1, N'Lastik', 87, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Parcalar] ([ParcaID], [ParcaAdi], [StokAdet], [Fiyat]) VALUES (2, N'Fren Balatası', 67, CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[Parcalar] ([ParcaID], [ParcaAdi], [StokAdet], [Fiyat]) VALUES (3, N'Motor Yağı', 200, CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[Parcalar] ([ParcaID], [ParcaAdi], [StokAdet], [Fiyat]) VALUES (4, N'Şanzıman Yağı', 144, CAST(40.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Parcalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Email], [Sifre], [RolID], [Aktifmi], [Maas]) VALUES (1, N'Dursun', N'Katar', N'dursun.katar@gmail.com', N'123', 1, 1, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Email], [Sifre], [RolID], [Aktifmi], [Maas]) VALUES (2, N'Ahmet', N'Köse', N'ahmet.kose@gmail.com', N'456', 1, 1, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Email], [Sifre], [RolID], [Aktifmi], [Maas]) VALUES (5, N'mahmut', N'karaman', N'mahmut.karaman@gmail.com', N'323432', 3, 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Email], [Sifre], [RolID], [Aktifmi], [Maas]) VALUES (6, N'falan', N'filan', N'falanfilan@hotmail.com', N'786', 5, 1, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Email], [Sifre], [RolID], [Aktifmi], [Maas]) VALUES (7, N'Ceren', N'Dobra', N'ceren.dobra@hotmail.com', N'123', 4, 0, CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (1, N'Yönetici')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (2, N'Servis Danışmanı')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (3, N'Mekanik Usta')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (4, N'Satış Temsilcisi')
INSERT [dbo].[Rol] ([RolID], [RolAdi]) VALUES (5, N'Depo Sorumlusu')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Satis] ON 

INSERT [dbo].[Satis] ([SatisID], [ParcaID], [SatisPersonelID], [MusteriID], [AracId], [Miktar], [ToplamTutar], [Tarih], [Silindimi]) VALUES (1, 1, 7, 1, 1, 2, CAST(300.00 AS Decimal(10, 2)), CAST(N'2024-04-12T14:52:00' AS SmallDateTime), 0)
INSERT [dbo].[Satis] ([SatisID], [ParcaID], [SatisPersonelID], [MusteriID], [AracId], [Miktar], [ToplamTutar], [Tarih], [Silindimi]) VALUES (2, 1, 7, 2, 2, 3, CAST(450.00 AS Decimal(10, 2)), CAST(N'2024-04-12T14:52:00' AS SmallDateTime), 0)
INSERT [dbo].[Satis] ([SatisID], [ParcaID], [SatisPersonelID], [MusteriID], [AracId], [Miktar], [ToplamTutar], [Tarih], [Silindimi]) VALUES (3, 2, 7, 1, 1, 6, CAST(450.00 AS Decimal(10, 2)), CAST(N'2024-04-12T14:52:00' AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[Satis] OFF
GO
SET IDENTITY_INSERT [dbo].[Tamir] ON 

INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (3, 1, 5, CAST(N'2024-04-08T04:20:00' AS SmallDateTime), N'', 1, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (4, 2, 5, CAST(N'2024-04-08T04:24:00' AS SmallDateTime), N'sdfsdf', 3, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (5, 1, 5, CAST(N'2024-04-08T04:33:00' AS SmallDateTime), N'', 1, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (6, 2, 5, CAST(N'2024-04-08T04:33:00' AS SmallDateTime), N'asda', 2, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (7, 1, 5, CAST(N'2024-04-08T04:34:00' AS SmallDateTime), N'erewr', 2, 0)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (8, 2, 5, CAST(N'2024-04-08T04:34:00' AS SmallDateTime), N'wer', 3, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (9, 2, 5, CAST(N'2024-04-08T04:34:00' AS SmallDateTime), N'ad', 1, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (10, 1, 5, CAST(N'2024-04-05T04:34:00' AS SmallDateTime), N'', 3, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (11, 2, 5, CAST(N'2024-04-08T04:39:00' AS SmallDateTime), N'awd', 2, 1)
INSERT [dbo].[Tamir] ([TamirID], [AracID], [MekanikUstaID], [TamirTarihi], [Aciklama], [TamirDurumId], [Silindimi]) VALUES (12, 2, 5, CAST(N'2024-04-08T04:56:00' AS SmallDateTime), N'', 3, 0)
SET IDENTITY_INSERT [dbo].[Tamir] OFF
GO
SET IDENTITY_INSERT [dbo].[TamirDurum] ON 

INSERT [dbo].[TamirDurum] ([Id], [Durum]) VALUES (1, N'Bekliyor')
INSERT [dbo].[TamirDurum] ([Id], [Durum]) VALUES (2, N'Giriş Yapıldı')
INSERT [dbo].[TamirDurum] ([Id], [Durum]) VALUES (3, N'Sonuçlandı')
SET IDENTITY_INSERT [dbo].[TamirDurum] OFF
GO
SET IDENTITY_INSERT [dbo].[Yetkiler] ON 

INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (1, N'Admin')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (2, N'Personel Ekle')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (3, N'Personel Güncelle')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (4, N'Personel Pasif Et')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (5, N'Personel Görüntüle')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (6, N'Müşteri Ekle')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (7, N'Müşteri Güncelle')
INSERT [dbo].[Yetkiler] ([Id], [Baslik]) VALUES (8, N'Müşteri Sil')
SET IDENTITY_INSERT [dbo].[Yetkiler] OFF
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_Silindimi]  DEFAULT ((0)) FOR [Silindimi]
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_KayitTarih]  DEFAULT (getdate()) FOR [KayitTarihi]
GO
ALTER TABLE [dbo].[Personel] ADD  CONSTRAINT [DF_Personel_Aktifmi]  DEFAULT ((1)) FOR [Aktifmi]
GO
ALTER TABLE [dbo].[Personel] ADD  CONSTRAINT [DF_Personel_Maas]  DEFAULT ((10000)) FOR [Maas]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Satis_Silindimi]  DEFAULT ((0)) FOR [Silindimi]
GO
ALTER TABLE [dbo].[Tamir] ADD  CONSTRAINT [DF_Tamir_Silindimi]  DEFAULT ((0)) FOR [Silindimi]
GO
ALTER TABLE [dbo].[Araclar]  WITH CHECK ADD  CONSTRAINT [FK__Araclar__ModelID__37A5467C] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[Araclar] CHECK CONSTRAINT [FK__Araclar__ModelID__37A5467C]
GO
ALTER TABLE [dbo].[Araclar]  WITH CHECK ADD  CONSTRAINT [FK__Araclar__Musteri__38996AB5] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteriler] ([MusteriID])
GO
ALTER TABLE [dbo].[Araclar] CHECK CONSTRAINT [FK__Araclar__Musteri__38996AB5]
GO
ALTER TABLE [dbo].[Araclar]  WITH CHECK ADD  CONSTRAINT [FK_Araclar_Marka] FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Marka] ([MarkaID])
GO
ALTER TABLE [dbo].[Araclar] CHECK CONSTRAINT [FK_Araclar_Marka]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Marka] ([MarkaID])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK__Personel__RolID__3B75D760] FOREIGN KEY([RolID])
REFERENCES [dbo].[Rol] ([RolID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK__Personel__RolID__3B75D760]
GO
ALTER TABLE [dbo].[RolYetkisi]  WITH CHECK ADD  CONSTRAINT [FK_RolYetkisi_Rol] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rol] ([RolID])
GO
ALTER TABLE [dbo].[RolYetkisi] CHECK CONSTRAINT [FK_RolYetkisi_Rol]
GO
ALTER TABLE [dbo].[RolYetkisi]  WITH CHECK ADD  CONSTRAINT [FK_RolYetkisi_Yetkiler] FOREIGN KEY([YetkiId])
REFERENCES [dbo].[Yetkiler] ([Id])
GO
ALTER TABLE [dbo].[RolYetkisi] CHECK CONSTRAINT [FK_RolYetkisi_Yetkiler]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__MusteriID__3C69FB99] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteriler] ([MusteriID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__MusteriID__3C69FB99]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__ParcaID__3D5E1FD2] FOREIGN KEY([ParcaID])
REFERENCES [dbo].[Parcalar] ([ParcaID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__ParcaID__3D5E1FD2]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__SatisPers__3E52440B] FOREIGN KEY([SatisPersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__SatisPers__3E52440B]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Araclar] FOREIGN KEY([AracId])
REFERENCES [dbo].[Araclar] ([AracID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Araclar]
GO
ALTER TABLE [dbo].[Tamir]  WITH CHECK ADD  CONSTRAINT [FK__Tamir__AracID__3F466844] FOREIGN KEY([AracID])
REFERENCES [dbo].[Araclar] ([AracID])
GO
ALTER TABLE [dbo].[Tamir] CHECK CONSTRAINT [FK__Tamir__AracID__3F466844]
GO
ALTER TABLE [dbo].[Tamir]  WITH CHECK ADD  CONSTRAINT [FK__Tamir__MekanikUs__403A8C7D] FOREIGN KEY([MekanikUstaID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Tamir] CHECK CONSTRAINT [FK__Tamir__MekanikUs__403A8C7D]
GO
ALTER TABLE [dbo].[Tamir]  WITH CHECK ADD  CONSTRAINT [FK_Tamir_TamirDurum] FOREIGN KEY([TamirDurumId])
REFERENCES [dbo].[TamirDurum] ([Id])
GO
ALTER TABLE [dbo].[Tamir] CHECK CONSTRAINT [FK_Tamir_TamirDurum]
GO
/****** Object:  StoredProcedure [dbo].[SpBelirliBirMusterininTumAracBilgileri]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpBelirliBirMusterininTumAracBilgileri] (@MusteriId as int)
as
begin
SELECT M.Ad, M.Soyad, A.Plaka, A.AracRenk, MK.MarkaAdi, MD.ModelAdi
FROM Musteriler M
JOIN Araclar A ON M.MusteriID = A.MusteriID
JOIN Marka MK ON A.MarkaID = MK.MarkaID
JOIN Model MD ON A.ModelID = MD.ModelID
WHERE @MusteriId = -1 or (M.MusteriID = @MusteriId)

end
GO
/****** Object:  StoredProcedure [dbo].[SpBirYildaTamirEdilenHerBirAracinBilgieriVeTamirSayisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpBirYildaTamirEdilenHerBirAracinBilgieriVeTamirSayisi]
as
begin
SELECT A.Plaka, COUNT(T.TamirID) AS TamirSayısı, YEAR(T.TamirTarihi) AS Yil
FROM Tamir T
JOIN Araclar A ON T.AracID = A.AracID
GROUP BY A.Plaka, YEAR(T.TamirTarihi);



end
GO
/****** Object:  StoredProcedure [dbo].[SpBirYildaYapilanToplamSatisMiktari]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpBirYildaYapilanToplamSatisMiktari]
as
begin
SELECT YEAR(S.Tarih) AS Yil, SUM(S.Miktar) AS ToplamSatisMiktari
FROM Satis S
GROUP BY YEAR(S.Tarih);



end
GO
/****** Object:  StoredProcedure [dbo].[SpEnCokGelirGetirenIlkBesParca]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpEnCokGelirGetirenIlkBesParca]
as
begin
SELECT TOP 5 P.ParcaAdi, SUM(S.ToplamTutar) AS ToplamGelir
FROM Satis S
JOIN Parcalar P ON S.ParcaID = P.ParcaID
GROUP BY P.ParcaAdi
ORDER BY SUM(S.ToplamTutar) DESC;


end
GO
/****** Object:  StoredProcedure [dbo].[SpEnCokKullanilanParcalarVeAraclardakiKullanimSikligi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpEnCokKullanilanParcalarVeAraclardakiKullanimSikligi]
as
begin

	SELECT P.ParcaAdi, COUNT(0) AS KullanimSikligi
FROM Satis S
JOIN Parcalar P ON S.ParcaID = P.ParcaID
GROUP BY P.ParcaAdi
ORDER BY COUNT(0) DESC;



end
GO
/****** Object:  StoredProcedure [dbo].[SpEncokTamirEdilenAraclarListesi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpEncokTamirEdilenAraclarListesi]
as
begin
SELECT A.Plaka, COUNT(T.TamirID) AS TamirSayisi
FROM Araclar A
JOIN Tamir T ON A.AracID = T.AracID
GROUP BY A.Plaka
ORDER BY COUNT(T.TamirID) DESC;
end
GO
/****** Object:  StoredProcedure [dbo].[SpEnCokTamirEdilenAracModelleri]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpEnCokTamirEdilenAracModelleri](@TamirBaslangicTarihi as date)
as
begin

	SELECT MD.ModelAdi, COUNT(T.TamirID) AS TamirSayisi
FROM Tamir T
JOIN Araclar A ON T.AracID = A.AracID
JOIN Model MD ON A.ModelID = MD.ModelID
WHERE cast(T.TamirTarihi as date) >= @TamirBaslangicTarihi
GROUP BY MD.ModelAdi
ORDER BY COUNT(T.TamirID) DESC;


end
GO
/****** Object:  StoredProcedure [dbo].[SpHerBirMarkayaAitAracSayisiVeOrtalamaYaslari]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpHerBirMarkayaAitAracSayisiVeOrtalamaYaslari]
as
begin
	SELECT MK.MarkaAdi, COUNT(A.AracID) AS AracSayisi, AVG(YEAR(GETDATE()) - A.Yil) AS OrtalamaYas
FROM Araclar A
JOIN Marka MK ON A.MarkaID = MK.MarkaID
GROUP BY MK.MarkaAdi;



end
GO
/****** Object:  StoredProcedure [dbo].[SpHerBirParcaninOrtalamaSatisFiyati]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpHerBirParcaninOrtalamaSatisFiyati]
as
begin
	SELECT P.ParcaAdi, AVG(S.ToplamTutar / S.Miktar) AS OrtalamaSatisFiyati
FROM Satis S
JOIN Parcalar P ON S.ParcaID = P.ParcaID
GROUP BY P.ParcaAdi;


end
GO
/****** Object:  StoredProcedure [dbo].[SpHerBirPersonelIcinYapilanToplamSatisTutariVeSatisAdedi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpHerBirPersonelIcinYapilanToplamSatisTutariVeSatisAdedi]
as
begin

	SELECT P.Email, P.Ad + ' ' + P.Soyad as SatisPersoneli, SUM(S.ToplamTutar) AS ToplamSatisTutari, COUNT(S.SatisID) AS SatisAdedi
FROM Personel P
JOIN Satis S ON P.PersonelID = S.SatisPersonelID
GROUP BY P.Email, P.Ad + ' ' + P.Soyad;



end
GO
/****** Object:  StoredProcedure [dbo].[SpHerBirRoldekiPersonelSayisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpHerBirRoldekiPersonelSayisi]
as
begin
SELECT R.RolAdi, COUNT(P.PersonelID) AS PersonelSayisi
FROM Rol R
JOIN Personel P ON R.RolID = P.RolID
GROUP BY R.RolAdi;



end
GO
/****** Object:  StoredProcedure [dbo].[SpMarkayaGoreSatilanParcaSayisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpMarkayaGoreSatilanParcaSayisi]
as
begin
  select m.MarkaAdi,sum(s.Miktar) as SatilanParcaSayisi from Satis as s
  inner join Parcalar as p on p.ParcaID=s.ParcaID
  inner join Araclar as a on a.AracID=s.AracId
  inner join Marka as m on m.MarkaID=a.MarkaID
  where s.Silindimi=0
  group by m.MarkaAdi
end
GO
/****** Object:  StoredProcedure [dbo].[SpMekanikUstalarininYaptigiTamirlerVeToplamCalismaSaatleri]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpMekanikUstalarininYaptigiTamirlerVeToplamCalismaSaatleri]
as
begin

	SELECT p.Email, P.Ad + ' ' + P.Soyad as Usta, COUNT(T.TamirID) AS TamirSayisi, SUM(DATEDIFF(hour, T.TamirTarihi, S.Tarih)) AS ToplamCalismaSaati
FROM Personel P
JOIN Tamir T ON P.PersonelID = T.MekanikUstaID
join Araclar A on A.AracID=T.AracID
join Satis S on S.MusteriID=A.MusteriID
GROUP BY p.Email, P.Ad + ' ' + P.Soyad;



end
GO
/****** Object:  StoredProcedure [dbo].[SpMekanikUstalarinTamirEttigiAracSayisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpMekanikUstalarinTamirEttigiAracSayisi]
as
begin
SELECT p.Email, P.Ad + ' ' + p.Soyad as Usta, COUNT(T.AracID) AS TamirEdilenAracSayisi
FROM Personel P
JOIN Tamir T ON P.PersonelID = T.MekanikUstaID
where T.Silindimi=0
GROUP BY p.Email,P.Ad + ' ' + p.Soyad;
end
GO
/****** Object:  StoredProcedure [dbo].[SpModelYilinaGoreAracSayisi]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpModelYilinaGoreAracSayisi]
as
begin
SELECT M.ModelAdi, M.Yil, COUNT(0) AS AracSayisi
FROM Araclar A
JOIN Model M ON A.ModelID = M.ModelID
GROUP BY M.ModelAdi,M.Yil;
end
GO
/****** Object:  StoredProcedure [dbo].[SpMusterilereGoreToplamHarcamaMiktari]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SpMusterilereGoreToplamHarcamaMiktari]
as
begin
SELECT M.Ad, M.Soyad, SUM(S.ToplamTutar) AS ToplamHarcama
FROM Musteriler M
JOIN Satis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad;
end
GO
/****** Object:  StoredProcedure [dbo].[SpMusterilerinEnSonSatinAldiklariParcalar]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpMusterilerinEnSonSatinAldiklariParcalar]
as
begin
SELECT M.Ad, M.Soyad, P.ParcaAdi, MAX(S.Tarih) AS SonSatinalmaTarihi
FROM Musteriler M
JOIN Satis S ON M.MusteriID = S.MusteriID
JOIN Parcalar P ON S.ParcaID = P.ParcaID
GROUP BY M.Ad, M.Soyad, P.ParcaAdi;


end
GO
/****** Object:  StoredProcedure [dbo].[SpMusterininTamirIcinHarcadigiToplamTutar]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpMusterininTamirIcinHarcadigiToplamTutar]
as
begin
SELECT M.Ad, M.Soyad, SUM(S.ToplamTutar) AS ToplamHarcama
FROM Musteriler M
JOIN Satis S ON M.MusteriID = S.MusteriID
JOIN Araclar A ON M.MusteriID= A.MusteriID
JOIN Tamir T ON A.AracID = T.AracID
GROUP BY M.Ad, M.Soyad;



end
GO
/****** Object:  StoredProcedure [dbo].[SpStoktakiParcalarinToplamDegeri]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SpStoktakiParcalarinToplamDegeri]
as
begin
SELECT SUM(StokAdet * Fiyat) AS ToplamDeger
FROM Parcalar;

end
GO
/****** Object:  StoredProcedure [dbo].[SpTamirEdilenAraclar]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpTamirEdilenAraclar](@BaslangicTarihi as date)
as
begin
SELECT A.Plaka, T.TamirTarihi, T.Aciklama
FROM Tamir T
JOIN Araclar A ON T.AracID = A.AracID
WHERE cast(T.TamirTarihi as date) >= @BaslangicTarihi;
end
GO
/****** Object:  StoredProcedure [dbo].[SpTamirIslemiGorenAracBilgileri]    Script Date: 12.04.2024 19:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpTamirIslemiGorenAracBilgileri]
as
begin
SELECT 
    M.Ad + ' ' + M.Soyad AS MusteriAdSoyad,
    A.Plaka,
    A.AracRenk ,
    P.Ad+ ' ' + P.Soyad AS TamirEdenPersonel,
    T.TamirTarihi ,
    T.Aciklama 
FROM Tamir T
INNER JOIN Araclar A ON T.AracID = A.AracID
INNER JOIN Musteriler M ON A.MusteriID = M.MusteriID
INNER JOIN Personel P ON T.MekanikUstaID = P.PersonelID
ORDER BY T.TamirTarihi DESC;
end
GO
