import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image2hashtag/image2hashtag.dart';

void main() {
  Image2Hashtag.initialize(apiKey: 'KEY');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoScreen());
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
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
      appBar: AppBar(title: const Text('Image2Hashtag Demo')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (_image != null) Image.file(_image!, height: 200),
            const SizedBox(height: 20),
            if (_loading)
              const CircularProgressIndicator()
            else
              Column(
                children: _hashtags
                    .map((tag) => Text(tag, style: const TextStyle(fontSize: 16)))
                    .toList(),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Görsel Seç ve Hashtag Üret'),
            ),
          ]),
        ),
      ),
    );
  }
}
