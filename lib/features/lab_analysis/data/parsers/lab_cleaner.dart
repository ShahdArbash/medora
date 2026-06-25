class LabCleaner {
  String clean(String text) {
    final lines = text.split('\n');

    final cleanedLines = lines
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .where((e) => !_isPureNoise(e))
        .toList();

    return cleanedLines.join('\n');
  }

  bool _isPureNoise(String line) {
    final lower = line.toLowerCase();

    // فقط headers الكبيرة اللي ما إلها قيمة
    return lower.contains('tft') ||
        lower.contains('electrolytes') ||
        lower.contains('bone metabolism');
  }
}
