-- ==============================================================================
-- VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı
-- 03: İleri Düzey Nesneler (View ve Index'ler)
-- Hedef Veritabanı: Microsoft SQL Server (T-SQL)
-- ==============================================================================

USE YemekSiparisiDB;
GO

-- ==============================================================================
-- 1. GÖRÜNÜMLER (VIEWS)
-- Proje İsteri: Karmaşık sorguları basitleştiren en az 2 adet View oluşturulmalıdır.
-- ==============================================================================

-- Görünüm 1: Aktif Restoranların Menüleri (vw_AktifRestoranMenuleri)
-- Müşterilerin uygulamayı açtıklarında gördükleri aktif restoranların menü listesi
CREATE VIEW vw_AktifRestoranMenuleri AS
SELECT 
    r.RestoranAdi,
    r.RestoranPuani,
    k.KategoriAdi,
    u.UrunAdi,
    u.Fiyat
FROM Restoranlar r
INNER JOIN Urunler u ON r.RestoranID = u.RestoranID
INNER JOIN Kategoriler k ON u.KategoriID = k.KategoriID
WHERE r.IsActive = 1 AND u.IsActive = 1 AND k.IsActive = 1;
GO

-- Görünüm 2: Askıda Yemek Havuz Durumu ve Toplam Bağışlar (vw_AskidaYemekOzet)
-- Sistem yöneticilerinin havuzdaki anlık bakiyeyi ve şu ana kadar yapılan toplam bağış miktarını görmesi için
CREATE VIEW vw_AskidaYemekOzet AS
SELECT 
    (SELECT ToplamBakiye FROM AskidaYemekHavuzu) AS AnlikHavuzBakiyesi,
    (SELECT SonGuncellemeTarihi FROM AskidaYemekHavuzu) AS SonGuncellemeTarihi,
    ISNULL((SELECT SUM(Tutar) FROM HavuzBagislari), 0) AS BuguneKadarYapilanToplamBagis,
    (SELECT COUNT(*) FROM HavuzBagislari) AS ToplamBagisAdedi;
GO


-- ==============================================================================
-- 2. İNDEKSLEME (INDEXING)
-- Proje İsteri: Performansı artırmak için en az 2 adet anlamlı Index tanımlanmalıdır.
-- ==============================================================================

-- İndeks 1: Müşteri Telefon Numarası
-- Sisteme giriş yaparken veya müşteri ararken telefon numarası çok sık kullanılır.
CREATE NONCLUSTERED INDEX IX_Musteriler_Telefon 
ON Musteriler(Telefon);
GO

-- İndeks 2: Sipariş Tarihi
-- "Son 1 aydaki siparişler", "Bugünkü ciro" gibi tarih bazlı raporlamalarda hızı artırmak için.
CREATE NONCLUSTERED INDEX IX_Siparisler_SiparisTarihi 
ON Siparisler(SiparisTarihi DESC);
GO

-- İndeks 3: Ürün Kategori Arama
-- Kullanıcılar "Pizzalar" veya "Tatlılar" kategorisine tıkladığında ürünlerin hızlı gelmesi için.
-- INCLUDE kullanarak Fiyat ve Adı gibi bilgilerin tablodan değil, doğrudan index'ten okunmasını sağlıyoruz (Covering Index).
CREATE NONCLUSTERED INDEX IX_Urunler_KategoriID 
ON Urunler(KategoriID)
INCLUDE (UrunAdi, Fiyat);
GO

PRINT '03: Görünümler (View) ve İndeksler (Index) başarıyla oluşturuldu.'
