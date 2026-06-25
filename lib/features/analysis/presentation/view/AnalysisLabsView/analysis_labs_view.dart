import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_model.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_state.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/count_badge.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/analysis_lab_card.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_base_screen.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_sort_dropdown.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/skeleton_list.dart';
import 'package:medoraapp/features/booking/data/models/View%20Model/booking_context.dart';
import 'package:medoraapp/features/booking/data/models/View%20Model/test_model.dart';
import 'package:medoraapp/features/booking/data/service/booking_service.dart';
import 'package:medoraapp/features/booking/presentation/view/booking_appointment_scope_view.dart';

class AnalysisLabsView extends StatefulWidget {
  final AnalysisModel analysis;

  const AnalysisLabsView({super.key, required this.analysis});

  @override
  State<AnalysisLabsView> createState() => _AnalysisLabsViewState();
}

class _AnalysisLabsViewState extends State<AnalysisLabsView> {
  String sortValue = "price";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisLabsCubit, AnalysisLabsState>(
      builder: (context, state) {
        return AppBaseScreen(
          title: widget.analysis.name,

          ///  عداد المخابر
          trailing: BlocSelector<AnalysisLabsCubit, AnalysisLabsState, int?>(
            selector: (state) {
              if (state is AnalysisLabsLoaded) return state.filteredCount;
              return null;
            },
            builder: (context, count) {
              if (count == null) return SizedBox();
              return CountBadge(count: count, label: "مخبر");
            },
          ),

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text("ترتيب حسب:", style: CairoFonts.bold()),
                    const SizedBox(width: 8),
                    AppSortDropdown(
                      value: sortValue,
                      onChanged: (v) {
                        setState(() => sortValue = v);

                        context.read<AnalysisLabsCubit>().getLabs(
                          widget.analysis.id,
                          sortBy: v,
                        );
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child:
                    BlocSelector<
                      AnalysisLabsCubit,
                      AnalysisLabsState,
                      AnalysisLabsState
                    >(
                      selector: (state) => state,
                      builder: (context, state) {
                        return _buildBody(state);
                      },
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(AnalysisLabsState state) {
    if (state is AnalysisLabsLoading) {
      return const AnalysisLabsSkeletonList();
    }

    if (state is AnalysisLabsError) {
      return Center(child: Text(state.message));
    }

    if (state is AnalysisLabsEmpty) {
      return const Center(child: Text("لا يوجد مخابر"));
    }

    if (state is AnalysisLabsLoaded) {
      return ListView.builder(
        itemCount: state.labs.length,
        itemBuilder: (context, index) {
          return AnalysisLabCard(
            lab: state.labs[index],
            analysisName: widget.analysis.name,
            onBook: () {
              final AnalysisLabModel lab = state.labs[index];

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RepositoryProvider(
                    create: (_) => BookingService(),
                    child: BookingScopeView(
                      bookingData: BookingContext(
                        labId: lab.labId,

                        testIds: [widget.analysis.id],

                        tests: [
                          TestModel(
                            id: widget.analysis.id,
                            name: widget.analysis.name,
                            price: lab.price,
                          ),
                        ],

                        labName: lab.labName,
                        location: lab.location,
                        duration: lab.duration,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return const SizedBox();
  }
}
