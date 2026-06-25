import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCardView/analysis_list_scope_view.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCategoryView/analysis_category_view.dart';

import '../../../logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';
import '../../../data/service/analysis_category_service.dart';

class AnalysisScopeView extends StatelessWidget {
  const AnalysisScopeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AnalysisCategoryService(),
      child: BlocProvider(
        create: (context) => AnalysisCategoryCubit(
          service: context.read<AnalysisCategoryService>(),
        ),
        child: AnalysisListScopeView(),
      ),
    );
  }
}
