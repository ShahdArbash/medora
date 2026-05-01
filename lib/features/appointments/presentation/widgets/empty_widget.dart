import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy, size: 60, color: Colors.grey.shade400),
          const SizedBox(height: 10),
          Text("لا يوجد مواعيد", style: CairoFonts.bold(color: Colors.grey)),
        ],
      ),
    );
  }
}
