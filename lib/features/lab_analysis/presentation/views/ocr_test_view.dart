import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:medoraapp/features/lab_analysis/data/models/lab_result_model.dart';
import 'package:medoraapp/features/lab_analysis/data/parsers/lab_cleaner.dart';
import 'package:medoraapp/features/lab_analysis/data/parsers/lab_parser.dart';
import 'package:medoraapp/features/lab_analysis/data/services/ocr_service.dart';

class OcrTestView extends StatefulWidget {
  const OcrTestView({super.key});

  @override
  State<OcrTestView> createState() => _OcrTestViewState();
}

class _OcrTestViewState extends State<OcrTestView> {
  final OcrService _ocrService = OcrService();

  // ✅ single instances (better performance)
  final LabCleaner _cleaner = LabCleaner();
  final LabParser _parser = LabParser();

  List<LabResultModel> results = [];
  bool isLoading = false;

  Future<void> pickAndReadImage() async {
    try {
      setState(() {
        isLoading = true;
        results = []; // clear old results
      });

      final result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result == null) {
        setState(() => isLoading = false);
        return;
      }

      final file = File(result.files.single.path!);

      // 📷 OCR
      final text = await _ocrService.extractText(file);

      // 🧼 CLEANING
      final cleanText = _cleaner.clean(text);

      // 🧠 PARSING
      final parsedResults = _parser.parse(cleanText);

      setState(() {
        results = parsedResults;
        isLoading = false;
      });

      debugPrint('RESULTS LENGTH: ${results.length}');

      for (final item in results) {
        debugPrint('${item.testName} : ${item.status}');
      }
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('ERROR: $e');
    }
  }

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OCR Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: isLoading ? null : pickAndReadImage,
              child: const Text('Upload Analysis'),
            ),

            const SizedBox(height: 20),

            if (isLoading) const CircularProgressIndicator(),

            const SizedBox(height: 10),

            // 🧠 EMPTY STATE HANDLING
            if (!isLoading && results.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    "No results yet\nUpload a lab report image",
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final item = results[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(item.testName),
                        subtitle: Text('${item.value} ${item.unit}'),
                        trailing: _statusChip(item.status),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 🎨 Status UI
  Widget _statusChip(String status) {
    Color color;

    switch (status) {
      case 'Low':
        color = Colors.blue;
        break;
      case 'High':
        color = Colors.red;
        break;
      default:
        color = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
