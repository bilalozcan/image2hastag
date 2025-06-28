# Image2Hashtag Örnek Uygulaması

Bu klasör, Image2Hashtag paketinin nasıl kullanılacağını gösteren örnek bir Flutter uygulaması içerir.

## Özellikler

- 📱 Galeriden görsel seçme
- 🤖 AI ile hashtag üretimi
- ⏳ Yükleme durumu göstergesi
- 🎨 Basit ve kullanıcı dostu arayüz

## Kurulum

1. Bu klasöre gidin:

```bash
cd example
```

2. Bağımlılıkları yükleyin:

```bash
flutter pub get
```

3. API anahtarınızı ayarlayın:
   - `lib/main.dart` dosyasını açın
   - 7. satırdaki `'KEY'` yerine Gemini API anahtarınızı yazın

4. Uygulamayı çalıştırın:

```bash
flutter run
```

## Kullanım

1. "Görsel Seç ve Hashtag Üret" butonuna tıklayın
2. Galeriden bir görsel seçin
3. AI görseli analiz eder ve hashtag önerileri üretir
4. Sonuçları ekranda görüntüleyin

## Ekran Görüntüleri

Uygulama şu özelliklere sahiptir:

- Görsel önizleme
- Yükleme animasyonu
- Hashtag listesi
- Hata mesajları

## Notlar

- Bu örnek uygulama sadece eğitim amaçlıdır
- Gerçek kullanım için API anahtarınızı güvenli bir şekilde saklayın
- Görsel boyutu ve formatı API limitlerine uygun olmalıdır

## Sorun Giderme

Eğer uygulama çalışmazsa:

1. API anahtarının doğru ayarlandığından emin olun
2. İnternet bağlantınızı kontrol edin
3. Flutter ve Dart SDK sürümlerinizi kontrol edin
