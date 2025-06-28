# Changelog

Bu dosya, Image2Hashtag paketinin tüm önemli değişikliklerini kaydeder.

## [0.0.1] - 2024-12-19

### Eklenenler
- 🎉 İlk sürüm yayınlandı
- Google Gemini Vision API entegrasyonu
- Görsel analizi ve hashtag üretimi
- Türkçe hashtag desteği
- Basit ve kullanımı kolay API
- Hata yönetimi
- Örnek uygulama

### Teknik Özellikler
- `Image2Hashtag.initialize()` - API anahtarı ayarlama
- `Image2Hashtag.generate()` - Görsel dosyasından hashtag üretme
- HTTP istekleri için http paketi kullanımı
- Base64 görsel kodlama
- JSON yanıt işleme

### Bağımlılıklar
- Flutter SDK: >=1.17.0
- Dart SDK: ^3.7.0
- http: 1.4.0

### Bilinen Sorunlar
- Henüz bilinen sorun yok

### Gelecek Sürümler İçin Planlar
- [ ] Çoklu dil desteği
- [ ] Hashtag kategorileri
- [ ] Özelleştirilebilir prompt'lar
- [ ] Batch işleme desteği
- [ ] Cache mekanizması
- [ ] Daha fazla görsel format desteği
