-- ==============================================================================
-- VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı
-- 05: DML (Veri Manipülasyonu) ve Sahte Veriler (Mock Data)
-- Hedef Veritabanı: Microsoft SQL Server (T-SQL)
-- ==============================================================================

USE YemekSiparisiDB;
GO

-- Proje İsteri: En az 5 restoran, 50 farklı ürün, 20 müşteri, "Askıda Yemek" işlemleri ve 100 sipariş hareketi.

-- ==============================================================================
-- 1. KATEGORİLER (6 Adet)
-- ==============================================================================
INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Hamburgerler'), ('Pizzalar'), ('Kebaplar ve Izgaralar'), 
('Ev Yemekleri'), ('Tatlılar'), ('İçecekler');
GO

-- ==============================================================================
-- 2. RESTORANLAR (5 Adet)
-- ==============================================================================
INSERT INTO Restoranlar (RestoranAdi, MinimumPaketTutari, RestoranPuani) VALUES 
('Burger King', 100.00, 4.20),
('Dominos Pizza', 120.00, 4.50),
('Köfteci Yusuf', 150.00, 4.60),
('Gaziantepli Kebapçı', 200.00, 4.80),
('Mado', 80.00, 4.90);
GO

-- ==============================================================================
-- 3. ÜRÜNLER (50 Adet - Her restorana 10'ar ürün)
-- ==============================================================================
INSERT INTO Urunler (RestoranID, KategoriID, UrunAdi, Fiyat) VALUES
(1, 1, 'Whopper Menü', 150.00), (1, 1, 'Texas Smokehouse', 170.00), (1, 1, 'Steakhouse Burger', 180.00),
(1, 1, 'Chicken Royale', 130.00), (1, 1, 'Big King XXL', 200.00), (1, 6, 'Kutu Kola', 30.00),
(1, 6, 'Ayran', 20.00), (1, 6, 'Soğan Halkası (Büyük)', 40.00), (1, 5, 'Çikolatalı Sufle', 50.00),
(1, 5, 'Dondurma', 35.00),
(2, 2, 'Karışık Pizza (Büyük)', 250.00), (2, 2, 'Margarita Pizza (Orta)', 180.00), (2, 2, 'Sucuksever Pizza', 200.00),
(2, 2, 'Extravaganzza', 280.00), (2, 2, 'Konyalım Pizza', 260.00), (2, 6, 'Litre Kola', 40.00),
(2, 6, 'Fanta', 30.00), (2, 4, 'Sarımsaklı Ekmek', 35.00), (2, 5, 'Mozaik Pasta', 60.00),
(2, 5, 'Brownie', 70.00),
(3, 3, 'Porsiyon Köfte', 150.00), (3, 3, 'Sucuk Porsiyon', 160.00), (3, 3, 'Kuzu Şiş', 220.00),
(3, 3, 'Karışık Izgara', 300.00), (3, 3, 'Tavuk Şiş', 140.00), (3, 6, 'Şişe Ayran', 25.00),
(3, 6, 'Şalgam Suyu', 20.00), (3, 4, 'Piyaz', 45.00), (3, 5, 'Ekmek Kadayıfı', 60.00),
(3, 5, 'Kemalpaşa Tatlısı', 50.00),
(4, 3, 'Adana Dürüm', 120.00), (4, 3, 'Urfa Porsiyon', 180.00), (4, 3, 'Ali Nazik', 220.00),
(4, 3, 'Beyti Sarma', 250.00), (4, 4, 'Lahmacun', 50.00), (4, 6, 'Açık Ayran', 25.00),
(4, 6, 'Kutu Şalgam', 20.00), (4, 4, 'İçli Köfte (Adet)', 35.00), (4, 5, 'Künefe', 90.00),
(4, 5, 'Havuç Dilimi Baklava', 100.00),
(5, 5, 'Fıstıklı Dondurma', 80.00), (5, 5, 'Maraş Kesme', 120.00), (5, 5, 'Triliçe', 70.00),
(5, 5, 'Sütlaç', 60.00), (5, 5, 'Kazandibi', 65.00), (5, 6, 'Türk Kahvesi', 50.00),
(5, 6, 'Çay', 20.00), (5, 6, 'Taze Sıkma Portakal', 60.00), (5, 4, 'Su Böreği (Porsiyon)', 70.00),
(5, 4, 'Kıymalı Kol Böreği', 75.00);
GO

-- ==============================================================================
-- 4. KURYELER (5 Adet)
-- ==============================================================================
INSERT INTO Kuryeler (Ad, Soyad, Telefon, Plaka) VALUES
('Ahmet', 'Yılmaz', '5551001010', '34ABC123'), ('Mehmet', 'Kaya', '5552002020', '06XYZ987'),
('Ali', 'Demir', '5553003030', '35DEF456'), ('Veli', 'Çelik', '5554004040', '16GHI789'),
('Ayşe', 'Şahin', '5555005050', '07JKL012');
GO

-- ==============================================================================
-- 5. MÜŞTERİLER (20 Adet - Son 2 müşteri İhtiyaç Sahibi)
-- ==============================================================================
INSERT INTO Musteriler (Ad, Soyad, Telefon, Email, IhtiyacSahibiMi) VALUES
('Fatma', 'Gül', '5301112233', 'fatma@mail.com', 0), ('Mustafa', 'Can', '5302223344', 'mustafa@mail.com', 0),
('Zeynep', 'Korkmaz', '5303334455', 'zeynep@mail.com', 0), ('Emre', 'Aydın', '5304445566', 'emre@mail.com', 0),
('Ebru', 'Yalçın', '5305556677', 'ebru@mail.com', 0), ('Burak', 'Aslan', '5306667788', 'burak@mail.com', 0),
('Elif', 'Polat', '5307778899', 'elif@mail.com', 0), ('Caner', 'Koç', '5308889900', 'caner@mail.com', 0),
('Selin', 'Çetin', '5309990011', 'selin@mail.com', 0), ('Deniz', 'Tekin', '5300001122', 'deniz@mail.com', 0),
('Oğuz', 'Avcı', '5311112233', 'oguz@mail.com', 0), ('Derya', 'Bozkurt', '5312223344', 'derya@mail.com', 0),
('Volkan', 'Şen', '5313334455', 'volkan@mail.com', 0), ('Esra', 'Kılıç', '5314445566', 'esra@mail.com', 0),
('Hakan', 'Erdoğan', '5315556677', 'hakan@mail.com', 0), ('Merve', 'Gündüz', '5316667788', 'merve@mail.com', 0),
('Tolga', 'Akın', '5317778899', 'tolga@mail.com', 0), ('Ceren', 'Yavuz', '5318889900', 'ceren@mail.com', 0),
-- Aşağıdaki 2 müşteri Askıda Yemek havuzundan faydalanabilecek ihtiyaç sahipleri
('Kemal', 'Garip', '5319990011', 'kemal@mail.com', 1), ('Ayten', 'Yoksun', '5310001122', 'ayten@mail.com', 1);
GO

-- ==============================================================================
-- 6. ASKIDA YEMEK BAĞIŞLARI (Trigger Testi İçin)
-- ==============================================================================
INSERT INTO HavuzBagislari (MusteriID, Tutar, GizliBagisMi) VALUES
(1, 500.00, 0),
(5, 300.00, 1),
(NULL, 1200.00, 1);
GO

-- ==============================================================================
-- 7. SİPARİŞLER VE SİPARİŞ DETAYLARI (100 ADET AÇIK YAZILMIŞ SİPARİŞ)
-- ==============================================================================
-- Askıdan Ödenen Siparişler
INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (19, 1, 1, 150.00, 'Teslim Edildi', 1);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 1, 1, 150.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (20, 2, 2, 200.00, 'Teslim Edildi', 1);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 13, 1, 200.00);

-- Normal Siparişler (Kalan 98 adet)
INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (4, 1, 3, 120.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 4, 1, 120.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 1, 5, 230.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 2, 1, 230.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 1, 1, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 2, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 5, 5, 220.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 41, 1, 220.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 5, 4, 190.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 44, 1, 190.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 1, 2, 150.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 7, 1, 150.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 2, 2, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 16, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (3, 4, 1, 160.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 36, 1, 160.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 1, 4, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 9, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (13, 1, 5, 250.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 5, 1, 250.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 5, 2, 60.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 42, 1, 60.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 3, 1, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 24, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (13, 3, 4, 100.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 26, 1, 100.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 3, 2, 270.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 25, 1, 270.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (3, 5, 2, 280.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 49, 1, 280.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 2, 4, 130.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 17, 1, 130.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 3, 120.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 11, 1, 120.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (2, 3, 4, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 25, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 5, 3, 250.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 44, 1, 250.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (16, 4, 4, 130.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 33, 1, 130.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 2, 5, 130.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 19, 1, 130.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 5, 4, 120.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 46, 1, 120.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 5, 4, 290.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 42, 1, 290.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (2, 1, 2, 300.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 3, 1, 300.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 5, 1, 170.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 47, 1, 170.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (15, 5, 3, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 49, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (4, 5, 3, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 46, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 4, 2, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 38, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 5, 2, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 49, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 5, 5, 90.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 44, 1, 90.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 2, 5, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 19, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (11, 4, 1, 160.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 32, 1, 160.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 2, 1, 230.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 14, 1, 230.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (3, 1, 4, 290.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 2, 1, 290.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 2, 220.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 18, 1, 220.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (6, 3, 5, 180.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 30, 1, 180.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 5, 2, 170.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 45, 1, 170.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 4, 5, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 38, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 2, 1, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 16, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 5, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 14, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (3, 1, 2, 60.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 2, 1, 60.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (11, 1, 5, 130.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 4, 1, 130.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (16, 2, 5, 280.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 13, 1, 280.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (16, 2, 4, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 17, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (4, 1, 4, 180.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 6, 1, 180.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 4, 1, 60.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 32, 1, 60.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (13, 3, 1, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 24, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 5, 4, 180.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 43, 1, 180.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (6, 3, 4, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 24, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (15, 5, 1, 250.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 41, 1, 250.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 1, 1, 100.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 4, 1, 100.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 4, 4, 170.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 34, 1, 170.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (2, 2, 4, 170.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 11, 1, 170.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 4, 3, 270.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 37, 1, 270.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 4, 2, 140.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 34, 1, 140.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 1, 5, 60.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 9, 1, 60.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (11, 1, 1, 200.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 10, 1, 200.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (17, 5, 2, 210.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 41, 1, 210.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (3, 2, 1, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 20, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 4, 1, 120.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 40, 1, 120.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (2, 5, 1, 260.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 47, 1, 260.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (17, 3, 3, 260.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 24, 1, 260.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (11, 2, 3, 90.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 17, 1, 90.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 4, 3, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 32, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (15, 5, 5, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 42, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 5, 90.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 15, 1, 90.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 1, 2, 140.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 6, 1, 140.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (6, 4, 5, 240.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 35, 1, 240.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (17, 1, 5, 260.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 5, 1, 260.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (4, 2, 3, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 12, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 3, 240.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 15, 1, 240.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 3, 2, 210.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 25, 1, 210.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (16, 3, 1, 250.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 22, 1, 250.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 3, 1, 150.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 21, 1, 150.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 3, 2, 220.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 28, 1, 220.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 5, 1, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 42, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 5, 1, 230.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 46, 1, 230.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 4, 60.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 13, 1, 60.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 3, 1, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 26, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 1, 3, 180.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 9, 1, 180.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (5, 2, 2, 180.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 13, 1, 180.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (1, 2, 3, 300.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 17, 1, 300.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (8, 3, 2, 170.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 22, 1, 170.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (2, 4, 2, 190.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 34, 1, 190.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (12, 3, 2, 50.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 24, 1, 50.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (7, 4, 3, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 35, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 3, 5, 260.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 27, 1, 260.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 3, 1, 130.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 22, 1, 130.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (6, 5, 3, 80.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 41, 1, 80.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 3, 3, 240.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 27, 1, 240.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (17, 1, 4, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 10, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (9, 1, 4, 210.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 1, 1, 210.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (18, 2, 3, 70.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 17, 1, 70.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (11, 5, 3, 280.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 42, 1, 280.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 5, 3, 150.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 47, 1, 150.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (13, 3, 5, 110.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 23, 1, 110.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (14, 4, 2, 230.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 40, 1, 230.00);

INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, ToplamTutar, SiparisDurumu, AskidaYemekKullanildiMi)
VALUES (10, 4, 5, 140.00, 'Teslim Edildi', 0);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
VALUES (@@IDENTITY, 31, 1, 140.00);

PRINT '05: DML işlemleri tamamlandı. Tüm veriler başarıyla eklendi.'
GO
