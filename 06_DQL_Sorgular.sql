-- ==============================================================================
-- VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı
-- 06: DQL (İleri Düzey SQL Analiz Sorguları)
-- Hedef Veritabanı: Microsoft SQL Server (T-SQL)
-- ==============================================================================

USE YemekSiparisiDB;
GO

-- ==============================================================================
-- 1. JOIN KULLANIMI (En az 3 Tabloyu Birleştiren Sorgu)
-- Proje İsteri: En az 3 tabloyu birbirine bağlayan detaylı bir sipariş fişi sorgusu.
-- ==============================================================================
-- Senaryo: Müşterinin, sipariş verdiği restoranın ve teslim eden kuryenin bilgilerini 
--          tek bir raporda ("Detaylı Sipariş Fişi") görmek istiyoruz.
-- Kullanılan Tablolar: Siparisler, Musteriler, Restoranlar, Kuryeler (Toplam 4 Tablo)

SELECT 
    s.SiparisID,
    m.Ad + ' ' + m.Soyad AS MusteriAdSoyad,
    r.RestoranAdi,
    k.Ad + ' ' + k.Soyad AS KuryeAdSoyad,
    s.SiparisTarihi,
    s.ToplamTutar,
    s.SiparisDurumu
FROM Siparisler s
INNER JOIN Musteriler m ON s.MusteriID = m.MusteriID
INNER JOIN Restoranlar r ON s.RestoranID = r.RestoranID
LEFT JOIN Kuryeler k ON s.KuryeID = k.KuryeID -- Henüz kurye atanmamış siparişler de gelsin diye LEFT JOIN kullanıldı
WHERE s.IsActive = 1;
GO

-- ==============================================================================
-- 2. AGREGASYON VE GRUPLAMA (GROUP BY, HAVING, SUM, COUNT, AVG)
-- Proje İsteri: SUM, COUNT, AVG fonksiyonlarının GROUP BY ve HAVING ile kullanıldığı analitik sorgu.
-- ==============================================================================
-- Senaryo: Sistemde "Toplamda 5'ten fazla sipariş almış" restoranların performans analizi
--          (Restoran bazında: Toplam sipariş sayısı, Toplam Ciro, Ortalama Sepet Tutarı)

SELECT 
    r.RestoranAdi,
    COUNT(s.SiparisID) AS ToplamSiparisSayisi,
    SUM(s.ToplamTutar) AS ToplamCiro,
    AVG(s.ToplamTutar) AS OrtalamaSepetTutari
FROM Siparisler s
INNER JOIN Restoranlar r ON s.RestoranID = r.RestoranID
GROUP BY r.RestoranAdi
HAVING COUNT(s.SiparisID) > 5
ORDER BY ToplamCiro DESC;
GO

-- ==============================================================================
-- 3. ALT SORGU (SUBQUERY - EXISTS / NOT EXISTS)
-- Proje İsteri: IN, EXISTS veya NOT EXISTS içeren mantıksal bir alt sorgu.
-- ==============================================================================
-- Senaryo: Sistemi aktif olarak kullanan (en az 1 sipariş vermiş) AMA 
--          "Askıda Yemek" havuzuna HİÇ bağış YAPMAMIŞ müşterilerin listesi.
--          (Pazarlama ekibinin bu kişilere "Siz de bağış yapın" bildirimi atması için harika bir veri)

SELECT 
    m.MusteriID,
    m.Ad,
    m.Soyad,
    m.Telefon
FROM Musteriler m
WHERE 
    -- Kural 1: En az 1 siparişi var (Aktif müşteri)
    EXISTS (
        SELECT 1 
        FROM Siparisler s 
        WHERE s.MusteriID = m.MusteriID
    )
    AND 
    -- Kural 2: Havuza hiç bağış yapmamış
    NOT EXISTS (
        SELECT 1 
        FROM HavuzBagislari b 
        WHERE b.MusteriID = m.MusteriID
    );
GO

PRINT '06: DQL (İleri Düzey Analiz Sorguları) başarıyla çalıştırıldı.'
