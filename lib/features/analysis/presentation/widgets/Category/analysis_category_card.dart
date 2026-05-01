import 'package:flutter/material.dart';
import 'package:medoraapp/core/utils/icon_mapper.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import '../../../data/models/analysis_category_model.dart';

class AnalysisCategoryBaseCard extends StatelessWidget {
  final AnalysisCategoryModel category;
  final VoidCallback? onTap;

  const AnalysisCategoryBaseCard({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.fieldBackgroundColor, width: 2),
        color: AppColors.whiteColor,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.35),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CategoryIconMapper.mapToIcon(category.iconName),
                    color: AppColors.IconColor.withValues(alpha: 0.85),
                    size: 28,
                  ),
                ),

                const SizedBox(height: 10),

                Flexible(
                  child: Text(
                    category.title,
                    style: CairoFonts.bold(fontSize: 14),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "${category.testsCount} تحليل",
                  style: CairoFonts.regular(
                    fontSize: 12,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
