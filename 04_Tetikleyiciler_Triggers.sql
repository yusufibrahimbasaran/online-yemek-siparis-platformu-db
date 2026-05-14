-- ==============================================================================
-- VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı
-- 04: İş Mantığı ve Tetikleyiciler (Triggers)
-- Hedef Veritabanı: Microsoft SQL Server (T-SQL)
-- ==============================================================================

USE YemekSiparisiDB;
GO

-- ==============================================================================
-- TETİKLEYİCİLER (TRIGGERS)
-- Proje İsteri: İş kurallarını otomatize eden en az 2 adet Trigger yazılmalıdır.
-- ==============================================================================

-- Tetikleyici 1: Havuza Bağış Yapıldığında Bakiyeyi Artırma
-- Amaç: HavuzBagislari tablosuna yeni bir bağış eklendiğinde, AskidaYemekHavuzu tablosundaki toplam bakiyeyi otomatik günceller.
CREATE TRIGGER trg_AskidaYemekBagisEkle
ON HavuzBagislari
AFTER INSERT
AS
BEGIN
    -- Etkilenen (eklenen) satırlardaki toplam bağış tutarını alıyoruz
    DECLARE @EklenenTutar DECIMAL(10,2);
    SELECT @EklenenTutar = SUM(Tutar) FROM inserted;

    IF (@EklenenTutar > 0)
    BEGIN
        -- Havuzdaki bakiyeyi artır ve son güncelleme tarihini şimdiki zaman yap
        UPDATE AskidaYemekHavuzu
        SET 
            ToplamBakiye = ToplamBakiye + @EklenenTutar,
            SonGuncellemeTarihi = GETDATE();
            
        PRINT 'Bilgi: Askıda Yemek havuzuna yeni bağış eklendi ve toplam bakiye güncellendi.';
    END
END;
GO

-- Tetikleyici 2: İhtiyaç Sahibi Askıdan Sipariş Verdiğinde Bakiyeyi Düşürme
-- Amaç: Siparisler tablosuna 'AskidaYemekKullanildiMi = 1' olan bir sipariş eklendiğinde, havuzdaki bakiyeden sipariş tutarını düşer.
CREATE TRIGGER trg_AskidaYemekSiparisOde
ON Siparisler
AFTER INSERT
AS
BEGIN
    DECLARE @DusulecekTutar DECIMAL(10,2);
    DECLARE @SiparisAskidanMi BIT;

    -- Sadece eklenen sipariş askıdan ödenmişse işlemi yapacağız (inserted tablosundan alıyoruz)
    SELECT 
        @DusulecekTutar = ToplamTutar,
        @SiparisAskidanMi = AskidaYemekKullanildiMi
    FROM inserted;

    IF (@SiparisAskidanMi = 1 AND @DusulecekTutar > 0)
    BEGIN
        -- Mevcut havuz bakiyesini kontrol et
        DECLARE @MevcutBakiye DECIMAL(18,2);
        SELECT @MevcutBakiye = ToplamBakiye FROM AskidaYemekHavuzu;

        IF (@MevcutBakiye >= @DusulecekTutar)
        BEGIN
            -- Bakiye yeterliyse düş
            UPDATE AskidaYemekHavuzu
            SET 
                ToplamBakiye = ToplamBakiye - @DusulecekTutar,
                SonGuncellemeTarihi = GETDATE();
                
            PRINT 'Bilgi: Askıdan sipariş verildi, havuz bakiyesi düşüldü.';
        END
        ELSE
        BEGIN
            -- Bakiye yetersizse işlemi iptal et ve hata fırlat (Rollback)
            RAISERROR('Hata: Askıda Yemek havuzunda bu siparişi karşılayacak yeterli bakiye bulunmamaktadır!', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;
GO

PRINT '04: Tetikleyiciler (Triggers) başarıyla oluşturuldu.'
