import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/Category/analysis_category_grid_skeleton.dart';

import '../../../logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';
import '../../widgets/Category/categories_grid.dart';

class AnalysisCategoriesView extends StatefulWidget {
  const AnalysisCategoriesView({super.key});

  @override
  State<AnalysisCategoriesView> createState() => _AnalysisCategoriesViewState();
}

class _AnalysisCategoriesViewState extends State<AnalysisCategoriesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();

    context.read<AnalysisCategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: Text(
            "أسعار التحاليل",
            style: CairoFonts.bold(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),

        body: Column(
          children: [
            Divider(),
            SizedBox(height: 25),
            Text(
              'اختر فئة التحليل لعرض جميع التحاليل المتاحة والأسعار',
              style: CairoFonts.bold(),
            ),
            SizedBox(height: 15),
            Expanded(
              child: BlocBuilder<AnalysisCategoryCubit, AnalysisCategoryState>(
                builder: (context, state) {
                  if (state is AnalysisLoading) {
                    return Column(
                      children: const [
                        Expanded(child: AnalysisCategoryGridSkeleton()),
                      ],
                    );
                  }

                  if (state is AnalysisLoaded) {
                    return AnalysisCategoryGrid(categories: state.categories);
                  }

                  if (state is AnalysisError) {
                    return Center(child: Text(state.message));
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
