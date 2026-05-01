import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_card_base.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_info_row.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_primary_button.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/offer_badge.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/price_text.dart';
import '../../../../../constants/fonts.dart';
import '../../../data/models/analysis_lab_model.dart';

class AnalysisLabCard extends StatelessWidget {
  final AnalysisLabModel lab;
  final String analysisName;
  final VoidCallback onBook;

  const AnalysisLabCard({
    super.key,
    required this.lab,
    required this.analysisName,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      top: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(lab.labName, style: CairoFonts.bold(fontSize: 14)),
              ),
              if (lab.hasOffer) const OfferBadge(),
            ],
          ),

          const SizedBox(height: 8),

          ///  الموقع
          AppInfoRow(icon: Icons.location_on, text: lab.location),

          const SizedBox(height: 8),

          Row(
            children: [
              ///  المدة
              AppInfoRow(
                icon: Icons.access_time,
                text: "مدة التسليم: ${lab.duration}",
              ),
              const Spacer(),

              PriceText(price: lab.price, oldPrice: lab.oldPrice),
            ],
          ),
        ],
      ),

      bottom: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 2),
                Text(lab.rating.toString()),
              ],
            ),
            SizedBox(height: 10),
            AppPrimaryButton(text: "احجز الآن", onPressed: onBook),
          ],
        ),
      ),
    );
  }
}
