import 'package:flutter/material.dart';

class GenderBottomSheetField extends StatelessWidget {
  const GenderBottomSheetField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String> onChanged;

  String _getLabel(String? value) {
    switch (value) {
      case 'male':
        return 'ذكر';
      case 'female':
        return 'أنثى';
      case 'prefer_not_to_say':
        return 'أفضل عدم التحديد';
      default:
        return 'اختر الجنس';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showGenderSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Text(
              _getLabel(value),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
            Expanded(child: const SizedBox(width: 12)),
            const Icon(Icons.wc_outlined),
          ],
        ),
      ),
    );
  }

  void _showGenderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),

              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 20),

              _buildItem(context, 'male', 'ذكر'),
              _buildItem(context, 'female', 'أنثى'),
              _buildItem(context, 'prefer_not_to_say', 'أفضل عدم التحديد'),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String valueKey, String label) {
    final isSelected = value == valueKey;

    return ListTile(
      onTap: () {
        onChanged(valueKey);
        Navigator.pop(context);
      },
      leading: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
