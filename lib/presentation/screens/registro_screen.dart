import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegistroView() ,
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

class _RegistroForm extends StatefulWidget {
  const _RegistroForm();

  @override
  State<_RegistroForm> createState() => _RegistroFormState();
}

class _RegistroFormState extends State<_RegistroForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nombre = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => nombre = value,
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty) return 'Campo requerido';
              if(value.length < 6) return 'Minimo 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: (value) => email = value,
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty) return 'Campo requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if(!emailRegExp.hasMatch(value)) return 'Correo no valido';
              return null;
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Contraseña',
            onChanged: (value) => password = value,
            obscureText: true,
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo requerido';
              if(value.trim().isEmpty) return 'Campo requerido';
              if(value.length < 6) return 'Minimo 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: (){
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
            }, 
            icon: const Icon(Icons.save), 
            label: const Text('Crear usuario')
          )
        ],
      )
    );
  }
}