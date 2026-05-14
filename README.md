# VTYS-1 Dönem Projesi: Çevrimiçi Yemek Sipariş Platformu Veritabanı 🍔

Bu depo, VTYS-1 dersi kapsamında geliştirilen, ilişkisel veritabanı (RDBMS) standartlarına ve **3. Normal Form'a (3NF)** uygun olarak tasarlanmış çevrimiçi bir yemek sipariş platformunun SQL kodlarını ve tasarım dokümanlarını içermektedir.

## 🌟 Projenin Öne Çıkan Özelliği: "Askıda Yemek" Modülü
Bu sistem, sıradan bir yemek siparişi uygulamasından farklı olarak yenilikçi bir **"Askıda Yemek"** sosyal sorumluluk modülüne sahiptir.
* Hayırseverler sisteme bakiye bağışı yapabilir (kimliklerini açıkça belirterek veya tamamen gizli tutarak).
* Sisteme kayıtlı, yetkililerce onaylanmış "İhtiyaç Sahibi" müşteriler, cüzdanlarında para olmasa dahi havuzdaki bu bakiyeyi kullanarak ücretsiz yemek siparişi verebilirler.
* Tüm bakiye düşme, artırma ve yetersiz bakiye (Hata/Rollback) kontrol işlemleri veritabanı seviyesinde, arka planda çalışan **Tetikleyiciler (Triggers)** ile tam otomatik olarak yönetilir. Uygulama tarafına iş bırakılmaz.

## 📂 Proje Dosyaları ve Kurulum Sırası
Proje, Microsoft SQL Server (T-SQL) üzerinde çalışacak şekilde tasarlanmıştır. Veritabanını ayağa kaldırmak için depo içerisindeki aşağıdaki dosyaları sırasıyla SSMS (SQL Server Management Studio) üzerinde çalıştırmanız yeterlidir:

1. **`01_Tasarim_ve_Kurallar.md`**: Projenin Varlık-İlişki (ER) Diyagramı ve iş kuralları dokümanı.
2. **`02_DDL.sql`**: Veritabanı iskeleti. Tabloların oluşturulması, Primary Key, Foreign Key ve CHECK/UNIQUE kısıtlamaları.
3. **`03_Gorunumler_ve_Indeksler.sql`**: Karmaşık sorguları basitleştiren `VIEW` nesneleri ve veritabanı okuma performansını artıran `INDEX` tanımlamaları.
4. **`04_Tetikleyiciler_Triggers.sql`**: "Askıda Yemek" modülünün otomasyonunu (para ekleme/düşme) sağlayan iş mantığı `TRIGGER` kodları.
5. **`05_DML_MockData.sql`**: Sistemin test edilebilmesi için eklenmiş gerçekçi sahte veriler (5 restoran, 50 ürün, 20 müşteri, 100 sipariş hareketi).
6. **`06_DQL_Sorgular.sql`**: 3 tabloyu birleştiren `JOIN`, agregasyon (`GROUP BY/HAVING`) ve `EXISTS/NOT EXISTS` içeren mantıksal alt sorguları barındıran ileri düzey analiz raporları.

---

## 🤖 Yapay Zeka (AI) Kullanım Beyanı / Dürüstlük Raporu
Bu projenin geliştirme sürecinde, ders proje yönergesinde belirtilen kurallar ve etik sınırlar çerçevesinde Yapay Zeka araçları (Google Gemini) bir **"Geliştirici Asistanı"** olarak kullanılmıştır.

* **Tasarım Aşaması:** Tablolar arası 3NF kısıtlamalarının doğrulanmasında ve oluşturulan mimarinin Varlık-İlişki (ER) diyagramı formatına (Mermaid sözdizimi) dökülmesinde destek alınmıştır.
* **Sahte Veri (Mock Data) Üretimi:** Proje isterlerinde yer alan "50 farklı ürün, 20 müşteri ve 100 farklı siparişin" veritabanına tek tek eklenmesi gibi tekrarlayan veri girişi işlemleri AI kullanılarak hızlandırılmış ve yüzlerce satırlık `INSERT INTO` kalıpları ürettirilmiştir.
* **Hata Ayıklama:** Tetikleyiciler (Trigger) yazılırken bakiye kontrolü sırasındaki ufak T-SQL sentaks (yazım) hatalarının tespiti için asistan kullanılmış, ancak sistemin ana algoritması ve çalışma mantığı tarafımca kurgulanmıştır.

*Kullanılan tüm SQL kodları, iş kuralları ve veritabanı nesneleri tarafımca okunmuş, SSMS üzerinde satır satır test edilmiş ve arkasında yatan mühendislik mantığı tamamen özümsenmiştir. Proje, tarafımdan savunulmaya hazırdır.*
