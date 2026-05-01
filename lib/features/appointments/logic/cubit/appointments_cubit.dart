import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';
import 'package:medoraapp/features/appointments/data/services/appointments_service.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  final AppointmentsService service;

  AppointmentsCubit(this.service) : super(AppointmentsInitial());

  List<AppointmentModel> _all = [];

  Future<void> getAppointments() async {
    emit(AppointmentsLoading());

    try {
      final data = await service.fetchAppointments();
      _all = data;

      _emitFiltered(AppointmentFilter.upcoming);
    } catch (_) {
      emit(AppointmentsError("حدث خطأ"));
    }
  }

  void changeTab(AppointmentFilter filter) {
    _emitFiltered(filter);
  }

  void _emitFiltered(AppointmentFilter filter) {
    final filtered = _all.where((e) {
      if (filter == AppointmentFilter.upcoming) {
        return e.isUpcoming;
      } else {
        return !e.isUpcoming;
      }
    }).toList();

    if (filtered.isEmpty) {
      emit(AppointmentsEmpty());
    } else {
      emit(AppointmentsLoaded(filtered, filter));
    }
  }
}
