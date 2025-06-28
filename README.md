<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Image2Hashtag

AI tabanlı bir Flutter paketi. Verilen bir görsel için sosyal medya hashtag önerileri üretir. Google Gemini Vision API kullanarak görsel analizi yapar ve Türkçe hashtag önerileri sunar.

## Özellikler

- 🖼️ **Görsel Analizi**: Yüklenen görselleri AI ile analiz eder
- 🏷️ **Hashtag Üretimi**: Sosyal medya için uygun hashtag önerileri üretir
- 🇹🇷 **Türkçe Desteği**: Türkçe hashtag önerileri
- ⚡ **Hızlı**: Gemini API ile hızlı sonuçlar
- 🔒 **Güvenli**: API anahtarınızı güvenli şekilde kullanır

## Kurulum

`pubspec.yaml` dosyanıza aşağıdaki bağımlılığı ekleyin:

```yaml
dependencies:
  image2hashtag: ^0.0.1
```

Paketi yüklemek için:

```bash
flutter pub get
```

## Kullanım

### 1. API Anahtarını Ayarlayın

Gemini API anahtarınızı [Google AI Studio](https://makersuite.google.com/app/apikey) adresinden alabilirsiniz.

```dart
import 'package:image2hashtag/image2hashtag.dart';

void main() {
  Image2Hashtag.initialize(apiKey: 'YOUR_GEMINI_API_KEY');
  runApp(MyApp());
}
```

### 2. Görsel Seçin ve Hashtag Üretin

```dart
import 'dart:io';
import 'package:image2hashtag/image2hashtag.dart';

Future<void> generateHashtags(File imageFile) async {
  try {
    final hashtags = await Image2Hashtag.generate(imageFile);
    print('Üretilen hashtag\'ler: $hashtags');
  } catch (e) {
    print('Hata: $e');
  }
}
```

### 3. Tam Örnek

```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image2hashtag/image2hashtag.dart';

class HashtagGenerator extends StatefulWidget {
  @override
  _HashtagGeneratorState createState() => _HashtagGeneratorState();
}

class _HashtagGeneratorState extends State<HashtagGenerator> {
  File? _image;
  List<String> _hashtags = [];
  bool _loading = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    setState(() {
      _loading = true;
      _hashtags = [];
      _image = File(picked.path);
    });

    try {
      final tags = await Image2Hashtag.generate(_image!);
      setState(() => _hashtags = tags);
    } catch (e) {
      setState(() => _hashtags = ['Hata: $e']);
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hashtag Üretici')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) 
              Image.file(_image!, height: 200),
            SizedBox(height: 20),
            if (_loading)
              CircularProgressIndicator()
            else
              Column(
                children: _hashtags
                    .map((tag) => Text(tag, style: TextStyle(fontSize: 16)))
                    .toList(),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Görsel Seç ve Hashtag Üret'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## API Gereksinimleri

Bu paket Google Gemini Vision API kullanır. API anahtarınızı almak için:

1. [Google AI Studio](https://makersuite.google.com/app/apikey) adresine gidin
2. Google hesabınızla giriş yapın
3. "Create API Key" butonuna tıklayın
4. API anahtarınızı kopyalayın ve güvenli bir yerde saklayın

## Hata Yönetimi

Paket aşağıdaki durumlarda hata fırlatabilir:

- API anahtarı ayarlanmamışsa
- Ağ bağlantısı sorunu varsa
- Gemini API'den hata dönerse
- Görsel dosyası okunamazsa

```dart
try {
  final hashtags = await Image2Hashtag.generate(imageFile);
  // Başarılı
} catch (e) {
  // Hata yönetimi
  print('Hata: $e');
}
```

## Katkıda Bulunma

Bu projeye katkıda bulunmak istiyorsanız:

1. Bu repository'yi fork edin
2. Yeni bir feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## İletişim

- **Geliştirici**: Bilal Özcan
- **GitHub**: [@bilalozcan](https://github.com/bilalozcan)
- **Proje Linki**: [https://github.com/bilalozcan/image2hashtag](https://github.com/bilalozcan/image2hashtag)

## Değişiklik Geçmişi

Detaylı değişiklik geçmişi için [CHANGELOG.md](CHANGELOG.md) dosyasına bakın.
