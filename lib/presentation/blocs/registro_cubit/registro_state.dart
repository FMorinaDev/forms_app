part of 'registro_cubit.dart';
enum FormStatus { invalid, valid, validating, posting }

class RegistroFormState extends Equatable {
  final FormStatus formStatus;
  final Nombre nombre;
  final Email email;
  final Password password;
  final bool isValid;

  const RegistroFormState({
    this.formStatus = FormStatus.invalid,
    this.nombre = const Nombre.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false
  });

  RegistroFormState copyWith({
    FormStatus? formStatus,
    Nombre? nombre,
    Email? email,
    Password? password,
    bool? isValid
  }) => RegistroFormState(
    formStatus: formStatus ?? this.formStatus,
    nombre: nombre ?? this.nombre,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid
  );

  @override
  List<Object> get props => [ formStatus, nombre, email, password, isValid ];
}
