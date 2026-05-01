import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCardView/analysis_list_scope_view.dart';
import '../../../data/models/analysis_category_model.dart';
import 'analysis_category_card.dart';

class AnalysisCategoryGrid extends StatelessWidget {
  final List<AnalysisCategoryModel> categories;

  const AnalysisCategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (width > 900) return 4;
      if (width > 600) return 3;
      return 2;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: width > 600 ? 1.1 : 0.9,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return AnalysisCategoryBaseCard(
          category: category,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AnalysisListScopeView(
                  categoryId: category.id,
                  category: category,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
