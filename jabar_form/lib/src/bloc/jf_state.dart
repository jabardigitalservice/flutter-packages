import 'package:equatable/equatable.dart';
import 'package:jabar_form/src/network/models/response/detail_form/detail_form_response.dart';

abstract class JFState extends Equatable {
  @override
  List<Object> get props => [];
}

class JFStateInit extends JFState {}

class JFStateLoading extends JFState {}

class JFStateSuccess extends JFState {
  final DetailFormResponse jfData;

  JFStateSuccess(this.jfData);

  @override
  List<Object> get props => [jfData];
}

class JFStateError extends JFState {
  final String error;

  JFStateError(this.error);

  @override
  List<Object> get props => [error];
}
