import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_category_model.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_state.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisLabsView/analysis_labs_scope_view.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/analysis_list_skeleton.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/count_badge.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/analysis_card.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/search_field.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';

class AnalysisListView extends StatelessWidget {
  final AnalysisCategoryModel category;

  const AnalysisListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppCustomAppBar(
          title: category.title,
          trailing: CountBadge(count: category.testsCount, label: 'تحليل'),
        ),
        body: Column(
          children: [
            Divider(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: AppSearchField(
                hint: "ابحث عن تحليل...",
                onChanged: (value) {
                  // context.read<AnalysisCubit>().search(value);
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<AnalysisCubit, AnalysisState>(
                builder: (context, state) {
                  if (state is AnalysisLoading) {
                    return Column(
                      children: const [Expanded(child: AnalysisListSkeleton())],
                    );
                  }

                  if (state is AnalysisError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is AnalysisEmpty) {
                    return Center(child: Text("لا يوجد تحاليل"));
                  }

                  if (state is AnalysisSuccess) {
                    return ListView.builder(
                      itemCount: state.analyses.length,
                      itemBuilder: (context, index) {
                        final item = state.analyses[index];

                        return AnalysisCard(
                          analysis: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AnalysisLabsScopeView(analysis: item),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
