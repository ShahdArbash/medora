import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/service/analysis_category_service.dart';
import 'package:medoraapp/features/analysis/data/service/analysis_service.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCardView/analysis_list_view.dart';

class AnalysisListScopeView extends StatelessWidget {
  const AnalysisListScopeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AnalysisService()),
        RepositoryProvider(create: (_) => AnalysisCategoryService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AnalysisCubit(context.read<AnalysisService>())
                  ..fetchAllAnalyses(),
          ),

          BlocProvider(
            create: (context) => AnalysisCategoryCubit(
              service: context.read<AnalysisCategoryService>(),
            )..getCategories(),
          ),
        ],
        child: const AnalysisListView(),
      ),
    );
  }
}
