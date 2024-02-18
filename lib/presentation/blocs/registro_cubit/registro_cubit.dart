
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructre/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'registro_state.dart';

class RegistroCubit extends Cubit<RegistroFormState> {
  RegistroCubit() : super(const RegistroFormState());

  void onSubmit(){
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        nombre: Nombre.dirty(state.nombre.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.nombre, state.password, state.email])
      )
    );
    print('Submit: $state');
  }

  void nombreChanged( String value) {
    final nombre = Nombre.dirty(value);
    emit(
      state.copyWith(
        nombre: nombre,
        isValid: Formz.validate([ nombre, state.password, state.email ])
      )
    );
  }
  void emailChanged( String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email ,state.password, state.nombre ])
      )
    );
  }
  void passwordChanged( String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.nombre, state.email ])
      )
    );
  }
}
