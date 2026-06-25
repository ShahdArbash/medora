import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';

class AnalysisCategoriesFilter extends StatefulWidget {
  final Function(int categoryId) onCategorySelected;

  const AnalysisCategoriesFilter({super.key, required this.onCategorySelected});

  @override
  State<AnalysisCategoriesFilter> createState() =>
      _AnalysisCategoriesFilterState();
}

class _AnalysisCategoriesFilterState extends State<AnalysisCategoriesFilter> {
  int? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCategoryCubit, AnalysisCategoryState>(
      builder: (context, state) {
        if (state is! AnalysisLoaded) {
          return const SizedBox();
        }

        return SizedBox(
          height: 45,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                final isSelected = selectedCategoryId == null;

                return _buildChip(
                  title: "الكل",
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedCategoryId = null;
                    });

                    context.read<AnalysisCubit>().fetchAllAnalyses();
                  },
                );
              }

              final category = state.categories[index - 1];

              final isSelected = selectedCategoryId == category.id;

              return _buildChip(
                title: category.title,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    selectedCategoryId = category.id;
                  });

                  widget.onCategorySelected(category.id);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildChip({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff00B8C9) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xffD9D9D9)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
