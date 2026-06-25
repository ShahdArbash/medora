import '../models/lab_result_model.dart';

class LabParser {
  List<LabResultModel> parse(String text) {
    final results = <LabResultModel>[];

    final lines = text
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    String? testName;
    double? value;
    String? unit;

    for (final line in lines) {
      // 1. إذا رقم
      final parsedValue = double.tryParse(line);

      if (parsedValue != null) {
        value = parsedValue;
        continue;
      }

      // 2. إذا range
      if (line.contains('-') && value != null && testName != null) {
        final rangeParts = line.split('-');

        final min = double.tryParse(rangeParts[0].trim());
        final max = double.tryParse(rangeParts[1].trim());

        if (min != null && max != null) {
          String status = 'Normal';

          if (value < min)
            status = 'Low';
          else if (value > max)
            status = 'High';

          results.add(
            LabResultModel(
              testName: testName,
              value: value,
              unit: unit ?? '',
              minRange: min,
              maxRange: max,
              status: status,
            ),
          );
        }

        // reset
        testName = null;
        value = null;
        unit = null;
        continue;
      }

      final lower = line.toLowerCase();

      final isUnit =
          lower.contains('mg') ||
          lower.contains('dl') ||
          lower.contains('mmol') ||
          lower.contains('mol') ||
          lower.contains('g/l') ||
          lower.contains('u/l') ||
          lower.contains('iu/l') ||
          lower.contains('miu') ||
          lower.contains('%');

      if (isUnit) {
        unit = line;
        continue;
      }

      // 4. غير هيك → test name
      final forbiddenNames = ['reference range', 'result', 'unit', 'test'];

      if (forbiddenNames.contains(line.toLowerCase())) {
        continue;
      }

      testName = line;
    }

    return results;
  }
}
