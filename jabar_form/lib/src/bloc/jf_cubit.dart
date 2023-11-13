import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jabar_form/src/bloc/jf_state.dart';
import 'package:jabar_form/src/network/api_service.dart';

class JFCubit extends Cubit<JFState> {
  JFCubit() : super(JFStateInit());

  Future<void> getJFData(String slug) async {
    emit(JFStateLoading());
    try {
      // Await the result of getFormSurvey
      final formData = await ApiService().getForm(slug);
      if (formData != null) {
        // Form data is not null, so emit a success state
        emit(JFStateSuccess(formData));
      } else {
        // Handle the case where formData is null
        emit(JFStateLoading());
      }
    } catch (error) {
      emit(JFStateError('An error occurred: $error'));
    }
  }
}
