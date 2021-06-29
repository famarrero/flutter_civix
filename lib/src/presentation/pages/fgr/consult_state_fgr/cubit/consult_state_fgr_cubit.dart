import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/domain/entities/statement_response_consult.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'consult_state_fgr_state.dart';

class ConsultStateFgrCubit extends Cubit<ConsultStateFgrState> {
  ConsultStateFgrCubit() : super(ConsultStateFgrState.initial());

  FormGroup _consultStateFgrForm = FormConsultStateFgr.consultStateFgrForm;

  FormGroup get getconsultStateFgrForm => _consultStateFgrForm;

  Future<void> consultState() async {
    if (_consultStateFgrForm.valid) {
      emit(state.copyWith(loading: true, statementsResponseConsult: null));
      StatementResponseConsult sfgrc = StatementResponseConsult(
          ticked: '5y4hj5', state: 'EN TRAMITACIÓN', response: null);
      await Future.delayed(Duration(seconds: 1));

      emit(state.copyWith(loading: false, statementsResponseConsult: sfgrc, showForm: false));
    } else {
      _consultStateFgrForm.markAllAsTouched();
    }
  }

  Future<void> consultAgain() async {
    emit(ConsultStateFgrState.initial());
  }
}

abstract class FormConsultStateFgr {
  const FormConsultStateFgr._();

  static const tikedRegExp = r'^[0-9 a-z A-Z]{5}$';

  static FormGroup get consultStateFgrForm => FormGroup({
        tiked: FormControl<String>(
            validators: [Validators.required, Validators.pattern(tikedRegExp)]),
      });

  static const tiked = 'tiked';
}
