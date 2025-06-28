import 'package:flutter_test/flutter_test.dart';
import 'package:image2hashtag/image2hashtag.dart';
import 'dart:io';

void main() {
  group('Image2Hashtag', () {
    setUp(() {
      // Her test öncesi API key'i temizle
      // Bu gerçek bir test için mock kullanılmalı
    });

    test('should throw exception when API key is not set', () {
      expect(
        () => Image2Hashtag.generate(File('test_image.jpg')),
        throwsA(isA<Exception>()),
      );
    });

    test('should initialize with API key', () {
      expect(() => Image2Hashtag.initialize(apiKey: 'test_key'), returnsNormally);
    });

    test('should throw exception for invalid file', () {
      Image2Hashtag.initialize(apiKey: 'test_key');
      
      expect(
        () => Image2Hashtag.generate(File('non_existent_file.jpg')),
        throwsA(isA<Exception>()),
      );
    });

    // Not: Gerçek API çağrıları için integration testleri ayrı olmalı
    // Bu testler sadece temel fonksiyonaliteyi test eder
  });
}
