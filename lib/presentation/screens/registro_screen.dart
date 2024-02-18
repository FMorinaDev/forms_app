import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/registro_cubit/registro_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegistroCubit(),
        child: const _RegistroView(),
      ) ,
    );
  }
}
class _RegistroView extends StatelessWidget {
  const _RegistroView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                FlutterLogo(size: 100,),
                _RegistroForm(),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ) ,
      ) 
    );
  }
}

class _RegistroForm extends StatelessWidget {
  const _RegistroForm();

  @override
  Widget build(BuildContext context) {
    final registroCubit = context.watch<RegistroCubit>();
    final nombre = registroCubit.state.nombre;
    final password = registroCubit.state.password;
    final email = registroCubit.state.email;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registroCubit.nombreChanged,
            errorMessage: nombre.errorMessage,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: registroCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Contraseña',
            onChanged: registroCubit.passwordChanged,
            errorMessage: password.errorMessage,
            obscureText: true,
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){

              registroCubit.onSubmit();
            }, 
            icon: const Icon(Icons.save), 
            label: const Text('Crear usuario')
          )
        ],
      )
    );
  }
}