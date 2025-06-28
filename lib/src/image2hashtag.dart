import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Verilen bir görsel için sosyal medya etiketleri üretir.
/// Gemini Vision API'yi kullanır.
class Image2Hashtag {
  static String? _apiKey;

  /// Kullanıcı paketi kullanmadan önce API anahtarını set etmeli
  static void initialize({required String apiKey}) {
    _apiKey = apiKey;
  }

  /// Görsel dosyasına göre hashtag üretir
  static Future<List<String>> generate(File imageFile) async {
    if (_apiKey == null) {
      throw Exception('API key is not set. Use Image2Hashtag.initialize() first.');
    }

    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$_apiKey',
    );

    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  "Bu görsel için sosyal medyada kullanılabilecek Türkçe hashtag önerileri üret. "
                  "Yalnızca etiketleri sırayla #etiket formatında listele. Açıklama veya başlık verme.",
            },
            {
              "inlineData": {"mimeType": "image/jpeg", "data": base64Image},
            },
          ],
        },
      ],
    };

    final response = await http.post(uri, headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

    if (response.statusCode != 200) {
      throw Exception('Gemini API hatası: ${response.body}');
    }

    final json = jsonDecode(response.body);
    final String text = json['candidates'][0]['content']['parts'][0]['text'];
    print(text);

    // Sadece # ile başlayan satırları filtrele
    final tags = text.split('\n').map((e) => e.trim()).where((e) => e.startsWith('#')).toList();

    return tags;
  }
}
