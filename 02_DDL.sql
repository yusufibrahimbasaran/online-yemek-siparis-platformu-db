-- ==============================================================================
-- VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı
-- 02: DDL (Data Definition Language) ve Kısıtlamalar (Constraints)
-- Hedef Veritabanı: Microsoft SQL Server (T-SQL)
-- ==============================================================================

-- 1. Veritabanının Oluşturulması
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'YemekSiparisiDB')
BEGIN
    CREATE DATABASE YemekSiparisiDB;
END
GO

USE YemekSiparisiDB;
GO

-- ==============================================================================
-- BAĞIMSIZ TABLOLAR (Foreign Key içermeyen tablolar önce oluşturulur)
-- ==============================================================================

-- MÜŞTERİLER TABLOSU
CREATE TABLE Musteriler (
    MusteriID INT IDENTITY(1,1) NOT NULL,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon VARCHAR(15) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    IhtiyacSahibiMi BIT DEFAULT 0 NOT NULL, -- 1: Askıda yemek alabilir, 0: Alamaz
    KayitTarihi DATETIME DEFAULT GETDATE() NOT NULL,
    IsActive BIT DEFAULT 1 NOT NULL, -- Soft Delete için (1: Aktif, 0: Pasif)
    
    CONSTRAINT PK_Musteriler PRIMARY KEY (MusteriID),
    CONSTRAINT UQ_Musteri_Telefon UNIQUE (Telefon),
    CONSTRAINT UQ_Musteri_Email UNIQUE (Email)
);
GO

-- RESTORANLAR TABLOSU
CREATE TABLE Restoranlar (
    RestoranID INT IDENTITY(1,1) NOT NULL,
    RestoranAdi NVARCHAR(100) NOT NULL,
    MinimumPaketTutari DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
    RestoranPuani DECIMAL(3,2) DEFAULT 0.00 NOT NULL,
    KayitTarihi DATETIME DEFAULT GETDATE() NOT NULL,
    IsActive BIT DEFAULT 1 NOT NULL,
    
    CONSTRAINT PK_Restoranlar PRIMARY KEY (RestoranID),
    CONSTRAINT CK_RestoranPuani CHECK (RestoranPuani >= 1.00 AND RestoranPuani <= 5.00) -- Proje İsteri: CHECK kısıtı
);
GO

-- KURYELER TABLOSU
CREATE TABLE Kuryeler (
    KuryeID INT IDENTITY(1,1) NOT NULL,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon VARCHAR(15) NOT NULL,
    Plaka VARCHAR(15) NOT NULL,
    IseGirisTarihi DATETIME DEFAULT GETDATE() NOT NULL,
    IsActive BIT DEFAULT 1 NOT NULL,

    CONSTRAINT PK_Kuryeler PRIMARY KEY (KuryeID),
    CONSTRAINT UQ_Kurye_Telefon UNIQUE (Telefon)
);
GO

-- KATEGORİLER TABLOSU
CREATE TABLE Kategoriler (
    KategoriID INT IDENTITY(1,1) NOT NULL,
    KategoriAdi NVARCHAR(50) NOT NULL,
    IsActive BIT DEFAULT 1 NOT NULL,

    CONSTRAINT PK_Kategoriler PRIMARY KEY (KategoriID),
    CONSTRAINT UQ_KategoriAdi UNIQUE (KategoriAdi)
);
GO

-- ASKIDA YEMEK HAVUZU (SİSTEM TABLOSU - SADECE 1 SATIR OLACAK)
CREATE TABLE AskidaYemekHavuzu (
    HavuzID INT IDENTITY(1,1) NOT NULL,
    ToplamBakiye DECIMAL(18,2) DEFAULT 0.00 NOT NULL,
    SonGuncellemeTarihi DATETIME DEFAULT GETDATE() NOT NULL,

    CONSTRAINT PK_AskidaYemekHavuzu PRIMARY KEY (HavuzID),
    CONSTRAINT CK_HavuzBakiyesi CHECK (ToplamBakiye >= 0) -- Havuz eksiye düşemez
);
GO


-- ==============================================================================
-- BAĞIMLI TABLOLAR (Foreign Key içeren tablolar)
-- ==============================================================================

-- ÜRÜNLER TABLOSU
CREATE TABLE Urunler (
    UrunID INT IDENTITY(1,1) NOT NULL,
    RestoranID INT NOT NULL,
    KategoriID INT NOT NULL,
    UrunAdi NVARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) NOT NULL,
    Aciklama NVARCHAR(255) NULL,
    IsActive BIT DEFAULT 1 NOT NULL,

    CONSTRAINT PK_Urunler PRIMARY KEY (UrunID),
    CONSTRAINT FK_Urun_Restoran FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    CONSTRAINT FK_Urun_Kategori FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID),
    CONSTRAINT CK_UrunFiyati CHECK (Fiyat > 0) -- Proje İsteri: CHECK kısıtı
);
GO

-- HAVUZ BAĞIŞLARI TABLOSU (Askıya Para Bırakanlar)
CREATE TABLE HavuzBagislari (
    BagisID INT IDENTITY(1,1) NOT NULL,
    MusteriID INT NULL, -- NULL ise Anonim bağış demektir
    Tutar DECIMAL(10,2) NOT NULL,
    BagisTarihi DATETIME DEFAULT GETDATE() NOT NULL,
    GizliBagisMi BIT DEFAULT 0 NOT NULL,

    CONSTRAINT PK_HavuzBagislari PRIMARY KEY (BagisID),
    CONSTRAINT FK_Bagis_Musteri FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
    CONSTRAINT CK_BagisTutari CHECK (Tutar > 0)
);
GO

-- SİPARİŞLER TABLOSU
CREATE TABLE Siparisler (
    SiparisID INT IDENTITY(1,1) NOT NULL,
    MusteriID INT NOT NULL,
    RestoranID INT NOT NULL,
    KuryeID INT NULL, -- Başlangıçta Kurye atanmamış olabilir
    SiparisTarihi DATETIME DEFAULT GETDATE() NOT NULL,
    ToplamTutar DECIMAL(10,2) NOT NULL,
    SiparisDurumu NVARCHAR(30) DEFAULT 'Hazırlanıyor' NOT NULL, -- Hazırlanıyor, Yolda, Teslim Edildi, İptal
    AskidaYemekKullanildiMi BIT DEFAULT 0 NOT NULL, -- 1 ise ödeme havuzdan yapılmıştır
    IsActive BIT DEFAULT 1 NOT NULL,

    CONSTRAINT PK_Siparisler PRIMARY KEY (SiparisID),
    CONSTRAINT FK_Siparis_Musteri FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
    CONSTRAINT FK_Siparis_Restoran FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    CONSTRAINT FK_Siparis_Kurye FOREIGN KEY (KuryeID) REFERENCES Kuryeler(KuryeID),
    CONSTRAINT CK_SiparisTutari CHECK (ToplamTutar >= 0)
);
GO

-- SİPARİŞ DETAYLARI TABLOSU (Siparişteki ürünler)
CREATE TABLE SiparisDetaylari (
    SiparisDetayID INT IDENTITY(1,1) NOT NULL,
    SiparisID INT NOT NULL,
    UrunID INT NOT NULL,
    Adet INT NOT NULL,
    BirimFiyat DECIMAL(10,2) NOT NULL, -- Sipariş anındaki ürün fiyatı

    CONSTRAINT PK_SiparisDetaylari PRIMARY KEY (SiparisDetayID),
    CONSTRAINT FK_SiparisDetay_Siparis FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
    CONSTRAINT FK_SiparisDetay_Urun FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
    CONSTRAINT CK_SiparisAdet CHECK (Adet > 0),
    CONSTRAINT CK_BirimFiyat CHECK (BirimFiyat >= 0)
);
GO

-- Havuz başlangıç değerini (0 TL) ekleyelim
INSERT INTO AskidaYemekHavuzu (ToplamBakiye, SonGuncellemeTarihi) VALUES (0.00, GETDATE());
GO

PRINT '02: Veritabanı ve tablolar başarıyla oluşturuldu.'
